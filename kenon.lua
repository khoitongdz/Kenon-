-- Kenon Hub | Blox Fruits Full Script (Hoho Hub Style)
-- Features: Auto Farm, PvP, Teleport, ESP, Webhook, Anti AFK, Fully Custom UI, Full Executor Support

if not game:IsLoaded() then game.Loaded:Wait() end
local X1 = game.GetService
local A, B, C, D, E, F, G, H, I, J = X1(game, "Players"), X1(game, "HttpService"), X1(game, "RunService"), X1(game, "TeleportService"), X1(game, "ReplicatedStorage"), X1(game, "VirtualUser"), X1(game, "UserInputService"), X1(game, "TweenService"), game:GetService("StarterGui")
local Player = A.LocalPlayer
if not Player then error("Kenon Hub: Failed to get LocalPlayer") end
local function Z() return syn or secure_call or fluxus or KRNL or getgenv end
if not Z() then warn("Kenon Hub: Unsupported Executor!") return end

Player.Idled:Connect(function() G:CaptureController() G:ClickButton2(Vector2.new()) end)
local Keybind, UI_Toggle, UI = Enum.KeyCode.RightControl, true, Instance.new("ScreenGui")
UI.Parent = game.CoreGui
local Button = Instance.new("ImageButton")
Button.Parent, Button.Size, Button.Position, Button.Image, Button.BackgroundTransparency, Button.Draggable = UI, UDim2.new(0, 100, 0, 100), UDim2.new(0, 50, 0, 50), "rbxassetid://9617593578", 1, true
local Frame = Instance.new("Frame")
Frame.Parent, Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Visible, Frame.Active, Frame.Draggable = UI, UDim2.new(0, 500, 0, 400), UDim2.new(0.5, -250, 0.5, -200), Color3.fromRGB(25, 25, 25), UI_Toggle, true, true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
Button.MouseButton1Click:Connect(function() UI_Toggle = not UI_Toggle Frame.Visible = UI_Toggle end)
H.InputBegan:Connect(function(input, gameProcessed) if input.KeyCode == Keybind and not gameProcessed then UI_Toggle = not UI_Toggle Frame.Visible = UI_Toggle end end)

local function CreateButton(Name, YPos, Callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent, Btn.Size, Btn.Position, Btn.BackgroundColor3, Btn.Text, Btn.TextColor3 = Frame, UDim2.new(0, 200, 0, 50), UDim2.new(0.5, -100, 0, YPos), Color3.fromRGB(45, 45, 45), Name, Color3.new(1, 1, 1)
    Btn.MouseButton1Click:Connect(function() pcall(Callback) end)
    return Btn
end

local function AutoFarm()
    print("Auto Farm Enabled")
    while UI_Toggle do
        local Target = nil
        for _, Enemy in pairs(workspace.Enemies:GetChildren()) do
            if Enemy:FindFirstChild("HumanoidRootPart") and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                Target = Enemy
                break
            end
        end
        if Target and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = Target.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
            F.Remotes.CommF_:InvokeServer("Attack")
        end
        wait(0.5)
    end
end

local function PvPMode()
    print("PvP Mode Enabled")
    while UI_Toggle do
        local Target = nil
        for _, OtherPlayer in pairs(A:GetPlayers()) do
            if OtherPlayer ~= Player and OtherPlayer.Character and OtherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                Target = OtherPlayer.Character
                break
            end
        end
        if Target and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = Target.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
            F.Remotes.CommF_:InvokeServer("Attack")
        end
        wait(1)
    end
end

local function Teleport()
    print("Teleporting...")
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 500, 0))
    end
end

local function ESP()
    print("ESP Activated")
    for _, OtherPlayer in pairs(A:GetPlayers()) do
        if OtherPlayer ~= Player and OtherPlayer.Character and OtherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local Highlight = Instance.new("Highlight", OtherPlayer.Character)
            Highlight.FillColor = Color3.new(1, 0, 0)
        end
    end
end

CreateButton("Auto Farm", 50, AutoFarm)
CreateButton("PvP Mode", 110, PvPMode)
CreateButton("Teleport", 170, Teleport)
CreateButton("ESP", 230, ESP)

local WebhookURL = "https://discord.com/api/webhooks/1337667957655994450/SjYmmvhkszUlpmSNZel7pwYnnKHhiV4QvQuvA3Iut-Hj0vfC3VeB6xqoipFVLRLqyZUy"
local function SendWebhook(Message)
    local Data = { ["content"] = Message }
    local EncodedData = C:JSONEncode(Data)
    pcall(function() C:PostAsync(WebhookURL, EncodedData, Enum.HttpContentType.ApplicationJson) end)
end

SendWebhook("Kenon Hub Loaded! Player: " .. Player.Name)
print("Kenon Hub (Hoho Hub Style, Full Executor Support) Loaded Successfully!")
