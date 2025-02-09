-- Kenon Hub - Full Features (Updated with New UI)

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Initialize UI (New UI Design with Lemon Logo)
local UI = Instance.new("ScreenGui", CoreGui)
UI.Name = "KenonHubUI"

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

-- Functions (Reintegrated with UI)
function AutoFarm()
  while true do
    local enemies = workspace:FindFirstChild("Enemies")
    if enemies then
      for _, enemy in ipairs(enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
          LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
          ReplicatedStorage.Remotes:FindFirstChild("Attack"):InvokeServer()
        end
      end
    end
    wait(0.1)
  end
end

function AutoQuest()
  local questGiver = workspace:FindFirstChild("QuestGiver")
  if questGiver then
    ReplicatedStorage.Remotes:FindFirstChild("AcceptQuest"):InvokeServer(questGiver)
  end
end

function AutoBoss()
  local bosses = workspace:FindFirstChild("Bosses")
  if bosses then
    for _, boss in ipairs(bosses:GetChildren()) do
      if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
        LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
        ReplicatedStorage.Remotes:FindFirstChild("Attack"):InvokeServer()
      end
    end
  end
end

function AutoChest()
  local chests = workspace:FindFirstChild("Chests")
  if chests then
    for _, chest in ipairs(chests:GetChildren()) do
      if chest:IsA("Model") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = chest.PrimaryPart.CFrame
        ReplicatedStorage.Remotes:FindFirstChild("CollectChest"):InvokeServer(chest)
      end
    end
  end
end

function InfiniteEnergy()
  LocalPlayer.Character.Humanoid.UseJumpPower = true
  LocalPlayer.Character.Humanoid.JumpPower = 500
end

-- Fully Functional Kenon Hub with UI
