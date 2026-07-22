--!strict
local AnimationLoader = {}
local humanoid: Humanoid

-- Utils
local CharacterLoader = require(script.Parent.CharacterLoader)

local function onCharacterAdded(_, newHumanoid)
	humanoid = newHumanoid
end

function AnimationLoader.Init(callback: (() -> ())?)
	CharacterLoader.Init(function(newCharacter, newHumanoid)
		onCharacterAdded(newCharacter, newHumanoid)
		if callback then
			callback()
		end
	end)
end

function AnimationLoader.LoadAnimation(animation: Animation): AnimationTrack
	local animator = humanoid:WaitForChild("Animator") :: Animator
	local animationTrack = animator:LoadAnimation(animation)
	return animationTrack
end

type AnimationLoader = typeof(AnimationLoader)

return AnimationLoader :: AnimationLoader
