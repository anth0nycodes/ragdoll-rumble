--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type ImageLabelProps = {
	Image: string,
	BackgroundTransparency: number?,
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
}

local function ImageLabel(props: ImageLabelProps)
	return create("ImageLabel")({
		Image = props.Image,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		AnchorPoint = if props.AnchorPoint then props.AnchorPoint else Vector2.new(0.5, 0.5),
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		Position = if props.Position then props.Position else UDim2.fromScale(0.5, 0.5),
	})
end

return ImageLabel
