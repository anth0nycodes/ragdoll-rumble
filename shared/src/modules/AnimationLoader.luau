--!strict
local AnimationLoader = {}
local humanoid: Humanoid

-- Utils
local CharacterLoader = require(script.Parent.CharacterLoader)

local function onCharacterAdded(_, newHumanoid)
	humanoid = newHumanoid
end

function AnimationLoader.Init()
	CharacterLoader.Init(onCharacterAdded)
end

function AnimationLoader.LoadAnimation(animation: Animation): AnimationTrack
	local animator = humanoid:WaitForChild("Animator") :: Animator
	local animationTrack = animator:LoadAnimation(animation)
	return animationTrack
end

type AnimationLoader = typeof(AnimationLoader)

return AnimationLoader :: AnimationLoader
