--[[ 
    Kenon Hub - All-in-One Script
    Version: 1.0
    Safe and Customizable for Roblox Games
    This script should work on all major executors (Synapse X, Krnl, WeAreDevs, etc.)
]]

-- Configuration
getgenv().Team = "Marines" -- Choose your team: "Marines" or "Pirates"
getgenv().AutoFarm = true -- Enable/Disable Auto-Farming
getgenv().AutoQuest = false -- Enable/Disable Auto Quest
getgenv().Teleport = true -- Enable/Disable Teleportation
getgenv().SilentAim = true -- Enable/Disable Silent Aim
getgenv().SpeedBoost = true -- Enable/Disable Speed Boost
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
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Text = "Kenon Hub"
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 30
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextStrokeTransparency = 0.5
titleLabel.Parent = mainFrame

-- Tab Section
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(0, 450, 0, 50)
tabsFrame.Position = UDim2.new(0, 0, 0, 60)
tabsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabsFrame.Parent = mainFrame

-- "Main" Tab Button
local mainTabButton = Instance.new("TextButton")
mainTabButton.Size = UDim2.new(0, 225, 1, 0)
mainTabButton.Text = "Main"
mainTabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
mainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTabButton.TextSize = 24
mainTabButton.Font = Enum.Font.Gotham
mainTabButton.BorderSizePixel = 0
mainTabButton.Parent = tabsFrame

mainTabButton.MouseEnter:Connect(function()
    mainTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)

mainTabButton.MouseLeave:Connect(function()
    mainTabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
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

-- Auto-Farm Button
local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Size = UDim2.new(1, 0, 0, 50)
autoFarmButton.Position = UDim2.new(0, 0, 0, 0)
autoFarmButton.Text = "Auto-Farm: ON"
autoFarmButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmButton.TextSize = 20
autoFarmButton.Font = Enum.Font.Gotham
autoFarmButton.BorderSizePixel = 0
autoFarmButton.Parent = tabContentFrame

autoFarmButton.MouseEnter:Connect(function()
    autoFarmButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

autoFarmButton.MouseLeave:Connect(function()
    autoFarmButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

autoFarmButton.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    autoFarmButton.Text = "Auto-Farm: " .. (getgenv().AutoFarm and "ON" or "OFF")
    if getgenv().AutoFarm then
        autoFarmWithFastAttack() -- Start Auto-Farming with Fast Attack
    end
end)

-- Fast Attack Button
local fastAttackButton = Instance.new("TextButton")
fastAttackButton.Size = UDim2.new(1, 0, 0, 50)
fastAttackButton.Position = UDim2.new(0, 0, 0, 60)
fastAttackButton.Text = "Fast Attack: ON"
fastAttackButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
fastAttackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fastAttackButton.TextSize = 20
fastAttackButton.Font = Enum.Font.Gotham
fastAttackButton.BorderSizePixel = 0
fastAttackButton.Parent = tabContentFrame

fastAttackButton.MouseEnter:Connect(function()
    fastAttackButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

fastAttackButton.MouseLeave:Connect(function()
    fastAttackButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

fastAttackButton.MouseButton1Click:Connect(function()
    getgenv().FastAttack = not getgenv().FastAttack
    fastAttackButton.Text = "Fast Attack: " .. (getgenv().FastAttack and "ON" or "OFF")
end)

-- Functions for Features (Auto-Farm with Fast Attack)
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
