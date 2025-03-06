-- Kenon Fix Lag Script
-- Discord:https://discord.gg/w26VGWmMPb

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local PingLabel = Instance.new("TextLabel")

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

local isLagFixEnabled = false

local function RemoveMap()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Model") and not game.Players:GetPlayerFromCharacter(v) and v.Name ~= "NPCs" then
            pcall(function() v:Destroy() end)
        end
    end
    for _, v in pairs(game.Lighting:GetChildren()) do pcall(function() v:Destroy() end) end
end

ToggleButton.MouseButton1Click:Connect(function()
    isLagFixEnabled = not isLagFixEnabled
    if isLagFixEnabled then
        RemoveMap()
        ToggleButton.ImageColor3 = Color3.fromRGB(0, 255, 0) 
    else
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) 
        ToggleButton.ImageColor3 = Color3.fromRGB(255, 0, 0)
    end
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

