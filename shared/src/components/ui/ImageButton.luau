--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type ImageButtonProps = {
	Image: string,
	BackgroundTransparency: number?,
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
	Activated: () -> (),
	CornerRadius: UDim?,
}

local function ImageButton(props: ImageButtonProps)
	return create("ImageButton")({
		Image = props.Image,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		AnchorPoint = props.AnchorPoint,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		Position = props.Position,
		Activated = props.Activated,
		create("UICorner")({
			CornerRadius = if props.CornerRadius then props.CornerRadius else UDim.new(0.1, 0),
		}),
	})
end

return ImageButton
