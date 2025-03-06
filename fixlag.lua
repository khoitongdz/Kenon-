--// UI Fix Lag Roblox
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local Logo = Instance.new("ImageLabel")
local FPSText = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "FixLagUI"

-- UI chính
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true

-- Nút bật/tắt fix lag
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Size = UDim2.new(0, 130, 0, 40)
ToggleButton.Position = UDim2.new(0.05, 0, 0.5, 0)
ToggleButton.Text = "Bật Fix Lag"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Logo
Logo.Parent = MainFrame
Logo.Size = UDim2.new(0, 50, 0, 50)
Logo.Position = UDim2.new(0.5, -25, 0.05, 0)
Logo.Image = "rbxassetid://84122944038358" -- 🔴 Thay ID ảnh của bạn vào đây!

-- Hiển thị FPS
FPSText.Parent = ScreenGui
FPSText.BackgroundTransparency = 1
FPSText.Position = UDim2.new(0.85, 0, 0.05, 0)
FPSText.Size = UDim2.new(0, 150, 0, 40)
FPSText.Font = Enum.Font.SourceSansBold
FPSText.TextSize = 20
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Text = "FPS: 0"

--// Script fix lag
local function fixLag(state)
    if state then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 9e9
        game.Lighting.Brightness = 1
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(game:GetService("SoundService"):GetDescendants()) do
            if v:IsA("Sound") then
                v.Volume = 0
            end
        end
        
        ToggleButton.Text = "Tắt Fix Lag"
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        game.Lighting.GlobalShadows = true
        game.Lighting.Brightness = 2
        ToggleButton.Text = "Bật Fix Lag"
    end
end

-- Bật/Tắt Fix Lag
local isLagFixed = false
ToggleButton.MouseButton1Click:Connect(function()
    isLagFixed = not isLagFixed
    fixLag(isLagFixed)
end)

-- FPS Counter
local RunService = game:GetService("RunService")
local LastTick = tick()

RunService.RenderStepped:Connect(function()
    local CurrentTick = tick()
    local FPS = math.floor(1 / (CurrentTick - LastTick))
    LastTick = CurrentTick
    FPSText.Text = "FPS: " .. FPS
end)

print("✅ Fix Lag UI đã hoạt động!")
