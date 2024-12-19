-- Tải thư viện UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "𝕜𝕖𝕟𝕠𝕟 𝕙𝕦𝕓", HidePremium = false, SaveConfig = true, ConfigFolder = "𝕜𝕖𝕟𝕠𝕟 𝕙𝕦𝕓"})
-- Tải script từ URL và loại bỏ cơ chế kiểm tra key
local scriptContent = game:HttpGet("https://apixerohub.x10.mx/main.lua")

-- Loại bỏ cơ chế kiểm tra key (giả sử script có đoạn như này)
scriptContent = scriptContent:gsub("if userKey ~= requiredKey then.-end", "") -- Xóa đoạn kiểm tra key

-- Thực thi script đã chỉnh sửa
loadstring(scriptContent)()

-- Khởi động giao diện Orion
OrionLib:Init()
