--// Flyx Hub UI - Hoho Hub Style \--
local FlyxHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LogoButton = Instance.new("ImageButton")
local TabBar = Instance.new("Frame")
local StatusTab = Instance.new("TextButton")
local ErrorTab = Instance.new("TextButton")
local MainTab = Instance.new("TextButton")
local AutoFarmTab = Instance.new("TextButton")
local TabContainer = Instance.new("Frame")
local StatusContainer = Instance.new("Frame")
local ErrorContainer = Instance.new("Frame")
local MainContainer = Instance.new("Frame")
local AutoFarmContainer = Instance.new("Frame")

-- Parent UI
FlyxHub.Parent = game:GetService("CoreGui")

-- Main Frame UI
MainFrame.Name = "MainFrame"
MainFrame.Parent = FlyxHub
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Visible = true
MainFrame.Draggable = true
MainFrame.Active = true

-- Logo Button
LogoButton.Name = "LogoButton"
LogoButton.Parent = FlyxHub
LogoButton.BackgroundTransparency = 1
LogoButton.Image = "http://www.roblox.com/asset/?id=6537589785" -- Kirito Avatar
LogoButton.Position = UDim2.new(0.05, 0, 0.05, 0)
LogoButton.Size = UDim2.new(0, 80, 0, 80)

-- Tabs
TabBar.Name = "TabBar"
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabBar.Size = UDim2.new(1, 0, 0, 40)

local function createTab(name, text, posX)
    local tab = Instance.new("TextButton")
    tab.Name = name
    tab.Parent = TabBar
    tab.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    tab.Position = UDim2.new(0, posX, 0, 5)
    tab.Size = UDim2.new(0, 120, 0, 30)
    tab.Font = Enum.Font.SourceSansBold
    tab.Text = text
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.TextSize = 16
    return tab
end

StatusTab = createTab("StatusTab", "Trạng Thái", 10)
ErrorTab = createTab("ErrorTab", "Lỗi Script", 140)
MainTab = createTab("MainTab", "Chính", 270)
AutoFarmTab = createTab("AutoFarmTab", "Auto Farm", 400)

-- Toggle UI
local isUIVisible = true
LogoButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    MainFrame.Visible = isUIVisible
end)

print("Flyx Hub UI Loaded Successfully!")
