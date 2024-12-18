-- Kiểm tra xem game có đang chạy
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Tải thư viện UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Blox Fruits - Kenon Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "KenonHub"})

-- Tabs chính với icon từ URL
local iconUrl = "https://media.discordapp.net/attachments/1251001730997682218/1310851463869632535/1290305687762501723.png?ex=6763ba0f&is=6762688f&hm=0df7474dea7ba9df531347cff793ba643d3879135eb7d789b546b1c9248e4d33&=&format=webp&quality=lossless&width=76&height=76"

local MainTab = Window:MakeTab({Name = "Main", Icon = iconUrl, PremiumOnly = false})
local CombatTab = Window:MakeTab({Name = "Combat", Icon = iconUrl, PremiumOnly = false})
local ESPTab = Window:MakeTab({Name = "ESP", Icon = iconUrl, PremiumOnly = false})
local SettingsTab = Window:MakeTab({Name = "Settings", Icon = iconUrl, PremiumOnly = false})

-- Biến trạng thái
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

-- Hàm bật/tắt Fast Attack
local function toggleFastAttack(state)
    isFastAttackEnabled = state

    if isFastAttackEnabled then
        spawn(function()
            while isFastAttackEnabled do
                local player = game.Players.LocalPlayer
                local character = player.Character

                if character and character:FindFirstChild("Humanoid") then
                    local tool = character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                        local hitbox = character:FindFirstChild("HumanoidRootPart")
                        if hitbox then
                            hitbox.Size = Vector3.new(50, 50, 50)
                            hitbox.Transparency = 0.5
                        end
                    end
                end
                wait(0.1)
            end
        end)
    else
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            character.HumanoidRootPart.Transparency = 0
        end
    end
end

-- Hàm bật/tắt Auto Equip
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

-- Hàm bật/tắt No Clip
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

-- Hàm bật/tắt Infinite Energy
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

-- Hàm bật/tắt Auto Raid
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

-- Hàm bật/tắt Server Hop
local function toggleServerHop(state)
    isServerHopEnabled = state

    if isServerHopEnabled then
        spawn(function()
            while isServerHopEnabled do
                -- Logic chuyển server sẽ được thêm ở đây
                wait(10)
            end
        end)
    end
end

-- Hàm bật/tắt Auto Farm
local function toggleAutoFarm(state)
    isAutoFarmEnabled = state

    if isAutoFarmEnabled then
        spawn(function()
            while isAutoFarmEnabled do
                local player = game.Players.LocalPlayer
                local character = player.Character

                -- Tìm quái và đánh
                -- Tùy thuộc vào game, bạn có thể tìm và đánh quái theo cách sau
                -- Ví dụ: Tìm quái và sử dụng skill để tấn công

                wait(0.1)
            end
        end)
    end
end

-- Hàm bật/tắt Auto Quest
local function toggleAutoQuest(state)
    isAutoQuestEnabled = state

    if isAutoQuestEnabled then
        spawn(function()
            while isAutoQuestEnabled do
                -- Tìm và nhận nhiệm vụ
                -- Hoàn thành nhiệm vụ bằng cách tự động đi tới mục tiêu hoặc đánh quái
                wait(0.1)
            end
        end)
    end
end

-- Hàm bật/tắt Kill Aura
local function toggleKillAura(state)
    isKillAuraEnabled = state

    if isKillAuraEnabled then
        spawn(function()
            while isKillAuraEnabled do
                -- Tìm và tấn công tất cả kẻ thù trong phạm vi
                wait(0.1)
            end
        end)
    end
end

-- Hàm bật/tắt ESP
local function toggleESP(state)
    isESPEnabled = state

    if isESPEnabled then
        spawn(function()
            while isESPEnabled do
                -- Tính năng ESP, hiển thị các vật phẩm, quái, bạn bè, v.v.
                wait(0.1)
            end
        end)
    end
end

-- Hàm bật/tắt Speed Hack
local function toggleSpeedHack(state)
    isSpeedHackEnabled = state

    if isSpeedHackEnabled then
        spawn(function()
            while isSpeedHackEnabled do
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character then
                    character.Humanoid.WalkSpeed = 100 -- Thay đổi tốc độ di chuyển
                end
                wait(0.1)
            end
        end)
    else
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            character.Humanoid.WalkSpeed = 16 -- Tốc độ mặc định
        end
    end
end

-- Thêm các nút vào giao diện
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
SettingsTab:AddToggle({Name = "ESP", Default = false, Callback = toggleESP})

-- Lưu cài đặt
OrionLib:Init()
