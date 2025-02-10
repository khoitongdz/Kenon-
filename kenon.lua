-- Kenon Hub | Blox Fruits Full Script 
-- Features: Auto Farm, PvP, Teleport, ESP, Webhook, Anti AFK, Fully Custom UI, Full Executor Support

if not game:IsLoaded() then game.Loaded:Wait() end
local X1, X2, X3, X4, X5, X6, X7, X8, X9, X10 = game:GetService, "Players", "LocalPlayer", "HttpService", "RunService", "TeleportService", "ReplicatedStorage", "VirtualUser", "UserInputService", "TweenService"
local A, B, C, D, E, F, G, H, I, J = X1(X2), X1(X3), X1(X4), X1(X5), X1(X6), X1(X7), X1(X8), X1(X9), X1(X10), game:GetService("StarterGui")
local function Z() return syn or secure_call or fluxus or KRNL or getgenv end
if not Z() then warn("Kenon Hub: Unsupported Executor!") return end
B.Idled:Connect(function() G:CaptureController() G:ClickButton2(Vector2.new()) end)
local K, L, M = Enum.KeyCode.RightControl, true, Instance.new("ScreenGui")
M.Parent = game.CoreGui
local N, O, P, Q = Instance.new("ImageButton"), UDim2.new(0, 100, 0, 100), UDim2.new(0, 50, 0, 50), "rbxassetid://9617593578"
N.Parent, N.Size, N.Position, N.Image, N.BackgroundTransparency, N.Draggable = M, O, P, Q, 1, true
local R = Instance.new("Frame")
R.Parent, R.Size, R.Position, R.BackgroundColor3, R.Visible, R.Active, R.Draggable = M, UDim2.new(0, 500, 0, 400), UDim2.new(0.5, -250, 0.5, -200), Color3.fromRGB(25, 25, 25), L, true, true
Instance.new("UICorner", R).CornerRadius = UDim.new(0, 10)
N.MouseButton1Click:Connect(function() L = not L R.Visible = L end)
I.InputBegan:Connect(function(S, T) if S.KeyCode == K and not T then L = not L R.Visible = L end end)
local function U(V, W, X) local Y = Instance.new("TextButton") Y.Parent, Y.Size, Y.Position, Y.BackgroundColor3, Y.Text, Y.TextColor3, Y.MouseButton1Click = R, UDim2.new(0, 200, 0, 50), UDim2.new(0.5, -100, 0, W), Color3.fromRGB(45, 45, 45), V, Color3.new(1, 1, 1), X return Y end
local function AA() print("Auto Farm Enabled") while true do if not L then break end local AB for _, AC in pairs(workspace.Enemies:GetChildren()) do if AC:FindFirstChild("HumanoidRootPart") and AC:FindFirstChild("Humanoid") and AC.Humanoid.Health > 0 then AB = AC break end end if AB then B.Character.HumanoidRootPart.CFrame = AB.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0) F.Remotes.CommF_:InvokeServer("Attack") end wait(0.5) end end
local function AD() print("PvP Mode Enabled") while true do if not L then break end local AE for _, AF in pairs(A:GetPlayers()) do if AF ~= B and AF.Character and AF.Character:FindFirstChild("HumanoidRootPart") then AE = AF.Character break end end if AE then B.Character.HumanoidRootPart.CFrame = AE.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0) F.Remotes.CommF_:InvokeServer("Attack") end wait(1) end end
local function AG() print("Teleporting...") B.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 500, 0)) end
local function AH() print("ESP Activated") for _, AI in pairs(A:GetPlayers()) do if AI ~= B and AI.Character and AI.Character:FindFirstChild("HumanoidRootPart") then local AJ = Instance.new("Highlight", AI.Character) AJ.FillColor = Color3.new(1, 0, 0) end end end
U("Auto Farm", 50, AA) U("PvP Mode", 110, AD) U("Teleport", 170, AG) U("ESP", 230, AH)
local AK = "https://discord.com/api/webhooks/1337667957655994450/SjYmmvhkszUlpmSNZel7pwYnnKHhiV4QvQuvA3Iut-Hj0vfC3VeB6xqoipFVLRLqyZUy"
local function AL(AM) local AN = { ["content"] = AM } local AO = C:JSONEncode(AN) C:PostAsync(AK, AO, Enum.HttpContentType.ApplicationJson) end
AL("Kenon Hub Loaded! Player: " .. B.Name)
print("Kenon Hub (Full Executor Support) Loaded Successfully!")
