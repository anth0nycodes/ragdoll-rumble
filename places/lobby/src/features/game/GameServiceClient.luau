--!strict
local GameServiceClient = {}

function GameServiceClient.Init()
	local cameraPart = workspace:WaitForChild("CameraPart") :: Part
	local currentCamera = workspace.CurrentCamera
	currentCamera.CameraType = Enum.CameraType.Scriptable
	currentCamera.CFrame = cameraPart.CFrame
end

return GameServiceClient
