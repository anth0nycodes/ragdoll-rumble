--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MountUI = require(ReplicatedStorage.Source.Shared.MountUI)

MountUI()

for _, module in ReplicatedStorage.Source.Features:GetDescendants() do
	if module:IsA("ModuleScript") and string.match(module.Name, "ServiceClient") then
		local success, result = pcall(function()
			local clientModule = require(module) :: any
			clientModule:Init()
		end)

		if not success then
			warn(`Failed to initialize {module.Name}: {result}`)
		end

		print(`Initialized {module.Name} successfully!`)
	end
end
