-- Kenon Hub Unified Script (No Key Version)

-- Global Settings
getgenv().Team = "Marines" -- Pirates/Marines
getgenv().Hide_Menu = false -- true/false

-- Importing Scripts from Original URLs Replaced for Kenon Hub
local ui_name = "Kenon Hub" -- Changed from Xero Hub to Kenon Hub
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
        -- Create and load the GUI with correct name
        local gui = Instance.new("ScreenGui")
        gui.Name = ui_name
        gui.Parent = ui_parent
        print("Loading " .. ui_name)

        -- Load the scripts
        loadScriptA()
        loadScriptB()
        loadScriptC()
    end
end

initializeUI()
print(ui_name .. " No Key Version Initialized Successfully")

-- Kenon Hub Auto Farm Feature
getgenv().AutoFarm = true  -- Bật Auto Farm

local function autoFarm()
    while getgenv().AutoFarm do
        for _, mob in pairs(workspace:GetChildren()) do
            if mob:IsA("Model") and mob:FindFirstChild("Humanoid") then
                if mob.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(mob.PrimaryPart.Position)
                    -- Thêm code tấn công hoặc sử dụng kỹ năng
                    -- game:GetService("ReplicatedStorage").AttackSkill:FireServer()  -- VD
                end
            end
        end
        wait(0.5)  -- Khoảng thời gian giữa mỗi vòng lặp
    end
end

autoFarm()  -- Gọi hàm để bắt đầu auto-farming
