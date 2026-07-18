--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type FrameProps = {
	AnchorPoint: Vector2?,
	Size: UDim2?,
	Position: UDim2?,
	Rotation: number?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	Visible: boolean?,
	ZIndex: number?,
	LayoutOrder: number?,
	ClipsDescendants: boolean?,
	CornerRadius: UDim?,
}

local function Frame(props: FrameProps)
	return create("Frame")({
		AnchorPoint = props.AnchorPoint,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		Position = props.Position,
		Rotation = props.Rotation,
		BackgroundColor3 = props.BackgroundColor3,
		BackgroundTransparency = props.BackgroundTransparency,
		Visible = props.Visible,
		ZIndex = props.ZIndex,
		LayoutOrder = props.LayoutOrder,
		ClipsDescendants = props.ClipsDescendants,
		if props.CornerRadius then create("UICorner")({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return Frame
