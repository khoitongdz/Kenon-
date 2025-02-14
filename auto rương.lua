local function JZxg(...) return ... end;
local WNJy={};WNJy.BglV=game;WNJy.OmDt=WNJy.BglV.Players;WNJy.jYGX=WNJy.OmDt.LocalPlayer;
WNJy.yFXN=WNJy.jYGX.Character or WNJy.jYGX.CharacterAdded:Wait();WNJy.LhJY=WNJy.yFXN:WaitForChild("HumanoidRootPart");

local function SDF3() return "KHOITONGDZ HUB" end
local function R9D2() return "Tự động nhặt rương" end
local function XQ8A() return "Số rương đã nhặt: " end

local YPqW=0; local NBLz=false;

local RAYF=loadstring(game:HttpGet('https://sirius.menu/rayfield'))();
local WI4H=RAYF:CreateWindow({Name=SDF3(), LoadingTitle="Đang khởi động...", LoadingSubtitle="Auto Chest | Hỗ trợ mọi executor", ConfigurationSaving={Enabled=true, FolderName="KhoiTongDZHub", FileName="AutoChest"}, Discord={Enabled=false}, KeySystem=false})

local function MWUJ() WI4H:Toggle() end
local function ZT6P()
    for _,RTVJ in pairs(WNJy.BglV:GetService("Workspace"):GetChildren()) do
        if RTVJ:IsA("Model") and string.find(RTVJ.Name:lower(),"chest") then
            WNJy.LhJY.CFrame=RTVJ.PrimaryPart.CFrame;
            wait(1);
            YPqW=YPqW+1;
            O5B2:Set(XQ8A()..YPqW)
        end
    end
end

local YPKX=WI4H:CreateTab("Auto Chest", 4483362458)
local O5B2=YPKX:CreateLabel(XQ8A().."0")

local function IQLV() WI4H:CreateButton({Name="🛠️ Bật/Tắt UI", Callback=MWUJ}) end
local function V9XG()
    YPKX:CreateSection("Người chơi trong server:");
    for _,plr in pairs(WNJy.OmDt:GetPlayers()) do YPKX:CreateLabel("👤 "..plr.Name) end
end
local function QWEU()
    YPKX:CreateToggle({Name=R9D2(), CurrentValue=false, Callback=function(state)
        NBLz=state;
        while NBLz do ZT6P(); wait(5) end
    end})
end

IQLV(); V9XG(); QWEU();

RAYF:Notify({Title=SDF3(), Content="Script đã tải thành công! Bật UI bằng nút 🛠️", Duration=5})
