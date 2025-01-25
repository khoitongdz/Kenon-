-- Flyx Hub Script for Blox Fruits with All Features
-- Created by khoitongdz

local FlyxHub = {}

-- Anti-AFK Protection
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- UI Setup (Using custom library for a better interface)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame for UI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.5, 0, 0.7, 0)
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
MainFrame.BackgroundTransparency = 0.8
MainFrame.Parent = ScreenGui

-- Title Label
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Text = "Flyx Hub | Blox Fruits"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26
Title.TextStrokeTransparency = 0.8
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Tabs Layout
local TabsFrame = Instance.new("Frame")
TabsFrame.Size = UDim2.new(1, 0, 0.15, 0)
TabsFrame.Position = UDim2.new(0, 0, 0.1, 0)
TabsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabsFrame.Parent = MainFrame

-- Tab Buttons
local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Size = UDim2.new(0.25, 0, 1, 0)
AutoFarmButton.Position = UDim2.new(0, 0, 0, 0)
AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoFarmButton.Parent = TabsFrame

local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(0.25, 0, 1, 0)
TeleportButton.Position = UDim2.new(0.25, 0, 0, 0)
TeleportButton.Text = "Teleport"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TeleportButton.Parent = TabsFrame

local MiscButton = Instance.new("TextButton")
MiscButton.Size = UDim2.new(0.25, 0, 1, 0)
MiscButton.Position = UDim2.new(0.5, 0, 0, 0)
MiscButton.Text = "Misc"
MiscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MiscButton.Parent = TabsFrame

local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.25, 0, 1, 0)
ESPButton.Position = UDim2.new(0.75, 0, 0, 0)
ESPButton.Text = "ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ESPButton.Parent = TabsFrame

-- Define UI Sections for each Tab
local AutoFarmFrame = Instance.new("Frame")
AutoFarmFrame.Size = UDim2.new(1, 0, 0.75, 0)
AutoFarmFrame.Position = UDim2.new(0, 0, 0.25, 0)
AutoFarmFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoFarmFrame.Visible = false
AutoFarmFrame.Parent = MainFrame

local TeleportFrame = Instance.new("Frame")
TeleportFrame.Size = UDim2.new(1, 0, 0.75, 0)
TeleportFrame.Position = UDim2.new(0, 0, 0.25, 0)
TeleportFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportFrame.Visible = false
TeleportFrame.Parent = MainFrame

local MiscFrame = Instance.new("Frame")
MiscFrame.Size = UDim2.new(1, 0, 0.75, 0)
MiscFrame.Position = UDim2.new(0, 0, 0.25, 0)
MiscFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MiscFrame.Visible = false
MiscFrame.Parent = MainFrame

local ESPFrame = Instance.new("Frame")
ESPFrame.Size = UDim2.new(1, 0, 0.75, 0)
ESPFrame.Position = UDim2.new(0, 0, 0.25, 0)
ESPFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPFrame.Visible = false
ESPFrame.Parent = MainFrame

-- Toggle ESP
local espEnabled = false
local function toggleESP(state)
    espEnabled = state
    if espEnabled then
        -- ESP logic: Show boxes/names of entities (like mobs, NPCs, or players)
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                local espBox = Instance.new("BillboardGui")
                espBox.Size = UDim2.new(0, 200, 0, 50)
                espBox.Adornee = v.Head
                espBox.Parent = v
                espBox.AlwaysOnTop = true
                espBox.StudsOffset = Vector3.new(0, 3, 0)
                
                local espLabel = Instance.new("TextLabel")
                espLabel.Size = UDim2.new(1, 0, 1, 0)
                espLabel.Text = v.Name
                espLabel.BackgroundTransparency = 1
                espLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                espLabel.TextStrokeTransparency = 0.8
                espLabel.TextSize = 16
                espLabel.Parent = espBox
            end
        end
    else
        -- Remove all ESP boxes
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                for _, gui in pairs(v:GetChildren()) do
                    if gui:IsA("BillboardGui") then
                        gui:Destroy()
                    end
                end
            end
        end
    end
end

-- Button to Toggle ESP
local ESPToggleButton = Instance.new("TextButton")
ESPToggleButton.Size = UDim2.new(0.8, 0, 0.1, 0)
ESPToggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ESPToggleButton.Text = "Toggle ESP"
ESPToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ESPToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggleButton.Parent = ESPFrame

ESPToggleButton.MouseButton1Click:Connect(function()
    toggleESP(not espEnabled)
end)

-- Switch between Tabs
local function switchTab(tab)
    AutoFarmFrame.Visible = false
    TeleportFrame.Visible = false
    MiscFrame.Visible = false
    ESPFrame.Visible = false

    if tab == "Auto Farm" then
        AutoFarmFrame.Visible = true
    elseif tab == "Teleport" then
        TeleportFrame.Visible = true
    elseif tab == "Misc" then
        MiscFrame.Visible = true
    elseif tab == "ESP" then
        ESPFrame.Visible = true
    end
end

AutoFarmButton.MouseButton1Click:Connect(function()
    switchTab("Auto Farm")
end)

TeleportButton.MouseButton1Click:Connect(function()
    switchTab("Teleport")
end)

MiscButton.MouseButton1Click:Connect(function()
    switchTab("Misc")
end)

ESPButton.MouseButton1Click:Connect(function()
    switchTab("ESP")
end)

-- Load Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flyx Hub Loaded",
    Text = "Enjoy your gameplay with Flyx Hub!",
    Duration = 5
})

return FlyxHub
