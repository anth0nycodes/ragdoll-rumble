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
	BackgroundColor3: Color3?,
	TextColor3: Color3?,
	CornerRadius: UDim?,
	Activated: () -> (),
}

local function Button(props: TextButtonProps)
	return create("TextButton")({
		Text = props.Text,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		BackgroundColor3 = props.BackgroundColor3,
		TextColor3 = props.TextColor3,
		Activated = props.Activated,
		create("UICorner")({
			CornerRadius = if props.CornerRadius then props.CornerRadius else UDim.new(0.1, 0),
		}),
	})
end

return Button
