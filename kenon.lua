local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "Không Biết - Blox Fruits", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "BloxFruitsConfig"
})

-- **Tab Auto Farm**
local AutoFarmTab = Window:MakeTab({Name = "🌾 Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
AutoFarmTab:AddToggle({
    Name = "Tự động Farm",
    Default = false,
    Callback = function(state)
        getgenv().AutoFarm = state
        while getgenv().AutoFarm do
            -- Code Auto Farm
            wait()
        end
    end
})

AutoFarmTab:AddButton({
    Name = "Tăng Tốc Đánh",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
})

-- **Tab Auto Raid**
local AutoRaidTab = Window:MakeTab({Name = "🔥 Auto Raid", Icon = "rbxassetid://4483345998", PremiumOnly = false})
AutoRaidTab:AddDropdown({
    Name = "Chọn Raid",
    Default = "Flame",
    Options = {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble"},
    Callback = function(option)
        getgenv().SelectedRaid = option
    end
})

AutoRaidTab:AddButton({
    Name = "Bắt đầu Raid",
    Callback = function()
        -- Code bắt đầu Raid
    end
})

-- **Tab Dịch Chuyển**
local TeleportTab = Window:MakeTab({Name = "🚀 Dịch Chuyển (Sea 3)", Icon = "rbxassetid://4483345998", PremiumOnly = false})
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

TeleportTab:AddDropdown({
    Name = "Chọn Đảo",
    Default = "Castle on the Sea",
    Options = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Castle on the Sea", "Tiki Outpost"},
    Callback = function(selectedIsland)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Islands[selectedIsland]
    end
})

-- **Tab Hack Khác**
local MiscTab = Window:MakeTab({Name = "⚡ Khác", Icon = "rbxassetid://4483345998", PremiumOnly = false})
MiscTab:AddButton({
    Name = "Bật Bất Tử",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 999999
    end
})

MiscTab:AddSlider({
    Name = "Tốc Độ Chạy",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

MiscTab:AddSlider({
    Name = "Độ Cao Nhảy",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- **Tab ESP**
local ESPTab = Window:MakeTab({Name = "👀 ESP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
ESPTab:AddButton({
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

-- **Tab Trái Ác Quỷ**
local FruitTab = Window:MakeTab({Name = "🍎 Trái Ác Quỷ", Icon = "rbxassetid://4483345998", PremiumOnly = false})
FruitTab:AddToggle({
    Name = "Nhặt Trái Ác Quỷ",
    Default = false,
    Callback = function(state)
        getgenv().AutoFruit = state
        while getgenv().AutoFruit do
            -- Code nhặt trái ác quỷ
            wait()
        end
    end
})

FruitTab:AddToggle({
    Name = "Mua Trái Ác Quỷ Shop",
    Default = false,
    Callback = function(state)
        -- Code tự mua trái ác quỷ
    end
})

-- **Khởi động UI**
OrionLib:Init()
