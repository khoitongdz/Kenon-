-- Load the UI library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Kenon hub", HidePremium = false, SaveConfig = true, ConfigFolder = "Kenon hub loading..."})

-- Fetch the script from the URL and remove the key-checking mechanism
local scriptContent = game:HttpGet("https://apixerohub.x10.mx/main.lua")

-- Remove the key-checking mechanism (assumes it follows a specific structure)
scriptContent = scriptContent:gsub("if userKey ~= requiredKey then.-end", "") -- Removes the key-check logic

-- Execute the modified script
local success, errorMsg = pcall(function()
    loadstring(scriptContent)()
end)

if not success then
    warn("Error executing script: " .. errorMsg)
end

-- Initialize the Orion interface
OrionLib:Init()
