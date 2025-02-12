-- Kenon Hub - Ultimate Blox Fruits Script
local ui = Instance.new("ScreenGui")
ui.Name = "KenonHubUI"
ui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 550)
frame.Position = UDim2.new(0.5, -225, 0.5, -275)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = ui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Text = "Kenon Hub - Blox Fruits"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame
title.TextStrokeTransparency = 0.5
title.TextScaled = true

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -50)
scrollingFrame.Position = UDim2.new(0, 0, 0, 50)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Parent = frame

local function createButton(name, parent, callback)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, (#parent:GetChildren() - 1) * 45)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = parent
    button.AutoButtonColor = true
    button.MouseButton1Click:Connect(callback)
    return button
end

local function autoFarm()
    while wait(0.1) do
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                    character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    game:GetService("VirtualUser"):Button1Down(Vector2.new())
                    enemy.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                end
            end
        end
    end
end

local function teleportToIsland()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 100, 1000)
end

local function enableESP()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local highlight = Instance.new("BoxHandleAdornment")
            highlight.Size = player.Character.HumanoidRootPart.Size + Vector3.new(1, 1, 1)
            highlight.Adornee = player.Character.HumanoidRootPart
            highlight.Color3 = Color3.fromRGB(255, 0, 0)
            highlight.AlwaysOnTop = true
            highlight.ZIndex = 5
            highlight.Parent = player.Character
        end
    end
end

local function speedHack()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end

local function collectChestsSequentially()
    local chests = {}
    for _, chest in pairs(workspace:GetChildren()) do
        if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
            table.insert(chests, chest)
        end
    end
    
    for _, chest in ipairs(chests) do
        if chest:FindFirstChild("TouchInterest") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.PrimaryPart.CFrame
            wait(0.5)
            game.Players.LocalPlayer.Character.Humanoid.Jump = true  -- Nhảy lên để nhặt rương
            wait(1)
        end
    end
end

createButton("Enable Auto Farm", scrollingFrame, function()
    spawn(autoFarm)
end)
createButton("Teleport to Island", scrollingFrame, teleportToIsland)
createButton("Enable ESP", scrollingFrame, enableESP)
createButton("Speed Hack", scrollingFrame, speedHack)
createButton("Collect Chests", scrollingFrame, collectChestsSequentially)

local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Image = "rbxassetid://88170470130971"
toggleButton.Parent = ui
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

return ui
