-- Script Auto Nhặt Rương - Hỗ trợ tất cả Executor
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local function teleportToChest(chest)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and chest:FindFirstChild("PrimaryPart") then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
        local goal = {CFrame = chest.PrimaryPart.CFrame}
        local tween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
        tween:Play()
        wait(0.6) -- Đợi để chắc chắn nhặt rương
    end
end

local function collectChests()
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("PrimaryPart") and string.find(obj.Name:lower(), "chest") then
            pcall(function()
                teleportToChest(obj)
            end)
        end
    end
end

while wait(2) do -- Giảm thời gian giữa mỗi lần quét rương
    pcall(function()
        collectChests()
    end)
end
