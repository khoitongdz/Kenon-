repeat wait() until game:IsLoaded()
loadstring(game:HttpGet('https://sirius.menu/sirius'))() 
repeat wait() until game:IsLoaded()

-- Kiểm tra executor
local executor = identifyexecutor and identifyexecutor() or "Unknown"
print("Bạn đang dùng executor:", executor)

-- Chống AFK
local vu = game:GetService("VirtualUser")
local plr = game.Players.LocalPlayer
plr.Idled:Connect(function() 
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) 
    wait(1) 
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) 
end)

-- Tự động trang bị vũ khí
function EquipWeapon(ToolName)
    local tool = plr.Backpack:FindFirstChild(ToolName)
    if tool then
        plr.Character.Humanoid:EquipTool(tool)
    end
end

-- **ESP Chỉ Kẻ Địch, Trái Ác Quỷ, Rương**
local function CreateESP(object, color)
    if object:FindFirstChild("ESP") then return end
    local esp = Instance.new("Highlight", object)
    esp.Name = "ESP"
    esp.FillColor = color
    esp.FillTransparency = 0.5
    esp.OutlineColor = Color3.new(1, 1, 1)
    esp.OutlineTransparency = 0.1
end

function UpdateESP()
    -- ESP Kẻ Địch
    for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("HumanoidRootPart") then
            CreateESP(enemy, Color3.fromRGB(255, 0, 0)) -- Màu đỏ cho kẻ địch
        end
    end
    -- ESP Trái Ác Quỷ
    for _, fruit in pairs(game.Workspace:GetChildren()) do
        if string.find(fruit.Name, "Fruit") then
            CreateESP(fruit, Color3.fromRGB(255, 255, 0)) -- Màu vàng cho trái ác quỷ
        end
    end
    -- ESP Rương
    for _, chest in pairs(game.Workspace:GetChildren()) do
        if string.find(chest.Name, "Chest") then
            CreateESP(chest, Color3.fromRGB(0, 255, 0)) -- Màu xanh cho rương
        end
    end
end
spawn(function()
    while wait(2) do
        UpdateESP()
    end
end)

-- Danh sách nhiệm vụ Sea 1 & Sea 2
local QuestData = {
    -- Sea 1
    {Level = 1, Quest = "BanditQuest1", NPC = "Bandit Quest Giver", Enemy = "Bandit"},
    {Level = 10, Quest = "JungleQuest1", NPC = "Jungle Quest Giver", Enemy = "Monkey"},
    {Level = 15, Quest = "JungleQuest2", NPC = "Jungle Quest Giver", Enemy = "Gorilla"},
    {Level = 30, Quest = "BuggyQuest1", NPC = "Pirate Quest Giver", Enemy = "Pirate"},
    {Level = 40, Quest = "BuggyQuest2", NPC = "Pirate Quest Giver", Enemy = "Brute"},
    {Level = 60, Quest = "DesertQuest1", NPC = "Desert Adventurer", Enemy = "Desert Bandit"},
    {Level = 75, Quest = "DesertQuest2", NPC = "Desert Adventurer", Enemy = "Desert Officer"},
    {Level = 90, Quest = "SnowQuest1", NPC = "Frozen Adventurer", Enemy = "Snow Bandit"},
    {Level = 100, Quest = "SnowQuest2", NPC = "Frozen Adventurer", Enemy = "Snowman"},
    {Level = 120, Quest = "YetiQuest", NPC = "Frozen Adventurer", Enemy = "Yeti"},
     {Level = 150, Quest = "SkyQuest1", NPC = "Sky Adventurer", Enemy = "Sky Bandit"},
    {Level = 175, Quest = "SkyQuest2", NPC = "Sky Adventurer", Enemy = "Dark Master"},
    {Level = 190, Quest = "PrisonerQuest1", NPC = "Prison Master", Enemy = "Dangerous Prisoner"},
    {Level = 250, Quest = "MagmaQuest1", NPC = "Magma Adventurer", Enemy = "Magma Admiral"},
    {Level = 300, Quest = "UnderwaterQuest1", NPC = "Fishman Warrior", Enemy = "Fishman"},
    {Level = 375, Quest = "UnderwaterQuest2", NPC = "Fishman Warrior", Enemy = "Fishman Commando"},
    {Level = 450, Quest = "SkyExpQuest1", NPC = "Sky Adventurer", Enemy = "God's Guard"},
    {Level = 525, Quest = "SkyExpQuest2", NPC = "Sky Adventurer", Enemy = "Shanda"},
    {Level = 600, Quest = "ColosseumQuest1", NPC = "Colosseum Quest Giver", Enemy = "Toga Warrior"},
    {Level = 675, Quest = "ColosseumQuest2", NPC = "Colosseum Quest Giver", Enemy = "Gladiator"}
    -- Sea 2
    {Level = 700, Quest = "FountainQuest", NPC = "Water Kung Fu Master", Enemy = "Galley Pirate"},
    {Level = 775, Quest = "PrisonQuest", NPC = "Prison Master", Enemy = "Dangerous Prisoner"},
    {Level = 850, Quest = "ColosseumQuest", NPC = "Colosseum Quest Giver", Enemy = "Toga Warrior"},
    {Level = 925, Quest = "MagmaQuest", NPC = "Magma Adventurer", Enemy = "Magma Ninja"},
    {Level = 1000, Quest = "FishmanQuest", NPC = "Fishman Warrior", Enemy = "Fishman"},
    {Level = 1075, Quest = "SkyQuest", NPC = "Sky Adventurer", Enemy = "God's Guard"},
    {Level = 1150, Quest = "SkyExpQuest", NPC = "Sky Adventurer", Enemy = "Shanda"},
    {Level = 1250, Quest = "DarkQuest", NPC = "Dark Master", Enemy = "Dark Beast"},
    {Level = 1350, Quest = "LabQuest", NPC = "Lab Scientist", Enemy = "Marine Lieutenant"},
    {Level = 1400, Quest = "GhostQuest", NPC = "Ghost Hunter", Enemy = "Ghost"},
    {Level = 1500, Quest = "HauntedQuest", NPC = "Haunted Master", Enemy = "Reaper"},
}
function GetQuest()
    local myLevel = plr.Data.Level.Value
    for i = #QuestData, 1, -1 do
        if myLevel >= QuestData[i].Level then
            return QuestData[i]
        end
    end
    return nil
end

function StartAutoFarm()
    while wait(1) do
        local quest = GetQuest()
        if quest then
            -- Nhận nhiệm vụ
            local npc = game.Workspace.NPCs:FindFirstChild(quest.NPC)
            if npc then
                plr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                wait(2)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", quest.Quest, quest.Level)
                wait(1)
            end
            
            -- Đánh quái
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy.Name == quest.Enemy and enemy:FindFirstChild("HumanoidRootPart") then
                    plr.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                    EquipWeapon("Combat")
                    repeat wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Hit", enemy)
                    until enemy.Humanoid.Health <= 0 or not enemy.Parent
                end
            end
        end
    end
end

StartAutoFarm()
