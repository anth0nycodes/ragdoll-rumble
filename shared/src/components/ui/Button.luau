--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
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
	Activated: () -> (),
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
		if props.CornerRadius then create("UICorner")({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return Button
