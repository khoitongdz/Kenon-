-- Kenon Ultimate Fix Lag Script
-- Cho phép chọn phần trăm fix lag từ 15% đến 100% bằng nút chọn
-- Hỗ trợ mọi executor, có UI bật/tắt

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("ImageButton")
local Dropdown = Instance.new("TextButton")
local DropdownList = Instance.new("Frame")
local Options = {}
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

Dropdown.Name = "Dropdown"
Dropdown.Parent = ScreenGui
Dropdown.Size = UDim2.new(0, 100, 0, 30)
Dropdown.Position = UDim2.new(0, 10, 0, 100)
Dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Dropdown.Text = "Chọn % Fix Lag"
Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.TextScaled = true
Dropdown.Font = Enum.Font.SourceSansBold

DropdownList.Name = "DropdownList"
DropdownList.Parent = Dropdown
DropdownList.Size = UDim2.new(0, 100, 0, 150)
DropdownList.Position = UDim2.new(0, 0, 1, 5)
DropdownList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DropdownList.Visible = false

local percentages = {15, 25, 50, 75, 100}
local fixLagPercentage = 50 -- Mức xoá đồ hoạ trung bình

for i, percent in ipairs(percentages) do
    local Option = Instance.new("TextButton")
    Option.Parent = DropdownList
    Option.Size = UDim2.new(1, 0, 0, 30)
    Option.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
    Option.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
    Option.Text = percent .. "%"
    Option.TextScaled = true
    Option.Font = Enum.Font.SourceSansBold
    Option.MouseButton1Click:Connect(function()
        fixLagPercentage = percent
        Dropdown.Text = "Fix Lag: " .. percent .. "%"
        DropdownList.Visible = false
    end)
    table.insert(Options, Option)
end

Dropdown.MouseButton1Click:Connect(function()
    DropdownList.Visible = not DropdownList.Visible
end)

local function RemoveIslands(percentage)
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

ToggleButton.MouseButton1Click:Connect(function()
    RemoveIslands(fixLagPercentage)
end)
