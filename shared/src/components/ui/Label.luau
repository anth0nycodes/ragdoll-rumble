--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local UIStroke = require(ReplicatedStorage.Source.Shared.Components.UI.UIStroke)
local create = Vide.create

type Stroke = {
	Thickness: number?,
	Color: Color3?,
	Transparency: number?,
}

type TextLabelProps = {
	Name: string?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,
	Title: string?,
	Text: string,
	TextSize: number?,
	TextScaled: boolean?,
	TextColor3: Color3?,
	TextTransparency: number?,
	TextXAlignment: Enum.TextXAlignment?,
	TextYAlignment: Enum.TextYAlignment?,
	TextWrapped: boolean?,
	RichText: boolean?,
	Font: Enum.Font?,
	Stroke: Stroke?,
}

local function Label(props: TextLabelProps)
	return create("TextLabel")({
		Name = props.Name,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = props.Size or UDim2.fromScale(0.5, 0.1),
		AutomaticSize = props.AutomaticSize,
		Title = props.Title,
		Text = props.Text,
		TextSize = props.TextSize,
		TextScaled = if props.TextSize then false else props.TextScaled,
		TextColor3 = props.TextColor3,
		TextTransparency = props.TextTransparency,
		TextXAlignment = props.TextXAlignment,
		TextYAlignment = props.TextYAlignment,
		TextWrapped = props.TextWrapped,
		RichText = props.RichText,
		Font = props.Font,
		if props.Stroke
			then UIStroke({
				Thickness = props.Stroke.Thickness,
				Color = props.Stroke.Color,
				Transparency = props.Stroke.Transparency,
			})
			else nil,
	})
end

return Label
