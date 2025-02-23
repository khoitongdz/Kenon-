local Rayfield = loadstring(game:HttpGet('https://sirius.menu/sirius'))()

local Window = Rayfield:CreateWindow({
    Name = "Kenon Hub | Blox Fruits",
    LoadingTitle = "Kenon Hub Loading...",
    LoadingSubtitle = "By Khoitongdz",
    ConfigurationSaving = { Enabled = true, FolderName = "KenonHub", FileName = "BloxFruitsSettings" },
    Discord = { Enabled = false },
    KeySystem = false
})
local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HRP = Char:WaitForChild("HumanoidRootPart")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local function Teleport(Position)
    if HRP then
        HRP.CFrame = CFrame.new(Position)
    end
end
local function ESP(Object, Color)
    if Object and Object:IsA("Model") and not Object:FindFirstChild("Highlight") then
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = Object
        Highlight.FillColor = Color
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end
local function SendWebhook(Message)
    local url = "https://discord.com/api/webhooks/1337667957655994450/SjYmmvhkszUlpmSNZel7pwYnnKHhiV4QvQuvA3Iut-Hj0vfC3VeB6xqoipFVLRLqyZUy"
    local data = HttpService:JSONEncode({ content = Message })
    
    syn.request({
        Url = url,
        Method = "POST",
        Headers = { ['Content-Type'] = "application/json" },
        Body = data
    })
