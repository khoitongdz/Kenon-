--By:khoitongdz

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.Name = "FixLagUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.5, -100, 0.5, -60) -- Căn giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Visible = false

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0, 180, 0, 50)
button.Position = UDim2.new(0.05, 0, 0.3, 0)
button.Text = "Bật Fix Lag"
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18

local toggleButton = Instance.new("ImageButton", gui)
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0.05, 0, 0.05, 0)
toggleButton.Image = "rbxassetid://126229665034471"
toggleButton.BackgroundTransparency = 1

local fpsLabel = Instance.new("TextLabel", gui)
fpsLabel.Size = UDim2.new(0, 150, 0, 40)
fpsLabel.Position = UDim2.new(0.7, 0, 0.05, 0)
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextSize = 20
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: 0"

local function FixLag(enable)
    if enable then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, obj in pairs(game:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") then
                obj:Destroy()
            end
        end
        game.Lighting.GlobalShadows = false
        game.Lighting.Brightness = 1
        for _, effect in pairs(game.Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect:Destroy()
            end
        end
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            end
        end
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                for _, item in pairs(player.Character:GetChildren()) do
                    if item:IsA("Accessory") or item:IsA("Clothing") then
                        item:Destroy()
                    elseif item:IsA("MeshPart") then
                        item.LocalTransparencyModifier = 1
                    end
                end
            end
        end
        button.Text = "Tắt Fix Lag"
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        game.Lighting.GlobalShadows = true
        game.Lighting.Brightness = 2
        button.Text = "Bật Fix Lag"
    end
end

local enabled = false
button.MouseButton1Click:Connect(function()
    enabled = not enabled
    FixLag(enabled)
end)

local uiVisible = false
toggleButton.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    frame.Visible = uiVisible
end)

local runService = game:GetService("RunService")
local lastTick = tick()
runService.RenderStepped:Connect(function()
    local currentTick = tick()
    local fps = math.floor(1 / (currentTick - lastTick))
    lastTick = currentTick
    fpsLabel.Text = "FPS: " .. fps
end)

print("✅ Script By khoitongdz!")
