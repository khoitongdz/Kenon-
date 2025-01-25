-- Flyx Hub Script for Blox Fruits
-- Created by khoitongdz

local FlyxHub = {}

-- Anti-AFK Protection
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame for UI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

-- Title Label
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Text = "Flyx Hub | Blox Fruits"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Tab buttons (Simple buttons for navigation)
local FarmButton = Instance.new("TextButton")
FarmButton.Size = UDim2.new(1, 0, 0.1, 0)
FarmButton.Position = UDim2.new(0, 0, 0.1, 0)
FarmButton.Text = "Auto Farm"
FarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FarmButton.Parent = MainFrame

local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(1, 0, 0.1, 0)
TeleportButton.Position = UDim2.new(0, 0, 0.2, 0)
TeleportButton.Text = "Teleport"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportButton.Parent = MainFrame

-- Placeholder content for Auto Farm tab
local AutoFarmFrame = Instance.new("Frame")
AutoFarmFrame.Size = UDim2.new(1, 0, 0.8, 0)
AutoFarmFrame.Position = UDim2.new(0, 0, 0.3, 0)
AutoFarmFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoFarmFrame.Visible = false
AutoFarmFrame.Parent = ScreenGui

local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Size = UDim2.new(1, 0, 0.1, 0)
AutoFarmLabel.Text = "Select Mob for Auto Farm"
AutoFarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmLabel.TextSize = 18
AutoFarmLabel.BackgroundTransparency = 1
AutoFarmLabel.Parent = AutoFarmFrame

local MobDropdown = Instance.new("TextButton")
MobDropdown.Size = UDim2.new(0.5, 0, 0.1, 0)
MobDropdown.Position = UDim2.new(0.25, 0, 0.2, 0)
MobDropdown.Text = "Select Mob"
MobDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
MobDropdown.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MobDropdown.Parent = AutoFarmFrame

-- Switch between tabs
local function switchTab(tab)
    if tab == "Farm" then
        AutoFarmFrame.Visible = true
    else
        AutoFarmFrame.Visible = false
    end
end

-- Button event handlers
FarmButton.MouseButton1Click:Connect(function()
    switchTab("Farm")
end)

TeleportButton.MouseButton1Click:Connect(function()
    switchTab("Teleport")
end)

-- Load Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flyx Hub Loaded",
    Text = "Enjoy your gameplay with Flyx Hub!",
    Duration = 5
})

return FlyxHub
