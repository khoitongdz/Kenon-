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

local function RemoveEverything()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if not v:IsA("Camera") and not v:IsA("Terrain") and not v:IsA("SpawnLocation") then
            pcall(function() v:Destroy() end) -- Sử dụng pcall để tránh lỗi
        end
    end
    for _, v in pairs(game.Lighting:GetChildren()) do pcall(function() v:Destroy() end) end
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 1e9
    game.Lighting.Brightness = 2
    game.Lighting.Ambient = Color3.new(1, 1, 1)
end

ToggleButton.MouseButton1Click:Connect(function()
    isLagFixEnabled = not isLagFixEnabled
    if isLagFixEnabled then
        RemoveEverything()
        ToggleButton.ImageColor3 = Color3.fromRGB(0, 255, 0) -- Chuyển xanh khi bật
    else
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) -- Reset game thay vì xóa lại
        ToggleButton.ImageColor3 = Color3.fromRGB(255, 0, 0) -- Chuyển đỏ khi tắt
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


