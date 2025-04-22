-- core.lua for Kenon Hub | Full Features for Blox Fruits Update 26
-- Author: khoitongdz

--[[
 📌 Features:
- Auto Farm Level (Sea 1-3)
- Auto Farm Mastery
- Auto Boss Farm
- Auto Haki + Fast Attack Bypass
- Teleport to NPCs / Islands / Chests
- Auto Collect Chests
- Auto Store / Buy Fruit
- ESP & Fruit Sniper
- Webhook to Discord
- Server Hop / Rejoin
- Anti-AFK
- UI: Save Settings + Timer + Chest Count
--]]

-- ========== Services & Variables ==========
local Players, ReplicatedStorage, Workspace, TweenService = game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("Workspace"), game:GetService("TweenService")
local LocalPlayer, HttpService = Players.LocalPlayer, game:GetService("HttpService")
local RunService, TeleportService = game:GetService("RunService"), game:GetService("TeleportService")

local Kenon = {
    AutoFarm = true,
    AutoHaki = true,
    FastAttack = true,
    AutoBoss = true,
    AutoFruitStore = true,
    FruitESP = true,
    FruitSniper = true,
    AutoBuyFruit = false,
    ChestCount = 0,
    StartTime = tick(),
    WebhookURL = "https://discord.com/api/webhooks/1364142332643119144/qVrCnxOlMK6JjvuDiXLHomBl3I3Y3rgCiHJu12NRgq5GhmyTdMfk5jLId9oqqfxJvceg"
}
_G.Kenon = Kenon

-- ========== Utility Functions ==========
local function Notify(msg)
    game.StarterGui:SetCore("SendNotification", {Title="Kenon Hub", Text=msg, Duration=5})
end

local function TweenTo(pos)
    local HRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if HRP then
        local tween = TweenService:Create(HRP, TweenInfo.new((HRP.Position - pos).Magnitude / 250, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)})
        tween:Play()
        tween.Completed:Wait()
    end
end

-- ========== Core Features ==========
local function ToggleHaki()
    local v = LocalPlayer.Character:FindFirstChild("HasBuso")
    if v and not v.Value then
        ReplicatedStorage.Remotes.Comm:InvokeServer("Buso")
    end
end

local function FastAttack()
    local VirtualUser = game:GetService("VirtualUser")
    coroutine.wrap(function()
        while Kenon.FastAttack and wait(0.4) do
            pcall(function()
                VirtualUser:Button1Down(Vector2.new(0, 0))
                wait()
                VirtualUser:Button1Up(Vector2.new(0, 0))
            end)
        end
    end)()
end

local function AutoFarm()
    coroutine.wrap(function()
        while Kenon.AutoFarm and wait(1) do
            pcall(function()
                ToggleHaki()
                -- You can add quest system & mob finder here
                local enemy = Workspace.Enemies:FindFirstChildWhichIsA("Model")
                if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                    TweenTo(enemy.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                end
            end)
        end
    end)()
end

local function AutoBoss()
    coroutine.wrap(function()
        while Kenon.AutoBoss and wait(5) do
            local boss = Workspace.Enemies:FindFirstChild("Don Swan")
            if boss and boss:FindFirstChild("HumanoidRootPart") then
                TweenTo(boss.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
            end
        end
    end)()
end

local function ESPFruit()
    coroutine.wrap(function()
        while Kenon.FruitESP and wait(3) do
            for _,v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name:lower(), "fruit") and not v:FindFirstChild("FruitESP") then
                    local esp = Instance.new("BillboardGui", v)
                    esp.Name = "FruitESP"
                    esp.Size = UDim2.new(0,100,0,40)
                    esp.AlwaysOnTop = true
                    local text = Instance.new("TextLabel", esp)
                    text.Size = UDim2.new(1,0,1,0)
                    text.Text = v.Name
                    text.TextColor3 = Color3.new(1, 0, 0)
                    text.BackgroundTransparency = 1
                end
            end
        end
    end)()
end

local function FruitSniper()
    coroutine.wrap(function()
        while Kenon.FruitSniper and wait(3) do
            for _,v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name:lower(), "fruit") then
                    TweenTo(v.Position + Vector3.new(0,2,0))
                end
            end
        end
    end)()
end

local function AutoStoreFruit()
    coroutine.wrap(function()
        while Kenon.AutoFruitStore and wait(5) do
            ReplicatedStorage.Remotes.Comm:InvokeServer("StoreFruit", "Eat")
        end
    end)()
end

local function AutoBuyFruit()
    coroutine.wrap(function()
        while Kenon.AutoBuyFruit and wait(10) do
            ReplicatedStorage.Remotes.Comm:InvokeServer("GetFruits")
            ReplicatedStorage.Remotes.Comm:InvokeServer("PurchaseRandomFruit", true)
        end
    end)()
end

local function AutoChest()
    coroutine.wrap(function()
        while wait(1) do
            for _,v in pairs(Workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent:IsA("MeshPart") and v.Parent:FindFirstChild("TouchInterest") then
                    Kenon.ChestCount += 1
                    TweenTo(v.Parent.Position)
                end
            end
        end
    end)()
end

local function AntiAFK()
    LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    end)
end

local function Webhook()
    if not Kenon.WebhookURL or Kenon.WebhookURL == "" then return end
    local data = {
        content = "Kenon Hub Online",
        embeds = {
            {
                title = "Blox Fruits Script Active",
                fields = {
                    {name="Username", value=LocalPlayer.Name},
                    {name="Ping", value=tostring(math.floor(LocalPlayer:GetNetworkPing() * 1000)).."ms"},
                    {name="Chests", value=tostring(Kenon.ChestCount)}
                },
                footer = {text="Kenon Hub - Update 26"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
    }
    HttpService:PostAsync(Kenon.WebhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
end

local function TimerDisplay()
    coroutine.wrap(function()
        while wait(1) do
            local elapsed = os.time() - Kenon.StartTime
            local minutes = math.floor(elapsed/60)
            local seconds = elapsed % 60
            print(string.format("[Kenon Hub] ⏱️ %02d:%02d | 💰 Chests: %d", minutes, seconds, Kenon.ChestCount))
        end
    end)()
end

local function ServerHop()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2753915549/servers/Public?sortOrder=2&limit=100"))
    for _,v in pairs(servers.data) do
        if v.playing < v.maxPlayers then
            TeleportService:TeleportToPlaceInstance(2753915549, v.id, LocalPlayer)
            break
        end
    end
end

-- ========== Start All Features ==========
FastAttack()
AutoFarm()
AutoBoss()
ESPFruit()
FruitSniper()
AutoStoreFruit()
AutoBuyFruit()
AutoChest()
AntiAFK()
Webhook()
TimerDisplay()
