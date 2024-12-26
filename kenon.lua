--[[ 
    [This file was protected with MoonSec V3]
    Kenon Hub - All-in-One Script
    Version: 1.0
    Created for Roblox Games (Safe and Customizable)
]]

-- Configuration
getgenv().Team = "Marines" -- Choose "Marines" or "Pirates"
getgenv().AutoFarm = true -- Auto-farming enabled/disabled
getgenv().AutoStats = true -- Automatically distribute stats
getgenv().AutoQuest = true -- Auto-complete quests
getgenv().Teleport = true -- Enable teleportation
getgenv().OptimizePerformance = false -- Better performance, limited features
getgenv().SilentAim = true -- Aim assist for mobs/players
getgenv().SpeedBoost = true -- Enable/disable speed boost

-- Internal Variables
local scriptID = "kenonhub-allfeatures" -- Unique identifier for cache
local scriptURL = "https://raw.githubusercontent.com/khoitongdz/ui/refs/heads/main/.gitignore" -- Hosted script URL
local cacheFile = scriptID .. "-cache.lua"

-- Wait for game to load
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Auto-Farming Script (Extracted Features Only)
-- Below is the logic for auto-farming and related functions

local function autoFarm()
    while getgenv().AutoFarm do
        -- Example: Automatically attack mobs in a given range
        local mobs = game:GetService("Workspace"):GetChildren() -- Get all objects in Workspace
        for _, mob in pairs(mobs) do
            if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                -- Move towards the mob and attack
                -- Assuming the mob is an NPC or enemy with Humanoid
                local character = game.Players.LocalPlayer.Character
                if character and mob then
                    local targetPosition = mob.HumanoidRootPart.Position
                    character:MoveTo(targetPosition)
                    -- Attack action, you can customize based on game mechanics
                    -- Example: Fire a weapon or use a skill
                    if character:FindFirstChild("Humanoid") then
                        character.Humanoid:MoveTo(targetPosition)
                    end
                end
            end
        end
        wait(1) -- Delay between actions to prevent overload
    end
end

-- Utility Functions
local function logError(message)
    warn("[Kenon Hub Error]: " .. message)
    pcall(function()
        writefile(scriptID .. "-error-log.txt", message)
    end)
end

local function loadFromCache()
    local success, result = pcall(function()
        local fileContent = readfile(cacheFile)
        return loadstring(fileContent)
    end)
    if success and result then
        return result
    else
        logError("Failed to load from cache: " .. tostring(result))
        return nil
    end
end

local function downloadScript()
    local success, result = pcall(function()
        return game:HttpGet(scriptURL)
    end)
    if success and result then
        pcall(function()
            writefile(cacheFile, result)
        end)
        return loadstring(result)
    else
        logError("Failed to download script: " .. tostring(result))
        return nil
    end
end

-- Main Loader
local scriptFunction = loadFromCache() or downloadScript()
if scriptFunction then
    pcall(function()
        scriptFunction()
    end)
else
    warn("[Kenon Hub]: Unable to load the script. Check your configuration or script URL.")
end

-- Start Auto-Farming
if getgenv().AutoFarm then
    autoFarm() -- Execute Auto-Farm function
end
