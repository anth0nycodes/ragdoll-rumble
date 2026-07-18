--!strict
local GameServiceServer = {}

-- Game Services
local Players = game:GetService("Players")

local function setPlayerCollisionGroup(player: Player)
	local character = player.Character or player.CharacterAdded:Wait()
	for _, part in character:GetDescendants() do
		if part:IsA("BasePart") then
			part.CollisionGroup = "PlayerPart"
		end
	end
end

function GameServiceServer.Init()
	Players.PlayerAdded:Connect(function(player: Player)
		player.CharacterAdded:Connect(function(character: Model)
			setPlayerCollisionGroup(player)
			local humanoidRootPart = character:WaitForChild("HumanoidRootPart") :: BasePart
			if humanoidRootPart then
				humanoidRootPart.Anchored = true
			end
		end)
	end)
end

return GameServiceServer
