--!strict
local RoundServiceServer = {}

-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

-- Packages
local Networker = require(ReplicatedStorage.Packages.Networker)

-- Assets
local Assets = ReplicatedStorage.Assets
local RedWrestler = Assets.RedWrestler:Clone()
local BlueWrestler = Assets.BlueWrestler:Clone()

--[[
1. Red on left, blue on right
2. Clone model from ReplicatedStorage.Assets
3. Parent RedWrestler to StarterPlayer
--]]

type RoundServiceServer = typeof(RoundServiceServer) & {
	networker: Networker.Server,
	allMaps: Folder,
	currentMapTheme: string,
	currentMapVariation: string,
	currentMaps: Folder?,
	currentMap: Model?,
	currentSpawnPoint: BasePart?,
}

function RoundServiceServer.Init(self: RoundServiceServer)
	self.networker = Networker.server.new("RoundService", self, { self.BeginRound :: any })
	self.allMaps = workspace.Maps
	self.currentMapTheme = "Desert"
	self.currentMapVariation = "1"
	self.currentMaps = self.allMaps:FindFirstChild(`{self.currentMapTheme}Maps`) :: Folder?
	if not self.currentMaps then
		return
	end
	self.currentMap = self.currentMaps:FindFirstChild(`{self.currentMapTheme}{self.currentMapVariation}`) :: Model?
	if not self.currentMap then
		return
	end
	self.currentSpawnPoint = self.currentMap:FindFirstChild("SpawnPoint") :: BasePart?
end

function RoundServiceServer.BeginRound(self: RoundServiceServer, player: Player)
	RedWrestler.Name = "StarterCharacter"
	RedWrestler.Parent = StarterPlayer
	if not self.currentSpawnPoint then
		warn("Current spawn point is not defined")
		return
	end

	-- Force respawn with new StarterCharacter
	player:LoadCharacterAsync()

	local character = player.Character
	if not character then
		return
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") :: BasePart
	if not humanoidRootPart then
		return
	end
	humanoidRootPart.CFrame = self.currentSpawnPoint.CFrame - Vector3.new(2.5, 0, 0)

	BlueWrestler.Parent = workspace
	local offset = humanoidRootPart.CFrame * CFrame.new(0, 0, -5)
	local facingPlayer = CFrame.lookAt(offset.Position, humanoidRootPart.Position)
	BlueWrestler:PivotTo(facingPlayer)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = BlueWrestler.PrimaryPart
	weld.Part1 = humanoidRootPart
	weld.Parent = BlueWrestler.PrimaryPart
end

return RoundServiceServer
