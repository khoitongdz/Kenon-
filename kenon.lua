local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Không Biết|Blox Fruits",
    LoadingTitle = "Đang tải UI...",
    LoadingSubtitle = "Vui lòng đợi...",
    ConfigurationSaving = {Enabled = true, FolderName = "BloxFruitsConfig"},
    Discord = {Enabled = false},
    KeySystem = false
})

-- **Tab Auto Farm**
local AutoFarmTab = Window:CreateTab("Auto Farm", 4483362458)
AutoFarmTab:CreateToggle({
    Name = "Tự động Farm",
    CurrentValue = false,
    Callback = function(state)
        getgenv().AutoFarm = state
        while getgenv().AutoFarm do
            -- Code Auto Farm
            wait()
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Farm Mastery",
    CurrentValue = false,
    Callback = function(state)
        getgenv().AutoMastery = state
        while getgenv().AutoMastery do
            -- Code farm mastery
            wait()
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Tự động săn Boss",
    CurrentValue = false,
    Callback = function(state)
        getgenv().AutoBoss = state
        while getgenv().AutoBoss do
            -- Code săn boss
            wait()
        end
    end
})

-- **Tab Auto Raid**
local AutoRaidTab = Window:CreateTab("Auto Raid", 4483362458)
AutoRaidTab:CreateDropdown({
    Name = "Chọn Raid",
    Options = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble"},
    CurrentOption = "Flame",
    Callback = function(option)
        getgenv().SelectedRaid = option
    end
})

AutoRaidTab:CreateButton({
    Name = "Bắt đầu Raid",
    Callback = function()
        -- Code bắt đầu Raid
    end
})

-- **Tab Teleport**
local TeleportTab = Window:CreateTab("Dịch Chuyển", 4483362458)
local Islands = {
    ["Port Town"] = CFrame.new(-290, 44, 5453),
    ["Hydra Island"] = CFrame.new(5228, 604, 345),
    ["Great Tree"] = CFrame.new(2281, 25, -6481),
    ["Floating Turtle"] = CFrame.new(-10200, 472, -880),
    ["Haunted Castle"] = CFrame.new(-9506, 142, 5530),
    ["Sea of Treats"] = CFrame.new(-2054, 200, -12308),
    ["Castle on the Sea"] = CFrame.new(-5074, 315, -3161),
    ["Tiki Outpost"] = CFrame.new(-16146, 21, -7548)
}

TeleportTab:CreateDropdown({
    Name = "Chọn Đảo",
    Options = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Castle on the Sea", "Tiki Outpost"},
    CurrentOption = "Castle on the Sea",
    Callback = function(selectedIsland)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Islands[selectedIsland]
    end
})

-- **Tab Hack Khác**
local MiscTab = Window:CreateTab("Khác", 4483362458)
MiscTab:CreateToggle({
    Name = "Bật Bất Tử",
    CurrentValue = false,
    Callback = function(state)
        game.Players.LocalPlayer.Character.Humanoid.Health = state and 999999 or 100
    end
})

MiscTab:CreateSlider({
    Name = "Tốc Độ Chạy",
    Range = {16, 200},
    Increment = 2,
    CurrentValue = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

MiscTab:CreateSlider({
    Name = "Độ Cao Nhảy",
    Range = {50, 500},
    Increment = 10,
    CurrentValue = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- **Tab ESP**
local ESPTab = Window:CreateTab("ESP", 4483362458)
ESPTab:CreateButton({
    Name = "Bật ESP Người Chơi",
    Callback = function()
        for _, v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer then
                local esp = Instance.new("BoxHandleAdornment", v.Character.Head)
                esp.Size = v.Character.Head.Size + Vector3.new(2, 2, 2)
                esp.Color3 = Color3.fromRGB(255, 0, 0)
                esp.Adornee = v.Character.Head
                esp.AlwaysOnTop = true
            end
        end
    end
})

ESPTab:CreateButton({
    Name = "Bật ESP Trái Ác Quỷ",
    Callback = function()
        -- Code ESP Trái Ác Quỷ
    end
})

-- **Tab Trái Ác Quỷ**
local FruitTab = Window:CreateTab("Trái Ác Quỷ", 4483362458)
FruitTab:CreateToggle({
    Name = "Nhặt Trái Ác Quỷ",
    CurrentValue = false,
    Callback = function(state)
        getgenv().AutoFruit = state
        while getgenv().AutoFruit do
            -- Code nhặt trái ác quỷ
            wait()
        end
    end
})

FruitTab:CreateToggle({
    Name = "Mua Trái Ác Quỷ Shop",
    CurrentValue = false,
    Callback = function(state)
        -- Code tự mua trái ác quỷ
    end
})

-- **Khởi động UI**
Rayfield:LoadConfiguration()
