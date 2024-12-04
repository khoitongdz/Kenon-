-- Kenon Hub - No Key Version

-- Cài Đặt Toàn Cục (Không Key)
getgenv().Team = "Pirates" -- Đổi thành "Marines" nếu cần
getgenv().Hide_Menu = false -- Hiện/Ẩn Menu
getgenv().AutoFarm = true -- Tự động farm (true: bật, false: tắt)

-- Hàm Tải Script Đơn Giản
local function load_script(url)
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    if success and response then
        local load_success, err = pcall(function()
            loadstring(response)()
        end)
        if not load_success then
            warn("Lỗi khi chạy script từ: " .. url .. " | Lỗi: " .. err)
        end
    else
        warn("Không thể tải script từ: " .. url)
    end
end

-- Đổi Tên GUI Thành Kenon Hub
local function change_gui_title(new_title)
    local gui_found = false
    for _, child in pairs(game.CoreGui:GetChildren()) do
        if string.find(child.Name, "Hub") then
            child.Name = new_title -- Đổi tên GUI
            gui_found = true
        end
    end

    if not gui_found then
        warn("Không tìm thấy GUI để đổi tên.")
    end
end

-- Tải Tất Cả Script
local scripts = {
    "https://raw.githubusercontent.com/verudous/Xero-Hub/main/main.lua",
    "https://raw.githubusercontent.com/VitinDvne/XeroHub-v2-new/main/xero_main.lua",
    "https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"
}

-- Chạy Tất Cả Script và Đổi Tên GUI
for _, url in ipairs(scripts) do
    load_script(url)
end

change_gui_title("Kenon | Blox Fruits") -- Đổi tên thành Kenon Hub

print("Kenon Hub - No Key Version Đã Được Tải Thành Công!")
