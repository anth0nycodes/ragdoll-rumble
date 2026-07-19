--!strict
-- Game Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

-- UI Primitives
local Button = require(ReplicatedStorage.Source.Shared.Components.UI.Button)
local ImageLabel = require(ReplicatedStorage.Source.Shared.Components.UI.ImageLabel)
local Frame = require(ReplicatedStorage.Source.Shared.Components.UI.Frame)
local UIListLayout = require(ReplicatedStorage.Source.Shared.Components.UI.UIListLayout)
local UIPadding = require(ReplicatedStorage.Source.Shared.Components.UI.UIPadding)

local ImageIds = require(ReplicatedStorage.Source.Game.Assets.ImageIds)

local function MainMenu()
	return Frame({
		Name = "MainMenu",

		UIPadding({
			PaddingTop = UDim.new(0.05, 0),
		}),

		UIListLayout({
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

		Frame({
			Name = "NavigationalButtons",
			Size = UDim2.fromScale(1, 0.05),

			UIListLayout({
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
					local success, result = pcall(function()
						TeleportService:Teleport(82886201833882)
					end)
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
