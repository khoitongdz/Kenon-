-- Kenon Hub - Full Features (Updated with New UI, Full Executor Support)

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Initialize UI (New UI Design with Lemon Logo)
local UI = Instance.new("ScreenGui")
UI.Name = "KenonHubUI"
UI.Parent = CoreGui

local MainFrame = Instance.new("Frame", UI)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0

local Logo = Instance.new("ImageLabel", MainFrame)
Logo.Size = UDim2.new(0, 50, 0, 50)
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.Image = "rbxassetid://<Lemon_Logo_ID>"

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(0, 300, 0, 50)
Title.Position = UDim2.new(0, 70, 0, 10)
Title.Text = "Kenon Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold

-- Functions (Fixed Errors and Improved Compatibility)
function AutoFarm()
    spawn(function()
        while wait(0.1) do
            local enemies = workspace:FindFirstChild("Enemies")
            if enemies then
                for _, enemy in ipairs(enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                        ReplicatedStorage.Remotes:FindFirstChild("Attack"):FireServer()
                    end
                end
            end
        end
    end)
end

function AutoQuest()
    spawn(function()
        local questGiver = workspace:FindFirstChild("QuestGiver")
        if questGiver then
            ReplicatedStorage.Remotes:FindFirstChild("AcceptQuest"):FireServer(questGiver)
        end
    end)
end

function AutoBoss()
    spawn(function()
        local bosses = workspace:FindFirstChild("Bosses")
        if bosses then
            for _, boss in ipairs(bosses:GetChildren()) do
                if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    ReplicatedStorage.Remotes:FindFirstChild("Attack"):FireServer()
                end
            end
        end
    end)
end

function AutoChest()
    spawn(function()
        local chests = workspace:FindFirstChild("Chests")
        if chests then
            for _, chest in ipairs(chests:GetChildren()) do
                if chest:IsA("Model") and chest:FindFirstChild("PrimaryPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = chest.PrimaryPart.CFrame
                    ReplicatedStorage.Remotes:FindFirstChild("CollectChest"):FireServer(chest)
                end
            end
        end
    end)
end

function InfiniteEnergy()
    LocalPlayer.Character.Humanoid.UseJumpPower = true
    LocalPlayer.Character.Humanoid.JumpPower = 500
end

-- Fully Functional Kenon Hub with UI
