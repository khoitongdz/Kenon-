-- Kenon Hub - Optimized Auto Chest Collector
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ChestCount = 0
local StartTime = tick()

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local MainFrame = Instance.new("Frame")
local ChestLabel = Instance.new("TextLabel")
local TimeLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0,50,0,50)
ToggleButton.Position = UDim2.new(0.05,0,0.1,0)
ToggleButton.Image = "rbxassetid://15325884228"
ToggleButton.BackgroundTransparency = 1

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0,200,0,100)
MainFrame.Position = UDim2.new(0.05,0,0.15,0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.Visible = false

ChestLabel.Parent = MainFrame
ChestLabel.Size = UDim2.new(1,0,0.5,0)
ChestLabel.Text = "Chests Collected: 0"
ChestLabel.TextColor3 = Color3.fromRGB(255,255,255)
ChestLabel.BackgroundTransparency = 1

TimeLabel.Parent = MainFrame
TimeLabel.Size = UDim2.new(1,0,0.5,0)
TimeLabel.Position = UDim2.new(0,0,0.5,0)
TimeLabel.Text = "Time: 0s"
TimeLabel.TextColor3 = Color3.fromRGB(255,255,255)
TimeLabel.BackgroundTransparency = 1

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local LoadingText = Instance.new("TextLabel", ScreenGui)
LoadingText.Size = UDim2.new(0,200,0,50)
LoadingText.Position = UDim2.new(0.5,-100,0.4,0)
LoadingText.Text = "Kenon Loading..."
LoadingText.TextColor3 = Color3.fromRGB(255,255,255)
LoadingText.BackgroundTransparency = 1

wait(5)
LoadingText:Destroy()

-- Function to get chests in the current Sea
local function GetChests()
    local chests = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") and obj.Name:lower():find("chest") then
            table.insert(chests, obj)
        end
    end
    return chests
end

-- Function to teleport to chest
local function TeleportToChest(chest)
    if chest and chest:FindFirstChild("HumanoidRootPart") then
        local Character = LocalPlayer.Character
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            Character.HumanoidRootPart.CFrame = chest.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            wait(0.3)
        end
    end
end

-- Function to collect chest
local function CollectChest(chest)
    if chest and chest:FindFirstChild("HumanoidRootPart") then
        local Character = LocalPlayer.Character
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(Character.HumanoidRootPart, chest.HumanoidRootPart, 0)
            firetouchinterest(Character.HumanoidRootPart, chest.HumanoidRootPart, 1)
            wait(0.1)
            firetouchinterest(Character.HumanoidRootPart, chest.HumanoidRootPart, 0)
            firetouchinterest(Character.HumanoidRootPart, chest.HumanoidRootPart, 1)
            ChestCount = ChestCount + 1
            ChestLabel.Text = "Chests Collected: " .. ChestCount
        end
    end
end

-- Main loop to collect chests
spawn(function()
    while wait(1) do
        local chests = GetChests()
        for _, chest in ipairs(chests) do
            TeleportToChest(chest)
            CollectChest(chest)
            wait(0.3)
        end
    end
end)

-- Update time elapsed
spawn(function()
    while wait(1) do
        local elapsedTime = math.floor(tick() - StartTime)
        TimeLabel.Text = "Time: " .. elapsedTime .. "s"
    end
end)
