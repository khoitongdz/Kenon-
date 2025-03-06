-- Kenon Fix Lag Script
-- Discord:https://discord.gg/w26VGWmMPb

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local PingLabel = Instance.new("TextLabel")
local SliderFrame = Instance.new("Frame")
local Slider = Instance.new("TextButton")
local PercentageLabel = Instance.new("TextLabel")

ScreenGui.Name = "KenonFixLagUI"
ScreenGui.Parent = game:GetService("CoreGui")

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Image = "rbxassetid://84122944038358"
ToggleButton.BackgroundTransparency = 1

PingLabel.Name = "PingLabel"
PingLabel.Parent = ScreenGui
PingLabel.Size = UDim2.new(0, 100, 0, 30)
PingLabel.Position = UDim2.new(0, 10, 0, 60)
PingLabel.BackgroundTransparency = 0.5
PingLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PingLabel.TextScaled = true
PingLabel.Font = Enum.Font.SourceSansBold

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = ScreenGui
SliderFrame.Size = UDim2.new(0, 150, 0, 20)
SliderFrame.Position = UDim2.new(0, 10, 0, 100)
SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

Slider.Name = "Slider"
Slider.Parent = SliderFrame
Slider.Size = UDim2.new(0, 15, 0, 20)
Slider.Position = UDim2.new(0, 0, 0, 0)
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

PercentageLabel.Name = "PercentageLabel"
PercentageLabel.Parent = ScreenGui
PercentageLabel.Size = UDim2.new(0, 100, 0, 20)
PercentageLabel.Position = UDim2.new(0, 10, 0, 130)
PercentageLabel.Text = "Fix Lag: 15%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.TextScaled = true
PercentageLabel.Font = Enum.Font.SourceSansBold

local isLagFixEnabled = false
local fixLagPercentage = 15

local function RemoveIslands(percentage)
    local islands = {}
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Model") and v.Name:lower():find("island") then
            table.insert(islands, v)
        end
    end
    local removeCount = math.floor(#islands * (percentage / 100))
    for i = 1, removeCount do
        pcall(function() islands[i]:Destroy() end)
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    isLagFixEnabled = not isLagFixEnabled
    if isLagFixEnabled then
        RemoveIslands(fixLagPercentage)
        ToggleButton.ImageColor3 = Color3.fromRGB(0, 255, 0) 
    else
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) 
        ToggleButton.ImageColor3 = Color3.fromRGB(255, 0, 0) 
    end
end)

Slider.MouseButton1Down:Connect(function()
    local inputConnection
    inputConnection = game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativeX = math.clamp(input.Position.X - SliderFrame.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X)
            Slider.Position = UDim2.new(0, relativeX, 0, 0)
            fixLagPercentage = math.floor(15 + (relativeX / SliderFrame.AbsoluteSize.X) * 85)
            PercentageLabel.Text = "Fix Lag: " .. fixLagPercentage .. "%"
        end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            inputConnection:Disconnect()
        end
    end)
end)

spawn(function()
    while true do
        local stats = game:GetService("Stats"):FindFirstChild("PerformanceStats")
        if stats then
            local ping = stats:FindFirstChild("Ping")
            if ping then
                PingLabel.Text = "Ping: " .. math.floor(ping.Value) .. " ms"
            end
        end
        wait(1)
    end
end)
