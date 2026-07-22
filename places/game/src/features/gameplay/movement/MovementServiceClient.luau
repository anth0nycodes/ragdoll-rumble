--!strict
local MovementServiceClient = {}

-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Packages
local Networker = require(ReplicatedStorage.Packages.Networker)

-- Modules
local AnimationLoader = require(ReplicatedStorage.Source.Shared.Modules.AnimationLoader)

local AnimationIds = require(ReplicatedStorage.Source.Game.AnimationIds)
local idleAnimation = Instance.new("Animation")
idleAnimation.AnimationId = AnimationIds.wrestlerIdle
local jumpAnimation = Instance.new("Animation")
jumpAnimation.AnimationId = AnimationIds.wrestlerJump

type MovementServiceClient = typeof(MovementServiceClient) & {
	networker: Networker.Client,
	tracks: { [string]: AnimationTrack },
}

function MovementServiceClient.Init(self: MovementServiceClient)
	self.networker = Networker.client.new("MovementService", self)
	AnimationLoader.Init(function()
		self.tracks =
			{ idle = AnimationLoader.LoadAnimation(idleAnimation), jump = AnimationLoader.LoadAnimation(jumpAnimation) }
		self:OverrideDefaultAnimations()
		self:Idle()
	end)

	UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
		if gameProcessedEvent then
			return
		end
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.Space then
				self:Jump()
			end
		end
	end)

	UserInputService.InputEnded:Connect(function(input: InputObject, gameProcessedEvent: boolean)
		if gameProcessedEvent then
			return
		end
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.Space then
				self:Idle()
			end
		end
	end)
end

function MovementServiceClient.OverrideDefaultAnimations(_self: MovementServiceClient)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	local animateScript = character:WaitForChild("Animate") :: LocalScript
	local idleConfig = animateScript:WaitForChild("idle")
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false) -- Remove default fall animations

	for _, child in idleConfig:GetChildren() do
		if child:IsA("Animation") then
			local newIdleAnimation = Instance.new("Animation")
			newIdleAnimation.Name = child.Name
			newIdleAnimation.AnimationId = AnimationIds.wrestlerIdle
			child:Destroy()
			newIdleAnimation.Parent = idleConfig
		end
	end
end

function MovementServiceClient.Idle(self: MovementServiceClient)
	self.tracks.jump:Stop()
	self.tracks.idle:Play()
end

function MovementServiceClient.Jump(self: MovementServiceClient)
	self.tracks.idle:Stop()
	self.tracks.jump:Play()
	self.networker:fire("Jump")
end

return MovementServiceClient
