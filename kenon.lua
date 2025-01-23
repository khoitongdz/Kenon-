---[[[https://discord.gg/SFvsMJHXfc]]]---
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/khoitongdz/Kenon-/refs/heads/main/message.txt"))()

local window = library:CreateWindow({
    Name = "Flyx Hub - Blox Fruits",
    LoadingTitle = "Flyx Hub Loading...",
    LoadingSubtitle = "Optimized for Blox Fruits",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FlyxHubData",
        FileName = "FlyxHubConfig"
    },
    KeySystem = false -- Không cần key để sử dụng script
})

-- MAIN TAB
local mainTab = window:CreateTab("Main", 4483362458) -- Icon của Roblox
mainTab:CreateSection("General Features")

-- Auto Farm
mainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(value)
        _G.AutoFarm = value
        while _G.AutoFarm do
            wait()
            -- Thêm logic Auto Farm
            print("Auto Farming...")
        end
    end
})

-- Auto Stats
mainTab:CreateDropdown({
    Name = "Auto Assign Stats",
    Options = {"Melee", "Defense", "Sword", "Gun", "Fruit"},
    CurrentOption = "Melee",
    Callback = function(option)
        _G.AutoStats = option
        print("Auto Assigning Stats: " .. option)
        while _G.AutoStats do
            wait(5)
            -- Thêm logic tự động tăng điểm stats
        end
    end
})

-- Teleport TAB
local teleportTab = window:CreateTab("Teleport", 4483362458)
teleportTab:CreateSection("Islands & Locations")

teleportTab:CreateDropdown({
    Name = "Select Island",
    Options = {"Starter Island", "Middle Town", "Pirate Village", "Skylands", "Magma Island", "Colosseum"},
    CurrentOption = "Starter Island",
    Callback = function(option)
        _G.SelectedIsland = option
        print("Selected Island: " .. option)
    end
})

teleportTab:CreateButton({
    Name = "Teleport Now",
    Callback = function()
        -- Logic Teleport
        print("Teleporting to: " .. (_G.SelectedIsland or "Unknown"))
    end
})

-- SEA EVENT TAB
local seaEventTab = window:CreateTab("Sea Event", 4483362458)
seaEventTab:CreateSection("Control Sea Events")

seaEventTab:CreateDropdown({
    Name = "Select Boat",
    Options = {"Dinghy", "Sloop", "Galleon", "Brigantine"},
    CurrentOption = "Dinghy",
    Callback = function(option)
        print("Selected Boat: " .. option)
        _G.SelectedBoat = option
    end
})

seaEventTab:CreateToggle({
    Name = "Auto Sea Event",
    CurrentValue = false,
    Callback = function(value)
        _G.AutoSeaEvent = value
        while _G.AutoSeaEvent do
            wait(10)
            -- Logic Auto Sea Event
            print("Auto Sea Event Running...")
        end
    end
})

-- SAFE FARM SEA EVENT
seaEventTab:CreateToggle({
    Name = "Safe Farm Sea Event",
    CurrentValue = false,
    Callback = function(value)
        _G.SafeSeaFarm = value
        while _G.SafeSeaFarm do
            wait(1)
            -- Logic Safe Farm
            print("Farming Safely...")
        end
    end
})

-- ITEM TAB
local itemTab = window:CreateTab("Item", 4483362458)
itemTab:CreateSection("Item Management")

itemTab:CreateButton({
    Name = "Auto Collect Chests",
    Callback = function()
        _G.AutoCollectChests = true
        while _G.AutoCollectChests do
            wait(1)
            -- Logic Auto Collect Chests
            print("Collecting Chests...")
        end
    end
})

itemTab:CreateButton({
    Name = "Auto Buy Fruits",
    Callback = function()
        -- Logic Auto Buy Fruits
        print("Buying Fruits...")
    end
})

-- MISC TAB
local miscTab = window:CreateTab("Misc", 4483362458)
miscTab:CreateSection("Extra Features")

miscTab:CreateToggle({
    Name = "Infinite Energy",
    CurrentValue = false,
    Callback = function(value)
        _G.InfiniteEnergy = value
        if value then
            -- Logic Infinite Energy
            print("Infinite Energy Activated!")
        else
            print("Infinite Energy Deactivated!")
        end
    end
})

miscTab:CreateToggle({
    Name = "Walk on Water",
    CurrentValue = false,
    Callback = function(value)
        _G.WalkOnWater = value
        if value then
            -- Logic Walk on Water
            print("Walking on Water Enabled!")
        else
            print("Walking on Water Disabled!")
        end
    end
})

-- CREDITS TAB
local creditsTab = window:CreateTab("Credits", 4483362458)
creditsTab:CreateSection("Developers")
creditsTab:CreateLabel("Script by khoitongdz")
creditsTab:CreateLabel("UI by khoitongdz")
creditsTab:CreateLabel("For Blox Fruits")

-- Finalize
library:Notify("Flyx Hub Loaded Successfully", "Enjoy using Flyx Hub for Blox Fruits!")
