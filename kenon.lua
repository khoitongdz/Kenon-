local webhookURL = "https://discord.com/api/webhooks/1336911910905315408/RcIx3pVog0jJqwUcfn2XpMqHWag6atynCjzCxp6fnyS2kBpjLfCTvayl-SOVIw6zSUEg"  -- Thay thế với URL Webhook của bạn
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

-- Kiểm tra nếu HttpService có hoạt động
if not HttpService then
    warn("[Webhook] Lỗi: HttpService không khả dụng!")
    return
end

-- Hàm gửi Webhook
local function sendWebhook(message)
    if webhookURL == "https://discord.com/api/webhooks/1336911910905315408/RcIx3pVog0jJqwUcfn2XpMqHWag6atynCjzCxp6fnyS2kBpjLfCTvayl-SOVIw6zSUEg" then
        warn("[Webhook] Bạn chưa thay URL webhook!")
        return
    end

    local data = {
        content = message,
        username = "Kenon Hub Notification|Bloxfruit",
        avatar_url = "https://img3.thuthuatphanmem.vn/uploads/2019/06/13/anh-nen-anime-cho-may-tinh-dep_095239016.jpg"
    }

    -- Mã hóa dữ liệu thành JSON
    local jsonData
    local success, err = pcall(function()
        jsonData = HttpService:JSONEncode(data)
    end)

    if not success then
        warn("[Webhook] Lỗi JSONEncode: " .. tostring(err))
        return
    end

    -- Gửi webhook
    success, err = pcall(function()
        HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("[Webhook] ✅ Webhook gửi thành công!")
    else
        warn("[Webhook] ❌ Lỗi gửi webhook: " .. tostring(err))
    end
end

-- Lấy số lượng người chơi trong server
local function getPlayerCount()
    return #Players:GetPlayers()
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

-- Gửi thông tin server (Ping + Player Count)
local function sendServerInfo()
    local playerCount = getPlayerCount()
    local ping = getPing()
    local serverId = getServerID()
    local serverMessage = "🔹 **Thông tin Server**\n👥 Số Người Chơi: **" .. playerCount .. "**\n📡 Ping: " .. ping .. "\n🔗 Server ID: " .. serverId
    sendWebhook(serverMessage)
end

-- Thông báo khi người chơi tham gia
Players.PlayerAdded:Connect(function(player)
    local joinMessage = "**" .. player.Name .. "** đã tham gia vào server!"
    sendWebhook(joinMessage)
end)

-- Thông báo khi người chơi rời game
Players.PlayerRemoving:Connect(function(player)
    local leaveMessage = "**" .. player.Name .. "** đã rời khỏi server!"
    sendWebhook(leaveMessage)
end)

-- Gửi thông tin về server mỗi 5 phút
while true do
    sendServerInfo()
    wait(10)  -- Gửi mỗi 5 phút
end
