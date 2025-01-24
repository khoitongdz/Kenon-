local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Flyx Hub - Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "FlyxHubConfig",
    IntroText = "Welcome to Flyx Hub"
})

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

MainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(value)
        _G.AutoFarm = value
        while _G.AutoFarm do
            wait()
            -- Logic for Auto Farm
            print("Auto Farming...")
        end
    end
})

MainTab:AddDropdown({
    Name = "Auto Assign Stats",
    Options = {"Melee", "Defense", "Sword", "Gun", "Fruit"},
    Default = "Melee",
    Callback = function(option)
        _G.AutoStats = option
        while _G.AutoStats do
            wait(5)
            -- Logic for Auto Assign Stats
            print("Assigning stats to: " .. option)
        end
    end
})

-- Teleport Tab
local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

TeleportTab:AddDropdown({
    Name = "Select Island",
    Options = {"Starter Island", "Middle Town", "Pirate Village", "Skylands", "Magma Island", "Colosseum"},
    Default = "Starter Island",
    Callback = function(option)
        _G.SelectedIsland = option
        print("Teleporting to: " .. option)
    end
})

TeleportTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        -- Teleport Logic
        print("Teleported to: " .. (_G.SelectedIsland or "Unknown"))
    end
})

-- Sea Event Tab
local SeaTab = Window:MakeTab({
    Name = "Sea Events",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

SeaTab:AddDropdown({
    Name = "Select Boat",
    Options = {"Dinghy", "Sloop", "Galleon", "Brigantine"},
    Default = "Dinghy",
    Callback = function(option)
        _G.SelectedBoat = option
        print("Boat selected: " .. option)
    end
})

SeaTab:AddToggle({
    Name = "Auto Sea Event",
    Default = false,
    Callback = function(value)
        _G.AutoSeaEvent = value
        while _G.AutoSeaEvent do
            wait(10)
            print("Auto Sea Event in progress...")
        end
    end
})

SeaTab:AddToggle({
    Name = "Safe Farm Sea Event",
    Default = false,
    Callback = function(value)
        _G.SafeSeaFarm = value
        while _G.SafeSeaFarm do
            wait(1)
            print("Safe farming sea event...")
        end
    end
})

-- Item Tab
local ItemTab = Window:MakeTab({
    Name = "Items",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

ItemTab:AddButton({
    Name = "Auto Collect Chests",
    Callback = function()
        _G.AutoCollectChests = true
        while _G.AutoCollectChests do
            wait(1)
            print("Collecting chests...")
        end
    end
})

ItemTab:AddButton({
    Name = "Auto Buy Fruits",
    Callback = function()
        print("Buying fruits...")
    end
})

-- Misc Tab
local MiscTab = Window:MakeTab({
    Name = "Miscellaneous",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

MiscTab:AddToggle({
    Name = "Infinite Energy",
    Default = false,
    Callback = function(value)
        _G.InfiniteEnergy = value
        if value then
            print("Infinite Energy Enabled")
        else
            print("Infinite Energy Disabled")
        end
    end
})

MiscTab:AddToggle({
    Name = "Walk on Water",
    Default = false,
    Callback = function(value)
        _G.WalkOnWater = value
        if value then
            print("Walking on water enabled!")
        else
            print("Walking on water disabled!")
        end
    end
})

-- Anti AFK
MiscTab:AddLabel("Anti AFK Enabled by Default")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    print("Anti AFK Triggered")
end)

-- Fast Attack Toggle
MiscTab:AddToggle({
    Name = "Fast Attack",
    Default = false,
    Callback = function(value)
        _G.FastAttack = value
        if value then
            print("Fast Attack Enabled")
        else
            print("Fast Attack Disabled")
        end
    end
})

-- Auto Fast Attack Near Enemies
MiscTab:AddToggle({
    Name = "Auto Fast Attack Near Enemies",
    Default = false,
    Callback = function(value)
        _G.AutoFastAttack = value
        while _G.AutoFastAttack do
            wait(0.1)
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local root = character.HumanoidRootPart
                local closestEnemy
                local shortestDistance = math.huge

                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local distance = (root.Position - enemy.HumanoidRootPart.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closestEnemy = enemy
                        end
                    end
                end

                if closestEnemy and shortestDistance < 50 then
                    print("Attacking enemy: " .. closestEnemy.Name)
                    -- Logic for fast attack goes here
                end
            end
        end
    end
})

-- Credits Tab
local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

CreditsTab:AddLabel("Script by khoitongdz")
CreditsTab:AddLabel("UI by khoitongdz")
CreditsTab:AddLabel("Specially Designed for Blox Fruits")

-- Initialization
OrionLib:Init()
