-- Kenon Hub | Full Blox Fruits Script (Update 26)
-- Support Executor PC/Mobile | Full UI | Full Features
-- Toggle UI = Click logo icon in bottom left corner

local KenonUI = Instance.new("ScreenGui")
KenonUI.Name = "KenonHub"
KenonUI.ResetOnSpawn = false
KenonUI.DisplayOrder = 999
KenonUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
KenonUI.Parent = game.CoreGui

local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 1, -60)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxassetid://105486552530887"
toggleButton.Parent = KenonUI

local mainUI = Instance.new("Frame")
mainUI.Size = UDim2.new(0, 600, 0, 400)
mainUI.Position = UDim2.new(0.5, -300, 0.5, -200)
mainUI.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainUI.BackgroundTransparency = 0.2
mainUI.BorderSizePixel = 0
mainUI.Visible = false
mainUI.Active = true
mainUI.Draggable = true
mainUI.Parent = KenonUI

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = mainUI

-- UI Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Kenon Hub | Blox Fruits"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = mainUI

-- Toggle UI
local visible = false
toggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    mainUI.Visible = visible
end)

-- Loader for all features
loadstring(game:HttpGet("https://raw.githubusercontent.com/khoitongdz/Kenon-/refs/heads/main/KenonHubautobouty.lua"))()

-- Show loading
local loading = Instance.new("TextLabel")
loading.Size = UDim2.new(1, 0, 1, 0)
loading.Position = UDim2.new(0, 0, 0, 0)
loading.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loading.BackgroundTransparency = 0.3
loading.Text = "Kenon Loading..."
loading.TextColor3 = Color3.new(1, 1, 1)
loading.TextSize = 36
loading.Font = Enum.Font.GothamBold
loading.ZIndex = 9999
loading.Parent = KenonUI

task.wait(5)
loading:Destroy()

-- End UI base
-- Make sure the script 'core.lua' contains all features (AutoFarm, Webhook, etc.)
