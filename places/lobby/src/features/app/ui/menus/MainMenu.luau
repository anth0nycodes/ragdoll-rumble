--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create

local Button = require(ReplicatedStorage.Source.Shared.Components.UI.Button)

local function MainMenu()
	return create("Frame")({
		Name = "MainMenu",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,

		create("UIListLayout")({ FillDirection = "Horizontal", Padding = UDim.new(0.1, 0) }),

		Button({
			Text = "Play",
			TextScaled = true,
			Activated = function()
				print("Play button clicked")
			end,
		}),

		Button({
			Text = "Settings",
			TextScaled = true,
			Activated = function()
				print("Settings button clicked")
			end,
		}),
	})
end

return MainMenu
