--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type TextLabelProps = {
	Text: string,
	TextSize: number?,
	TextScaled: boolean?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	TextTransparency: number?,
	TextColor3: Color3?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,
	TextWrapped: boolean?,
	RichText: boolean?,
	Font: Font?,
}

local function Label(props: TextLabelProps)
	return create("TextLabel")({
		Text = props.Text,
		TextSize = props.TextSize,
		TextScaled = if props.TextSize then false else props.TextScaled,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		TextTransparency = props.TextTransparency,
		TextColor3 = props.TextColor3,
		TextXAlignment = props.TextXAlignment,
		TextYAlignment = props.TextYAlignment,
		TextWrapped = props.TextWrapped,
		RichText = props.RichText,
		Font = props.Font,
	})
end

return Label
