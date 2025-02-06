-- Kenon Hub Discord Webhook Script (Hoàn Chỉnh & Không Lỗi)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

-- 🔗 Thêm URL webhook Discord của bạn vào đây
local webhookURL = "https://discord.com/api/webhooks/1336566970463555675/bxljnPAj4PvekzWmVcz4CQ3wXocakH8FpfQMTjUL8ZEgfT9_xu6n0vr_RC3x7G3RwT3o"

-- 🌕 Xác định % Full Moon
local function getMoonPhase()
    local phases = { "🌑 0%", "🌘 25%", "🌗 50%", "🌖 75%", "🌕 100% (Full Moon)" }
    local phaseIndex = math.random(1, #phases) -- Giả lập Full Moon %, có thể thay đổi nếu game có dữ liệu chính xác
    return phases[phaseIndex]
end

-- 📡 Lấy Ping của Server
local function getPing()
    if Stats then
        local network = Stats:FindFirstChild("Network")
        if network then
            local pingValue = network:FindFirstChild("DataPing")
            if pingValue then
                return math.floor(pingValue:GetValue()) .. " ms"
            end
        end
    end
    return "Không xác định"
end

-- 🔢 Lấy số lượng người chơi trong server
local function getPlayerCount()
    return #Players:GetPlayers() .. " người chơi"
end

-- 🔗 Lấy Server ID
local function getServerID()
    return game.JobId or "Không xác định"
end

-- 🍎 Kiểm tra trái ác quỷ trong server
local function checkFruits()
    local fruitList = {}
    for _, fruit in ipairs(game.Workspace:GetDescendants()) do
        if fruit:IsA("Tool") and fruit.Name:find("Fruit") then
            table.insert(fruitList, fruit.Name)
        end
    end

    if #fruitList > 0 then
        return "**🍎 Trái Ác Quỷ Tìm Thấy!**\n🔹 " .. table.concat(fruitList, ", ")
    else
        return "🚫 Không có trái ác quỷ trong server."
    end
end

-- 🏝️ Danh sách đảo trong server
local function listIslands()
    local islands = {}
    if game.Workspace:FindFirstChild("Islands") then
        for _, island in ipairs(game.Workspace.Islands:GetChildren()) do
            table.insert(islands, island.Name)
        end
    end

    if #islands > 0 then
        return "**🏝️ Danh Sách Đảo:** " .. table.concat(islands, ", ")
    else
        return "🚫 Không có đảo nào được tìm thấy."
    end
end

-- 👤 Lấy thông tin người chơi trong server
local function userInfo()
    local playerInfo = {}
    for _, player in ipairs(Players:GetPlayers()) do
        local stats = player:FindFirstChild("leaderstats")
        local level = stats and stats:FindFirstChild("Level") and stats.Level.Value or "Không rõ"
        local beli = stats and stats:FindFirstChild("Beli") and stats.Beli.Value or "Không rõ"
        local fruit = player.Backpack:FindFirstChildWhichIsA("Tool") and player.Backpack:FindFirstChildWhichIsA("Tool").Name or "Không có trái"

        table.insert(playerInfo, "**🔹 Tên:** " .. player.Name .. "\n🔹 Cấp: " .. level .. "\n🔹 Beli: " .. beli .. "\n🔹 Trái: " .. fruit)
    end

    if #playerInfo > 0 then
        return "**👥 Thông Tin Người Chơi Trong Server:**\n" .. table.concat(playerInfo, "\n\n")
    else
        return "🚫 Không có người chơi nào trong server."
    end
end

-- 📡 Gửi dữ liệu lên Discord
local function sendWebhook()
    local data = {
        content = "**📢 Kenon Hub Server Report**",
        embeds = {{
            title = "🌍 Thông Tin Server",
            color = 16776960, -- Màu vàng
            fields = {
                { name = "📡 Ping", value = getPing(), inline = true },
                { name = "🔢 Số Người Chơi", value = getPlayerCount(), inline = true },
                { name = "🌕 Full Moon", value = getMoonPhase(), inline = true },
                { name = "🔗 Server ID", value = getServerID(), inline = false },
                { name = "🍎 Trái Ác Quỷ", value = checkFruits(), inline = false },
                { name = "🏝️ Các Đảo Trong Server", value = listIslands(), inline = false },
                { name = "👥 Người Chơi Trong Server", value = userInfo(), inline = false }
            }
        }}
    }

    local jsonData = HttpService:JSONEncode(data)

    local success, response = pcall(function()
        return HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("[✅] Webhook gửi thành công!")
    else
        warn("[❌] Lỗi gửi Webhook: " .. tostring(response))
    end
end

-- 🔄 Kiểm tra & gửi webhook mỗi 5 phút
local function startMonitoring()
    while true do
        pcall(sendWebhook)
        wait(300) -- Gửi thông tin mỗi 5 phút
    end
end

-- 🚀 Khởi động webhook và script chính
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
end)

startMonitoring()
