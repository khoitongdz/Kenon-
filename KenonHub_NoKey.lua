-- Kenon Hub Unified Script (No Key Version)

-- Auto load settings
getgenv().Team = "Marines" -- Pirates/Marines
getgenv().Hide_Menu = false -- true/false

-- Import common utilities and features from script A and B, combining into one file
local ui_name = "Kenon Hub" -- Unified script
local ui_parent = game.CoreGui

local function loadScriptA()
    -- Load from first source (Xero Hub main)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/verudous/Xero-Hub/main/main.lua"))()
end

local function loadScriptB()
    -- Load from second source (XeroHub-v2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VitinDvne/XeroHub-v2-new/main/xero_main.lua"))()
end

local function initializeUI()
    -- Setup UI with appropriate name and link to core GUI components
    if ui_parent:FindFirstChild(ui_name) then
        warn(ui_name .. " UI Already Loaded!")
    else
        -- Custom UI Manager
        print("Starting " .. ui_name)
        -- Main UI Configuration:
        loadScriptA()
        loadScriptB()
    end
end

-- Execute final hub loader
initializeUI()
print(ui_name .. " No Key Mode Activated")
