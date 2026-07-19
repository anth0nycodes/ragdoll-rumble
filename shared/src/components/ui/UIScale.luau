--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

type UIScaleProps = {
	Scale: number?,
}

local function UIScale(props: UIScaleProps)
	return create("UIScale")({
		Scale = props.Scale or 1,
	})
end

return UIScale
