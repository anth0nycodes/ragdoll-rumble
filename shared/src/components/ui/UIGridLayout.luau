--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UIGridLayoutProps = {
	CellPadding: UDim2?,
	CellSize: UDim2?,
	FillDirection: Enum.FillDirection?,
	FillDirectionMaxCells: number?,
	StartCorner: Enum.StartCorner?,
	SortOrder: Enum.SortOrder?,
	HorizontalAlignment: Enum.HorizontalAlignment?,
	VerticalAlignment: Enum.VerticalAlignment?,
}

local function UIGridLayout(props: UIGridLayoutProps)
	return create("UIGridLayout")({
		CellPadding = props.CellPadding,
		CellSize = props.CellSize,
		FillDirection = props.FillDirection,
		FillDirectionMaxCells = props.FillDirectionMaxCells or 0,
		StartCorner = props.StartCorner,
		SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = props.HorizontalAlignment,
		VerticalAlignment = props.VerticalAlignment,
	})
end

return UIGridLayout
