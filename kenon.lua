--[[ 
    Kenon Hub - All-in-One Script with Modern UI
    Version: 1.0
    Safe and Customizable for Roblox Games
    This script works on most major executors (Synapse X, Krnl, WeAreDevs, etc.)
]]

-- Configuration
getgenv().Team = "Marines" -- Choose your team: "Marines" or "Pirates"
getgenv().AutoFarm = true -- Enable/Disable Auto-Farming
getgenv().AutoQuest = false -- Enable/Disable Auto Quest
getgenv().FastAttack = true -- Enable/Disable Fast Attack

-- Wait until game is fully loaded
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Create GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "KenonHubMenu"
screenGui.ResetOnSpawn = false -- Keep GUI after respawn

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 600)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundTransparency = 0.1
mainFrame.ZIndex = 10

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

-- Logo Button (Toggle)
local logoButton = Instance.new("ImageButton")
logoButton.Size = UDim2.new(0, 50, 0, 50)
logoButton.Position = UDim2.new(0, 390, 0, 10)
logoButton.Image = "https://images-ext-1.discordapp.net/external/QKfBrLEqr4HicNoOEDr3vg8g5uuoBCdb3n_ENYSY1Uc/https/cdn.nekotina.com/images/L06x1IO7L.jpg?format=webp&width=312&height=416"  -- Replace with your actual logo's asset ID
logoButton.BackgroundTransparency = 1
logoButton.Parent = mainFrame

local logoEnabled = true -- Toggle state for the logo visibility

logoButton.MouseButton1Click:Connect(function()
    logoEnabled = not logoEnabled
    if logoEnabled then
        logoButton.ImageTransparency = 0
    else
        logoButton.ImageTransparency = 1
    end
end)

-- Tab Section
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(0, 450, 0, 50)
tabsFrame.Position = UDim2.new(0, 0, 0, 60)
tabsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
tabsFrame.Parent = mainFrame

-- "Main" Tab Button
local mainTabButton = Instance.new("TextButton")
mainTabButton.Size = UDim2.new(0, 225, 1, 0)
mainTabButton.Text = "Main"
mainTabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
mainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTabButton.TextSize = 26
mainTabButton.Font = Enum.Font.Gotham
mainTabButton.BorderSizePixel = 0
mainTabButton.Parent = tabsFrame

mainTabButton.MouseEnter:Connect(function()
    mainTabButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
end)

mainTabButton.MouseLeave:Connect(function()
    mainTabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

-- Tab Content Frame (Main Tab)
local tabContentFrame = Instance.new("Frame")
tabContentFrame.Size = UDim2.new(1, 0, 0, 500)
tabContentFrame.Position = UDim2.new(0, 0, 0, 110)
tabContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
tabContentFrame.Visible = false
tabContentFrame.Parent = mainFrame

-- Toggle Visibility of Tab Content
mainTabButton.MouseButton1Click:Connect(function()
    tabContentFrame.Visible = not tabContentFrame.Visible
end)

-- Button Style Function (Modern)
local function createButton(name, position, size, text, callback)
    local button = Instance.new("TextButton")
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

    return button
end

-- Auto-Farm Button
createButton("AutoFarmButton", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 50), "Auto-Farm: ON", function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    if getgenv().AutoFarm then
        -- Start Auto-Farming Logic
        autoFarmWithFastAttack()
    end
end)

-- Fast Attack Button
createButton("FastAttackButton", UDim2.new(0, 0, 0, 60), UDim2.new(1, 0, 0, 50), "Fast Attack: ON", function()
    getgenv().FastAttack = not getgenv().FastAttack
end)

-- Auto Quest Button
createButton("AutoQuestButton", UDim2.new(0, 0, 0, 120), UDim2.new(1, 0, 0, 50), "Auto Quest: OFF", function()
    getgenv().AutoQuest = not getgenv().AutoQuest
end)

-- Fast Attack Logic
local function autoFarmWithFastAttack()
    while getgenv().AutoFarm do
        local mobs = game:GetService("Workspace"):GetChildren() -- Get all objects in Workspace
        for _, mob in pairs(mobs) do
            if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                -- Move towards the mob and attack
                local character = game.Players.LocalPlayer.Character
                if character and mob then
                    local targetPosition = mob.HumanoidRootPart.Position
                    character:MoveTo(targetPosition)
                    if character:FindFirstChild("Humanoid") then
                        character.Humanoid:MoveTo(targetPosition)
                    end
                    -- Perform fast attack if enabled
                    if getgenv().FastAttack then
                        fastAttack(mob)
                    end
                end
            end
        end
        wait(0.1) -- Delay between actions to prevent overload
    end
end

-- Fast Attack Function
local function fastAttack(target)
    local character = game.Players.LocalPlayer.Character
    if character and target then
        local humanoid = target:FindFirstChild("Humanoid")
        if humanoid then
            -- Simulate a quick attack (using FireServer for RemoteEvent, adjust based on your game's mechanics)
            local attackEvent = game.ReplicatedStorage:WaitForChild("Attack")
            if attackEvent then
                while getgenv().FastAttack do
                    attackEvent:FireServer(target) -- Fire an attack event on the target
                    wait(0) -- No delay to simulate fastest attack
                end
            end
        end
    end
end

-- Main execution (to activate menu and functionalities)
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
