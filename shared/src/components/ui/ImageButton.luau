--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type ImageButtonProps = {
	Name: string?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,
	BackgroundTransparency: number?,
	Image: string,
	Activated: () -> (),
	CornerRadius: UDim?,
}

local function ImageButton(props: ImageButtonProps)
	return create("ImageButton")({
		Name = props.Name,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		AutomaticSize = props.AutomaticSize,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		Image = props.Image,
		Activated = props.Activated,
		if props.CornerRadius then create("UICorner")({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return ImageButton
