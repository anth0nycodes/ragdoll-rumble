--!strict
local CharacterLoader = {}

-- Game Services
local Players = game:GetService("Players")

-- Player
local player = Players.LocalPlayer
assert(player, "Player is not defined")

function CharacterLoader.Init(callback: (newCharacter: Model, newHumanoid: Humanoid) -> ())
	local function onCharacterAdded(character: Model)
		local humanoid = character:WaitForChild("Humanoid") :: Humanoid
		callback(character, humanoid)
	end

	if player.Character then
		onCharacterAdded(player.Character)
	end
	player.CharacterAdded:Connect(onCharacterAdded)
end

return CharacterLoader
