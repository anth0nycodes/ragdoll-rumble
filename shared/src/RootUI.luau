--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local Frame = require(ReplicatedStorage.Source.Shared.Components.UI.Frame)

local capturedRoots = {}

for _, module in ReplicatedStorage.Source.Features:GetDescendants() do
	if module:IsA("ModuleScript") and string.match(module.Name, "Root") and module ~= script then
		capturedRoots[module.Name] = require(module) :: any
	end
end

return function()
	local root = Frame({
		Name = "RootUI",
	})

	for _, rootModule in capturedRoots do
		Vide.mount(rootModule, root)
	end

	return root
end
