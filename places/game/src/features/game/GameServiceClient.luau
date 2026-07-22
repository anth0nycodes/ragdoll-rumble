--!strict
local GameServiceClient = {}

-- Game Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
assert(player, "Player is not defined")
local playerGui = player:WaitForChild("PlayerGui") :: PlayerGui

type GameServiceClient = typeof(GameServiceClient)

function GameServiceClient.Init(_self: GameServiceClient)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
	StarterGui:SetCore("ResetButtonCallback", false)
	playerGui.ScreenOrientation = Enum.ScreenOrientation.LandscapeSensor
end

return GameServiceClient
