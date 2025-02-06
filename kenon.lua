-- 🛠️ Kenon Hub Webhook Script 🛠️
local webhookURL = "https://discord.com/api/webhooks/1336566970463555675/bxljnPAj4PvekzWmVcz4CQ3wXocakH8FpfQMTjUL8ZEgfT9_xu6n0vr_RC3x7G3RwT3o"

-- 🏗️ Hàm gửi webhook bằng request() (không bị chặn)
local function sendWebhook(message)
    local data = {
        content = message,
        username = "Kenon Hub|blox fruit Notification"
    }

    local headers = {
        ["Content-Type"] = "application/json"
    }

    local body = game:GetService("HttpService"):JSONEncode(data)

    local success, response

    if syn and syn.request then
        success, response = pcall(function()
            return syn.request({
                Url = webhookURL,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end)
    elseif request then
        success, response = pcall(function()
            return request({
                Url = webhookURL,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end)
    elseif http and http.request then
        success, response = pcall(function()
            return http.request({
                Url = webhookURL,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end)
    else
        warn("[❌] Executor không hỗ trợ HTTP requests!")
        return
    end

    if success and response and response.StatusCode == 200 then
        print("[✅] Gửi Webhook Thành Công!")
    else
        warn("[❌] Lỗi gửi Webhook: ", response and response.StatusMessage or "Không xác định")
    end
end

-- 🆔 Lấy ID Server để join lại
local function getServerID()
    return game.JobId or "Không xác định"
end

-- 📡 Lấy Ping Server
local function getPing()
    local stats = game:GetService("Stats")
    local pingValue = stats and stats:FindFirstChild("Network") and stats.Network:FindFirstChild("DataPing")
    return pingValue and math.floor(pingValue:GetValue()) .. " ms" or "Không xác định"
end

-- 🌕 Kiểm tra Full Moon Progress
local function getFullMoonProgress()
    local moonPhase = math.random(1, 4) -- Giả lập dữ liệu (thay bằng cách lấy dữ liệu thật nếu có)
    local phases = { "🌑 25%", "🌓 50%", "🌔 75%", "🌕 100% (Full Moon)" }
    return phases[moonPhase]
end

-- 🌍 Lấy số lượng người trong server
local function getPlayerCount()
    return #game.Players:GetPlayers() .. " người chơi"
end

-- 🍎 Kiểm tra trái ác quỷ trong server
local function checkFruits()
    for _, fruit in ipairs(game.Workspace:GetDescendants()) do
        if fruit:IsA("Tool") and fruit.Name:find("Fruit") then
            sendWebhook("**🍎 Trái Ác Quỷ Tìm Thấy!**\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "\n👥 Người chơi: " .. getPlayerCount() .. "\n🌕 Trăng: " .. getFullMoonProgress() .. "\n**Trái:** " .. fruit.Name)
        end
    end
end

-- 🏝️ Lấy danh sách đảo
local function listIslands()
    local islands = {}
    if game.Workspace:FindFirstChild("Islands") then
        for _, island in ipairs(game.Workspace.Islands:GetChildren()) do
            table.insert(islands, island.Name)
        end
    end
    sendWebhook("**🏝️ Danh Sách Đảo:** " .. table.concat(islands, ", ") .. "\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "\n👥 Người chơi: " .. getPlayerCount() .. "\n🌕 Trăng: " .. getFullMoonProgress())
end

-- 👤 Lấy thông tin người chơi
local function userInfo()
    for _, player in ipairs(game.Players:GetPlayers()) do
        local stats = player:FindFirstChild("leaderstats")
        local level = stats and stats:FindFirstChild("Level") and stats.Level.Value or "Không rõ"
        local beli = stats and stats:FindFirstChild("Beli") and stats.Beli.Value or "Không rõ"
        local fruit = player.Backpack:FindFirstChildWhichIsA("Tool") and player.Backpack:FindFirstChildWhichIsA("Tool").Name or "Không có trái"

        sendWebhook("**👤 Thông Tin Người Chơi:**\n🔹 Tên: " .. player.Name .. "\n🔹 Cấp: " .. level .. "\n🔹 Beli: " .. beli .. "\n🔹 Trái: " .. fruit .. "\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "\n👥 Người chơi: " .. getPlayerCount() .. "\n🌕 Trăng: " .. getFullMoonProgress())
    end
end

-- 🔄 Tự động kiểm tra và gửi thông báo (kể cả khi người chơi rời game)
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

-- 🚀 Khởi động script loadstring chính
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
end)

-- 🔥 Chạy Webhook Monitor
startMonitoring()
