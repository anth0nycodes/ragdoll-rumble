--!strict
local MovementServiceClient = {}

-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

-- Packages
local Networker = require(ReplicatedStorage.Packages.Networker)

-- Modules
local AnimationLoader = require(ReplicatedStorage.Source.Shared.Modules.AnimationLoader)

local AnimationIds = require(ReplicatedStorage.Source.Game.AnimationIds)

type MovementServiceClient = typeof(MovementServiceClient) & {
	networker: Networker.Client,
}

function MovementServiceClient.Init(self: MovementServiceClient)
	self.networker = Networker.client.new("MovementService", self)
	AnimationLoader.Init()
	self:Idle()
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
end

function MovementServiceClient.Idle(_self: MovementServiceClient)
	local idleAnimation = Instance.new("Animation")
	idleAnimation.AnimationId = AnimationIds.wrestlerIdle
	local idleTrack = AnimationLoader.LoadAnimation(idleAnimation)
	idleTrack:Play()
end

function MovementServiceClient.Jump(self: MovementServiceClient)
	local jumpAnimation = Instance.new("Animation")
	jumpAnimation.AnimationId = AnimationIds.wrestlerJump
	local jumpTrack = AnimationLoader.LoadAnimation(jumpAnimation)
	jumpTrack:Play()
	self.networker:fire("Jump")
	jumpTrack.Stopped:Wait()
	self:Idle()
end

return MovementServiceClient
