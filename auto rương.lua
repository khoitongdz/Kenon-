-- Kenon Hub - Auto Chest Collector (Optimized)
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ChestCount = 0
local StartTime = tick()

-- Display Loading Message
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local LoadingText = Instance.new("TextLabel", ScreenGui)
LoadingText.Size = UDim2.new(0,200,0,50)
LoadingText.Position = UDim2.new(0.5,-100,0.4,0)
LoadingText.Text = "Join sever discord để biết thêm thông tin và những thông báo update script mới nhất nhé:>:https://discord.gg/w26VGWmMPb"
LoadingText.TextColor3 = Color3.fromRGB(255,255,255)
LoadingText.BackgroundTransparency = 1

wait(800)
LoadingText:Destroy()

-- Function to get chests in the current Sea
local function GetChests()
    local chests = {}
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") and obj.Name:lower():find("chest") then
            table.insert(chests, obj)
        end
    end
    return chests
end

-- Move to and collect chest
local function CollectChest(chest)
    if chest and chest:FindFirstChild("HumanoidRootPart") then
        local Character = LocalPlayer.Character
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            local hrp = Character.HumanoidRootPart
            hrp.CFrame = chest.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            wait(0.3)
            firetouchinterest(hrp, chest.HumanoidRootPart, 0)
            wait(0.1)
            firetouchinterest(hrp, chest.HumanoidRootPart, 1)
            ChestCount = ChestCount + 1
        end
    end
end

-- Main loop to collect chests efficiently
spawn(function()
    while wait(1) do
        local chests = GetChests()
        for _, chest in ipairs(chests) do
            CollectChest(chest)
        end
    end
end)


