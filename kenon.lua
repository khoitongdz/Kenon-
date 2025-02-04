--// Tạo UI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")
local FarmButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")
local MiscButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

--// Cài đặt UI
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 250)

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

--// Nút Auto Farm
FarmButton.Parent = MainFrame
FarmButton.Text = "🌾 Auto Farm"
FarmButton.Size = UDim2.new(0, 180, 0, 40)
FarmButton.Position = UDim2.new(0.05, 0, 0.2, 0)
FarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmButton.Font = Enum.Font.GothamBold
FarmButton.TextSize = 16
FarmButton.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    while getgenv().AutoFarm do
        -- Code Auto Farm
        wait()
    end
end)

--// Nút Teleport
TeleportButton.Parent = MainFrame
TeleportButton.Text = "🚀 Dịch Chuyển"
TeleportButton.Size = UDim2.new(0, 180, 0, 40)
TeleportButton.Position = UDim2.new(0.05, 0, 0.5, 0)
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.TextSize = 16
TeleportButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5074, 315, -3161) -- Castle on the Sea
end)

--// Nút Hack Khác
MiscButton.Parent = MainFrame
MiscButton.Text = "⚡ Hack Khác"
MiscButton.Size = UDim2.new(0, 180, 0, 40)
MiscButton.Position = UDim2.new(0.5, 10, 0.2, 0)
MiscButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MiscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscButton.Font = Enum.Font.GothamBold
MiscButton.TextSize = 16
MiscButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

--// Nút Đóng UI
CloseButton.Parent = MainFrame
CloseButton.Text = "❌"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(0.85, 0, 0.05, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
