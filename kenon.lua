-- Tải thư viện UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Kenon Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "KenonHub"})

-- Tạo một cửa sổ nhập key
local KeyInputTab = Window:MakeTab({
    Name = "Enter Key", 
    Icon = "rbxassetid://4483345998", 
    PremiumOnly = false
})

-- Tạo một textbox cho việc nhập key
KeyInputTab:AddTextbox({
    Name = "Enter Key", 
    Default = "", 
    TextDisappear = true,
    Callback = function(value)
        local userKey = value
        local key = "khoitongdz"  -- Key hợp lệ đã được thay đổi

        if userKey == key then
            -- Key chính xác, script sẽ tiếp tục hoạt động
            print("Key is correct! Script initialized.")
            
            -- Tải toàn bộ tính năng từ link bạn cung cấp
            local Script = loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua"))()

            -- Các hàm và chức năng khác của bạn sẽ tiếp tục ở đây, như:
            -- Các chức năng trong script gốc mà bạn muốn giữ lại.

        else
            -- Key sai, kick người chơi ra khỏi game
            game.Players.LocalPlayer:Kick("địt mẹ mày")
        end
    end
})

-- Khởi động giao diện Orion
OrionLib:Init()
