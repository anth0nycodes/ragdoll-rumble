--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type FrameProps = {
	Name: string?,
	AnchorPoint: Vector2?,
	Position: UDim2?,
	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,
	Rotation: number?,
	LayoutOrder: number?,
	ZIndex: number?,
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	Visible: boolean?,
	ClipsDescendants: boolean?,
	CornerRadius: UDim?,
}

local function Frame(props: FrameProps)
	return create("Frame")({
		Name = props.Name,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = if props.Size then props.Size else UDim2.fromScale(0.15, 0.05),
		AutomaticSize = props.AutomaticSize,
		Rotation = props.Rotation,
		LayoutOrder = props.LayoutOrder,
		ZIndex = props.ZIndex,
		BackgroundColor3 = props.BackgroundColor3,
		BackgroundTransparency = props.BackgroundTransparency,
		Visible = props.Visible,
		ClipsDescendants = props.ClipsDescendants,
		if props.CornerRadius then create("UICorner")({ CornerRadius = props.CornerRadius }) else nil,
	})
end

return Frame
