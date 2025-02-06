-- Kenon Hub - Webhook Full Moon Notification

local Players = game:GetService("Players")
local webhookURL = "https://discord.com/api/webhooks/1336566970463555675/bxljnPAj4PvekzWmVcz4CQ3wXocakH8FpfQMTjUL8ZEgfT9_xu6n0vr_RC3x7G3RwT3o"
local imageURL = "https://images-ext-1.discordapp.net/external/z9JRUK34QF4Ne_XqfgyqUfSMSDu1ZAINWYBi-beigCM/https/cdn.nekotina.com/images/smPf01ez6.jpg?format=webp&width=244&height=415"

-- Hàm gửi thông báo lên webhook
local function sendWebhook(message)
    local data = {
        content = message,
        username = "Kenon Hub - Full Moon",
        embeds = {
            {
                title = "🌙 Full Moon Update!",
                description = message,
                color = 16776960, -- Màu vàng
                image = { url = imageURL }
            }
        }
    }
    local jsonData = game:GetService("HttpService"):JSONEncode(data)

    local requestFunction = syn and syn.request or http_request or request
    if requestFunction then
        local success, response = pcall(function()
            return requestFunction {
                Url = webhookURL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = jsonData
            }
        end)

        if not success then
            warn("[Kenon Hub] Lỗi gửi webhook: " .. tostring(response))
        end
    else
        warn("[Kenon Hub] Executor không hỗ trợ HTTP Requests!")
    end
end

-- Lấy ID server
local function getServerID()
    return game.JobId or "Không xác định"
end

-- Lấy số người chơi trong server
local function getPlayerCount()
    return #Players:GetPlayers()
end

-- Lấy ping của server
local function getPing()
    local stats = game:GetService("Stats")
    local network = stats and stats:FindFirstChild("Network")
    local pingValue = network and network:FindFirstChild("ServerStatsItem")
    return pingValue and math.floor(pingValue:GetValue()) .. " ms" or "Không xác định"
end

-- Kiểm tra Full Moon
local function getFullMoonStatus()
    local moonPercent = math.random(1, 5) * 25  -- Giả lập Full Moon (Cần chỉnh sửa nếu có API thật)
    local status = "🌙 Full Moon: " .. moonPercent .. "%"
    if moonPercent == 100 then status = "🌕 FULL MOON!" end
    return status
end

-- Gửi thông báo lên Discord
local function notifyFullMoon()
    local fullMoonStatus = getFullMoonStatus()
    local playerCount = getPlayerCount()
    local ping = getPing()
    local serverID = getServerID()
    
    local message = fullMoonStatus .. "\n" ..
                    "👥 Người chơi: " .. playerCount .. "\n" ..
                    "📡 Ping: " .. ping .. "\n" ..
                    "🔗 Server ID: " .. serverID .. "\n" ..
                    "📜 Script join server: `game:GetService(\"TeleportService\"):TeleportToPlaceInstance(game.PlaceId, '" .. serverID .. "', game.Players.LocalPlayer)`"
    
    sendWebhook(message)
end

-- Tự động kiểm tra Full Moon mỗi 10 giây
while true do
    notifyFullMoon()
    wait(1) -- 10 giây
end
