-- Flyx Hub Script for Blox Fruits (UI giống Hoho Hub)
-- Created by khoitongdz

local FlyxHub = {}

-- Anti-AFK Protection
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- UI Setup (Using custom library for better UI)
local Library = loadstring(game:HttpGet(" https://raw.githubusercontent.com/khoitongdz/ui/refs/heads/main/.gitignore"))()

local Window = Library:CreateWindow("Flyx Hub | Blox Fruits")

-- Create Tabs
local AutoFarmTab = Window:CreateTab("Auto Farm")
local TeleportTab = Window:CreateTab("Teleport")
local MiscTab = Window:CreateTab("Misc")
local ESPTab = Window:CreateTab("ESP")
local SettingsTab = Window:CreateTab("Settings")

-- Variables
local autofarm = false
local selectedMob = "Bandit"
local selectedLocation = "Starter Island"
local espEnabled = false
local speedHack = false

-- Functions to Update Tabs Based on Sea
local function updateTabsForSea(sea)
    if sea == "Sea 1" then
        AutoFarmTab:UpdateDropdown("Select Mob", {"Bandit", "Monkey", "Pirate", "Brute"})
        TeleportTab:UpdateDropdown("Select Location", {"Starter Island", "Jungle", "Pirate Village"})
    elseif sea == "Sea 2" then
        AutoFarmTab:UpdateDropdown("Select Mob", {"Swan Pirate", "Factory Staff", "Marine Lieutenant"})
        TeleportTab:UpdateDropdown("Select Location", {"Kingdom of Rose", "Green Zone", "Graveyard"})
    elseif sea == "Sea 3" then
        AutoFarmTab:UpdateDropdown("Select Mob", {"Pirate Millionaire", "Fishman Raider", "Sea Soldier"})
        TeleportTab:UpdateDropdown("Select Location", {"Port Town", "Hydra Island", "Great Tree"})
    end
end

-- Auto Farm Section
AutoFarmTab:CreateToggle("Auto Farm", function(state)
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

AutoFarmTab:CreateDropdown("Select Mob", {"Bandit", "Monkey", "Pirate", "Brute"}, function(selected)
    selectedMob = selected
end)

-- Teleport Section
TeleportTab:CreateDropdown("Select Sea", {"Sea 1", "Sea 2", "Sea 3"}, function(sea)
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

-- ESP Section
local function toggleESP(state)
    espEnabled = state
    if espEnabled then
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                local espBox = Instance.new("BillboardGui")
                espBox.Size = UDim2.new(0, 200, 0, 50)
                espBox.Adornee = v.Head
                espBox.Parent = v
                espBox.AlwaysOnTop = true
                espBox.StudsOffset = Vector3.new(0, 3, 0)
                
                local espLabel = Instance.new("TextLabel")
                espLabel.Size = UDim2.new(1, 0, 1, 0)
                espLabel.Text = v.Name
                espLabel.BackgroundTransparency = 1
                espLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                espLabel.TextStrokeTransparency = 0.8
                espLabel.TextSize = 16
                espLabel.Parent = espBox
            end
        end
    else
        -- Remove ESP boxes
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                for _, gui in pairs(v:GetChildren()) do
                    if gui:IsA("BillboardGui") then
                        gui:Destroy()
                    end
                end
            end
        end
    end
end

ESPTab:CreateToggle("Enable ESP", function(state)
    toggleESP(state)
end)

-- Speed Hack Section
MiscTab:CreateToggle("Speed Hack", function(state)
    speedHack = state
    if speedHack then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

-- Code Redeem Section
MiscTab:CreateButton("Redeem All Codes", function()
    local codes = {"FUDD10", "BIGNEWS", "THEGREATACE"}
    for _, code in pairs(codes) do
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
    end
end)

-- Settings Section
SettingsTab:CreateButton("Reset Settings", function()
    -- Reset all settings
    autofarm = false
    espEnabled = false
    speedHack = false
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

-- Load Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flyx Hub Loaded",
    Text = "Enjoy your gameplay with Flyx Hub!",
    Duration = 5
})

return FlyxHub
