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

local autoFarmToggle = Instance.new("TextButton")
autoFarmToggle.Text = "Enable Auto Farm"
autoFarmToggle.Size = UDim2.new(1, -10, 0, 40)
autoFarmToggle.Position = UDim2.new(0, 5, 0, 40)
autoFarmToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
autoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmToggle.Font = Enum.Font.GothamBold
autoFarmToggle.TextSize = 14
autoFarmToggle.Parent = farmFrame

local function autoFarm()
    while wait(0.1) do
        if farmFrame.Visible then
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
end

autoFarmToggle.MouseButton1Click:Connect(function()
    farmFrame.Visible = not farmFrame.Visible
    if farmFrame.Visible then
        spawn(autoFarm)
    end
end)

local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Image = "rbxassetid://15417735343" -- Thay thế bằng ID logo trái cây
toggleButton.Parent = ui

toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

return ui
