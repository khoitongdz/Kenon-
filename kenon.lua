--[[ 
    Kenon Hub - Multi-Function Script
    Version: 1.5
    Works with all major executors
]]

-- Configuration
getgenv().AutoFarm = false -- Auto-Farm
getgenv().FastAttack = false -- Fast Attack
getgenv().AutoQuest = false -- Auto-Quest
getgenv().SilentAim = false -- Silent Aim
getgenv().ESP = false -- ESP (Extra Sensory Perception)
getgenv().WalkSpeed = 16 -- Default WalkSpeed
getgenv().JumpPower = 50 -- Default JumpPower
getgenv().GodMode = false -- God Mode

-- Wait until the game is fully loaded
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Create GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "KenonHubMenu"
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 600)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundTransparency = 0.1
mainFrame.Visible = false -- Menu hidden initially

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Text = "Kenon Hub - Multi-Function"
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 32
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextStrokeTransparency = 0.5
titleLabel.Parent = mainFrame

-- Tab Content Frame
local tabContentFrame = Instance.new("Frame")
tabContentFrame.Size = UDim2.new(1, 0, 1, -50)
tabContentFrame.Position = UDim2.new(0, 0, 0, 50)
tabContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
tabContentFrame.Parent = mainFrame

-- Create a button
local function createButton(name, position, size, text, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = size
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 20
    button.Font = Enum.Font.Gotham
    button.BorderSizePixel = 0
    button.Parent = tabContentFrame
    
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    button.MouseButton1Click:Connect(callback)
end

-- Add buttons for functionalities
createButton("AutoFarmButton", UDim2.new(0, 0, 0, 10), UDim2.new(1, 0, 0, 50), "Toggle Auto-Farm", function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    print("Auto-Farm is now", getgenv().AutoFarm and "ON" or "OFF")
end)

createButton("FastAttackButton", UDim2.new(0, 0, 0, 70), UDim2.new(1, 0, 0, 50), "Toggle Fast Attack", function()
    getgenv().FastAttack = not getgenv().FastAttack
    print("Fast Attack is now", getgenv().FastAttack and "ON" or "OFF")
end)

createButton("SilentAimButton", UDim2.new(0, 0, 0, 130), UDim2.new(1, 0, 0, 50), "Toggle Silent Aim", function()
    getgenv().SilentAim = not getgenv().SilentAim
    print("Silent Aim is now", getgenv().SilentAim and "ON" or "OFF")
end)

createButton("ESPButton", UDim2.new(0, 0, 0, 190), UDim2.new(1, 0, 0, 50), "Toggle ESP", function()
    getgenv().ESP = not getgenv().ESP
    print("ESP is now", getgenv().ESP and "ON" or "OFF")
end)

createButton("WalkSpeedButton", UDim2.new(0, 0, 0, 250), UDim2.new(1, 0, 0, 50), "Increase WalkSpeed", function()
    getgenv().WalkSpeed = getgenv().WalkSpeed + 10
    player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeed
    print("WalkSpeed set to", getgenv().WalkSpeed)
end)

createButton("JumpPowerButton", UDim2.new(0, 0, 0, 310), UDim2.new(1, 0, 0, 50), "Increase JumpPower", function()
    getgenv().JumpPower = getgenv().JumpPower + 10
    player.Character.Humanoid.JumpPower = getgenv().JumpPower
    print("JumpPower set to", getgenv().JumpPower)
end)

createButton("GodModeButton", UDim2.new(0, 0, 0, 370), UDim2.new(1, 0, 0, 50), "Toggle God Mode", function()
    getgenv().GodMode = not getgenv().GodMode
    if getgenv().GodMode then
        player.Character.Humanoid.Health = math.huge
        print("God Mode Activated")
    else
        player.Character.Humanoid.Health = 100
        print("God Mode Deactivated")
    end
end)

-- Menu Toggle Icon
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Image = "rbxassetid://1234567890" -- Replace with your image ID
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = screenGui

-- Toggle Menu Visibility
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    print("Menu visibility toggled:", mainFrame.Visible)
end)

-- Debugging Log
print("Kenon Hub loaded! Click the icon to toggle the menu.")
