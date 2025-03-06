--discord.gg//w26VGWmMPb

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
frame.Active, frame.Draggable, frame.Visible = true, true, false

local function createButton(parent, text, position)
    local btn = Instance.new("TextButton", parent)
    btn.Size, btn.Position = UDim2.new(0, 180, 0, 40), position
    btn.Text, btn.BackgroundColor3, btn.TextColor3 = text, Color3.fromRGB(100, 100, 100), Color3.fromRGB(255, 255, 255)
    return btn
end

local btnFixLag = createButton(frame, "Fix Lag Max", UDim2.new(0, 10, 0, 10))
local btnJump = createButton(frame, "Nhảy Cao", UDim2.new(0, 10, 0, 60))
local btnSpeed = createButton(frame, "Chạy Nhanh", UDim2.new(0, 10, 0, 110))

local FPSLabel = Instance.new("TextLabel", gui)
FPSLabel.Size, FPSLabel.Position = UDim2.new(0, 100, 0, 30), UDim2.new(0.02, 0, 0.02, 0)
FPSLabel.TextColor3, FPSLabel.BackgroundTransparency = Color3.fromRGB(255, 255, 255), 1
FPSLabel.Text = "FPS: Calculating..."

local function FixLag()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 9e9
    game.Lighting.Brightness = 1
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Trail") or v:IsA("Sparkles") then v:Destroy() end
        if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end
        if v:IsA("Sound") then v.Volume = 0 end
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
        if v:IsA("MeshPart") then v.TextureID = "" end
    end
    print("✅ Fix Lag Cấp Độ Max thành công!")
end

local function ModifyCharacter(property, value, message)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then humanoid[property] = value print(message) end
    end
end

FixLag()

spawn(function()
    while true do
        ModifyCharacter("JumpPower", 200, "✅ Đã bật Nhảy Cao!")
        ModifyCharacter("WalkSpeed", 290, "✅ Đã bật Chạy Nhanh!")
        wait(2)
    end
end)

local RunService = game:GetService("RunService")
local fps = 0
RunService.Heartbeat:Connect(function() fps = fps + 1 end)

spawn(function()
    while wait(1) do
        FPSLabel.Text = "FPS: " .. fps
        fps = 0
    end
end)

toggleButton.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)

btnFixLag.MouseButton1Click:Connect(FixLag)
btnJump.MouseButton1Click:Connect(function() ModifyCharacter("JumpPower", 200, "✅ Đã bật Nhảy Cao!") end)
btnSpeed.MouseButton1Click:Connect(function() ModifyCharacter("WalkSpeed", 500, "✅ Đã bật Chạy Nhanh!") end)
