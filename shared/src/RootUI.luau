--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

local capturedRoots = {}
for _, module in ReplicatedStorage.Source.Features:GetDescendants() do
	if module:IsA("ModuleScript") and string.match(module.Name, "Root") and module ~= script then
		capturedRoots[module.Name] = require(module) :: any
	end
end

local function RootUI()
	local root = create("Frame")({
		Name = "RootUI",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
	})

	for _, rootModule in capturedRoots do
		local result = rootModule(root)
		if result then
			result.Parent = root
		end
	end

	return root
end

return RootUI
