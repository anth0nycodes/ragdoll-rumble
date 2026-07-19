--!strict
local GameServiceServer = {}

-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

-- Assets
local Assets = ReplicatedStorage.Assets
local RedWrestler = Assets.RedWrestler:Clone()
local BlueWrestler = Assets.BlueWrestler:Clone()

--[[
1. Red on left, blue on right
2. Clone model from ReplicatedStorage.Assets
3. Parent RedWrestler to StarterPlayer
--]]

function GameServiceServer.Init()
	RedWrestler.Name = "StarterCharacter"
	RedWrestler.Parent = StarterPlayer
end

return GameServiceServer
