local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local flying = false

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FlyxMenu"

local logoButton = Instance.new("ImageButton")
logoButton.Image = "rbxassetid://123456789" -- Replace with your logo's image ID
logoButton.Size = UDim2.new(0, 50, 0, 50)
logoButton.Position = UDim2.new(0, 100, 0, 100)
logoButton.Parent = gui

local logoState = false
local antiAfkEnabled = false
local autoAttackEnabled = false
local fastAttackEnabled = false
local autoMonsterAttackEnabled = false

-- Toggle Fly Functionality
logoButton.MouseButton1Click:Connect(function()
    flying = not flying
    logoButton.Image = flying and "rbxassetid://987654321" or "rbxassetid://123456789" -- Replace with on/off images
end)

-- Anti-AFK Button
local antiAfkButton = Instance.new("TextButton")
antiAfkButton.Text = "Anti AFK: OFF"
antiAfkButton.Size = UDim2.new(0, 150, 0, 50)
antiAfkButton.Position = UDim2.new(0, 200, 0, 100)
antiAfkButton.Parent = gui

antiAfkButton.MouseButton1Click:Connect(function()
    antiAfkEnabled = not antiAfkEnabled
    antiAfkButton.Text = antiAfkEnabled and "Anti AFK: ON" or "Anti AFK: OFF"
    if antiAfkEnabled then
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new(0, 0))
        end)
    end
end)

-- Auto Attack Button
local autoAttackButton = Instance.new("TextButton")
autoAttackButton.Text = "Auto Attack: OFF"
autoAttackButton.Size = UDim2.new(0, 150, 0, 50)
autoAttackButton.Position = UDim2.new(0, 400, 0, 100)
autoAttackButton.Parent = gui

local autoAttackLoop
autoAttackButton.MouseButton1Click:Connect(function()
    autoAttackEnabled = not autoAttackEnabled
    autoAttackButton.Text = autoAttackEnabled and "Auto Attack: ON" or "Auto Attack: OFF"
    if autoAttackEnabled then
        autoAttackLoop = coroutine.create(function()
            while autoAttackEnabled do
                local target = workspace:FindFirstChild("Target") -- Replace "Target" with your game-specific logic
                if target and target:FindFirstChild("Humanoid") then
                    local attackAnimation = character.Humanoid:LoadAnimation(Instance.new("Animation", game.CoreGui))
                    attackAnimation.AnimationId = "rbxassetid://AnimationID" -- Replace with valid animation ID
                    attackAnimation:Play()
                end
                wait(1)
            end
        end)
        coroutine.resume(autoAttackLoop)
    end
end)

-- Fast Attack Button
local fastAttackButton = Instance.new("TextButton")
fastAttackButton.Text = "Fast Attack: OFF"
fastAttackButton.Size = UDim2.new(0, 150, 0, 50)
fastAttackButton.Position = UDim2.new(0, 600, 0, 100)
fastAttackButton.Parent = gui

fastAttackButton.MouseButton1Click:Connect(function()
    fastAttackEnabled = not fastAttackEnabled
    fastAttackButton.Text = fastAttackEnabled and "Fast Attack: ON" or "Fast Attack: OFF"
    character.Humanoid.WalkSpeed = fastAttackEnabled and 20 or 10
    character.Humanoid.JumpPower = fastAttackEnabled and 50 or 20
end)

-- Auto Monster Attack Button
local autoMonsterAttackButton = Instance.new("TextButton")
autoMonsterAttackButton.Text = "Auto Monster Attack: OFF"
autoMonsterAttackButton.Size = UDim2.new(0, 200, 0, 50)
autoMonsterAttackButton.Position = UDim2.new(0, 800, 0, 100)
autoMonsterAttackButton.Parent = gui

local autoMonsterAttackLoop
autoMonsterAttackButton.MouseButton1Click:Connect(function()
    autoMonsterAttackEnabled = not autoMonsterAttackEnabled
    autoMonsterAttackButton.Text = autoMonsterAttackEnabled and "Auto Monster Attack: ON" or "Auto Monster Attack: OFF"
    if autoMonsterAttackEnabled then
        autoMonsterAttackLoop = coroutine.create(function()
            while autoMonsterAttackEnabled do
                local monster = workspace:FindFirstChild("Monster") -- Replace "Monster" with game-specific logic
                if monster and monster:FindFirstChild("Humanoid") then
                    local attackAnimation = character.Humanoid:LoadAnimation(Instance.new("Animation", game.CoreGui))
                    attackAnimation.AnimationId = "rbxassetid://AnimationID" -- Replace with valid animation ID
                    attackAnimation:Play()
                end
                wait(1)
            end
        end)
        coroutine.resume(autoMonsterAttackLoop)
    end
end)
