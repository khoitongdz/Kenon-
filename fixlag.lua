--// Kenon Hub - Fix Lag Script
local ui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local buttons = {}
local levels = {"Đã Bật X1", "Đã Bật X2", "Đã Bật X3", "Tắt"}

-- UI Setup
ui.Parent = game.CoreGui
frame.Parent = ui
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0.5, -100, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 3

for i, text in ipairs(levels) do
    local button = Instance.new("TextButton")
    button.Parent = frame
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = UDim2.new(0, 0, 0, (i-1) * 55)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 20
    table.insert(buttons, button)
end

-- Function to adjust lag settings
local function fixLag(level)
    if level >= 1 then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 -- Giảm đồ họa
        game.Lighting.GlobalShadows = false -- Tắt bóng
        game.Lighting.Brightness = 2 -- Tăng độ sáng
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
                v.Enabled = false -- Tắt hiệu ứng hình ảnh
            end
        end
    end
    if level >= 2 then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
                v.Material = Enum.Material.SmoothPlastic -- Đơn giản hóa vật thể
            end
        end
    end
    if level >= 3 then
        game:GetService("RunService"):Set3dRenderingEnabled(false) -- Tắt hoàn toàn đồ họa
    end
    if level == 0 then
        game:GetService("RunService"):Set3dRenderingEnabled(true) -- Bật lại đồ họa
    end
end

-- Button Events
buttons[1].MouseButton1Click:Connect(function() fixLag(1) end)
buttons[2].MouseButton1Click:Connect(function() fixLag(2) end)
buttons[3].MouseButton1Click:Connect(function() fixLag(3) end)
buttons[4].MouseButton1Click:Connect(function() fixLag(0) end)
