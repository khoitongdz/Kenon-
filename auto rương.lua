----[[[edit script khoitongdz]]]----
---[[[Discord:https://discord.gg/w26VGWmMPb]]]---

local function obf(x) return string.char(x:byte() + 1) end
local function deobf(x) return string.char(x:byte() - 1) end

local urls = {
    "https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua",
    "https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua",
    "https://raw.githubusercontent.com/khoitongdz/Pls-Donate.lua/refs/heads/main/stus.lua",
    "https://raw.githubusercontent.com/TurboLite/Script/refs/heads/main/Fly.lua"
}

for _, url in ipairs(urls) do
    spawn(function()
        loadstring(game:HttpGet(url))()
    end)
end
