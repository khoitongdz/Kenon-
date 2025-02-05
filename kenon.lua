-- Kenon Hub Discord Webhook Script (Đã sửa lỗi MISSING PLAYER)

-- Thêm URL webhook Discord của bạn vào đây
local webhookURL = "https://discord.com/api/webhooks/1336566970463555675/bxljnPAj4PvekzWmVcz4CQ3wXocakH8FpfQMTjUL8ZEgfT9_xu6n0vr_RC3x7G3RwT3o"

-- Hàm gửi dữ liệu lên Discord
local function sendWebhook(message)
    local httpService = game:GetService("HttpService")
    if not httpService then return end -- Kiểm tra HttpService

    local data = {
        content = message
    }
    local jsonData = httpService:JSONEncode(data)

    pcall(function()
        httpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
    end)
end

-- Lấy Server ID
local function getServerID()
    return game.JobId or "Không xác định"
end

-- Lấy ping của server
local function getPing()
    local stats = game:GetService("Stats")
    if not stats then return "Không xác định" end

    local network = stats:FindFirstChild("Network")
    if network and network:FindFirstChild("ServerStatsItem") then
        local pingValue = network.ServerStatsItem:FindFirstChild("DataPing")
        if pingValue and pingValue:GetValue() then
            return math.floor(pingValue:GetValue()) .. " ms"
        end
    end
    return "Không xác định"
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
    if game.Workspace:FindFirstChild("Islands") then
        for _, island in ipairs(game.Workspace.Islands:GetChildren()) do
            if island and island.Name then -- Kiểm tra đảo tồn tại
                table.insert(islands, island.Name)
            end
        end
    end
    sendWebhook("📡 Ping: " .. getPing() .. " | 🏝️ Các đảo: " .. table.concat(islands, ", ") .. "\n🔗 Server ID: " .. getServerID())
end

-- Thông tin tài khoản người dùng
local function userInfo()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player and player.Parent then -- Kiểm tra player tồn tại
            local stats = player:FindFirstChild("leaderstats")
            local level = stats and stats:FindFirstChild("Level") and stats.Level.Value or "Không rõ"
            local beli = stats and stats:FindFirstChild("Beli") and stats.Beli.Value or "Không rõ"
            local fruit = player.Backpack:FindFirstChildWhichIsA("Tool") and player.Backpack:FindFirstChildWhichIsA("Tool").Name or "Không có trái"

            sendWebhook("📡 Ping: " .. getPing() .. " | 👤 Người dùng: " .. player.Name .. " | Cấp: " .. level .. " | Beli: " .. beli .. " | Trái: " .. fruit .. "\n🔗 Server ID: " .. getServerID())
        end
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
