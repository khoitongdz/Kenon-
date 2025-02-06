-- ✅ Webhook Discord của bạn
local webhookURL = "https://discord.com/api/webhooks/1336911910905315408/RcIx3pVog0jJqwUcfn2XpMqHWag6atynCjzCxp6fnyS2kBpjLfCTvayl-SOVIw6zSUEg"

-- ✅ Proxy cho executor KHÔNG hỗ trợ HTTP Requests (dùng nếu cần)
local proxyURL = "https://webhook.lewisakura.moe/api/webhooks"

-- ✅ Kiểm tra Executor có hỗ trợ HTTP Requests không
local http = game:GetService("HttpService")
local supportsHttp = false

local success, _ = pcall(function()
    http:PostAsync("https://httpbin.org/post", "{}")
end)

if success then
    supportsHttp = true
end

-- ✅ Hàm gửi dữ liệu lên Discord
function sendToDiscord(title, description, color)
    local data = {
        ["embeds"] = {{
            ["title"] = title,
            ["description"] = description,
            ["color"] = color
        }}
    }

    local jsonData = http:JSONEncode(data)
    
    if supportsHttp then
        -- Nếu Executor hỗ trợ HTTP Requests, gửi trực tiếp
        http:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
    else
        -- Nếu Executor KHÔNG hỗ trợ HTTP Requests, gửi qua Proxy
        local proxyData = {
            ["url"] = webhookURL,
            ["embeds"] = data.embeds
        }
        http:PostAsync(proxyURL, http:JSONEncode(proxyData), Enum.HttpContentType.ApplicationJson)
    end
end

-- ✅ Kiểm tra trạng thái mặt trăng
local function checkFullMoon()
    local moonStatus = game:GetService("Lighting"):FindFirstChild("MoonStatus")
    return moonStatus and moonStatus.Value == "FullMoon"
end

-- ✅ Lấy thời gian trong game
local function getTimeOfDay()
    local lighting = game:GetService("Lighting")
    return lighting and lighting.TimeOfDay or "Unknown"
end

-- ✅ Lấy số lượng người chơi trong server
local function getPlayerCount()
    return #game.Players:GetPlayers()
end

-- ✅ Gửi thông báo khi có Trăng Tròn
local function sendMoonNotification()
    if checkFullMoon() then
        sendToDiscord(
            "🌕 Full Moon Detected!",
            "**Moon Status:** Full Moon\n" ..
            "**Player Count:** " .. getPlayerCount() .. "\n" ..
            "**Time Of Day:** " .. getTimeOfDay(),
            16776960 -- Màu vàng
        )
    end
end

-- 🔄 Kiểm tra và gửi thông báo mỗi 1 giây
while wait(1) do
    sendMoonNotification()
end

-- 🚀 Chạy script Auto Farm mà bạn yêu cầu
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
