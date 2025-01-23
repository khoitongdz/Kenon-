---[[[https://discord.gg/SFvsMJHXfc]]]---
local fxy = game.Players.LocalPlayer
local a4j8 = fxy.Character or fxy.CharacterAdded:Wait()
local qd = function() return true end
local g7s = function(t) return t * 2 end
local _x1 = Instance.new
local a98s = "Flyx|Blox Fruits"
local _3 = "Auto Farm"
local _4 = "Auto Stats"
local _5 = "ESP"
local _6 = "Teleport"
local _7 = "God Mode"
local _8 = "Kill Aura"
local _9 = "Auto Chest Farm"
local _10 = "Auto Raid"
local _11 = "Sea Beast Farm"

local o_gui = _x1("ScreenGui", game.CoreGui)
o_gui.Name = "UI_" .. math.random(1, 9999)

local f_frame = _x1("Frame", o_gui)
f_frame.Size = UDim2.new(0, 450, 0, 600)
f_frame.Position = UDim2.new(0.5, -225, 0.5, -300)
f_frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
f_frame.BorderSizePixel = 0

local u_grad = _x1("UIGradient", f_frame)
u_grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
}

local u_toggle = _x1("TextButton", o_gui)
u_toggle.Text = "☰"
u_toggle.Size = UDim2.new(0, 60, 0, 60)
u_toggle.Position = UDim2.new(0, 20, 0, 20)
u_toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
u_toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
local f_vis = true
u_toggle.MouseButton1Click:Connect(function()
    f_vis = not f_vis
    f_frame.Visible = f_vis
end)

local function m_button(name, p_idx, callback)
    local btn = _x1("TextButton", f_frame)
    btn.Text = name .. ": OFF"
    btn.Size = UDim2.new(0, 400, 0, 40)
    btn.Position = UDim2.new(0, 25, 0, 50 + (p_idx * 50))
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. (state and ": ON" or ": OFF")
        callback(state)
    end)
end

-- Features Setup
m_button(_3, 0, function(v)
    if v then
        while wait(1) do
            if not v then break end
            for _, npc in pairs(game.Workspace.Enemies:GetChildren()) do
                if npc:FindFirstChild("HumanoidRootPart") then
                    a4j8.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                    wait(0.5)
                    a4j8.Humanoid:MoveTo(npc.HumanoidRootPart.Position)
                end
            end
        end
    end
end)

m_button(_4, 1, function(v)
    if v then
        while wait(2) do
            if not v then break end
            local points = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}
            for _, stat in pairs(points) do
                game:GetService("ReplicatedStorage").Remotes["StatPoint"]:FireServer(stat, 1)
            end
        end
    end
end)

m_button(_5, 2, function(v)
    while v do
        wait(1)
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
                if not obj:FindFirstChild("ESP") then
                    local esp = _x1("BillboardGui", obj)
                    esp.Size = UDim2.new(1, 0, 1, 0)
                    esp.AlwaysOnTop = true
                    local label = _x1("TextLabel", esp)
                    label.Text = obj.Name
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.TextColor3 = Color3.new(1, 0, 0)
                end
            end
        end
    end
end)

m_button(_6, 3, function(v)
    if v then
        local islands = {
            ["Starter Island"] = Vector3.new(0, 100, 0),
            ["Pirate Village"] = Vector3.new(500, 100, 500)
        }
        for name, pos in pairs(islands) do
            print("Teleporting to " .. name)
            a4j8.HumanoidRootPart.CFrame = CFrame.new(pos)
            wait(3)
        end
    end
end)

m_button(_7, 4, function(v)
    if v then
        a4j8.Humanoid.MaxHealth = math.huge
        a4j8.Humanoid.Health = math.huge
    else
        a4j8.Humanoid.MaxHealth = 100
        a4j8.Humanoid.Health = 100
    end
end)

m_button(_8, 5, function(v)
    while v do
        wait(0.5)
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                local dist = (enemy.HumanoidRootPart.Position - a4j8.HumanoidRootPart.Position).Magnitude
                if dist <= 20 then
                    game:GetService("ReplicatedStorage").Remotes["Combat"]:FireServer(enemy)
                end
            end
        end
    end
end)

m_button(_9, 6, function(v)
    if v then
        while wait(1) do
            if not v then break end
            for _, chest in pairs(game.Workspace:GetChildren()) do
                if chest:IsA("Model") and chest.Name:lower():find("chest") then
                    a4j8.HumanoidRootPart.CFrame = chest.PrimaryPart.CFrame
                    wait(0.5)
                end
            end
        end
    end
end)

m_button(_10, 7, function(v)
    -- Auto Raid Logic Here
end)

m_button(_11, 8, function(v)
    -- Sea Beast Farm Logic Here
end)
