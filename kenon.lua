-- Check if the game is loaded
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Load the UI library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Blox Fruits - Kenon Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "KenonHub"})

-- Main Tabs
local MainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local CombatTab = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ESPTab = Window:MakeTab({Name = "ESP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SettingsTab = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- State variables
local isFastAttackEnabled = false
local isAutoFarmEnabled = false
local isAutoChestEnabled = false
local isAutoSkillEnabled = false
local isAutoQuestEnabled = false
local isESPEnabled = false
local isKillAuraEnabled = false
local isSafeZoneEnabled = false
local isSpeedHackEnabled = false
local isFruitESPEnabled = false
local isAutoEquipEnabled = false
local isNoClipEnabled = false
local isInfiniteEnergyEnabled = false
local isAutoRaidEnabled = false
local isServerHopEnabled = false
local selectedStat = "Melee"

-- Long-range attack (Auto Attack)
local function longRangeAttack()
    spawn(function()
        while isFastAttackEnabled do
            local player = game.Players.LocalPlayer
            local character = player.Character

            if character and character:FindFirstChild("Humanoid") then
                -- Find the nearest enemy
                local nearestEnemy = nil
                local shortestDistance = math.huge
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj ~= character then
                        local distance = (obj.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                        if distance < shortestDistance then
                            nearestEnemy = obj
                            shortestDistance = distance
                        end
                    end
                end

                -- Attack if an enemy is found within range
                if nearestEnemy and shortestDistance <= 100 then -- Attack range of 100 studs (can be adjusted)
                    local tool = character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    end
                end
            end
            wait(0.1)
        end
    end)
end

-- Toggle Fast Attack
local function toggleFastAttack(state)
    isFastAttackEnabled = state

    if isFastAttackEnabled then
        longRangeAttack()  -- Activate long-range attack when Fast Attack is enabled
    else
        -- Stop long-range attack when Fast Attack is disabled (optional)
    end
end

-- Toggle Auto Equip
local function toggleAutoEquip(state)
    isAutoEquipEnabled = state

    if isAutoEquipEnabled then
        spawn(function()
            while isAutoEquipEnabled do
                local player = game.Players.LocalPlayer
                local backpack = player.Backpack
                for _, tool in pairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name:find("Sword") then
                        player.Character.Humanoid:EquipTool(tool)
                        break
                    end
                end
                wait(1)
            end
        end)
    end
end

-- Toggle No Clip
local function toggleNoClip(state)
    isNoClipEnabled = state

    if isNoClipEnabled then
        spawn(function()
            while isNoClipEnabled do
                local player = game.Players.LocalPlayer
                local character = player.Character

                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
                wait(0.1)
            end
        end)
    end
end

-- Toggle Infinite Energy
local function toggleInfiniteEnergy(state)
    isInfiniteEnergyEnabled = state

    if isInfiniteEnergyEnabled then
        spawn(function()
            while isInfiniteEnergyEnabled do
                local player = game.Players.LocalPlayer
                local energy = player.Character.Energy
                if energy then
                    energy.Value = energy.MaxValue
                end
                wait(0.1)
            end
        end)
    end
end

-- Toggle Auto Raid
local function toggleAutoRaid(state)
    isAutoRaidEnabled = state

    if isAutoRaidEnabled then
        spawn(function()
            while isAutoRaidEnabled do
                local raidRemote = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("RaidStart")
                if raidRemote then
                    raidRemote:FireServer()
                end
                wait(5)
            end
        end)
    end
end

-- Toggle Server Hop
local function toggleServerHop(state)
    isServerHopEnabled = state

    if isServerHopEnabled then
        spawn(function()
            while isServerHopEnabled do
                -- Logic for server hopping will be added here
                wait(10)
            end
        end)
    end
end

-- Add buttons to the UI
MainTab:AddToggle({Name = "Fast Attack", Default = false, Callback = toggleFastAttack})
MainTab:AddToggle({Name = "Auto Equip Best Weapon", Default = false, Callback = toggleAutoEquip})
CombatTab:AddToggle({Name = "Kill Aura", Default = false, Callback = toggleKillAura})
CombatTab:AddToggle({Name = "Auto Skill", Default = false, Callback = toggleAutoSkill})
CombatTab:AddToggle({Name = "Auto Farm", Default = false, Callback = toggleAutoFarm})
CombatTab:AddToggle({Name = "Auto Quest", Default = false, Callback = toggleAutoQuest})
SettingsTab:AddToggle({Name = "No Clip", Default = false, Callback = toggleNoClip})
SettingsTab:AddToggle({Name = "Infinite Energy", Default = false, Callback = toggleInfiniteEnergy})
SettingsTab:AddToggle({Name = "Auto Raid", Default = false, Callback = toggleAutoRaid})
SettingsTab:AddToggle({Name = "Server Hop", Default = false, Callback = toggleServerHop})
SettingsTab:AddToggle({Name = "Speed Hack", Default = false, Callback = toggleSpeedHack})
SettingsTab:AddToggle({Name = "Safe Zone", Default = false, Callback = toggleSafeZone})

OrionLib:Init()
