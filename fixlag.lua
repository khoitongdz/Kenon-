--Bykhoitongdz
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local task = task -- Tối ưu hiệu suất

-- Kiểm tra executor để đảm bảo tương thích
local executor = "Unknown"
if syn then executor = "Synapse X" elseif fluxus then executor = "Fluxus" elseif is_protosmasher_loaded then executor = "ProtoSmasher" elseif KRNL_LOADED then executor = "KRNL" elseif secure_load then executor = "Script-Ware" end
print("[INFO] Script chạy trên executor: " .. executor)

-- UI chính (Giao diện mới)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.Name = "BloxFruitsHubV2"

-- Khung UI chính
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 400)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Tiêu đề UI
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "KenonFixLag"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Logo mở UI
local logoButton = Instance.new("ImageButton")
logoButton.Size = UDim2.new(0, 30, 0, 30)
logoButton.Position = UDim2.new(0, 20, 0, 20)
logoButton.BackgroundTransparency = 1
logoButton.Image = "rbxassetid://126229665034471"
logoButton.Parent = screenGui

-- Hiệu ứng bật/tắt UI
local isUIOpen = true
local function toggleUI()
    isUIOpen = not isUIOpen
    if isUIOpen then
        mainFrame.Visible = true
        tweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
    else
        local fadeOut = tweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            if not isUIOpen then mainFrame.Visible = false end
        end)
    end
end
logoButton.MouseButton1Click:Connect(toggleUI)

-- Tạo nút bật/tắt (UI mới đẹp hơn)
local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 45)
    button.Position = UDim2.new(0.05, 0, position, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.TextSize = 18
    button.Font = Enum.Font.GothamBold
    button.Parent = mainFrame
    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        button.BackgroundColor3 = enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
        callback(enabled)
    end)
end
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
