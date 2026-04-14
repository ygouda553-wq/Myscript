-- [[ JATREX GUI - KEY SYSTEM EDITION ]] --
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer
local cam = workspace.CurrentCamera

if CoreGui:FindFirstChild("JatrexGUI") then CoreGui:FindFirstChild("JatrexGUI"):Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "JatrexGUI"
ScreenGui.ResetOnSpawn = false

-- [[ 1. Key System UI ]] --
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 300, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.BorderSizePixel = 0
Instance.new("UICorner", KeyFrame)

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0.3, 0)
KeyTitle.Text = "ENTER KEY"
KeyTitle.TextColor3 = Color3.fromRGB(0, 120, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextSize = 18

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0.25, 0)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.PlaceholderText = "Type Key Here..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", KeyInput)

local KeyBtn = Instance.new("TextButton", KeyFrame)
KeyBtn.Size = UDim2.new(0.4, 0, 0.2, 0)
KeyBtn.Position = UDim2.new(0.3, 0, 0.7, 0)
KeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
KeyBtn.Text = "Verify"
KeyBtn.TextColor3 = Color3.new(1, 1, 1)
KeyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", KeyBtn)

-- [[ 2. Main Frame ]] --
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 360, 0, 480)
MainFrame.Visible = false
Instance.new("UICorner", MainFrame)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0.08, 0)
Title.Text = "JATREX GUI"
Title.TextColor3 = Color3.fromRGB(0, 120, 255)
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
Title.TextSize = 20

local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size, ToggleBtn.Position = UDim2.new(0, 50, 0, 50), UDim2.new(0, 10, 0.5, 0)
ToggleBtn.Text = "J"; ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255); ToggleBtn.Visible = false
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- Key Logic
KeyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "imak123" then
        KeyFrame:Destroy()
        MainFrame.Visible = true
        ToggleBtn.Visible = true
        -- Sound Effect on Success
        local s = Instance.new("Sound", ScreenGui)
        s.SoundId = "rbxassetid://5567501003"
        s.Volume = 2
        s:Play()
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "WRONG KEY!"
        task.wait(1)
        KeyInput.PlaceholderText = "Type Key Here..."
    end
end)

-- [[ 3. Functions & Features ]] --
local config = { speed = false, fly = false, esp = false, noclip = false, antiafk = false, fling = false }
local savedPos = nil

local function createBtn(text, pos, type, color)
    local btn = Instance.new("TextButton", MainFrame)
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

createBtn("Speed", UDim2.new(0.02, 0, 0.12, 0), "speed")
createBtn("Fly", UDim2.new(0.26, 0, 0.12, 0), "fly")
createBtn("ESP", UDim2.new(0.50, 0, 0.12, 0), "esp")
createBtn("Noclip", UDim2.new(0.74, 0, 0.12, 0), "noclip")
createBtn("FLING", UDim2.new(0.02, 0, 0.21, 0), "fling", Color3.fromRGB(200, 0, 0))
createBtn("AntiAFK", UDim2.new(0.26, 0, 0.21, 0), "antiafk")

createBtn("S-Hop", UDim2.new(0.50, 0, 0.21, 0), nil, Color3.fromRGB(150, 150, 0)).MouseButton1Click:Connect(function()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    for _, v in pairs(servers) do if v.playing < v.maxPlayers and v.id ~= game.JobId then TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, lp) end end
end)

createBtn("Rejoin", UDim2.new(0.74, 0, 0.21, 0), nil, Color3.fromRGB(0, 100, 100)).MouseButton1Click:Connect(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, lp) end)

local sPos = createBtn("Save Pos", UDim2.new(0.02, 0, 0.30, 0), nil, Color3.fromRGB(80, 0, 150))
local lPos = createBtn("TP Pos", UDim2.new(0.26, 0, 0.30, 0), nil, Color3.fromRGB(0, 150, 150))
sPos.MouseButton1Click:Connect(function() if lp.Character then savedPos = lp.Character.HumanoidRootPart.CFrame end end)
lPos.MouseButton1Click:Connect(function() if savedPos and lp.Character then lp.Character:PivotTo(savedPos) end end)

local pBox = Instance.new("TextBox", MainFrame)
pBox.Size, pBox.Position = UDim2.new(0.7, 0, 0.07, 0), UDim2.new(0.02, 0, 0.40, 0)
pBox.PlaceholderText = "Player Name..."
pBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30); pBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", pBox)
createBtn("TP To", UDim2.new(0.74, 0, 0.40, 0), nil, Color3.fromRGB(0, 80, 180)).MouseButton1Click:Connect(function()
    for _, v in pairs(Players:GetPlayers()) do if v ~= lp and (v.Name:lower():find(pBox.Text:lower()) or v.DisplayName:lower():find(pBox.Text:lower())) then lp.Character:PivotTo(v.Character.HumanoidRootPart.CFrame) end end
end)

-- [[ 4. Loops & Physics ]] --
local bv = Instance.new("BodyVelocity")
RunService.RenderStepped:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        local hrp, hum = lp.Character.HumanoidRootPart, lp.Character:FindFirstChildOfClass("Humanoid")
        if config.speed and hum.MoveDirection.Magnitude > 0 then hrp.CFrame = hrp.CFrame + (hum.MoveDirection * 1.5) end
        if config.fly or config.fling then
            bv.Parent = hrp; bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            local dir = (hum.MoveDirection.Magnitude > 0 and cam.CFrame.LookVector * 100 or Vector3.new(0,0,0))
            local up = (UserInputService:IsKeyDown(Enum.KeyCode.Space) and 50 or 0) + (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and -50 or 0)
            bv.Velocity = dir + Vector3.new(0, up, 0)
            if config.fling then
                hrp.RotVelocity = Vector3.new(0, 30000, 0)
                for _, v in pairs(lp.Character:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end
            end
        else 
            if bv.Parent then bv.Parent = nil; hrp.RotVelocity = Vector3.new(0,0,0)
            for _, v in pairs(lp.Character:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = true end end end
        end
        if config.noclip then for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp and p.Character then
                local hl = p.Character:FindFirstChild("JHighlight")
                if config.esp then
                    if not hl then hl = Instance.new("Highlight", p.Character); hl.Name = "JHighlight"; hl.FillColor = Color3.new(1, 0, 0) end
                elseif hl then hl:Destroy() end
            end
        end
    end
end)
lp.Idled:Connect(function() if config.antiafk then game:GetService("VirtualUser"):CaptureController(); game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end end)
