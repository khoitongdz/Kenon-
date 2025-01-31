--// Flyx Hub UI - khoitongdz \--
local FlyxHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LogoButton = Instance.new("ImageButton")
local TabBar = Instance.new("Frame")
local StatusTab = Instance.new("TextButton")
local ErrorTab = Instance.new("TextButton")
local MainTab = Instance.new("TextButton")
local AutoFarmTab = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local StatusContainer = Instance.new("Frame")
local ErrorContainer = Instance.new("Frame")
local MainContainer = Instance.new("Frame")
local AutoFarmContainer = Instance.new("Frame")

-- Parent UI
FlyxHub.Parent = game:GetService("CoreGui")

-- Main Frame UI
MainFrame.Name = "MainFrame"
MainFrame.Parent = FlyxHub
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Visible = true
MainFrame.Draggable = true
MainFrame.Active = true

-- Logo Button
LogoButton.Name = "LogoButton"
LogoButton.Parent = FlyxHub
LogoButton.BackgroundTransparency = 1
LogoButton.Image = "http://www.roblox.com/asset/?id=6537589785" -- Kirito Avatar
LogoButton.Position = UDim2.new(0.05, 0, 0.05, 0)
LogoButton.Size = UDim2.new(0, 80, 0, 80)

-- Tabs
TabBar.Name = "TabBar"
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabBar.Size = UDim2.new(1, 0, 0, 40)

local function createTab(name, text, posX)
    local tab = Instance.new("TextButton")
    tab.Name = name
    tab.Parent = TabBar
    tab.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    tab.Position = UDim2.new(0, posX, 0, 5)
    tab.Size = UDim2.new(0, 120, 0, 30)
    tab.Font = Enum.Font.SourceSansBold
    tab.Text = text
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.TextSize = 16
    return tab
end

StatusTab = createTab("StatusTab", "Trạng Thái", 10)
ErrorTab = createTab("ErrorTab", "Lỗi Script", 140)
MainTab = createTab("MainTab", "Chính", 270)
AutoFarmTab = createTab("AutoFarmTab", "Auto Farm", 400)

-- Toggle UI
local isUIVisible = true
LogoButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    MainFrame.Visible = isUIVisible
end)

-- Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Auto Chat
local ChatBox = Instance.new("TextBox", MainContainer)
ChatBox.Position = UDim2.new(0.1, 0, 0.3, 0)
ChatBox.Size = UDim2.new(0.8, 0, 0.1, 0)
ChatBox.PlaceholderText = "Nhập tin nhắn..."

local StartChatButton = Instance.new("TextButton", MainContainer)
StartChatButton.Position = UDim2.new(0.1, 0, 0.45, 0)
StartChatButton.Size = UDim2.new(0.8, 0, 0.1, 0)
StartChatButton.Text = "Bắt đầu Auto Chat"

local chatDelay = 10
StartChatButton.MouseButton1Click:Connect(function()
    while true do
        wait(chatDelay)
        game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(ChatBox.Text, "All")
    end
end)

-- Auto Farm
local function findNearestEnemy()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    local nearestEnemy = nil
    local shortestDistance = math.huge
    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
            local distance = (character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestEnemy = enemy
            end
        end
    end
    return nearestEnemy
end

local function autoFarm()
    while true do
        wait(1)
        local enemy = findNearestEnemy()
        if enemy then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
            game:GetService("ReplicatedStorage"):FindFirstChild("MeleeAttack"):FireServer()
        end
    end
end

local StartFarmButton = Instance.new("TextButton", AutoFarmContainer)
StartFarmButton.Position = UDim2.new(0.1, 0, 0.3, 0)
StartFarmButton.Size = UDim2.new(0.8, 0, 0.1, 0)
StartFarmButton.Text = "Bắt đầu Auto Farm"
StartFarmButton.MouseButton1Click:Connect(autoFarm)

print("Flyx Hub UI Loaded with Features!")
