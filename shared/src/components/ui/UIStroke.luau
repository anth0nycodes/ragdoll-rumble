--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UIStrokeProps = {
	ApplyStrokeMode: Enum.ApplyStrokeMode?,
	Color: Color3?,
	Enabled: boolean?,
	LineJoinMode: Enum.LineJoinMode?,
	Thickness: number?,
	Transparency: number?,
}

local function UIStroke(props: UIStrokeProps)
	return create("UIStroke")({
		ApplyStrokeMode = props.ApplyStrokeMode,
		Color = props.Color or Color3.new(0, 0, 0),
		Enabled = props.Enabled,
		LineJoinMode = props.LineJoinMode,
		Thickness = props.Thickness or 1,
		Transparency = props.Transparency or 0,
	})
end

return UIStroke
