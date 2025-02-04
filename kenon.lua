--// UI Giao diện Chính
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

--// Cài đặt UI
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 350)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 85, 85)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 255))
}
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

Title.Parent = MainFrame
Title.Text = "Không Biết - Blox Fruits"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1

CloseButton.Parent = MainFrame
CloseButton.Text = "❌"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(0.9, 0, 0.05, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

--// Auto Farm
local function AutoFarm()
    while true do
        -- Code auto farm
        wait()
    end
end

--// Dịch Chuyển
local function Teleport(location)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location
end

--// ESP Hack
local function ESP()
    for _, v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer then
            local esp = Instance.new("BoxHandleAdornment", v.Character.Head)
            esp.Size = v.Character.Head.Size + Vector3.new(2, 2, 2)
            esp.Color3 = Color3.fromRGB(255, 0, 0)
            esp.Adornee = v.Character.Head
            esp.AlwaysOnTop = true
        end
    end
end

--// Nút Chức Năng
local FarmButton = Instance.new("TextButton", MainFrame)
FarmButton.Text = "🌾 Auto Farm"
FarmButton.Size = UDim2.new(0, 180, 0, 40)
FarmButton.Position = UDim2.new(0.05, 0, 0.2, 0)
FarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmButton.Font = Enum.Font.GothamBold
FarmButton.TextSize = 16
FarmButton.MouseButton1Click:Connect(AutoFarm)

local TeleportButton = Instance.new("TextButton", MainFrame)
TeleportButton.Text = "🚀 Dịch Chuyển"
TeleportButton.Size = UDim2.new(0, 180, 0, 40)
TeleportButton.Position = UDim2.new(0.05, 0, 0.5, 0)
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.TextSize = 16
TeleportButton.MouseButton1Click:Connect(function()
    Teleport(CFrame.new(-5074, 315, -3161))
end)

local ESPButton = Instance.new("TextButton", MainFrame)
ESPButton.Text = "👀 ESP"
ESPButton.Size = UDim2.new(0, 180, 0, 40)
ESPButton.Position = UDim2.new(0.5, 10, 0.2, 0)
ESPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Font = Enum.Font.GothamBold
ESPButton.TextSize = 16
ESPButton.MouseButton1Click:Connect(ESP)
