-- [[ JATREX GUI - COMPLETE ULTIMATE EDITION (WITH INTRO) ]] --
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()
local cam = workspace.CurrentCamera

if CoreGui:FindFirstChild("JatrexGUI") then CoreGui:FindFirstChild("JatrexGUI"):Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JatrexGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- [[ 1. شاشة الافتتاح (Splash Screen) ]] --
-- ==========================================
local SplashFrame = Instance.new("Frame")
SplashFrame.Parent = ScreenGui
SplashFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
SplashFrame.Size = UDim2.new(1, 0, 1, 0)
SplashFrame.ZIndex = 100

local SplashLogo = Instance.new("ImageLabel")
SplashLogo.Parent = SplashFrame
SplashLogo.BackgroundTransparency = 1
SplashLogo.Size = UDim2.new(0, 0, 0, 0) -- بيبدأ من صفر
SplashLogo.Position = UDim2.new(0.5, 0, 0.45, 0)
SplashLogo.Image = "rbxassetid://15128090543" 
SplashLogo.ImageColor3 = Color3.fromRGB(0, 120, 255)
SplashLogo.ZIndex = 101

local SplashText = Instance.new("TextLabel")
SplashText.Parent = SplashFrame
SplashText.BackgroundTransparency = 1
SplashText.Position = UDim2.new(0, 0, 0.65, 0)
SplashText.Size = UDim2.new(1, 0, 0.1, 0)
SplashText.Text = "JATREX GUI IS OPENING..."
SplashText.TextColor3 = Color3.new(1, 1, 1)
SplashText.Font = Enum.Font.GothamBold
SplashText.TextSize = 25
SplashText.TextTransparency = 1
SplashText.ZIndex = 101

-- ==========================================
-- [[ 2. القائمة الرئيسية (Main Frame) ]] --
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 360, 0, 450)
MainFrame.Visible = false -- بتظهر بعد الانترو
Instance.new("UICorner", MainFrame)

-- Open/Close Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ToggleBtn.Position = UDim2.new(0, 10, 0.5, -100)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Text = "J"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.TextSize = 25
ToggleBtn.Visible = false -- بيظهر بعد الانترو
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)

