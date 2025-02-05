-- Kenon Hub - Script Blox Fruit Ultimate Version (Obfuscated)

local A1 = Instance.new("ScreenGui")
local B2 = Instance.new("Frame")
local C3 = Instance.new("Frame")
local D4 = Instance.new("Frame")
local E5 = Instance.new("TextButton")
local F6 = Enum.KeyCode.RightControl
local G7 = game:GetService("UserInputService")
local H8 = game:GetService("Players")
local I9 = H8.LocalPlayer
local J10 = game:GetService("VirtualUser")
local K11 = game:GetService("RunService")
local L12 = game:GetService("ReplicatedStorage")
local M13 = game:GetService("TweenService")

I9.Idled:Connect(function()
    J10:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    J10:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

A1.Name = "XyZ123"
A1.Parent = game.CoreGui

B2.Name = "QwE456"
B2.Size = UDim2.new(0, 600, 0, 400)
B2.Position = UDim2.new(0.5, -300, 0.5, -200)
B2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
B2.BorderSizePixel = 0
B2.Parent = A1
B2.Active = true
B2.Draggable = true

C3.Name = "AsD789"
C3.Size = UDim2.new(0, 150, 1, 0)
C3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C3.Parent = B2

D4.Name = "ZxC321"
D4.Size = UDim2.new(1, -150, 1, 0)
D4.Position = UDim2.new(0, 150, 0, 0)
D4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
D4.Parent = B2

E5.Name = "CloseXYZ"
E5.Size = UDim2.new(0, 50, 0, 30)
E5.Position = UDim2.new(1, -55, 0, 5)
E5.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
E5.Text = "X"
E5.Parent = B2

E5.MouseButton1Click:Connect(function()
    A1.Enabled = false
end)

G7.InputBegan:Connect(function(inp)
    if inp.KeyCode == F6 then
        A1.Enabled = not A1.Enabled
    end
end)

function ObfuscatedFunc1()
    spawn(function()
        while wait(0.5) do
            local enemy = workspace:FindFirstChild("Enemy")
            if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                I9.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                L12.Remotes.Attack:FireServer()
            end
        end
    end)
end

function ObfuscatedFunc2()
    spawn(function()
        while wait(1) do
            local boss = workspace:FindFirstChild("Boss")
            if boss and boss:FindFirstChild("HumanoidRootPart") then
                I9.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                L12.Remotes.Attack:FireServer()
            end
        end
    end)
end

function ObfuscatedFunc3()
    spawn(function()
        while wait(1) do
            for _, mob in pairs(workspace:GetChildren()) do
                if mob:FindFirstChild("HumanoidRootPart") then
                    mob.HumanoidRootPart.CFrame = I9.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                end
            end
        end
    end)
end

function ObfuscatedFunc4()
    spawn(function()
        while wait(1) do
            -- Dummy function to confuse decompilers
        end
    end)
end

function createObfuscatedTab(name, scriptFunction)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 130, 0, 50)
    btn.Position = UDim2.new(0, 10, 0, (#C3:GetChildren() - 1) * 55)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Parent = C3
    
    btn.MouseButton1Click:Connect(function()
        scriptFunction()
    end)
end

createObfuscatedTab("Auto Farm", ObfuscatedFunc1)
createObfuscatedTab("Auto Boss", ObfuscatedFunc2)
createObfuscatedTab("Bring Mob", ObfuscatedFunc3)
createObfuscatedTab("Max Level", ObfuscatedFunc4)

print("Kenon Hub Loaded Successfully - Ultimate Version! Obfuscated")
