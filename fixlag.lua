
-- Kenon Ultimate Fix Lag Script
-- Cho phép chọn phần trăm fix lag từ 15% đến 100% bằng thanh trượt
-- Hỗ trợ mọi executor, có UI bật/tắt, Reset đồ họa

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local SliderFrame = Instance.new("Frame")
local Slider = Instance.new("TextButton")
local ResetButton = Instance.new("TextButton")
local UserInputService = game:GetService("UserInputService")

-- Cấu hình UI
ScreenGui.Name = "KenonFixLagUI"
ScreenGui.Parent = game:GetService("CoreGui")

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Image = "rbxassetid://84122944038358" -- Thay bằng ID logo của bạn
ToggleButton.BackgroundTransparency = 1

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = ScreenGui
SliderFrame.Size = UDim2.new(0, 150, 0, 40)
SliderFrame.Position = UDim2.new(0, 10, 0, 100)
SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

Slider.Name = "Slider"
Slider.Parent = SliderFrame
Slider.Size = UDim2.new(0, 20, 1, 0)
Slider.Position = UDim2.new(0.5, -10, 0, 0)
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

ResetButton.Name = "ResetButton"
ResetButton.Parent = ScreenGui
ResetButton.Size = UDim2.new(0, 100, 0, 30)
ResetButton.Position = UDim2.new(0, 10, 0, 150)
ResetButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
ResetButton.Text = "Reset Đồ Họa"
ResetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetButton.TextScaled = true
ResetButton.Font = Enum.Font.SourceSansBold

local fixLagPercentage = 50 -- Mặc định 50%

local function UpdateSlider(input)
    local scale = math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0.15, 1)
    fixLagPercentage = math.floor(scale * 100)
    Slider.Position = UDim2.new(scale, -10, 0, 0)
end

Slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                UpdateSlider(input)
            end
        end)
    end
end)

local function RemoveLagObjects(percentage)
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("PointLight") or v:IsA("SurfaceLight") then
            v.Enabled = false
        end
    end
    
    local islands = {}
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Model") and v.Name:lower():find("island") then
            table.insert(islands, v)
        end
    end
    local removeCount = math.floor(#islands * (percentage / 100))
    for i = 1, removeCount do
        pcall(function() islands[i]:Destroy() end)
    end
end

local function ResetGraphics()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("PointLight") or v:IsA("SurfaceLight") then
            v.Enabled = true
        end
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    RemoveLagObjects(fixLagPercentage)
end)

ResetButton.MouseButton1Click:Connect(function()
    ResetGraphics()
end)
