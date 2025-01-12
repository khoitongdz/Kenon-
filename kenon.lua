local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ExecuteButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local LockScreenButton = Instance.new("TextButton")
local AutoTradeButton = Instance.new("TextButton")
local LockOverlay = Instance.new("Frame")

-- Set up the ScreenGui
ScreenGui.Name = "Khoitongdz"
ScreenGui.Parent = game.CoreGui

-- Set up the Frame
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 300, 0, 220)
Frame.Position = UDim2.new(0.5, -150, 0.5, -110)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BorderSizePixel = 0

-- Set up the TextBox
TextBox.Name = "ScriptInput"
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.Size = UDim2.new(0, 280, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 20)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Enter script URL here"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14

-- Set up the ExecuteButton
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
ExecuteButton.Size = UDim2.new(0, 280, 0, 40)
ExecuteButton.Position = UDim2.new(0, 10, 0, 80)
ExecuteButton.Font = Enum.Font.SourceSans
ExecuteButton.Text = "Execute Script"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16

-- Set up the ToggleButton
ToggleButton.Name = "Khoitongdz"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Toggle UI"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14

-- Set up the LockScreenButton
LockScreenButton.Name = "LockScreenButton"
LockScreenButton.Parent = Frame
LockScreenButton.BackgroundColor3 = Color3.fromRGB(255, 69, 69)
LockScreenButton.Size = UDim2.new(0, 280, 0, 40)
LockScreenButton.Position = UDim2.new(0, 10, 0, 130)
LockScreenButton.Font = Enum.Font.SourceSans
LockScreenButton.Text = "Lock Screen"
LockScreenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LockScreenButton.TextSize = 16

-- Set up the AutoTradeButton
AutoTradeButton.Name = "AutoTradeButton"
AutoTradeButton.Parent = Frame
AutoTradeButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
AutoTradeButton.Size = UDim2.new(0, 280, 0, 40)
AutoTradeButton.Position = UDim2.new(0, 10, 0, 180)
AutoTradeButton.Font = Enum.Font.SourceSans
AutoTradeButton.Text = "Enable Auto Trade"
AutoTradeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoTradeButton.TextSize = 16

-- Set up the LockOverlay
LockOverlay.Name = "LockOverlay"
LockOverlay.Parent = ScreenGui
LockOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LockOverlay.BackgroundTransparency = 0.5
LockOverlay.Size = UDim2.new(1, 0, 1, 0)
LockOverlay.Position = UDim2.new(0, 0, 0, 0)
LockOverlay.Visible = false

-- Toggle Frame Visibility
ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

-- Function to Lock and Unlock Screen
local isLocked = false
LockScreenButton.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    LockOverlay.Visible = isLocked
    if isLocked then
        LockScreenButton.Text = "Unlock Screen"
    else
        LockScreenButton.Text = "Lock Screen"
    end
end)

-- Function to handle Auto Trade
autoTradeEnabled = false
local function enableAutoTrade()
    autoTradeEnabled = not autoTradeEnabled
    if autoTradeEnabled then
        AutoTradeButton.Text = "Disable Auto Trade"
        game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
            if child.Name == "TradeRequest" then
                -- Lock the other player's screen
                local otherPlayer = game.Players:FindFirstChild(child:GetAttribute("Sender"))
                if otherPlayer then
                    otherPlayer:Kick("Your screen has been locked by trade automation.")
                end

                -- Auto accept the trade
                wait(1) -- Delay to simulate player action
                local acceptButton = child:FindFirstChild("AcceptButton")
                if acceptButton then
                    fireclickdetector(acceptButton.ClickDetector)
                end
            end
        end)
    else
        AutoTradeButton.Text = "Enable Auto Trade"
    end
end

AutoTradeButton.MouseButton1Click:Connect(enableAutoTrade)

-- Function to support all executors
local function executeScript(scriptCode)
    local executor = identifyexecutor and identifyexecutor() or "Unknown"
    print("Executor detected: " .. executor)

    local success, errorMessage = pcall(function()
        loadstring(scriptCode)()
    end)

    if not success then
        warn("Error executing script: " .. errorMessage)
    end
end

-- Button Click Event
ExecuteButton.MouseButton1Click:Connect(function()
    local scriptUrl = TextBox.Text
    if scriptUrl and scriptUrl ~= "" then
        local success, scriptCode = pcall(function()
            return game:HttpGet(scriptUrl)
        end)
        if success then
            executeScript(scriptCode)
        else
            warn("Error loading script: " .. scriptCode)
        end
    else
        warn("Please enter a valid script URL!")
    end
end)
