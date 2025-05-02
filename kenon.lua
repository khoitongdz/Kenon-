
-- Xoá UI cũ nếu có
if game.CoreGui:FindFirstChild("FastAttackUI") then
    game.CoreGui.FastAttackUI:Destroy()
end

-- Biến toàn cục
local FastAttack = false
local AttackSpeed = 0.5
local UIVisible = false
local Player = game.Players.LocalPlayer
local MonFarm = nil
local PosMon = nil
local BringMobDistance = 300

local SpeedTable = {
    ["Slow"] = 0.10,
    ["Normal"] = 0.19,
    ["Fast"] = 0.12,
    ["Super Fast"] = 0.5
}
local SpeedList = {"Slow", "Normal", "Fast", "Super Fast"}
local CurrentSpeed = "Normal"

-- UI Setup
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FastAttackUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = syn and syn.protect_gui and syn.protect_gui(ScreenGui) or CoreGui

-- Nút bật/tắt UI
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 100, 0, 40)
ToggleBtn.Position = UDim2.new(0, 10, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleBtn.Text = "OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
ToggleBtn.TextSize = 16
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.AutoButtonColor = false
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 10)

-- Frame chính
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 160)
Frame.Position = UDim2.new(0.5, -125, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Visible = false
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "⚡ Fram Skibiditolet"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Toggle Fast Attack
local Toggle = Instance.new("TextButton", Frame)
Toggle.Size = UDim2.new(1, -20, 0, 30)
Toggle.Position = UDim2.new(0, 10, 0, 40)
Toggle.Text = "🔄 Fram quái: OFF"
Toggle.Font = Enum.Font.Gotham
Toggle.TextSize = 16
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 6)

-- Dropdown Speed
local Drop = Instance.new("TextButton", Frame)
Drop.Size = UDim2.new(1, -20, 0, 30)
Drop.Position = UDim2.new(0, 10, 0, 80)
Drop.Text = "⚙️ Speed: Normal"
Drop.Font = Enum.Font.Gotham
Drop.TextSize = 16
Drop.TextColor3 = Color3.fromRGB(255, 255, 255)
Drop.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Instance.new("UICorner", Drop).CornerRadius = UDim.new(0, 6)

-- Nút xóa UI
local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(1, -20, 0, 30)
Close.Position = UDim2.new(0, 10, 0, 120)
Close.Text = "🗑 Xoá UI"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.TextColor3 = Color3.fromRGB(255, 100, 100)
Close.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)

-- Logic Toggle
Toggle.MouseButton1Click:Connect(function()
    FastAttack = not FastAttack
    Toggle.Text = FastAttack and "🔄 Fram quái: ON" or "🔄 Fram quái: OFF"
end)

-- Logic đổi tốc độ
local index = 2
Drop.MouseButton1Click:Connect(function()
    index = index % #SpeedList + 1
    CurrentSpeed = SpeedList[index]
    AttackSpeed = SpeedTable[CurrentSpeed]
    Drop.Text = "⚙️ Speed: " .. CurrentSpeed
end)

-- Xoá UI
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Bật/tắt UI bằng nút
ToggleBtn.MouseButton1Click:Connect(function()
    UIVisible = not UIVisible
    Frame.Visible = UIVisible
    ToggleBtn.Text = UIVisible and "ON" or "OFF"
    ToggleBtn.TextColor3 = UIVisible and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 80, 80)
end)
