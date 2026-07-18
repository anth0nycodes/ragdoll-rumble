--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)

local RootUI = require(script.Parent.RootUI)

return function(parent)
	local destroy = Vide.mount(RootUI, parent)
	return function()
		destroy()
	end
end
