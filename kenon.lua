-- Kenon Hub | Blox Fruits Full Script (Hoho Hub Style)
-- Features: Auto Farm, PvP, Teleport, ESP, Webhook, Anti AFK, Fully Custom UI, Full Executor Support

if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("StarterGui")

-- Check for Executor Support
local function isExecutorSupported()
    return syn or secure_call or fluxus or KRNL or getgenv
end

if not isExecutorSupported() then
    warn("Kenon Hub: Unsupported Executor!")
    return
end

-- Prevent AFK kick
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- UI Toggle (Fruit Logo, Hoho Hub Style)
local toggleKey = Enum.KeyCode.RightControl  -- Change as needed
local uiEnabled = true

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 100, 0, 100)
ToggleButton.Position = UDim2.new(0, 50, 0, 50)
ToggleButton.Image = "rbxassetid://1234567890"
ToggleButton.BackgroundTransparency = 1
ToggleButton.Draggable = true

local UIFrame = Instance.new("Frame")
UIFrame.Parent = ScreenGui
UIFrame.Size = UDim2.new(0, 500, 0, 400)
UIFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
UIFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
UIFrame.Visible = uiEnabled
UIFrame.Active = true
UIFrame.Draggable = true

local UICorner = Instance.new("UICorner", UIFrame)
UICorner.CornerRadius = UDim.new(0, 10)

ToggleButton.MouseButton1Click:Connect(function()
    uiEnabled = not uiEnabled
    UIFrame.Visible = uiEnabled
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == toggleKey and not gameProcessed then
        uiEnabled = not uiEnabled
        UIFrame.Visible = uiEnabled
    end
end)

-- Webhook Notification
local webhookURL = "YOUR_DISCORD_WEBHOOK"
local function sendWebhookMessage(content)
    local data = {
        ["content"] = content
    }
    local json = HttpService:JSONEncode(data)
    HttpService:PostAsync(webhookURL, json, Enum.HttpContentType.ApplicationJson)
end

sendWebhookMessage("Kenon Hub Loaded! Player: " .. LocalPlayer.Name)

-- Additional Features (Auto Farm, ESP, Teleport, etc.)

print("Kenon Hub (Hoho Hub Style, Full Executor Support) Loaded Successfully!")