end
local MainTab = Window:CreateTab("Main", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local AutoFarmEnabled = false

local function AutoFarm()
    while AutoFarmEnabled and wait() do
        local EnemyList = {
local Sea1_Enemies = {
    { Level = 1, Name = "Bandit", Position = Vector3.new(-4480, 50, 3470) },
    { Level = 10, Name = "Monkey", Position = Vector3.new(-1600, 35, 160) },
    { Level = 15, Name = "Gorilla", Position = Vector3.new(-1150, 40, 450) },
    { Level = 30, Name = "Pirate", Position = Vector3.new(-1210, 40, 4000) },
    { Level = 40, Name = "Brute", Position = Vector3.new(-1145, 40, 4200) },
    { Level = 60, Name = "Desert Bandit", Position = Vector3.new(950, 15, 4400) },
    { Level = 75, Name = "Desert Officer", Position = Vector3.new(1500, 15, 4500) },
    { Level = 90, Name = "Snow Bandit", Position = Vector3.new(1200, 35, -4700) },
    { Level = 105, Name = "Snowman", Position = Vector3.new(1400, 35, -5000) },
    { Level = 120, Name = "Chief Petty Officer", Position = Vector3.new(-4800, 15, 4200) },
    { Level = 150, Name = "Sky Bandit", Position = Vector3.new(-4900, 300, -700) },
    { Level = 175, Name = "Dark Master", Position = Vector3.new(-5200, 360, -300) },
    { Level = 190, Name = "Prisoner", Position = Vector3.new(5400, 95, 690) },
    { Level = 225, Name = "Colossus", Position = Vector3.new(5600, 110, 600) },
    { Level = 250, Name = "Toga Warrior", Position = Vector3.new(-1050, 15, -5000) },
    { Level = 275, Name = "Gladiator", Position = Vector3.new(-1350, 15, -5200) },
    { Level = 300, Name = "Military Soldier", Position = Vector3.new(-5400, 55, 3900) },
    { Level = 325, Name = "Military Spy", Position = Vector3.new(-5800, 60, 4100) },
    { Level = 375, Name = "Fishman Warrior", Position = Vector3.new(6000, 10, -1750) },
    { Level = 400, Name = "Fishman Commando", Position = Vector3.new(6400, 10, -1900) },
    { Level = 450, Name = "God's Guard", Position = Vector3.new(-4600, 890, -1660) },
    { Level = 475, Name = "Shanda", Position = Vector3.new(-4400, 920, -2100) },
    { Level = 525, Name = "Warden", Position = Vector3.new(-5400, 30, -6600) },
    { Level = 550, Name = "Magma Admiral", Position = Vector3.new(-6000, 10, -5500) },
    { Level = 625, Name = "Fishman Lord", Position = Vector3.new(6700, 10, -2200) },
    { Level = 650, Name = "Sky Emperor", Position = Vector3.new(-5000, 950, -2500) }
}
local Sea2_Enemies = {
    { Level = 700, Name = "Raider", Position = Vector3.new(0, 0, 0) },
    { Level = 725, Name = "Mercenary", Position = Vector3.new(0, 0, 0) },
    { Level = 775, Name = "Swan Pirate", Position = Vector3.new(0, 0, 0) },
    { Level = 800, Name = "Factory Staff", Position = Vector3.new(0, 0, 0) },
    { Level = 850, Name = "Marine Lieutenant", Position = Vector3.new(0, 0, 0) },
    { Level = 875, Name = "Marine Captain", Position = Vector3.new(0, 0, 0) },
    { Level = 925, Name = "Zombie", Position = Vector3.new(0, 0, 0) },
    { Level = 950, Name = "Vampire", Position = Vector3.new(0, 0, 0) },
    { Level = 975, Name = "Snow Trooper", Position = Vector3.new(0, 0, 0) },
    { Level = 1000, Name = "Winter Warrior", Position = Vector3.new(0, 0, 0) },
    { Level = 1050, Name = "Lab Subordinate", Position = Vector3.new(0, 0, 0) },
    { Level = 1100, Name = "Horned Warrior", Position = Vector3.new(0, 0, 0) },
    { Level = 1125, Name = "Magma Ninja", Position = Vector3.new(0, 0, 0) },
    { Level = 1175, Name = "Lava Pirate", Position = Vector3.new(0, 0, 0) },
    { Level = 1200, Name = "Ship Deckhand", Position = Vector3.new(0, 0, 0) },
    { Level = 1250, Name = "Ship Engineer", Position = Vector3.new(0, 0, 0) },
    { Level = 1275, Name = "Ship Steward", Position = Vector3.new(0, 0, 0) },
    { Level = 1300, Name = "Ship Officer", Position = Vector3.new(0, 0, 0) },
    { Level = 1325, Name = "Arctic Warrior", Position = Vector3.new(0, 0, 0) },
    { Level = 1350, Name = "Snow Lurker", Position = Vector3.new(0, 0, 0) },
    { Level = 1375, Name = "Sea Soldier", Position = Vector3.new(0, 0, 0) },
    { Level = 1400, Name = "Water Fighter", Position = Vector3.new(0, 0, 0) }
}
    local Sea3_Enemies = {
    { Level = 1500, Name = "Pirate Millionaire", Position = Vector3.new(-290, 44, 5585) },
    { Level = 1525, Name = "Pistol Billionaire", Position = Vector3.new(-50, 44, 5850) },
    { Level = 1575, Name = "Dragon Crew Warrior", Position = Vector3.new(6300, 104, -5045) },
    { Level = 1600, Name = "Dragon Crew Archer", Position = Vector3.new(6400, 84, -5300) },
    { Level = 1625, Name = "Female Islander", Position = Vector3.new(3875, 52, -4815) },
    { Level = 1650, Name = "Giant Islander", Position = Vector3.new(3775, 52, -5050) },
    { Level = 1700, Name = "Marine Commodore", Position = Vector3.new(5150, 72, 3900) },
    { Level = 1725, Name = "Marine Rear Admiral", Position = Vector3.new(5100, 100, 4800) },
    { Level = 1775, Name = "Fishman Raider", Position = Vector3.new(-10350, 332, -850) },
    { Level = 1800, Name = "Fishman Captain", Position = Vector3.new(-10900, 332, -650) },
    { Level = 1825, Name = "Forest Pirate", Position = Vector3.new(-13350, 340, -790) },
    { Level = 1850, Name = "Mythological Pirate", Position = Vector3.new(-13650, 340, -400) },
    { Level = 1900, Name = "Jungle Pirate", Position = Vector3.new(-12000, 385, -10500) },
    { Level = 1925, Name = "Musketeer Pirate", Position = Vector3.new(-13200, 475, -9800) },
    { Level = 1975, Name = "Reborn Skeleton", Position = Vector3.new(-8765, 142, 603) },
    { Level = 2000, Name = "Living Zombie", Position = Vector3.new(-10142, 140, 850) },
    { Level = 2050, Name = "Demonic Soul", Position = Vector3.new(-9500, 285, 605) },
    { Level = 2100, Name = "Posessed Mummy", Position = Vector3.new(-9500, 285, 950) },
    { Level = 2125, Name = "Peanut Scout", Position = Vector3.new(-2095, 37, -10066) },
    { Level = 2150, Name = "Peanut President", Position = Vector3.new(-2095, 37, -9750) },
    { Level = 2200, Name = "Ice Cream Chef", Position = Vector3.new(-658, 75, -11018) },
    { Level = 2225, Name = "Ice Cream Commander", Position = Vector3.new(-527, 75, -11226) },
    { Level = 2300, Name = "Cookie Crafter", Position = Vector3.new(-2161, 74, -12130) },
    { Level = 2325, Name = "Cookie Guard", Position = Vector3.new(-1878, 74, -12257) },
    { Level = 2375, Name = "Cocoa Warrior", Position = Vector3.new(-384, 78, -12852) },
    { Level = 2400, Name = "Chocolate Bar Battler", Position = Vector3.new(-241, 78, -13246) },
    { Level = 2450, Name = "Sweet Thief", Position = Vector3.new(1068, 37, -13481) },
    { Level = 2475, Name = "Candy Rebel", Position = Vector3.new(813, 37, -13804) },
    { Level = 2525, Name = "Candy Pirate", Position = Vector3.new(490, 37, -14250) },
    { Level = 2550, Name = "Snow Demon", Position = Vector3.new(-766, 114, -14452) },
    { Level = 2600, Name = "Tiki Warrior", Position = Vector3.new(970, 114, -14952) },
}
        for _, mob in pairs(EnemyList) do
            if Player.Data.Level.Value >= mob.Level then
                HRP.CFrame = CFrame.new(mob.Position)

                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy.Name == mob.Name and enemy:FindFirstChild("HumanoidRootPart") then
                        repeat
                            HRP.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            VirtualUser:Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                            wait(0.1)
                        until enemy.Humanoid.Health <= 0 or not enemy.Parent or not AutoFarmEnabled
                    end
                end
            end
        end
    end
end

MainTab:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        AutoFarmEnabled = Value
        if Value then
            spawn(AutoFarm)
        end
    end
})
TeleportTab:CreateButton({
    Name = "Teleport to Sea 3",
    Callback = function()
        Teleport(Vector3.new(0, 100, 0))
    end
})
local ESPEnabled = false

MainTab:CreateToggle({
    Name = "ESP Players",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        ESPEnabled = Value
        while ESPEnabled and wait(1) do
            for _, player in pairs(game.Players:GetChildren()) do
                if player.Character then
                    ESP(player.Character, Color3.fromRGB(255, 0, 0))
                end
            end
        end
    end
})
MainTab:CreateButton({
    Name = "Send Webhook",
    Callback = function()
        SendWebhook("Kenon Hub Activated!")
    end
})
Rayfield:LoadConfiguration()
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightControl then
        Window:Toggle()
    end
end)
