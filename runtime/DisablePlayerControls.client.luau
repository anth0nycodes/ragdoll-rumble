--!strict
-- Game Services
local Players = game:GetService("Players")

local player = Players.LocalPlayer
assert(player, "Player is not defined")
local playerScripts = player:WaitForChild("PlayerScripts")
local playerModule = require(playerScripts:WaitForChild("PlayerModule"))
local controls = playerModule:GetControls()

-- Disable all default controls
controls:Disable()
