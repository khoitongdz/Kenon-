-- Kenon Fix Lag Script
-- Discord:https://discord.gg/w26VGWmMPb

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local PingLabel = Instance.new("TextLabel")

ScreenGui.Name = "KenonFixLagUI"
ScreenGui.Parent = game.CoreGui

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

local isLagFixEnabled = false

local function RemoveEverything()
    for _, v in pairs(game:GetDescendants()) do
        if not v:IsA("LocalScript") and not v:IsA("ScreenGui") then
            v:Destroy()
        end
    end
    sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Compatibility)
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 9e9
    game.Lighting.Brightness = 2
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    for _, v in pairs(game.Lighting:GetChildren()) do v:Destroy() end
end

ToggleButton.MouseButton1Click:Connect(function()
    isLagFixEnabled = not isLagFixEnabled
    if isLagFixEnabled then
        RemoveEverything()
        ToggleButton.ImageColor3 = Color3.fromRGB(0, 255, 0) 
    else
        RemoveEverything() 
        ToggleButton.ImageColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

spawn(function()
    while true do
        local ping = game:GetService("Stats"):FindFirstChild("Network"):FindFirstChild("Ping").Value
        PingLabel.Text = "Ping: " .. math.floor(ping * 1000) .. " ms"
        wait(1)
    end
end)

