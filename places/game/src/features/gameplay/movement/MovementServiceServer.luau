--!strict
local MovementServiceServer = {}

-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Networker = require(ReplicatedStorage.Packages.Networker)

type MovementServiceServer = typeof(MovementServiceServer) & {
	networker: Networker.Server,
}

function MovementServiceServer.Init(self: MovementServiceServer)
	self.networker = Networker.server.new("MovementService", self, { self.Jump :: any })
end

function MovementServiceServer.Jump(_self: MovementServiceServer, player: Player)
	print(player.Name .. " jumped!")
end

return MovementServiceServer
