--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type TextButtonProps = {
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
	Text: string,
	TextSize: number?,
	TextScaled: boolean?,
	BackgroundColor3: Color3?,
	TextColor3: Color3?,
	CornerRadius: UDim?,
	Activated: () -> (),
}

local function Button(props: TextButtonProps)
	return create("TextButton")({
		Text = props.Text,
		TextSize = props.TextSize,
		TextScaled = if props.TextSize then false else props.TextScaled,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		BackgroundColor3 = props.BackgroundColor3,
		TextColor3 = props.TextColor3,
		Activated = props.Activated,
		if props.CornerRadius then create("UICorner")({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return Button
