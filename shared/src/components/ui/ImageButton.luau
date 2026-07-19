--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local UICorner = require(ReplicatedStorage.Source.Shared.Components.UI.UICorner)
local create = Vide.create

type ImageButtonProps = {
	Name: string?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,
	BackgroundTransparency: number?,
	Image: string,
	Activated: ((input: InputObject, clickCount: number) -> ())?,
	MouseEnter: ((x: number, y: number) -> ())?,
	MouseLeave: ((x: number, y: number) -> ())?,
	InputBegan: ((input: InputObject) -> ())?,
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
		MouseEnter = props.MouseEnter,
		MouseLeave = props.MouseLeave,
		InputBegan = props.InputBegan,
		if props.CornerRadius then UICorner({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return ImageButton
