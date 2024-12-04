-- Kenon Hub Unified Script (No Key Version)

-- Global Settings
getgenv().Team = "Marines" -- Pirates/Marines
getgenv().Hide_Menu = false -- true/false

-- Importing Scripts from Original URLs Replaced for Kenon Hub
local ui_name = "Kenon Hub"
local ui_parent = game.CoreGui

local function loadScriptA()
    -- Load Script A (Kenon Hub)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/khoitongdz/kenon-exe/refs/heads/main/message.txt"))()
end

local function loadScriptB()
    -- Load Script B (Kenon Hub)
    loadstring(game:HttpGet("https://github.com/VitinDvne/XeroHub-v2-new/blob/main/xero_main.lua"))()
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
        print("Loading " .. ui_name)
        loadScriptA()
        loadScriptB()
        loadScriptC()
    end
end

initializeUI()
print(ui_name .. " No Key Version Initialized Successfully")
