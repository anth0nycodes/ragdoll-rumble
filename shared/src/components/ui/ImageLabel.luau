--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type ImageLabelProps = {
	Name: string?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,
	BackgroundTransparency: number?,
	Image: string,
	ScaleType: Enum.ScaleType?,
}

local function ImageLabel(props: ImageLabelProps)
	return create("ImageLabel")({
		Name = props.Name,
		AnchorPoint = if props.AnchorPoint then props.AnchorPoint else Vector2.new(0.5, 0.5),
		Position = if props.Position then props.Position else UDim2.fromScale(0.5, 0.5),
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		AutomaticSize = props.AutomaticSize,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		Image = props.Image,
		ScaleType = props.ScaleType or Enum.ScaleType.Fit,
	})
end

return ImageLabel
