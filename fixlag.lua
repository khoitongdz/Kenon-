--// UI Fix Lag Roblox
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local LogoButton = Instance.new("ImageButton")
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
MainFrame.Visible = false -- Ẩn UI ban đầu

-- Nút bật/tắt fix lag
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Size = UDim2.new(0, 130, 0, 40)
ToggleButton.Position = UDim2.new(0.05, 0, 0.5, 0)
ToggleButton.Text = "Bật Fix Lag"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

LogoButton.Parent = ScreenGui
LogoButton.Size = UDim2.new(0, 60, 0, 60)
LogoButton.Position = UDim2.new(0.05, 0, 0.05, 0)
LogoButton.Image = "rbxassetid://75989752728924" 
LogoButton.BackgroundTransparency = 1

FPSText.Parent = ScreenGui
FPSText.BackgroundTransparency = 1
FPSText.Position = UDim2.new(0.75, 0, 0.05, 0) 
FPSText.Size = UDim2.new(0, 150, 0, 40)
FPSText.Font = Enum.Font.SourceSansBold
FPSText.TextSize = 20
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Text = "FPS: 0"

local function fixLag(state)
    if state then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v:Destroy()
            end
        end

        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 9e9
        game.Lighting.Brightness = 1
        for _, v in pairs(game.Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") then
                v:Destroy()
            end
        end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            end
        end

        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                for _, obj in pairs(player.Character:GetChildren()) do
                    if obj:IsA("Accessory") or obj:IsA("Clothing") then
                        obj:Destroy()
                    elseif obj:IsA("MeshPart") or obj:IsA("Part") then
                        obj.LocalTransparencyModifier = 1 -- Làm trong suốt nhân vật
                    end
                end
            end
        end

        for _, v in pairs(game:GetService("SoundService"):GetDescendants()) do
            if v:IsA("Sound") then
                v.Volume = 0
            end
        end

        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character.Humanoid
                for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                    track:Stop()
                end
            end
        end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("WedgePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
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

local isLagFixed = false
ToggleButton.MouseButton1Click:Connect(function()
    isLagFixed = not isLagFixed
    fixLag(isLagFixed)
end)

local isUIVisible = false
LogoButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    MainFrame.Visible = isUIVisible
end)

local RunService = game:GetService("RunService")
local LastTick = tick()

RunService.RenderStepped:Connect(function()
    local CurrentTick = tick()
    local FPS = math.floor(1 / (CurrentTick - LastTick))
    LastTick = CurrentTick
    FPSText.Text = "FPS: " .. FPS
end)

print("✅ Fix Lag Hoàn Chỉnh Đã Hoạt Động!")
