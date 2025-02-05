-- Kenon Hub - Script Blox Fruit Ultimate Version (Hoho Hub Inspired)

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabFrame = Instance.new("Frame")
local ScriptFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local ToggleKey = Enum.KeyCode.RightControl
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Chống AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

ScreenGui.Name = "KenonHub"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

TabFrame.Name = "TabFrame"
TabFrame.Size = UDim2.new(0, 140, 1, 0)
TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabFrame.Parent = MainFrame

ScriptFrame.Name = "ScriptFrame"
ScriptFrame.Size = UDim2.new(1, -140, 1, 0)
ScriptFrame.Position = UDim2.new(0, 140, 0, 0)
ScriptFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ScriptFrame.Parent = MainFrame

CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 50, 0, 30)
CloseButton.Position = UDim2.new(1, -55, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == ToggleKey then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

function createTab(name, scriptFunction)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 130, 0, 50)
    button.Position = UDim2.new(0, 10, 0, (#TabFrame:GetChildren() - 1) * 55)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Parent = TabFrame
    
    button.MouseButton1Click:Connect(function()
        scriptFunction()
    end)
end

function AutoFarm()
    spawn(function()
        while wait(0.5) do
            for _, enemy in pairs(workspace:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    game:GetService("ReplicatedStorage").Remotes.Attack:FireServer()
                end
            end
        end
    end)
end

function AutoBoss()
    spawn(function()
        while wait(1) do
            for _, boss in pairs(workspace:GetChildren()) do
                if boss:IsA("Model") and boss:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    game:GetService("ReplicatedStorage").Remotes.Attack:FireServer()
                end
            end
        end
    end)
end

function BringMob()
    spawn(function()
        while wait(1) do
            for _, mob in pairs(workspace:GetChildren()) do
                if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                    mob.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                end
            end
        end
    end)
end

function MaxLevel()
    spawn(function()
        while wait(1) do
            -- Logic lên cấp nhanh
        end
    end)
end

function OpenDiscord()
    setclipboard("https://discord.gg/w26VGWmMPb")
    print("Discord link copied to clipboard!")
end

createTab("Auto Farm", AutoFarm)
createTab("Auto Boss", AutoBoss)
createTab("Bring Mob", BringMob)
createTab("Max Level", MaxLevel)
createTab("Discord", OpenDiscord)

print("Kenon Hub Loaded Successfully - Ultimate Version!")
