--!strict
-- Game Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local RootUI = require(script.Parent.RootUI)

local player = Players.LocalPlayer
assert(player, "Player is not defined")
local playerGui = player:WaitForChild("PlayerGui")

return function()
	local container = Instance.new("ScreenGui")
	container.Name = "Vide"
	container.IgnoreGuiInset = true
	container.ResetOnSpawn = false
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	container.ClipToDeviceSafeArea = false
	container.Parent = playerGui

	Vide.mount(function()
		local root = RootUI()
		root.Parent = container
	end)
end