-- Dragging Logic
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) dragging = false end)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0.08, 0)
Title.Text = "JATREX GUI - ULTIMATE"
Title.TextColor3 = Color3.fromRGB(0, 120, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.BackgroundTransparency = 1

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Parent = MainFrame
StatsLabel.Size = UDim2.new(1, 0, 0.05, 0)
StatsLabel.Position = UDim2.new(0, 0, 0.07, 0)
StatsLabel.BackgroundTransparency = 1
StatsLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
StatsLabel.TextSize = 11
StatsLabel.Text = "FPS: 0 | Ping: 0ms"

local config = { speed = false, jump = false, fly = false, esp = false, noclip = false, clicktp = false, antiafk = false, swim = false, fling = false }
local savedPos = nil

local function createBtn(text, pos, type, color)
    local btn = Instance.new("TextButton")
    btn.Parent = MainFrame
    btn.Size = UDim2.new(0.22, 0, 0.07, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color or Color3.fromRGB(130, 0, 0)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 10
    Instance.new("UICorner", btn)

    if type then
        btn.MouseButton1Click:Connect(function()
            config[type] = not config[type]
            btn.BackgroundColor3 = config[type] and Color3.fromRGB(0, 150, 0) or (color or Color3.fromRGB(130, 0, 0))
        end)
    end
    return btn
end

-- [[ وظيفة أنيميشن البداية الحماسي ]] --
local function StartIntro()
    task.wait(0.2)
    -- صوت حماسي (Riser)
    local s = Instance.new("Sound", SoundService)
    s.SoundId = "rbxassetid://183785172"
    s:Play()
    
    -- ظهور الصورة
    TweenService:Create(SplashLogo, TweenInfo.new(0.8, Enum.EasingStyle.Elastic), {
        Size = UDim2.new(0, 150, 0, 150),
        Position = UDim2.new(0.5, -75, 0.45, -75),
        ImageTransparency = 0
    }):Play()
    
    task.wait(0.5)
    -- ظهور النص
    TweenService:Create(SplashText, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
    
    task.wait(2.2)
    -- اختفاء كل شيء
    TweenService:Create(SplashFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(SplashLogo, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
    TweenService:Create(SplashText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    
    task.wait(0.5)
    SplashFrame:Destroy()
    MainFrame.Visible = true
    ToggleBtn.Visible = true
    -- صوت فتح القائمة
    local s2 = Instance.new("Sound", SoundService)
    s2.SoundId = "rbxassetid://5646503140"
    s2:Play()
end

-- [[ BUTTON LAYOUT ]] --
createBtn("Speed", UDim2.new(0.02, 0, 0.15, 0), "speed")
createBtn("Jump", UDim2.new(0.26, 0, 0.15, 0), "jump")
createBtn("Fly", UDim2.new(0.50, 0, 0.15, 0), "fly")
createBtn("ESP", UDim2.new(0.74, 0, 0.15, 0), "esp")
createBtn("Noclip", UDim2.new(0.02, 0, 0.24, 0), "noclip")
createBtn("Swim", UDim2.new(0.26, 0, 0.24, 0), "swim")
createBtn("FLING", UDim2.new(0.50, 0, 0.24, 0), "fling", Color3.fromRGB(200, 0, 0))
createBtn("AntiAFK", UDim2.new(0.74, 0, 0.24, 0), "antiafk")

createBtn("Server Hop", UDim2.new(0.02, 0, 0.33, 0), nil, Color3.fromRGB(150, 150, 0)).MouseButton1Click:Connect(function()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    for _, v in pairs(servers) do if v.playing < v.maxPlayers and v.id ~= game.JobId then TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, lp) break end end
end)

createBtn("Rejoin", UDim2.new(0.26, 0, 0.33, 0), nil, Color3.fromRGB(0, 100, 100)).MouseButton1Click:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
end)

createBtn("Anti-Lag", UDim2.new(0.50, 0, 0.33, 0), nil, Color3.fromRGB(50, 50, 50)).MouseButton1Click:Connect(function()
    Lighting.GlobalShadows = false
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
    end
end)

createBtn("ClickTP", UDim2.new(0.74, 0, 0.33, 0), "clicktp")

local sPosBtn = createBtn("Save Pos", UDim2.new(0.02, 0, 0.42, 0), nil, Color3.fromRGB(80, 0, 150))
local gPosBtn = createBtn("Go To", UDim2.new(0.26, 0, 0.42, 0), nil, Color3.fromRGB(0, 150, 150))
local dexBtn = createBtn("Open DEX", UDim2.new(0.50, 0, 0.42, 0), nil, Color3.fromRGB(40, 40, 40))

sPosBtn.MouseButton1Click:Connect(function() if lp.Character then savedPos = lp.Character.HumanoidRootPart.CFrame end end)
gPosBtn.MouseButton1Click:Connect(function() if savedPos and lp.Character then lp.Character:PivotTo(savedPos) end end)
dexBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))() end)

local pBox = Instance.new("TextBox")
pBox.Parent = MainFrame
pBox.Size, pBox.Position = UDim2.new(0.7, 0, 0.08, 0), UDim2.new(0.02, 0, 0.55, 0)
pBox.PlaceholderText = "Target Player Name..."
pBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
pBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", pBox)

local tpBtn = createBtn("TP", UDim2.new(0.74, 0, 0.55, 0), nil, Color3.fromRGB(0, 80, 180))
tpBtn.MouseButton1Click:Connect(function()
    local t = pBox.Text:lower()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= lp and (v.Name:lower():find(t) or v.DisplayName:lower():find(t)) then 
            lp.Character:PivotTo(v.Character.HumanoidRootPart.CFrame) 
        end
    end
end)

-- [[ MAIN PHYSICS LOOP ]] --
local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(0, 0, 0)

RunService.Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("Humanoid") then
        local hrp, hum = lp.Character.HumanoidRootPart, lp.Character.Humanoid
        if config.speed and hum.MoveDirection.Magnitude > 0 then hrp.CFrame = hrp.CFrame + (hum.MoveDirection * 1.5) end
        if config.jump then hum.JumpPower = 120; hum.UseJumpPower = true else hum.JumpPower = 50 end
        if config.noclip or config.fling then for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
        if config.fly or config.fling then
            bv.Parent = hrp; bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            local direction = hum.MoveDirection * 100
            local upVector = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then upVector = Vector3.new(0, 50, 0)
            elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then upVector = Vector3.new(0, -50, 0) end
            bv.Velocity = direction + upVector + (hum.MoveDirection.Magnitude == 0 and not UserInputService:IsKeyDown(Enum.KeyCode.Space) and Vector3.new(0, 1.5, 0) or Vector3.new(0,0,0))
        else bv.Parent = nil end
        if config.swim then hum:ChangeState(Enum.HumanoidStateType.Swimming) end
        if config.fling then
            for _, v in pairs(lp.Character:GetChildren()) do if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then v.RotVelocity = Vector3.new(300000, 300000, 300000); v.Velocity = Vector3.new(500, 500, 500) end end
            hrp.RotVelocity = Vector3.new(0, 0, 0) 
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        local fps = math.floor(1/RunService.RenderStepped:Wait())
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        StatsLabel.Text = "FPS: "..fps.." | Ping: "..ping.."ms"
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp and p.Character then
                local h = p.Character:FindFirstChild("JHighlight")
                if config.esp then
                    if not h then h = Instance.new("Highlight", p.Character); h.Name = "JHighlight"; h.FillColor = Color3.new(1, 0, 0) end
                elseif h then h:Destroy() end
            end
        end
    end
end)

mouse.Button1Down:Connect(function() if config.clicktp and mouse.Target then lp.Character:PivotTo(CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))) end end)
ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

lp.Idled:Connect(function()
    if config.antiafk then game:GetService("VirtualUser"):CaptureController(); game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end
end)

-- بدء الافتتاحية
task.spawn(StartIntro)
