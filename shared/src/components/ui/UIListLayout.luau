--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UIListLayoutProps = {
	Padding: UDim?,
	FillDirection: Enum.FillDirection?,
	HorizontalAlignment: Enum.HorizontalAlignment?,
	VerticalAlignment: Enum.VerticalAlignment?,
	HorizontalFlex: Enum.UIFlexAlignment?,
	VerticalFlex: Enum.UIFlexAlignment?,
	SortOrder: Enum.SortOrder?,
	Wraps: boolean?,
	ItemLineAlignment: Enum.ItemLineAlignment?,
}

local function UIListLayout(props: UIListLayoutProps)
	return create("UIListLayout")({
		Padding = props.Padding,
		FillDirection = props.FillDirection,
		HorizontalAlignment = props.HorizontalAlignment,
		VerticalAlignment = props.VerticalAlignment,
		HorizontalFlex = props.HorizontalFlex,
		VerticalFlex = props.VerticalFlex,
		SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder,
		Wraps = props.Wraps,
		ItemLineAlignment = props.ItemLineAlignment,
	})
end

return UIListLayout
