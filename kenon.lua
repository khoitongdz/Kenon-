-- Flyx Hub Script for Blox Fruits with ESP
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
local FarmButton = Instance.new("TextButton")
FarmButton.Size = UDim2.new(0.25, 0, 1, 0)
FarmButton.Position = UDim2.new(0, 0, 0, 0)
FarmButton.Text = "Auto Farm"
FarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FarmButton.Parent = TabsFrame

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

-- ESP Tab
local ESPFrame = Instance.new("Frame")
ESPFrame.Size = UDim2.new(1, 0, 0.75, 0)
ESPFrame.Position = UDim2.new(0, 0, 0.25, 0)
ESPFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPFrame.Visible = false
ESPFrame.Parent = MainFrame

-- Toggle ESP
local function createToggle(name, parent, position, action)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0.9, 0, 0.1, 0)
    toggle.Position = position
    toggle.Text = name
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    toggle.Parent = parent

    local enabled = false
    toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            toggle.Text = name .. " [ON]"
            toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            action(true)
        else
            toggle.Text = name .. " [OFF]"
            toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            action(false)
        end
    end)

    return toggle
end

local espEnabled = false
local function toggleESP(state)
    espEnabled = state
    if espEnabled then
        -- ESP logic: Show boxes/names of entities (like mobs, NPCs, players)
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

createToggle("Enable ESP", ESPFrame, UDim2.new(0.05, 0, 0.05, 0), toggleESP)

-- Switch between Tabs
local function switchTab(tab)
    ESPFrame.Visible = false
    AutoFarmFrame.Visible = false
    TeleportFrame.Visible = false
    MiscFrame.Visible = false

    if tab == "ESP" then
        ESPFrame.Visible = true
    elseif tab == "Farm" then
        AutoFarmFrame.Visible = true
    elseif tab == "Teleport" then
        TeleportFrame.Visible = true
    elseif tab == "Misc" then
        MiscFrame.Visible = true
    end
end

FarmButton.MouseButton1Click:Connect(function()
    switchTab("Farm")
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
