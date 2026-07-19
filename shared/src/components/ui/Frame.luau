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
	BackgroundColor3: Color3?,
	BackgroundTransparency: number?,
	BorderSizePixel: number?,
	ClipsDescendants: boolean?,
	LayoutOrder: number?,
	Visible: boolean?,
	ZIndex: number?,
	[number]: Instance,
}

local function Frame(props: FrameProps)
	props.Size = props.Size or UDim2.fromScale(1, 1)
	props.BackgroundTransparency = if props.BackgroundTransparency then props.BackgroundTransparency else 1
	props.BorderSizePixel = props.BorderSizePixel or 0
	return create("Frame")(props)
end

return Frame
