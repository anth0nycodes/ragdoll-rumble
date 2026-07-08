const fs = require("fs");
const path = require("path");

const ROOT = path.join(__dirname, "..");
const PLACES_DIR = path.join(ROOT, "places");
const SHARED_SRC = path.join(ROOT, "shared", "src");

function toPosix(p) {
  return p.split(path.sep).join("/");
}

function toPascalCase(str) {
  if (str.toUpperCase() === "UI") return "UI";
  return str.charAt(0).toUpperCase() + str.slice(1);
}

function isServerFile(filename) {
  return filename.toLowerCase().includes("server");
}

function walk(dir, blacklist, callback) {
  if (blacklist.includes(toPosix(dir))) return;
  if (!fs.existsSync(dir)) return;

  fs.readdirSync(dir, { withFileTypes: true }).forEach((entry) => {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      walk(full, blacklist, callback);
    } else if (entry.isFile() && entry.name.endsWith(".luau")) {
      callback(full);
    }
  });
}

function processTree(basePath, pathPrefix, serverRoot, replicatedRoot) {
  const blacklist = [toPosix(path.join(basePath, "startup"))];
  const initClaimed = new Set();

  walk(basePath, blacklist, (filepath) => {
    const relativePath = path.relative(basePath, filepath);
    const parts = relativePath.split(path.sep);
    const filename = path.basename(filepath, ".luau");

    const folderName =
      parts.length > 1 ? toPascalCase(parts[parts.length - 2]) : "";
    const isInit = filename === "init";
    let name;

    if (isInit) {
      name = folderName;
    } else if (
      ["server", "client", "utils", "types"].includes(filename.toLowerCase())
    ) {
      name = folderName + toPascalCase(filename);
    } else {
      name = filename;
    }

    const root = isServerFile(filename) ? serverRoot : replicatedRoot;
    const folder = parts.slice(0, -1).map(toPascalCase);
    const fullFolderKey = folder.join("/");

    if (isInit) {
      const parent = folder.slice(0, -1).reduce((acc, part) => {
        if (!acc[part]) acc[part] = { $className: "Folder" };
        return acc[part];
      }, root);
      parent[name] = {
        $path: toPosix(path.join(pathPrefix, ...parts.slice(0, -1))),
      };
      initClaimed.add(fullFolderKey);
      return;
    }

    if (initClaimed.has(fullFolderKey)) return;

    let current = root;
    for (const part of folder) {
      if (!current[part]) current[part] = { $className: "Folder" };
      current = current[part];
    }

    current[name] = { $path: toPosix(path.join(pathPrefix, ...parts)) };
  });
}

function cleanEmpty(obj) {
  for (const key of Object.keys(obj)) {
    const val = obj[key];
    if (typeof val === "object" && val !== null && !Array.isArray(val)) {
      cleanEmpty(val);
      const keys = Object.keys(val);
      if (keys.length === 1 && keys[0] === "$className") {
        delete obj[key];
      }
    }
  }
}

function generateForPlace(placeName) {
  const placeDir = path.join(PLACES_DIR, placeName);
  const placeSrc = path.join(placeDir, "src");

  const tree = {
    emitLegacyScripts: false,
    name: `ragdoll-rumble-${placeName}`,
    tree: {
      $className: "DataModel",

      ReplicatedStorage: {
        Source: {
          $className: "Folder",
          StartUp: { $className: "Folder" },
        },
        Packages: { $path: "../../Packages" },
      },

      ServerScriptService: {
        StartUp: { $className: "Folder" },
      },
    },
  };

  const source = tree.tree.ReplicatedStorage.Source;
  const sss = tree.tree.ServerScriptService;

  // Handle startup scripts
  const startupDir = path.join(placeSrc, "startup");
  if (fs.existsSync(startupDir)) {
    fs.readdirSync(startupDir)
      .filter((f) => f.endsWith(".luau"))
      .forEach((file) => {
        const name = path.basename(file, ".luau").split(".")[0];
        const filePath = `src/startup/${file}`;

        if (file.includes(".server.")) {
          sss.StartUp[name] = { $path: filePath };
        } else {
          source.StartUp[name] = { $path: filePath };
        }
      });
  }

  // Process place-specific code
  processTree(placeSrc, "src", sss, source);

  // Process shared code under Shared namespace
  if (fs.existsSync(SHARED_SRC)) {
    source.Shared = { $className: "Folder" };
    sss.Shared = { $className: "Folder" };
    processTree(SHARED_SRC, "../../shared/src", sss.Shared, source.Shared);
  }

  // Clean empty folders
  cleanEmpty(tree.tree);

  const outPath = path.join(placeDir, "default.project.json");
  fs.writeFileSync(outPath, JSON.stringify(tree, null, 2));
  console.log(`✅ Generated ${path.relative(ROOT, outPath)}`);
}

// Generate for all places
const places = fs
  .readdirSync(PLACES_DIR, { withFileTypes: true })
  .filter((d) => d.isDirectory())
  .map((d) => d.name);

for (const place of places) {
  generateForPlace(place);
}
