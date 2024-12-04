
-- Kenon Hub - No Key Version

-- Global Settings (No Key System)
getgenv().Team = "Pirates" -- Change to "Marines" if needed
getgenv().Hide_Menu = false -- Show/Hide Menu
getgenv().AutoFarm = true -- Auto farm toggle (default: true)

-- Simplified Multi-Source Loader
local function load_script(url)
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    if success and response then
        loadstring(response)()
    else
        warn("Failed to load script from " .. url)
    end
end

-- Source URLs (Combined)
local scripts = {
    "https://raw.githubusercontent.com/verudous/Xero-Hub/main/main.lua",
    "https://github.com/VitinDvne/XeroHub-v2-new/blob/main/xero_main.lua",
    "https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"
}

-- Load All Scripts
for _, url in ipairs(scripts) do
    load_script(url)
end

-- Additional Features (Optional)
if getgenv().FixCrash then
    print("Applying crash fix settings...")
end

print("Kenon Hub - No Key Version Loaded Successfully!")
