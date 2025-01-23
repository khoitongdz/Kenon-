---[[[https://discord.gg/SFvsMJHXfc]]]---
local a,b,c,d,e=game.Players.LocalPlayer,game.Players.LocalPlayer.Character,false,nil,game.CoreGui
local f=Instance.new("ScreenGui",e)f.Name="FlyxMenu"local g=Instance.new("Frame")g.Size=UDim2.new(0,400,0,350)
g.Position=UDim2.new(0.5,-200,0.5,-175)g.BackgroundColor3=Color3.fromRGB(30,30,30)g.BorderSizePixel=0
g.Parent=f local h=Instance.new("UIGradient")h.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(45,45,45)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(25,25,25))}h.Rotation=90 h.Parent=g local i=Instance.new("TextButton")
i.Size=UDim2.new(0,50,0,50)i.Position=UDim2.new(0,10,0,10)i.BackgroundColor3=Color3.fromRGB(50,50,50)
i.Text="☰"i.TextSize=24 i.TextColor3=Color3.fromRGB(255,255,255)i.Parent=f local j=true
i.MouseButton1Click:Connect(function()j=not j g.Visible=j end)local k=Instance.new("TextLabel")k.Size=UDim2.new(1,0,0,50)
k.BackgroundColor3=Color3.fromRGB(40,40,40)k.Text="Flyx Menu"k.TextColor3=Color3.fromRGB(255,255,255)k.TextSize=20
k.Font=Enum.Font.GothamBold k.Parent=g local l=Instance.new("Frame")l.Size=UDim2.new(1,0,0,2)l.Position=UDim2.new(0,0,0,50)
l.BackgroundColor3=Color3.fromRGB(100,100,100)l.BorderSizePixel=0 l.Parent=g

local function m(n,o,p)local q=Instance.new("TextButton")q.Size=UDim2.new(0,350,0,50)
q.Position=UDim2.new(0,25,0,50+(o*60))q.BackgroundColor3=Color3.fromRGB(50,50,50)q.Text=n..": OFF"
q.TextColor3=Color3.fromRGB(255,255,255)q.TextSize=18 q.Font=Enum.Font.Gotham q.Parent=g local r=false
q.MouseButton1Click:Connect(function()r=not r q.Text=n..(r and ": ON"or": OFF")p(r)end)end

m("Fly",0,function(s)c=s;if s then b.HumanoidRootPart.Anchored=true else b.HumanoidRootPart.Anchored=false end end)

m("Anti AFK",1,function(s)if s then game:GetService("Players").LocalPlayer.Idled:Connect(function()
game:GetService("VirtualUser"):CaptureController()game:GetService("VirtualUser"):ClickButton2(Vector2.new(0,0))end)end end)

m("Auto Level Farm",2,function(s)if s then while s do wait(1)local t,u,v=nil,math.huge,b.HumanoidRootPart
for w,x in ipairs(workspace:GetChildren())do if x:FindFirstChild("Humanoid")and x:FindFirstChild("HumanoidRootPart")then
local y=(v.Position-x.HumanoidRootPart.Position).Magnitude if y<u then u=y t=x end end end if t then
b.Humanoid:MoveTo(t.HumanoidRootPart.Position)wait(0.5)local z=b.Humanoid:LoadAnimation(Instance.new("Animation"))
z.AnimationId="rbxassetid://AnimationID"z:Play()end end end end)
