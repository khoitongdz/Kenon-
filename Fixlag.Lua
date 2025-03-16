-- By: khoitongdz (This beta script!)
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "BloxFruitsFixLag"

local logoButton = Instance.new("ImageButton", screenGui)
logoButton.Size = UDim2.new(0, 40, 0, 40)
logoButton.Position = UDim2.new(0.02, 0, 0.1, 0)
logoButton.BackgroundTransparency = 1
logoButton.Image = "rbxassetid://105486552530887"
logoButton.Active = true
logoButton.Draggable = true

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 350)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 1
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Fix Lag All Games Roblox!"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.BackgroundTransparency = 1

local isUIOpen = false
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

local function createToggleButton(name, position, callback)
    local button = Instance.new("TextButton", mainFrame)
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, position, 0)
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.TextSize = 16
    button.Font = Enum.Font.GothamBold
    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        button.BackgroundColor3 = enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        callback(enabled)
    end)
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
    print("✅ Fix Lag hoàn tất!")
end
local function SeepHackSpeed(enabled)
 local function ToggleSpeed(enabled)
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
if humanoid then
if enabled then
humanoid:SetAttribute("WalkSpeedMultiplier", 10)
humanoid.WalkSpeed = 300
game:GetService("RunService").Stepped:Connect(function()
if humanoid and player.Character then
humanoid.WalkSpeed = 350 
end
end)
else
humanoid:SetAttribute("WalkSpeedMultiplier", 1)
humanoid.WalkSpeed = 260
humanoid.WalkSpeed = 16 
end
print("✅ Seep Hack Speed: " .. tostring(enabled))

local function ToggleJumpPower(enabled)
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = enabled and 150 or 250
        print("✅ Nhảy Cao: " .. tostring(enabled))
    end
end

createToggleButton("🛠️ Fix Lag", 0.15, FixLag)
createToggleButton("⚡ Seep Hack", 0.3, SeepHack)
createToggleButton("🔥 Nhảy Cao", 0.45, ToggleJumpPower)

local fpsLabel = Instance.new("TextLabel", screenGui)
fpsLabel.Size = UDim2.new(0, 120, 0, 30)
fpsLabel.Position = UDim2.new(0.85, 0, 0.02, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextSize = 16
fpsLabel.Text = "FPS: loading..."

local fps = 0
runService.Heartbeat:Connect(function() fps = fps + 1 end)
spawn(function()
    while wait(1) do
        fpsLabel.Text = "FPS: " .. fps
        fps = 0
    end
end)
