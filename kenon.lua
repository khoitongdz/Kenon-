-- Kenon Hub Discord Webhook Script

-- Thêm URL webhook Discord của bạn vào đây
local webhookURL = "https://discord.com/api/webhooks/1336566970463555675/bxljnPAj4PvekzWmVcz4CQ3wXocakH8FpfQMTjUL8ZEgfT9_xu6n0vr_RC3x7G3RwT3o"

-- Hàm gửi dữ liệu lên Discord
local function sendWebhook(message)
    local httpService = game:GetService("HttpService")
    local data = {
        content = message
    }
    local jsonData = httpService:JSONEncode(data)

    httpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
end

-- Lấy Server ID
local function getServerID()
    return game.JobId or "Không xác định"
end

-- Lấy ping của server
local function getPing()
    local stats = game:GetService("Stats")
    local network = stats:FindFirstChild("Network")
    if network then
        return math.floor(network.ServerStatsItem.DataPing:GetValue()) .. " ms"
    else
        return "Không xác định"
    end
end

-- Thông tin trái ác quỷ
local function checkFruits()
    for _, fruit in ipairs(game.Workspace:GetDescendants()) do
        if fruit:IsA("Tool") and fruit.Name:find("Fruit") then
            sendWebhook("📡 Ping: " .. getPing() .. " | 🍎 Trái ác quỷ: " .. fruit.Name .. "\n🔗 Server ID: " .. getServerID())
        end
    end
end

-- Thông tin các đảo trong server
local function listIslands()
    local islands = {}
    for _, island in ipairs(game.Workspace.Islands:GetChildren()) do
        table.insert(islands, island.Name)
    end
    sendWebhook("📡 Ping: " .. getPing() .. " | 🏝️ Các đảo: " .. table.concat(islands, ", ") .. "\n🔗 Server ID: " .. getServerID())
}

-- Thông tin tài khoản người dùng
local function userInfo()
    local player = game.Players.LocalPlayer
    local stats = player:FindFirstChild("leaderstats")
    if stats then
        local level = stats:FindFirstChild("Level") and stats.Level.Value or "Không rõ"
        local beli = stats:FindFirstChild("Beli") and stats.Beli.Value or "Không rõ"
        local fruit = player.Backpack:FindFirstChildWhichIsA("Tool") and player.Backpack:FindFirstChildWhichIsA("Tool").Name or "Không có trái"

        sendWebhook("📡 Ping: " .. getPing() .. " | 👤 Người dùng: " .. player.Name .. " | Cấp: " .. level .. " | Beli: " .. beli .. " | Trái: " .. fruit .. "\n🔗 Server ID: " .. getServerID())
    end
end

-- Tự động kiểm tra và gửi thông báo ngay cả khi người chơi thoát game
local function startMonitoring()
    while true do
        pcall(function()
            checkFruits()
            listIslands()
            userInfo()
        end)
        wait(300) -- Kiểm tra mỗi 5 phút
    end
end

-- Khởi động webhook và script chính
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
end)

startMonitoring()
