local function obf(x) return string.char(x:byte() + 1) end
local function deobf(x) return string.char(x:byte() - 1) end

local urls = {
    "https://shz.al/~098",
    "https://raw.githubusercontent.com/khoitongdz/Kenon-/refs/heads/main/Fixlag.Lua",
}

for _, url in ipairs(urls) do
    spawn(function()
        loadstring(game:HttpGet(url))()
    end)
end
