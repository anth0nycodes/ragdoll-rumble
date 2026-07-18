--!strict
local GameServiceClient = {}

-- Game Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
assert(player, "Player is not defined")
local playerGui = player:WaitForChild("PlayerGui") :: PlayerGui

function GameServiceClient.Init()
	local cameraPart = workspace:WaitForChild("CameraPart") :: Part
	local currentCamera = workspace.CurrentCamera
	currentCamera.CameraType = Enum.CameraType.Scriptable
	currentCamera.CFrame = cameraPart.CFrame
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
	playerGui.ScreenOrientation = Enum.ScreenOrientation.LandscapeSensor
end

return GameServiceClient
