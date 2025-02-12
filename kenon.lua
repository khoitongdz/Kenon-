-- Kenon Hub - Super UI for Blox Fruits
local ui = Instance.new("ScreenGui")
ui.Name = "KenonHubUI"
ui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 500)
frame.Position = UDim2.new(0.5, -200, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = ui

local title = Instance.new("TextLabel")
title.Text = "Kenon Hub - Blox Fruits"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame
title.TextStrokeTransparency = 0.5
title.TextScaled = true

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 100, 1, -50)
sidebar.Position = UDim2.new(0, 0, 0, 50)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebar.BorderSizePixel = 0
sidebar.Parent = frame

local options = {"Farm", "Sea", "Islands", "Quests/Items", "Fruit/Raid", "Teleport", "Status", "Visual", "Shop", "Misc"}
for i, v in ipairs(options) do
    local button = Instance.new("TextButton")
    button.Text = v
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, (i-1) * 42)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = sidebar
end

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
                    game:GetService("VirtualUser"):Button1Down(Vector2.new()) -- Giả lập nhấn đánh
                    enemy.HumanoidRootPart.Size = Vector3.new(20, 20, 20) -- Tăng hitbox
                end
            end
        end
    end
end

local function findChestsAndShips()
    for _, chest in pairs(workspace:GetChildren()) do
        if chest:IsA("Model") and chest:FindFirstChild("Chest") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.Chest.CFrame
        end
    end
end

local function teleportToIsland()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 100, 1000) -- Toạ độ giả định
end

local function completeQuest()
    print("Completing quest...")
end

local function collectFruitAndJoinRaid()
    print("Collecting fruit and joining raid...")
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

local farmFrame = Instance.new("Frame")
farmFrame.Size = UDim2.new(0, 300, 0, 200)
farmFrame.Position = UDim2.new(0, 110, 0, 60)
farmFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
farmFrame.BorderSizePixel = 0
farmFrame.Visible = false
farmFrame.Parent = frame

local farmTitle = Instance.new("TextLabel")
farmTitle.Text = "Auto Farm"
farmTitle.Size = UDim2.new(1, 0, 0, 30)
farmTitle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
farmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
farmTitle.Font = Enum.Font.GothamBold
farmTitle.TextSize = 16
farmTitle.Parent = farmFrame

createButton("Enable Auto Farm", farmFrame, function()
    farmFrame.Visible = not farmFrame.Visible
end)

createButton("Enable Level Farm", farmFrame, function()
    farmFrame.Visible = true
    spawn(autoFarm)
end)

createButton("Find Chests & Ships", farmFrame, findChestsAndShips)

createButton("Teleport to Island", farmFrame, teleportToIsland)

createButton("Complete Quest", farmFrame, completeQuest)

createButton("Collect Fruit & Join Raid", farmFrame, collectFruitAndJoinRaid)

createButton("Enable ESP", farmFrame, enableESP)

createButton("Speed Hack", farmFrame, speedHack)

local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Image = "rbxassetid://15417735343" -- Thay thế bằng ID logo trái cây
toggleButton.Parent = ui

toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

return ui

