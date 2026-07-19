--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local Frame = require(ReplicatedStorage.Source.Shared.Components.UI.Frame)

local capturedMenus = {}

for _, module in script.Parent:GetChildren() do
	if module:IsA("ModuleScript") and string.match(module.Name, "Menu") and module ~= script then
		capturedMenus[module.Name] = require(module) :: any
	end
end

return function()
	local menu = Frame({
		Name = "MenuRoot",
	})

	for _, menuModule in capturedMenus do
		Vide.mount(menuModule, menu)
	end

	return menu
end
