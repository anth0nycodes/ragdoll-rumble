--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UICornerProps = {
	CornerRadius: UDim?,
	TopLeftRadius: UDim?,
	TopRightRadius: UDim?,
	BottomLeftRadius: UDim?,
	BottomRightRadius: UDim?,
}

local function UICorner(props: UICornerProps)
	return create("UICorner")({
		CornerRadius = props.CornerRadius or UDim.new(0, 8),
		TopLeftRadius = props.TopLeftRadius,
		TopRightRadius = props.TopRightRadius,
		BottomLeftRadius = props.BottomLeftRadius,
		BottomRightRadius = props.BottomRightRadius,
	})
end

return UICorner
