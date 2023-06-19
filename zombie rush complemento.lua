--execute this loadstring
loadstring(game:HttpGet(("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Zombie%20Rush/ZombieRushGUI")))()
--and after execute the script above
local Config = {--                                                                                                                                        "
    WindowName = "1.0                                                                                                         Pink Gui on top(practically)",
    Color = Color3.fromRGB(245, 81, 231),
    Keybind = Enum.KeyCode.RightControl
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/BracketV3/main/Lib.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Zombie Rush")


local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse() 
local tpservice= game:GetService("TeleportService")
local VirtualUser= game:service'VirtualUser'

local bLocation

-- Credits To Charwar for Server Hop
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
 
jesus = game.Players.LocalPlayer.Name

local Toggle1 = Section1:CreateToggle("auto equip", nil, function(State)
toggle = State 
        while toggle do
            wait(.3)
--anti afk 
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
--
local vai = game:GetService("VirtualInputManager")

game.Players:WaitForChild(jesus).Backpack:WaitForChild("PaintballGun") print "vvv" vai:SendKeyEvent(true, "One", false, nil)
			
game.Workspace:WaitForChild(jesus).HumanoidRootPart.CFrame = game:GetService("Workspace").SafehouseLobby[".Barriers"].Barrier.CFrame + Vector3.new(0, -11.25, -3)
end
end)

local Toggle1 = Section2:CreateToggle("auto KYS on leaderboard", nil, function(State)
toggle = State 
        while toggle do
            wait(0)

local best = game:GetService("Workspace").SafehouseLobby[".Functional"].LeaderboardAllTime.Board.LeaderboardGUI.Container.Body:WaitForChild("4").Score.Text
local now = game.ReplicatedStorage.GameProperties.CurrentWave.Value

if now == best then game.Workspace:WaitForChild(jesus).Humanoid.Health = 0

end

end
end)

local Toggle8 = Section2:CreateToggle("UI Toggle", nil, function(State)
    Window:Toggle(State)
end)
 
Toggle8:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
    Config.Keybind = Enum.KeyCode[Key]
end)    
Toggle8:SetState(true)
