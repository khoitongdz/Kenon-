--[[ 
    Kenon Hub - All-in-One Script with Modern UI
    Version: 1.2
    Works with all major executors (Synapse X, Krnl, WeAreDevs, etc.)
]]

-- Configuration
getgenv().Team = "Marines" -- Choose your team: "Marines" or "Pirates"
getgenv().AutoFarm = false -- Enable/Disable Auto-Farming
getgenv().AutoQuest = false -- Enable/Disable Auto Quest
getgenv().FastAttack = false -- Enable/Disable Fast Attack

-- Wait until the game is fully loaded
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Create GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "KenonHub"
screenGui.ResetOnSpawn = false -- Keep GUI after respawn

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 600)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundTransparency = 0.1
mainFrame.Visible = false -- Menu hidden initially

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Text = "Kenon Hub"
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

-- Create a button in the tab content frame
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

createButton("AutoQuestButton", UDim2.new(0, 0, 0, 130), UDim2.new(1, 0, 0, 50), "Toggle Auto-Quest", function()
    getgenv().AutoQuest = not getgenv().AutoQuest
    print("Auto-Quest is now", getgenv().AutoQuest and "ON" or "OFF")
end)

-- Menu Toggle Icon
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Image = "https://images-ext-1.discordapp.net/external/QKfBrLEqr4HicNoOEDr3vg8g5uuoBCdb3n_ENYSY1Uc/https/cdn.nekotina.com/images/L06x1IO7L.jpg?format=webp&width=312&height=416" -- Replace with your image ID
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = screenGui

-- Toggle Menu Visibility
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

print("Kenon Hub loaded! Click the icon to toggle the menu.")
