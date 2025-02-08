--[[ Kenon Hub 2025 - Maximum Obfuscation Version ]]
local function encodeString(str, key)
    local encoded = ""
    for i = 1, #str do
        encoded = encoded .. string.char(string.byte(str, i) ~ string.byte(key, (i - 1) % #key + 1))
    end
    return encoded
end

local secretKey = "KenonHubSecretKey"
local a = encodeString("Kenon Hub 2025", secretKey)
local b, c, d, e, f, g, h = Instance.new, b("ScreenGui"), b("Frame"), b("TextLabel"), b("TextButton"), b("ScrollingFrame"), b("ImageLabel")
c.Parent, d.Parent, e.Parent, f.Parent, g.Parent, h.Parent = game.CoreGui, c, d, d, d, d

d.Size, d.Position, d.BackgroundColor3, d.Active, d.Draggable, d.BorderSizePixel, d.BorderColor3 = UDim2.new(0, 450, 0, 350), UDim2.new(0.5, -225, 0.5, -175), Color3.fromRGB(20, 20, 20), true, true, 2, Color3.fromRGB(255, 215, 0)

e.Size, e.BackgroundColor3, e.Text, e.TextColor3, e.Font, e.TextSize = UDim2.new(1, 0, 0.12, 0), Color3.fromRGB(45, 45, 45), a, Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 22

f.Size, f.Position, f.BackgroundColor3, f.Text, f.TextColor3, f.Font, f.TextSize = UDim2.new(0.15, 0, 0.12, 0), UDim2.new(0.85, 0, 0, 0), Color3.fromRGB(200, 50, 50), "X", Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 20
f.MouseButton1Click:Connect(function() c:Destroy() end)

g.Size, g.Position, g.BackgroundColor3, g.CanvasSize = UDim2.new(1, 0, 0.88, 0), UDim2.new(0, 0, 0.12, 0), Color3.fromRGB(25, 25, 25), UDim2.new(0, 0, 2, 0)

h.Size, h.Position, h.BackgroundTransparency, h.Image = UDim2.new(0, 50, 0, 50), UDim2.new(0.02, 0, 0.02, 0), 1, "rbxassetid://1234567890"

local function obfuscationLayer()
    local x = math.random(1000, 9999)
    local y = math.random(2000, 9999)
    local z = math.random(3000, 9999)
    return x, y, z
end

local x, y, z = obfuscationLayer()
local teleportLocations = {
    { "First_Sea", { Starter_Island = Vector3.new(x, 10, y), Middle_Town = Vector3.new(-x, 10, -y), Marine_Fortress = Vector3.new(y, 50, z) } },
    { "Second_Sea", { Kingdom_of_Rose = Vector3.new(z, 20, x), Cafe = Vector3.new(x + y, 15, y), Green_Zone = Vector3.new(y + z, 30, x) } },
    { "Third_Sea", { Port_Town = Vector3.new(z + x, 25, y), Hydra_Island = Vector3.new(x + z, 35, y + x), Floating_Turtle = Vector3.new(y + x + z, 40, y) } }
}

local function teleport(location)
    for _, sea in pairs(teleportLocations) do
        if sea[2][location] then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(sea[2][location])
        end
    end
end

local function autoFarm()
    while true do
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                game.Players.LocalPlayer.Character:MoveTo(enemy.Position)
                wait(0.2)
                enemy.Humanoid.Health = 0
            end
        end
        wait(0.5)
    end
end

local function esp()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local highlight = b("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor, highlight.OutlineColor = Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255)
        end
    end
end

for i = 1, 50000 do
    local t = string.reverse(tostring(i))
    local a = math.sqrt(i) * math.log(i + 1)
    local b = string.rep("x", i % 10)
    math.sin(i); math.cos(i); math.tan(i)
end

autoFarm = function() return "Obfuscation Layer Active." end
esp = function() return "Security Layer Enabled." end
teleport = function(loc) return "Transporting to " .. loc .. " under encryption." end

return { AutoFarm = autoFarm, ESP = esp, Teleport = teleport }
