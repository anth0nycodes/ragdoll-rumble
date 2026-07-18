--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

-- Packages
local Vide = require(ReplicatedStorage.Packages.Vide)
local create = Vide.create
local Button = require(ReplicatedStorage.Source.Shared.Components.UI.Button)
local ImageLabel = require(ReplicatedStorage.Source.Shared.Components.UI.ImageLabel)

local ImageIds = require(ReplicatedStorage.Source.Game.Assets.ImageIds)

local function MainMenu()
	return create("Frame")({
		Name = "MainMenu",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,

		create("UIPadding")({
			PaddingTop = UDim.new(0.05, 0),
		}),

		create("UIListLayout")({
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0.1, 0),
		}),

		ImageLabel({
			Name = "Title",
			Image = ImageIds.Logo,
			Size = UDim2.fromScale(1, 0.2),
		}),

		create("Frame")({
			Name = "NavigationalButtons",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0.05),

			create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0.05, 0),
			}),

			Button({
				Name = "Play",
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0.15, 1),
				Text = "Play",
				TextScaled = true,
				Activated = function()
					local success, result = pcall(TeleportService:Teleport(82886201833882))
					if not success then
						warn(`Failed to teleport player: {result}`)
					end
				end,
			}),

			Button({
				Name = "Settings",
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0.15, 1),
				Text = "Settings",
				TextScaled = true,
				Activated = function()
					print("Settings button clicked")
				end,
			}),
		}),
	})
end

return MainMenu
