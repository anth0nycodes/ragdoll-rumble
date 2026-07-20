--!strict
local RoundServiceClient = {}

-- Game Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Packages
local Networker = require(ReplicatedStorage.Packages.Networker)

local player = Players.LocalPlayer
assert(player, "Player is not defined")

type RoundServiceClient = typeof(RoundServiceClient) & {
	networker: Networker.Client,
	players: { player1: Player, player2: Model },
}

local cameraPart = workspace:WaitForChild("CameraPart") :: Part
local currentCamera = workspace.CurrentCamera
assert(currentCamera, "CurrentCamera is not defined")
currentCamera.CameraType = Enum.CameraType.Scriptable

function RoundServiceClient.Init(self: RoundServiceClient)
	self.networker = Networker.client.new("RoundService", self)
	currentCamera.CFrame = cameraPart.CFrame
	self.networker:fire("BeginRound")
	-- for now we can just use an arbitrary array of players, but in the future will swap it out with Players:GetPlayers
	self.players = { player1 = player, player2 = workspace:WaitForChild("BlueWrestler") }
	RunService.RenderStepped:Connect(function(dt: number)
		self:TrackCameraToPlayers(dt)
	end)
end

function RoundServiceClient.TrackCameraToPlayers(self: RoundServiceClient, dt: number)
	local playerOneCharacter = self.players.player1.Character
	if not playerOneCharacter then
		return
	end
	local playerOneHrp = playerOneCharacter:FindFirstChild("HumanoidRootPart") :: Part?
	if not playerOneHrp then
		return
	end

	local playerTwoCharacter = self.players.player2
	local playerTwoHrp = playerTwoCharacter:FindFirstChild("HumanoidRootPart") :: Part?
	if not playerTwoHrp then
		return
	end

	local midpoint = (playerOneHrp.Position + playerTwoHrp.Position) / 2
	local targetPos = Vector3.new(midpoint.X, midpoint.Y, cameraPart.Position.Z)
	local smoothing = 1 - math.exp(-20 * dt)
	local newPos = cameraPart.Position:Lerp(targetPos, smoothing)
	cameraPart.Position = newPos
	currentCamera.CFrame = cameraPart.CFrame
end

return RoundServiceClient
