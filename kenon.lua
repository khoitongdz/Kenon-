-- Tải thư viện UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "𝕜𝕖𝕟𝕠𝕟 𝕙𝕦𝕓", HidePremium = false, SaveConfig = true, ConfigFolder = "𝕜𝕖𝕟𝕠𝕟 𝕙𝕦𝕓"})

-- Tải toàn bộ tính năng từ link bạn cung cấp
local bananaScript = loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()

-- Khởi động giao diện Orion
OrionLib:Init()
