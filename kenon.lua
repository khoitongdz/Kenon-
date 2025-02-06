local webhookURL = "https://discord.com/api/webhooks/1336911910905315408/RcIx3pVog0jJqwUcfn2XpMqHWag6atynCjzCxp6fnyS2kBpjLfCTvayl-SOVIw6zSUEg"  -- Thay bằng URL Webhook của bạn
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")

-- Kiểm tra nếu HttpService khả dụng
if not HttpService then
    warn("[Kenon Hub] Lỗi: HttpService không khả dụng!")
    return
end

-- Hàm gửi Webhook
local function sendWebhook(message)
    local data = {
        content = message,
        username = "Kenon Hub Notification|Bloxfruit",
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
    local fullMoon = Lighting:FindFirstChild("FullMoonProgress") -- Kiểm tra biến ánh sáng mặt trăng
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

-- Lấy thông tin ping của server
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
    local ping = getPing()
    local serverId = getServerID()
    
    local serverMessage = "🔹 **Thông tin Server**\n👥 Số Người Chơi: **" .. playerCount .. "**\n🌙 Trạng thái Mặt Trăng: " .. fullMoonStatus .. "\n📡 Ping: " .. ping .. "\n🔗 Server ID: " .. serverId
    sendWebhook(serverMessage)  -- Gửi Webhook
end

-- Thông báo khi người chơi tham gia
Players.PlayerAdded:Connect(function(player)
    local joinMessage = "**" .. player.Name .. "** đã tham gia vào server!"
    sendWebhook(joinMessage)  -- Gửi Webhook
end)

-- Thông báo khi người chơi rời game
Players.PlayerRemoving:Connect(function(player)
    local leaveMessage = "**" .. player.Name .. "** đã rời khỏi server!"
    sendWebhook(leaveMessage)  -- Gửi Webhook
end)

-- Gửi thông tin về server mỗi 0 phút
while true do
    sendServerInfo()
    wait(10) 
end
