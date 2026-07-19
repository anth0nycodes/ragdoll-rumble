--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UIPaddingProps = {
	PaddingTop: UDim?,
	PaddingBottom: UDim?,
	PaddingLeft: UDim?,
	PaddingRight: UDim?,
}

local function UIPadding(props: UIPaddingProps)
	return create("UIPadding")({
		PaddingTop = props.PaddingTop,
		PaddingBottom = props.PaddingBottom,
		PaddingLeft = props.PaddingLeft,
		PaddingRight = props.PaddingRight,
	})
end

return UIPadding
