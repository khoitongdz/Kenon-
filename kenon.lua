-- Super Obfuscated Flyx Hub Script (Ultra Complex Version)
-- Developed by khoitongdz

local _A = Instance.new("ScreenGui")
local _B = Instance.new("Frame")
local _C = Instance.new("TextLabel")
local _D = Instance.new("Frame")
local _E = Instance.new("ScrollingFrame")
local _F = Instance.new("UIListLayout")

-- Executor Detection
local __X__ = identifyexecutor and identifyexecutor() or "???"
print("Running on: " .. tostring(__X__))

-- Fake Environment Check
if not game or not game:IsLoaded() then while true do end end

-- Random Fake Variables
local _RND = math.random(1000, 9999)
local _JUNK = "Obfuscate" .. tostring(_RND)
local _FAKE_TABLE = { ["x"] = _RND, ["y"] = _RND * 2, ["z"] = "FakeData" }

-- UI Setup
_A.Name = "FxH"
_A.Parent = game:GetService("CoreGui")

_B.Name = "M_"
_B.Parent = _A
_B.BackgroundColor3 = Color3.fromRGB(10 + _RND % 20, 20, 30)
_B.Position = UDim2.new(0.3, 0, 0.2, 0)
_B.Size = UDim2.new(0, 400, 0, 500)
_B.Active = true
_B.Draggable = true

_C.Name = "T_"
_C.Parent = _B
_C.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
_C.Size = UDim2.new(1, 0, 0, 30)
_C.Text = "FLYX HUB " .. _RND
_C.TextColor3 = Color3.fromRGB(255, 255, 255)
_C.TextSize = 20

_D.Name = "TBS"
_D.Parent = _B
_D.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_D.Position = UDim2.new(0, 0, 0, 30)
_D.Size = UDim2.new(0, 100, 1, -30)

_E.Name = "SCROLL"
_E.Parent = _B
_E.Position = UDim2.new(0, 100, 0, 30)
_E.Size = UDim2.new(1, -100, 1, -30)
_E.CanvasSize = UDim2.new(0, 0, 5, 0)
_E.ScrollBarThickness = 6

_F.Parent = _E
_F.SortOrder = Enum.SortOrder.LayoutOrder

-- Fake Functions for Obfuscation
local function _X(a, b)
    return (a * b + _RND) % 98765
end

local function _FAKE_LOOP()
    for i = 1, 1000 do
        local temp = _X(i, _RND)
        if temp % 2 == 0 then
            temp = temp / 2
        else
            temp = temp * 3 + 1
        end
    end
end

local function _Y(z, idx)
    local btn = Instance.new("TextButton")
    btn.Name = z
    btn.Parent = _D
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, idx * 40)
    btn.Text = z .. tostring(_X(idx, _RND))
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.MouseButton1Click:Connect(function()
        print("Button " .. z .. " clicked!")
        _FAKE_LOOP()
    end)
    return btn
end

local tabs = {"F", "S", "I", "Q", "FR", "TP", "SH", "MS", "EXTRA", "HIDDEN", "DUMMY", "LOOP"}
for i, v in ipairs(tabs) do
    _Y(v, i)
end

-- Auto-Attack Logic (Super Fast Mode)
local function autoAttack()
    while task.wait(0.01) do
        pcall(function()
            local enemies = workspace:FindFirstChild("Enemies")
            if enemies then
                for _, enemy in ipairs(enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        for i = 1, 5 do
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):FindFirstChild("Attack"):FireServer(enemy)
                        end
                    end
                end
            end
        end)
    end
end

task.spawn(autoAttack)

-- Anti-Leak Fake Errors
if not syn then error("Script Error: Incompatible Environment") end

-- Additional Fake Checks
for i = 1, 100 do
    if i % 7 == 0 then
        print("Fake log: " .. tostring(_X(i, _RND)))
    end
end

print("Kenon Hub ULTRA ACTIVE " .. tostring(_RND))
