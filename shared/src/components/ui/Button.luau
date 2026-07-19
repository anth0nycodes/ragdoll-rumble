--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local UICorner = require(ReplicatedStorage.Source.Shared.Components.UI.UICorner)
local create = Vide.create

type TextButtonProps = {
	Name: string?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,
	BackgroundColor3: Color3?,
	Text: string,
	TextSize: number?,
	TextScaled: boolean?,
	TextColor3: Color3?,
	Activated: ((input: InputObject, clickCount: number) -> ())?,
	MouseEnter: ((x: number, y: number) -> ())?,
	MouseLeave: ((x: number, y: number) -> ())?,
	InputBegan: ((input: InputObject) -> ())?,
	CornerRadius: UDim?,
}

local function Button(props: TextButtonProps)
	return create("TextButton")({
		Name = props.Name,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		AutomaticSize = props.AutomaticSize,
		BackgroundColor3 = props.BackgroundColor3,
		Text = props.Text,
		TextSize = props.TextSize,
		TextScaled = if props.TextSize then false else props.TextScaled,
		TextColor3 = props.TextColor3,
		Activated = props.Activated,
		MouseEnter = props.MouseEnter,
		MouseLeave = props.MouseLeave,
		InputBegan = props.InputBegan,
		if props.CornerRadius then UICorner({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return Button
