--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UIGradientProps = {
	Color: ColorSequence?,
	Enabled: boolean?,
	Offset: Vector2?,
	Rotation: number?,
	Transparency: NumberSequence?,
}

local function UIGradient(props: UIGradientProps)
	return create("UIGradient")({
		Color = props.Color,
		Enabled = props.Enabled,
		Offset = props.Offset,
		Rotation = props.Rotation or 0,
		Transparency = props.Transparency,
	})
end

return UIGradient
