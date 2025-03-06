-- By: khoitongdz
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.Name = "FixLagUI"

local toggleButton = Instance.new("ImageButton", gui)
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0.05, 0, 0.05, 0)
toggleButton.Image = "rbxassetid://126229665034471"
toggleButton.BackgroundTransparency = 1

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 160)
frame.Position = UDim2.new(0.5, -100, 0.4, -80)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Visible = false

local ButtonFixLag = Instance.new("TextButton", frame)
ButtonFixLag.Size = UDim2.new(0, 180, 0, 40)
ButtonFixLag.Position = UDim2.new(0, 10, 0, 10)
ButtonFixLag.Text = "Fix Lag"
ButtonFixLag.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ButtonFixLag.TextColor3 = Color3.fromRGB(255, 255, 255)

local ButtonJump = Instance.new("TextButton", frame)
ButtonJump.Size = UDim2.new(0, 180, 0, 40)
ButtonJump.Position = UDim2.new(0, 10, 0, 60)
ButtonJump.Text = "Nhảy Cao"
ButtonJump.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ButtonJump.TextColor3 = Color3.fromRGB(255, 255, 255)

local ButtonSpeed = Instance.new("TextButton", frame)
ButtonSpeed.Size = UDim2.new(0, 180, 0, 40)
ButtonSpeed.Position = UDim2.new(0, 10, 0, 110)
ButtonSpeed.Text = "Chạy Nhanh"
ButtonSpeed.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ButtonSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)

local FPSLabel = Instance.new("TextLabel", gui)
FPSLabel.Size = UDim2.new(0, 100, 0, 30)
FPSLabel.Position = UDim2.new(0.02, 0, 0.02, 0)
FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS: đang tải..."

local function FixLag()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game.Lighting.GlobalShadows = false
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Trail") or v:IsA("Sparkles") then
            v:Destroy()
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
        if v:IsA("Sound") then
            v.Volume = 0
        end
        if v:IsA("CharacterMesh") or v:IsA("Accessory") then
            v:Destroy()
        end
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
        end
    end
    print("✅ Đã Fix Lag thành công!")
end

local function JumpBoost()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        player.Character.Humanoid.JumpPower = 150
        print("✅ Đã bật Nhảy Cao!")
    end
end

local function SpeedBoost()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        player.Character.Humanoid.WalkSpeed = 450
        print("✅ Đã bật Chạy Nhanh!")
    end
end

local RunService = game:GetService("RunService")
local fps = 0
RunService.RenderStepped:Connect(function()
    fps = fps + 1
end)

spawn(function()
    while true do
        wait(1)
        FPSLabel.Text = "FPS: " .. fps
        fps = 0
    end
end)

local uiVisible = false
toggleButton.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    frame.Visible = uiVisible
end)

ButtonFixLag.MouseButton1Click:Connect(FixLag)
ButtonJump.MouseButton1Click:Connect(JumpBoost)
ButtonSpeed.MouseButton1Click:Connect(SpeedBoost)
