-- Flyx Hub Script for Blox Fruits
-- Created by khoitongdz

local FlyxHub = {}

-- Anti-AFK Protection
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- UI Setup
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Library/Source/main/Library.lua"))()
local Window = Library:CreateWindow("Flyx Hub|Blox Fruits")

local FarmTab = Window:CreateTab("Auto Farm")
local TeleportTab = Window:CreateTab("Teleport")
local MiscTab = Window:CreateTab("Misc")
local VolcanoTab = Window:CreateTab("Volcano Event")

-- Variables
local autofarm = false
local selectedMob = ""
local autoCraft = false
local autoFindIsland = false
local selectedWeapon = "Melee"
local selectedMethod = "Click M1"
local selectedSea = "Sea 1"

-- Function to Update Tabs Based on Sea
local function updateTabsForSea(sea)
    if sea == "Sea 1" then
        FarmTab:UpdateDropdown("Select Mob", {"Bandit", "Monkey", "Pirate", "Brute"})
        TeleportTab:UpdateDropdown("Select Location", {"Starter Island", "Jungle", "Pirate Village"})
    elseif sea == "Sea 2" then
        FarmTab:UpdateDropdown("Select Mob", {"Swan Pirate", "Factory Staff", "Marine Lieutenant"})
        TeleportTab:UpdateDropdown("Select Location", {"Kingdom of Rose", "Green Zone", "Graveyard"})
    elseif sea == "Sea 3" then
        FarmTab:UpdateDropdown("Select Mob", {"Pirate Millionaire", "Fishman Raider", "Sea Soldier"})
        TeleportTab:UpdateDropdown("Select Location", {"Port Town", "Hydra Island", "Great Tree"})
    end
end

-- Auto Farm Section
FarmTab:CreateToggle("Auto Farm", function(state)
    autofarm = state
    while autofarm do
        pcall(function()
            local mob = game:GetService("Workspace").Enemies:FindFirstChild(selectedMob)
            if mob and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)
                game:GetService("VirtualUser"):Button1Down(Vector2.new())
            else
                wait(0.5)
            end
        end)
        wait()
    end
end)

FarmTab:CreateDropdown("Select Mob", {"Bandit", "Monkey", "Pirate", "Brute"}, function(selected)
    selectedMob = selected
end)

-- Teleport Section
TeleportTab:CreateDropdown("Select Sea", {"Sea 1", "Sea 2", "Sea 3"}, function(sea)
    selectedSea = sea
    updateTabsForSea(sea)
end)

TeleportTab:CreateDropdown("Select Location", {"Starter Island", "Jungle", "Pirate Village"}, function(location)
    local locations = {
        ["Starter Island"] = CFrame.new(1159, 16, 1240),
        ["Jungle"] = CFrame.new(-1178, 11, 3853),
        ["Pirate Village"] = CFrame.new(-1121, 4, 3828),
        ["Kingdom of Rose"] = CFrame.new(-394, 118, 1248),
        ["Green Zone"] = CFrame.new(-2365, 72, -316),
        ["Graveyard"] = CFrame.new(-5438, 48, -5934),
        ["Port Town"] = CFrame.new(-290, 6, 5303),
        ["Hydra Island"] = CFrame.new(5228, 604, 346),
        ["Great Tree"] = CFrame.new(2175, 28, -6727)
    }
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = locations[location]
end)

-- Volcano Event Section
VolcanoTab:CreateToggle("Auto Crafting Volcanic Magnet", function(state)
    autoCraft = state
    while autoCraft do
        pcall(function()
            local blazeEmber = game:GetService("Workspace").Resources:FindFirstChild("Blaze Ember")
            local scrapMetal = game:GetService("Workspace").Resources:FindFirstChild("Scrap Metal")
            if blazeEmber then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = blazeEmber.CFrame
                wait(1)
            elseif scrapMetal then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = scrapMetal.CFrame
                wait(1)
            else
                wait(0.5)
            end
        end)
        wait()
    end
end)

VolcanoTab:CreateToggle("Auto Find Prehistoric Island", function(state)
    autoFindIsland = state
    while autoFindIsland do
        pcall(function()
            local volcanicMagnet = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Volcanic Magnet")
            if volcanicMagnet then
                -- Replace with Prehistoric Island teleport location
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 100, 1000) -- Example
            else
                wait(0.5)
            end
        end)
        wait()
    end
end)

VolcanoTab:CreateDropdown("Select Weapon Kill Golem", {"Melee", "Sword", "Gun"}, function(weapon)
    selectedWeapon = weapon
end)

VolcanoTab:CreateDropdown("Select Method Kill Golem", {"Click M1", "Skill"}, function(method)
    selectedMethod = method
end)

-- Misc Section
MiscTab:CreateButton("Redeem All Codes", function()
    local codes = {"FUDD10", "BIGNEWS", "THEGREATACE"}
    for _, code in pairs(codes) do
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
    end
end)

MiscTab:CreateButton("Speed Hack", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- Load Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flyx Hub Loaded",
    Text = "Enjoy your gameplay with Flyx Hub!",
    Duration = 5
})

return FlyxHub
