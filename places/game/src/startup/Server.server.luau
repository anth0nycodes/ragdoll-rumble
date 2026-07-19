--!strict
-- Game Services
local ServerScriptService = game:GetService("ServerScriptService")

for _, module in ServerScriptService.Features:GetDescendants() do
	if module:IsA("ModuleScript") and string.match(module.Name, "ServiceServer") then
		local success, result = pcall(function()
			local serverModule = require(module) :: any
			serverModule:Init()
		end)

		if not success then
			warn(`Failed to initialize {module.Name}: {result}`)
		end

		print(`Initialized {module.Name} successfully!`)
	end
end
