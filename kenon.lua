-- Kenon Hub - Script Blox Fruit Ultimate Version
-- Dev:khoitongdz
-- Discord:https://discord.gg/w26VGWmMPb
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabFrame = Instance.new("Frame")
local ScriptFrame = Instance.new("Frame")
local UIScale = Instance.new("UIScale")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- WebHook Logs
local webhookURL = "https://discord.com/api/webhooks/1336566970463555675/bxljnPAj4PvekzWmVcz4CQ3wXocakH8FpfQMTjUL8ZEgfT9_xu6n0vr_RC3x7G3RwT3o"

function sendWebhook(message)
    local data = { ["content"] = message }
    HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
end

sendWebhook("Kenon Hub Script has been executed by " .. LocalPlayer.Name .. " (UserID: " .. LocalPlayer.UserId .. ")")

LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

ScreenGui.Name = "KenonHub"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

TabFrame.Name = "TabFrame"
TabFrame.Size = UDim2.new(0, 150, 1, 0)
TabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabFrame.Parent = MainFrame

ScriptFrame.Name = "ScriptFrame"
ScriptFrame.Size = UDim2.new(1, -150, 1, 0)
ScriptFrame.Position = UDim2.new(0, 150, 0, 0)
ScriptFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ScriptFrame.Parent = MainFrame

function createTab(name, icon, scriptFunction)
    local button = Instance.new("ImageButton")
    button.Size = UDim2.new(0, 130, 0, 50)
    button.Position = UDim2.new(0, 10, 0, (#TabFrame:GetChildren() - 1) * 55)
    button.Image = icon
    button.BackgroundTransparency = 1
    button.Parent = TabFrame
    
    button.MouseButton1Click:Connect(function()
        sendWebhook("User " .. LocalPlayer.Name .. " activated " .. name)
        scriptFunction()
    end)
end

function AutoFarm()
    spawn(function()
        while wait(0.5) do
            for _, enemy in pairs(workspace:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    ReplicatedStorage.Remotes.Attack:FireServer()
                end
            end
        end
    end)
end

function AutoRaid()
    spawn(function()
        while wait(1) do
            ReplicatedStorage.Remotes.Raid:FireServer("Start")
        end
    end)
end

function HuntPlayer()
    spawn(function()
        while wait(1) do
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    ReplicatedStorage.Remotes.Attack:FireServer()
                end
            end
        end
    end)
end

function AutoBoss()
    spawn(function()
        while wait(1) do
            for _, boss in pairs(workspace:GetChildren()) do
                if boss:IsA("Model") and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    ReplicatedStorage.Remotes.Attack:FireServer()
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
                    mob.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                end
            end
        end
    end)
end

function MaxLevel()
    spawn(function()
        while wait(1) do
            AutoFarm()
        end
    end)
end

function AntiBan()
    RunService.RenderStepped:Connect(function()
        pcall(function()
            game:GetService("GuiService"):ClearError()
        end)
    end)
end

function WebHookLogs()
    sendWebhook("Kenon Hub Log: Script is running on " .. LocalPlayer.Name)
end

createTab("Auto Farm", "rbxassetid://123456", AutoFarm)
createTab("Auto Raid", "rbxassetid://234567", AutoRaid)
createTab("Hunt Player", "rbxassetid://345678", HuntPlayer)
createTab("Auto Boss", "rbxassetid://456789", AutoBoss)
createTab("Bring Mob", "rbxassetid://567890", BringMob)
createTab("Max Level", "rbxassetid://678901", MaxLevel)
createTab("Anti Ban", "rbxassetid://789012", AntiBan)
createTab("WebHook Logs", "rbxassetid://919012", WebHookLogs)

print("Kenon Hub Loaded Successfully - Ultimate Version!")
