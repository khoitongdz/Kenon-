
local HttpService = game:GetService("HttpService")
local GIST_URL = "https://raw.githubusercontent.com/khoitongdz/Kenon-/refs/heads/main/wehook"

-- Hàm kiểm tra Trăng Tròn
local function isFullMoon()
    local moon = game:GetService("Lighting"):FindFirstChild("MoonStatus")
    return moon and moon.Value == "FullMoon"
end

-- Hàm lấy số lượng người chơi
local function getPlayerCount()
    return #game.Players:GetPlayers()
end

-- Hàm cập nhật trạng thái lên GitHub Gist
local function updateGist()
    local data = {
        moon = isFullMoon() and "FullMoon" or "NewMoon",
        players = getPlayerCount()
    }
    local jsonData = HttpService:JSONEncode(data)
    
    -- Cập nhật Gist bằng `HttpPost()`
    HttpService:PostAsync(GIST_URL, jsonData, Enum.HttpContentType.ApplicationJson)
end

-- Chạy cập nhật mỗi 30 giây
while wait(30) do
    updateGist()
end

