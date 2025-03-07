--By:khoitongdz
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.Name = "FixLagUI"

local toggleButton = Instance.new("ImageButton", gui)
toggleButton.Size = UDim2.new(0, 80, 0, 80) -- Mở rộng kích thước
toggleButton.Position = UDim2.new(0.02, 0, 0.02, 0) -- Đẩy sát góc
toggleButton.Image = "rbxassetid://126229665034471"
toggleButton.BackgroundTransparency = 1

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 300) 
frame.Position = UDim2.new(0.5, -125, 0.4, -150)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active, frame.Draggable, frame.Visible = true, true, false

local FPSLabel = Instance.new("TextLabel", frame)
FPSLabel.Size, FPSLabel.Position = UDim2.new(0, 230, 0, 30), UDim2.new(0, 10, 0, 260)
FPSLabel.TextColor3, FPSLabel.BackgroundTransparency = Color3.fromRGB(255, 255, 255), 1
FPSLabel.Text = "FPS: Calculating..."
FPSLabel.Font = Enum.Font.SourceSansBold
FPSLabel.TextSize = 18

local FPSCornerLabel = Instance.new("TextLabel", gui)
FPSCornerLabel.Size, FPSCornerLabel.Position = UDim2.new(0, 100, 0, 30), UDim2.new(0.9, -110, 0.02, 0)
FPSCornerLabel.TextColor3, FPSCornerLabel.BackgroundTransparency = Color3.fromRGB(255, 255, 255), 1
FPSCornerLabel.Text = "FPS: Calculating..."
FPSCornerLabel.Font = Enum.Font.SourceSansBold
FPSCornerLabel.TextSize = 18
FPSCornerLabel.TextXAlignment = Enum.TextXAlignment.Right

local function createButton(parent, text, position, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size, btn.Position = UDim2.new(0, 230, 0, 45), position -- Nút lớn hơn
    btn.Text, btn.BackgroundColor3, btn.TextColor3 = text, Color3.fromRGB(100, 100, 100), Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function FixLag()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 9e9
    game.Lighting.Brightness = 1
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Trail") or v:IsA("Sparkles") then v:Destroy() end
        if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end
        if v:IsA("Sound") then v.Volume = 0 end
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic; v.Color = Color3.fromRGB(200, 200, 200) end
        if v:IsA("MeshPart") then v.TextureID = ""; v.Color = Color3.fromRGB(200, 200, 200) end
        if v:IsA("Model") and v.Name == "Tree" then v:Destroy() end
    end
    print("✅ Fix Lag hoàn tất! Mọi vật thể đã được làm trắng bạc và cây đã bị xóa.")
end

local speedEnabled = false
local function ToggleSpeed()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            speedEnabled = not speedEnabled
            humanoid.WalkSpeed = speedEnabled and 300 or 16
            print("✅ Chạy nhanh: " .. tostring(speedEnabled))
        end
    end
end

local jumpEnabled = false
local function ToggleJumpPower()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            jumpEnabled = not jumpEnabled
            humanoid.JumpPower = jumpEnabled and 150 or 250 
            print("✅ Nhảy Cao: " .. tostring(jumpEnabled))
        end
    end
end

local function ToggleNoclip()
    print("🛸 Xuyên tường chưa được tích hợp!")
end

FixLag()

local btnFixLag = createButton(frame, "🛠️ Fix Lag", UDim2.new(0, 10, 0, 10), FixLag)
local btnSpeed = createButton(frame, "⚡ Chạy Nhanh", UDim2.new(0, 10, 0, 60), ToggleSpeed)
local btnJump = createButton(frame, "🔥 Nhảy Cao", UDim2.new(0, 10, 0, 110), ToggleJumpPower)
local btnNoclip = createButton(frame, "🛸 Xuyên Tường", UDim2.new(0, 10, 0, 160), ToggleNoclip)

toggleButton.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)

local RunService = game:GetService("RunService")
local fps = 0
RunService.Heartbeat:Connect(function() fps = fps + 1 end)

spawn(function()
    while wait(1) do
        FPSLabel.Text = "FPS: " .. fps
        FPSCornerLabel.Text = "FPS: " .. fps
        fps = 0
    end
end)
