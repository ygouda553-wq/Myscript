-- JATREX GUI SS: The Final Chaos Edition
local myUsername = "red_wanted1" 

-- المعرفات (IDs)
local decalID = "73884714863714" -- الـ ID الجديد اللي جبته
local screamID = 6754147732
local stolenMusicID = 1840712882 -- الـ ID اللي استخرجناه من الكود حقك
local discoActive = false

-- وظيفة جلب الصورة
local function getImg(id)
    return "rbxassetid://" .. id
end
local finalAsset = getImg(decalID)

local player = game.Players:FindFirstChild(myUsername)
if player then
    local screen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screen.Name = "JatrexPanel"
    screen.ResetOnSpawn = false

    -- تصميم اللوحة بالعرض (Landscape)
    local main = Instance.new("Frame", screen)
    main.Size = UDim2.new(0, 500, 0, 320) 
    main.Position = UDim2.new(0.2, 0, 0.2, 0)
    main.BackgroundColor3 = Color3.new(0, 0, 0)
    main.BorderColor3 = Color3.new(1, 0.5, 0)
    main.Active = true; main.Draggable = true

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "JATREX GUI SS" --
    title.TextColor3 = Color3.new(1, 0.5, 0)
    title.BackgroundColor3 = Color3.new(0.1, 0, 0)
    title.Font = Enum.Font.Code; title.TextSize = 24

    local function createBtn(name, x, y, func, color)
        local btn = Instance.new("TextButton", main)
        btn.Size = UDim2.new(0.3, 0, 0, 35)
        btn.Position = UDim2.new(x, 0, 0, y)
        btn.Text = name
        btn.BackgroundColor3 = color or Color3.new(0.2, 0.1, 0)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.Code; btn.TextSize = 10
        btn.MouseButton1Click:Connect(func)
        return btn
    end

    -- الصف الأول: الهجوم والتحكم
    createBtn("FULLSCREEN HACK", 0.02, 55, function()
        for _, p in pairs(game.Players:GetPlayers()) do
            local g = Instance.new("ScreenGui", p.PlayerGui); g.IgnoreGuiInset = true
            local f = Instance.new("Frame", g); f.Size = UDim2.new(1, 0, 1, 0); f.BackgroundColor3 = Color3.new(0, 0, 0); f.BackgroundTransparency = 0.6
            local t = Instance.new("TextLabel", f); t.Size = UDim2.new(1, 0, 0.2, 0); t.Position = UDim2.new(0, 0, 0.4, 0)
            t.Text = "SERVER HAS GOT HACKED BY JATREX TEAM"; t.TextColor3 = Color3.new(1, 0.5, 0); t.TextScaled = true; t.BackgroundTransparency = 1; t.Font = Enum.Font.Code
            task.delay(8, function() g:Destroy() end)
        end
    end)

    createBtn("KICK ALL", 0.35, 55, function()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player then p:Kick("SERVER DESTROYED BY JATREX TEAM") end
        end
    end, Color3.new(0.6, 0, 0))

    createBtn("PLR ALL (STYLE)", 0.68, 55, function()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character then
                for _, v in pairs(p.Character:GetChildren()) do if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then v:Destroy() end end
                Instance.new("Shirt", p.Character).ShirtTemplate = "rbxassetid://15291242334"
                Instance.new("Pants", p.Character).PantsTemplate = "rbxassetid://15291243171"
            end
        end
    end)

    -- الصف الثاني: التدمير البصري (666)
    createBtn("666 INFERNO", 0.02, 105, function()
        game.Lighting.Ambient = Color3.new(1, 0, 0)
        for _, v in pairs(game.Workspace:GetDescendants()) do 
            if v:IsA("BasePart") and math.random(1, 2) == 1 then
                local f = Instance.new("Fire", v); f.Color = Color3.new(1, 0.5, 0); f.SecondaryColor = Color3.new(0, 0, 0); f.Size = 40
            end 
        end
    end)

    createBtn("JUMPSCARE", 0.35, 105, function()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character then
                local s = Instance.new("Sound", p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Head")); s.SoundId = "rbxassetid://" .. screamID; s.Volume = 10; s:Play()
                local sg = Instance.new("ScreenGui", p.PlayerGui); local img = Instance.new("ImageLabel", sg); img.Size = UDim2.new(1,0,1,0); img.Image = finalAsset; img.BackgroundTransparency = 1
                task.delay(2, function() sg:Destroy() end)
            end
        end
    end)

    createBtn("WORLD DECAL", 0.68, 105, function()
        for _, v in pairs(game.Workspace:GetDescendants()) do if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then for i = 0, 5 do local d = Instance.new("Decal", v); d.Texture = finalAsset; d.Face = i end end end
    end)

    -- الصف الثالث: الجسيمات والموسيقى
    createBtn("FORCE PARTICLES", 0.02, 155, function()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character then
                local target = p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso")
                if target then
                    local att = Instance.new("Attachment", target)
                    local part = Instance.new("ParticleEmitter", att); part.Texture = finalAsset; part.Size = NumberSequence.new(5); part.Rate = 30; part.VelocitySpread = 50
                end
            end
        end
    end)

    createBtn("PLAY STOLEN MUSIC", 0.35, 155, function()
        local s = Instance.new("Sound", game.Workspace); s.Name = "JatrexMusic"
        s.SoundId = "rbxassetid://" .. stolenMusicID; s.Volume = 10; s.Looped = true; s:Play()
    end)

    createBtn("SKYBOX", 0.68, 155, function()
        local sky = Instance.new("Sky", game.Lighting)
        sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt, sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = finalAsset, finalAsset, finalAsset, finalAsset, finalAsset, finalAsset
    end)

    -- الصف الرابع: التحكم النهائي
    local discoBtn = createBtn("DISCO: OFF", 0.02, 205, function()
        discoActive = not discoActive
        if discoActive then
            task.spawn(function()
                while discoActive do
                    local randomColor = Color3.fromHSV(tick() % 1, 1, 1)
                    game.Lighting.Ambient = randomColor; task.wait(0.1)
                end
                game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            end)
        end
    end)

    createBtn("STOP ALL / CLEAN", 0.35, 205, function()
        discoActive = false
        game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("Fire") or v:IsA("Decal") or v:IsA("ParticleEmitter") or v:IsA("Attachment") or v.Name == "JatrexMusic" then v:Destroy() end
        end
    end, Color3.new(0.1, 0.1, 0.1))

    createBtn("EXIT GUI", 0.68, 205, function() screen:Destroy() end)
    
    -- تحديث نص الديسكو
    task.spawn(function()
        while true do discoBtn.Text = discoActive and "DISCO: ON" or "DISCO: OFF"; task.wait(0.1) end
    end)
end
