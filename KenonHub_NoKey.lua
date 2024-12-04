-- Kenon Hub Unified Script (No Key Version)

-- Global Settings
getgenv().Team = "Marines" -- Pirates/Marines
getgenv().Hide_Menu = false -- true/false

-- Importing Scripts from Original URLs Replaced for Kenon Hub
local ui_name = "Kenon Hub" -- GUI name
local ui_parent = game.CoreGui

local function loadScriptA()
    -- Load Script A (Kenon Hub)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/khoitongdz/kenon-exe/refs/heads/main/message.txt"))()
end

local function loadScriptB()
    -- Load Script B (Kenon Hub)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VitinDvne/XeroHub-v2-new/main/xero_main.lua"))()
end

local function loadScriptC()
    -- Placeholder: (Old Hub Combined and Transformed)
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end

-- GUI Initialization Process
local function initializeUI()
    if ui_parent:FindFirstChild(ui_name) then
        warn(ui_name .. " Already Loaded!")
    else
        -- Create and load the Kenon Hub GUI
        local gui = Instance.new("ScreenGui")
        gui.Name = ui_name
        gui.Parent = ui_parent
        print("Loading " .. ui_name)

        -- Load scripts
        loadScriptA()
        loadScriptB()
        loadScriptC()

        -- Create the menu GUI
        local frame = Instance.new("Frame")
        frame.Parent = gui
        frame.Size = UDim2.new(0, 400, 0, 200) -- Size of the menu
        frame.Position = UDim2.new(0.5, -200, 0.5, -100) -- Center position
        frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Background color

        -- Add Auto Farm Button
        local autoFarmButton = Instance.new("TextButton")
        autoFarmButton.Parent = frame
        autoFarmButton.Size = UDim2.new(0, 380, 0, 40)
        autoFarmButton.Position = UDim2.new(0, 10, 0, 10)
        autoFarmButton.Text = "Auto Farm"
        autoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        autoFarmButton.MouseButton1Click:Connect(function()
            getgenv().AutoFarm = not getgenv().AutoFarm
            print("Auto Farm is now: " .. tostring(getgenv().AutoFarm))
        end)

        -- Add Hide Menu Button
        local hideMenuButton = Instance.new("TextButton")
        hideMenuButton.Parent = frame
        hideMenuButton.Size = UDim2.new(0, 380, 0, 40)
        hideMenuButton.Position = UDim2.new(0, 10, 0, 60)
        hideMenuButton.Text = "Hide Menu"
        hideMenuButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        hideMenuButton.MouseButton1Click:Connect(function()
            gui.Enabled = not gui.Enabled
            print("Menu visibility toggled.")
        end)
    end
end

initializeUI()
print(ui_name .. " No Key Version Initialized Successfully")

-- Kenon Hub Auto Farm Feature
getgenv().AutoFarm = true  -- Enable Auto Farm

local function autoFarm()
    while getgenv().AutoFarm do
        for _, mob in pairs(workspace:GetChildren()) do
            if mob:IsA("Model") and mob:FindFirstChild("Humanoid") then
                if mob.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(mob.PrimaryPart.Position)
                    -- Add attack code here (for example, using skills)
                    -- game:GetService("ReplicatedStorage").AttackSkill:FireServer()  -- Example
                end
            end
        end
        wait(0.5)  -- Time between each loop
    end
end

autoFarm()  -- Start auto-farming
