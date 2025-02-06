-- Kenon Hub Webhook - Hoàn chỉnh 100%

local webhookURL = "https://discord.com/api/webhooks/1336911910905315408/RcIx3pVog0jJqwUcfn2XpMqHWag6atynCjzCxp6fnyS2kBpjLfCTvayl-SOVIw6zSUEg" -- Thay bằng webhook Discord của bạn
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

-- Kiểm tra nếu HttpService bị chặn và thử gửi webhook
local function sendWebhook(message)
    if webhookURL == "https://discord.com/api/webhooks/1336911910905315408/RcIx3pVog0jJqwUcfn2XpMqHWag6atynCjzCxp6fnyS2kBpjLfCTvayl-SOVIw6zSUEg" then
        warn("[Kenon Hub] Bạn chưa thay URL webhook! Hãy nhập webhook đúng.")
        return
    end

    local data = {
        content = message,
        username = "Kenon Hub Notification",
        avatar_url = "https://img3.thuthuatphanmem.vn/uploads/2019/06/13/anh-nen-anime-cho-may-tinh-dep_095239016.jpg"
    }

    local jsonData
    local success, err = pcall(function()
        jsonData = HttpService:JSONEncode(data)
    end)

    if not success then
        warn("[Kenon Hub] Lỗi JSONEncode: " .. tostring(err))
        return
    end

    -- Thử gửi webhook nếu không có lỗi
    success, err = pcall(function()
        HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("[Kenon Hub] ✅ Webhook gửi thành công!")
    else
        warn("[Kenon Hub] ❌ Lỗi gửi webhook: " .. tostring(err))
    end
end

-- Lấy số lượng người chơi trong server
local function getPlayerCount()
    return #Players:GetPlayers()
end

-- Lấy trạng thái Full Moon (%)
local function getFullMoonStatus()
    local fullMoon = game.Lighting:FindFirstChild("FullMoonProgress")
    if fullMoon then
        local progress = fullMoon.Value
        if progress >= 1 then
            return "🌕 **100% - Full Moon!**"
        elseif progress >= 0.75 then
            return "🌔 **75% - Gần Full Moon**"
        elseif progress >= 0.5 then
            return "🌓 **50% - Trăng Nửa**"
        elseif progress >= 0.25 then
            return "🌒 **25% - Trăng Non**"
        else
            return "🌑 **0% - Không có trăng**"
        end
    end
    return "❓ Không xác định"
end

-- Lấy Ping của server
local function getPing()
    local network = Stats:FindFirstChild("Network")
    if network and network:FindFirstChild("ServerStatsItem") then
        local pingValue = network.ServerStatsItem:FindFirstChild("DataPing")
        if pingValue and pingValue:GetValue() then
            return math.floor(pingValue:GetValue()) .. " ms"
        end
    end
    return "Không xác định"
end

-- Lấy Server ID
local function getServerID()
    return game.JobId or "Không xác định"
end

-- Gửi thông tin server (Ping + Player Count + Full Moon)
local function sendServerInfo()
    local playerCount = getPlayerCount()
    local fullMoonStatus = getFullMoonStatus()
    sendWebhook("🔹 **Thông tin Server**\n👥 Số Người Chơi: **" .. playerCount .. "**\n🌙 Trạng thái Mặt Trăng: " .. fullMoonStatus .. "\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "\n💾 Script join server: ```lua\ngame:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, '" .. getServerID() .. "', game.Players.LocalPlayer)```")
end

-- Thông tin trái ác quỷ trong server
local function checkFruits()
    for _, fruit in ipairs(game.Workspace:GetDescendants()) do
        if fruit:IsA("Tool") and fruit.Name:find("Fruit") then
            sendWebhook("**🍎 Trái Ác Quỷ Tìm Thấy!**\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "\n**Trái:** " .. fruit.Name .. "")
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
    sendWebhook("**🏝️ Danh Sách Đảo:** " .. table.concat(islands, ", ") .. "\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "")
end

-- Thông tin tài khoản người chơi
local function userInfo()
    for _, player in ipairs(Players:GetPlayers()) do
        if player and player.Parent then
            local stats = player:FindFirstChild("leaderstats")
            local level = stats and stats:FindFirstChild("Level") and stats.Level.Value or "Không rõ"
            local beli = stats and stats:FindFirstChild("Beli") and stats.Beli.Value or "Không rõ"
            local fruit = player.Backpack:FindFirstChildWhichIsA("Tool") and player.Backpack:FindFirstChildWhichIsA("Tool").Name or "Không có trái"

            sendWebhook("**👤 Thông Tin Người Dùng:**\n🔹 Tên: **" .. player.Name .. "**\n🔹 Cấp: **" .. level .. "**\n🔹 Beli: **" .. beli .. "**\n🔹 Trái: **" .. fruit .. "**\n📡 Ping: " .. getPing() .. "\n🔗 Server ID: " .. getServerID() .. "")
        end
    end
end

-- Tự động kiểm tra và gửi thông báo mỗi 5 giây
local function startMonitoring()
    while true do
        pcall(function()
            sendServerInfo()
            checkFruits()
            listIslands()
            userInfo()
        end)
        wait(5) -- Kiểm tra mỗi 5 giây
    end
end

-- Khởi động script và webhook
pcall(function()
    -- Kiểm tra tính tương thích với các executor
    if not is_scripter_running then
        warn("[Kenon Hub] Cần phải sử dụng một executor có hỗ trợ HttpService.")
        return
    end
    startMonitoring()
end)
