local Config = {
    WindowName = "version 2.8 (unofficial)                                                                        Pink Gui on top(practically",
    Color = Color3.fromRGB(245, 81, 231),
    Keybind = Enum.KeyCode.RightControl
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/BracketV3/main/Lib.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Fishing Simulator")


local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local mouse = player:GetMouse() 
local tpservice= game:GetService("TeleportService")
local VirtualUser= game:service'VirtualUser'

local ToolsCache = game:GetService("ReplicatedStorage").ToolsCache[player.UserId]
local plrTools
local bLocation
local fuckMonster
local fuckMobby

local seacreatureSelectionned
local locationSelected
local eggs

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
 
 
-- Server Hop
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end
 
function switchServer()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
 
function teleport(loc)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc
end
 
-- Get Tools Name (Just hidden the tool in replicatedstorage, savageeeee but characte win)
for i, getTools in pairs(player.Character:GetChildren()) do
    if getTools:IsA("Tool") and  getTools:FindFirstChild("Handle") then -- Handle/GripC1
        plrTools = getTools.Name
    end
end

local porn = game.ReplicatedStorage.ToolsCache

for i, v in pairs(porn:GetChildren()) do
    print(v.Name)
end

function EquipTool()
    wait(7)
    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(2)
    local args = {
     [1] = game:GetService("ReplicatedStorage").ToolsCache:GetChildren()[plrTools]
    }
    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EquipTool:FireServer(unpack(args))
end

game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
 
Section1:CreateLabel("Farming")
 
local Toggle6 = Section1:CreateToggle("Auto Kill", nil, function(State)
    shared.toggle = State
     if shared.toggle then
    fuckMonster = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("TakeDamage") then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
 
 
                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and getTools:FindFirstChild("Handle") then --GripC1/Handle
                            plrTools = getTools.Name
                        --[[ elseif getTools:IsA("Tool") and getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name]]
                        end
                    end
 
                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(Workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMonster:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
Toggle6:AddToolTip("put your spear on the second slot of hotbar")
 
local Toggle11 = Section1:CreateToggle("Auto Kill Mobby Wood", nil, function(State)
    shared.toggle = State
     if shared.toggle then
    fuckMobby = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaBoss") and v.Name == "MobyWood" then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
 
 
                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("Handle") then --GripC1/Handle
                            plrTools = getTools.Name
                        end
                    end
 
                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMobby:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
 
 
local Toggle8 = Section1:CreateToggle("Reduce Lag", nil, function(State)
    toggle = State
     if toggle then
        while toggle do 
            wait(30)
            for i, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
                if v:IsA("Model") then
                    v:Destroy()
                end
            end
        end
      end
end)

Toggle8:AddToolTip("Delete Dropped Items in 30 sec :)")

local Toggle10 = Section1:CreateToggle("Auto Lock Rare Items", nil, function(State)
    toggle10 = State
    if toggle10 then
        spawn(function()
            while toggle10 do 
                wait(.1)
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetChildren()) do
                    if string.match(v.Name, "key") then
                        for i, model in pairs(v:GetDescendants()) do
                            if model:IsA("Tool") then -- this music start play https://www.youtube.com/watch?v=EytSP67tg_0
                                if model.Name == "babygreatwhitesharkegg" or model.Name == "sharktooth" or model.Name == "ornamentpufferfish" or model.Name == "ornamentgoldfish" or model.Name == "starfish" or model.Name == "sandray" or model.Name == "alienstarfish" or model.Name == "flounder" or model.Name == "yellowsnapper" or model.Name == "redrockfish" or model.Name == "piranha" or model.Name == "mosasaurus" or model.Name == "cobia" or model.Name == "dragonfish" or model.Name == "snapper" or model.Name == "magmanapoleonfish" or model.Name == "magmatrout" or model.Name == "largemouthbass" or model.Name == "yellowfintuna" or model.Name == "rainbowparrotfish" or model.Name == "swordfish" or model.Name == "porgy" or model.Name == "sunfish" or model.Name == "bluefish" or model.Name == "tigerfish" or model.Name == "rockfish" or model.Name == "starfish" or model.Name == "cuttlefish" or model.Name == "seabear" or model.Name == "ninjafish" or model.Name == "purplecandyfish" or model.Name == "gemheartfish" or model.Name == "babygreatwhiteshark" or model.Name == "babyhammerheadshark" or model.Name == "babykillerwhale" or model.Name == "babyneongreatwhiteshark" or model.Name == "babyneonkillerwhale" or model.Name == "babyoversizedgreatwhiteshark" or model.Name == "oversizedgreatwhitetooth" or model.Name == "whalehead" or model.Name == "whaleheart" or model.Name == "whaletooth" or model.Name == "whalekey" or model.Name == "neongreatwhitetooth" or model.Name == "hammerheadsharktooth" or model.Name == "hammerheadsharkhead" or model.Name == "babyhammerheadshark" or model.Name == "kronkasaurusheart" or model.Name == "kronkasaurustooth" or model.Name == "kronkasaurushead" or model.Name == "voidhammerheadsharkhead" or model.Name == "voidhammerheadsharktooth" or model.Name == "babyvoidhammerheadshark" then
                                    if v.DraggableComponent.Contents.LockIcon.Visible == false then -- GOD OF SCRIPT (ironia guys)
                                        print(v.Name, model.Name)
                                        local args = {[1] = "Tools",[2] = v.Name,[3] = true}
                                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))
                                    end
                                end
                            end
                        end
                    end
                 end
            end
        end)
    end
end)
 
Toggle10:AddToolTip("Rarity Locked:\nWhaleKey \nLegendary fish \nAll Mythic \n \nPlease report any bugs with this function on discord")

local Toggle10 = Section1:CreateToggle("Auto Lock leg/mit with glow", nil, function(State)
    toggle10 = State
    if toggle10 then
        spawn(function()
            while toggle10 do 
                wait(.1)
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetChildren()) do
                    if string.match(v.Name, "key") then
                        for i, model in pairs(v:GetDescendants()) do
                            if model:IsA("Tool") then -- this music start play https://www.youtube.com/watch?v=EytSP67tg_0
                                if model.Name == "babygreatwhitesharkegg" or model.Name == "sharktooth" or model.Name == "ornamentpufferfish" or model.Name == "ornamentgoldfish" or model.Name == "starfish" or model.Name == "sandray" or model.Name == "alienstarfish" or model.Name == "flounder" or model.Name == "yellowsnapper" or model.Name == "redrockfish" or model.Name == "piranha" or model.Name == "mosasaurus" or model.Name == "cobia" or model.Name == "dragonfish" or model.Name == "snapper" or model.Name == "magmanapoleonfish" or model.Name == "magmatrout" or model.Name == "largemouthbass" or model.Name == "yellowfintuna" or model.Name == "rainbowparrotfish" or model.Name == "swordfish" or model.Name == "porgy" or model.Name == "sunfish" or model.Name == "bluefish" or model.Name == "tigerfish" or model.Name == "rockfish" or model.Name == "starfish" or model.Name == "cuttlefish" or model.Name == "seabear" or model.Name == "ninjafish" or model.Name == "purplecandyfish" or model.Name == "gemheartfish" or model.Name == "babygreatwhiteshark" or model.Name == "babyhammerheadshark" or model.Name == "babykillerwhale" or model.Name == "babyneongreatwhiteshark" or model.Name == "babyneonkillerwhale" or model.Name == "babyoversizedgreatwhiteshark" or model.Name == "oversizedgreatwhitetooth" or model.Name == "whalehead" or model.Name == "whaleheart" or model.Name == "whaletooth" or model.Name == "whalekey" or model.Name == "neongreatwhitetooth" or model.Name == "hammerheadsharktooth" or model.Name == "hammerheadsharkhead" or model.Name == "babyhammerheadshark" or model.Name == "kronkasaurusheart" or model.Name == "kronkasaurustooth" or model.Name == "kronkasaurushead" or model.Name == "voidhammerheadsharkhead" or model.Name == "voidhammerheadsharktooth" or model.Name == "babyvoidhammerheadshark" then
                                    if v.DraggableComponent.Contents.LockIcon.Visible == false then -- GOD OF SCRIPT (ironia guys)
                                    if v.DraggableComponent.Contents:FindFirstChild("MutationIcon") then
                                        print(v.Name, model.Name)
                                        local args = {[1] = "Tools",[2] = v.Name,[3] = true}
                                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))
                                    end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
 




local Toggle3 = Section1:CreateToggle("Auto Sell", nil, function(State)
toggle = State
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
    end
end)
 
local Toggle4 = Section1:CreateToggle("Remove Fog and Water", nil, function(State)
    toggle = State
        while toggle do
        if  game.Lighting.FogEnd == 2000 then
         game.Lighting.FogEnd = 20000000
        end
            game.Lighting.Blur:Destroy()
            game.Lighting.Bloom:Destroy()     
            game.Lighting.Atmosphere:Destroy()  
            game.Lighting.ColorCorrection:Destroy()
            game.Workspace.OceanWaves:Destroy()
        end
end)

Section1:CreateLabel("\n auto Fishing")

local Button1 = Section1:CreateButton("auto Fishing (TryHard)", function()

local replication = game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams

local MAX_CONCURRENCY = 100
local current_index = 1
game:GetService("RunService").RenderStepped:Connect(function()
task.spawn(function()
for i = current_index, current_index + MAX_CONCURRENCY - 1 do
wait(0.01)
if i > 102 then return end
replication.FishBiting:InvokeServer()
wait(0.04)
game.ReplicatedStorage.CloudFrameShared.DataStreams.FishCaught:FireServer()
game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
end
current_index = current_index + MAX_CONCURRENCY
end)
end)

end)

Button1:AddToolTip("use ONLY in Public server")

local Toggle1 = Section1:CreateToggle("Auto Fish(Safe Mode)", nil, function(State)
toggle = State
local r = Random.new()
        
while toggle do wait(0.15)

local children = game.Players.LocalPlayer.PlayerGui:WaitForChild("FishBubbles"):GetChildren()
local count = #children
print(count)          
if count >= 2 then

wait(r:NextNumber(0, 0.3))
game.ReplicatedStorage.CloudFrameShared.DataStreams.FishCaught:FireServer()
print("gozei")
local vim = game:GetService("VirtualInputManager")
vim:SendKeyEvent(true, "One", false, nil)
wait(1.24)
local vim = game:GetService("VirtualInputManager")
vim:SendKeyEvent(true, "One", false, nil)
local vuser = game:GetService("VirtualUser")
wait(1.499)
vuser:CaptureController()
vuser:ClickButton1(Vector2.new())
end
end-- toggle

end) -- fun
--
Toggle1:AddToolTip("HEY, put your fishing rod on the first slot. NOW \nthrow the fish hook into the water then activate this option")

local Toggle2 = Section1:CreateToggle("use this with ANY auto fish", nil, function(State)
toggle = State
local r = Random.new()
        
while toggle do

wait(0.01)
local children = game.Players.LocalPlayer.PlayerGui.FishBubbles:GetChildren()
local count = #children

end -- TUGLADILSON

--wait(600)
-- clone the FishBubbles
--local penis = game.Players.LocalPlayer.PlayerGui.FishBubbles:Clone()
--penis.Parent = game.Players.LocalPlayer.PlayerGui

--local vim = game:GetService("VirtualInputManager")
--vim:SendKeyEvent(true, "One", false, nil)
--wait(r:NextNumber(3.5, 5.7))
--local vim = game:GetService("VirtualInputManager")
--vim:SendKeyEvent(true, "One", false, nil)
-- the cloned FishBubbles have the name FishBubbles1
 --instance = game.Players.LocalPlayer.PlayerGui.FishBubbles
 --instance.Name = "FishBubbles1"

            --game.Players.LocalPlayer.PlayerGui.FishBubbles1:Destroy()
-- now the FishBubbles1 die

--local vuser = game:GetService("VirtualUser")
--vuser:CaptureController()
--vuser:ClickButton1(Vector2.new())

end)


Section1:CreateLabel("Chest and Items")
 
local Toggle4 = Section1:CreateToggle("Collect Items", nil, function(State)
    toggle = State
        while toggle do
            wait(0.3)
            if game.Workspace.DroppedItems:FindFirstChildOfClass("Model") then
             for i, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                if v:IsA("Model") then
                        print("larry")
                        teleport(v.Handle.CFrame)
                        for i, x in pairs(v:GetChildren()) do
                            if string.match(x.Name, "Model") then
                                teleport(x.Handle.CFrame)
                                wait(3)  
                                end                                
                            end
                        break
                     end
                  end
            end
        end
    end
end)

local Toggle9 = Section1:CreateToggle("Random Chest", nil, function(State)
    toggle = State
        while toggle do

local children = game.Workspace.RandomChests:GetChildren()
local count = #children

print(count)            
if count == 0 then

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
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport(0)

end

if count >= 1 then

                wait(0.3)
                for i, v in pairs(game.Workspace.RandomChests:GetChildren()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                            count1 = count
                        teleport (v.Bottom.CFrame)
                            repeat
                        wait(.05)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                            until count1 < count
                        end                            
                    end
                end            
        end
    end
end)
 
local Toggle5 = Section1:CreateToggle("Suken Chest", nil, function(State)
    toggle = State
        while toggle do
            wait(5)
             for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "ShipModel") then
                        teleport(v.HitBox.CFrame)
                        for i, x in pairs(v:GetChildren()) do
                            if string.match(x.Name, "Chest_") then
                                teleport(x.HumanoidRootPart.CFrame)
                                wait(.1)
                                fireproximityprompt(x.HumanoidRootPart.ProximityPrompt)    
                            end                                
                        end
                    break
                 end
              end
        end
end)
---------------------------------------------------------------------
Section1:CreateLabel("Teleport")
 
local Dropdown2 = Section1:CreateDropdown("Store", {"Boat Store","Raygan's Tavern","Supplies Store", "Bait Store", "Pets Store"}, function(String)
    locationSelected = String
end)
 
local Button1 = Section1:CreateButton("Teleport", function()
    if locationSelected == "Boat Store" then
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("BoatShopInterior", "Inside")
        elseif locationSelected == "Raygan's Tavern" then
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("TavernInterior", "Inside")
        elseif locationSelected == "Supplies Store" then
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("SuppliesStoreInterior", "Inside")  
        elseif locationSelected == "Bait Store" then
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("BaitShop", "MainEntrance")        
        elseif locationSelected == "Pets Store" then
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("PetShop", "MainEntrance")
    end
end)
 
local Dropdown3 = Section1:CreateDropdown("Location", {"Port Jackson","Ancient Shores","Shadow Isles", "Pharaoh's Dunes", "Eruption Island", "Monster's Borough", "Suken Ship"}, function(String)
    locationSelected = String
end)
 
local Button2 = Section1:CreateButton("Teleport", function()
    if locationSelected == "Port Jackson" then
        teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))           
        elseif locationSelected == "Ancient Shores" then
        teleport(CFrame.new(127.998779296875, 58.22438049316406, -124.70226287841797))
        wait(.7)
        teleport(CFrame.new(-2436.431640625, 43.564971923828, -1683.4526367188))    
        elseif locationSelected == "Shadow Isles" then
        teleport(CFrame.new(127.998779296875, 58.22438049316406, -124.70226287841797)) 
        wait(.7)
        teleport(CFrame.new(2196.9926757812, 43.491630554199, -2216.4543457031))    
        elseif locationSelected == "Pharaoh's Dunes" then
        teleport(CFrame.new(127.998779296875, 58.22438049316406, -124.70226287841797)) 
        wait(.7)
        teleport(CFrame.new(-4142.74609375, 46.71378326416, 262.05679321289))
        elseif locationSelected == "Eruption Island" then
        teleport(CFrame.new(127.998779296875, 58.22438049316406, -124.70226287841797)) 
        wait(.7)
        teleport(CFrame.new(3022.9311523438, 52.347640991211, 1323.74609375))
        elseif locationSelected == "Monster's Borough" then
        teleport(CFrame.new(127.998779296875, 58.22438049316406, -124.70226287841797))
        wait(.7)
        teleport(CFrame.new(-3211.9047851562, 41.850345611572, 2735.306640625))  
        elseif locationSelected == "Suken Ship" then
             for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "ShipModel") then
                        teleport(v.HitBox.CFrame)
                    break
                 end
              end                               
    end
end)
 
Section2:CreateLabel("Boats")
 
local Slider1 = Section2:CreateSlider("Boat Speed", 0,150,nil,true, function(Value)
 for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             v.Controller.VehicleSeat.MaxSpeed = tonumber(Value)
         end
    end   
end)
 
local Button3 = Section2:CreateButton("Tp to Boat", function()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             teleport(v.Controller.VehicleSeat.CFrame + Vector3.new(0, 3.25, 0))
        end
    end
end)

--[[local Button4 = Section2:CreateButton("Remove Borders", function()
    for i, v in pairs(game.Workspace.IgnoredByMouse.BoatBorders:GetChildren()) do
        v:Destroy()
    end
end)   
 ]]
Section2:CreateLabel("Pets")
 
 
local Dropdown4 = Section2:CreateDropdown("Egg's and Chest", {"Royal - Egg","Normal - Egg","Ruby - Egg", "Void - Egg", "Silver - Chest", "Stone - Chest", "Gold - Chest"}, function(String)
    eggsandchest = String
end)
 
local Button8 = Section2:CreateButton("Buy", function()
    if eggsandchest == "Royal" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("royalegg")

        elseif eggsandchest == "Normal - Egg" then
       
 game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("normalegg")
        
        elseif eggsandchest == "Ruby - Egg" then
       
 game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("rubyegg")
        
        elseif eggsandchest == "Void - Egg" then
       
 game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("voidegg")
        
        elseif eggsandchest == "Silver - Chest" then
       
 game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("silverchest")
        
        elseif eggsandchest == "Stone - Chest" then
       
 game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("stonechest")
        
        elseif eggsandchest == "Gold - Chest" then
       
 game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("goldchest")       

    end
end)

Section2:CreateLabel("Misc")
 
 
local Button8 = Section2:CreateButton("hey, click HERE", function()
setclipboard("i like kaede to suzu the animation")
        wait(1)
loadstring(game:HttpGet(('https://pastebin.com/raw/yynzQp3T' ),true))()
end) 

--Button8:AddToolTip("if the auto kill doesn't work \nopen the raw script and go to the line 154 and change 'Handle' per 'GripC1' \n \nand one more thing, don't click here")

local Button5 = Section2:CreateButton("Rejoins", function()
tpservice:Teleport(game.PlaceId, plr)
end) 
 
local Button6 = Section2:CreateButton("Server Hop", function()
switchServer()
end)   
 
local Button7 = Section2:CreateButton("Discord", function()
--  getgenv().InviteCode = "ngVB6bkb"

getgenv().InviteCode = "Kaede To Suzu The Animation"

--loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/Discord-Auto-Join.lua"))()
--no Work
--by TweedLeak#4003
end)
 
Button7:AddToolTip("Hi: \nif you want to report a problem mention me and i will do my best \n(i'm really trash and newbie scripter) \nmy discord nick:᲼᲼᲼᲼#5125\nClick to copy my nick")
setclipboard("᲼᲼᲼᲼#5125")
end)

local Toggle7 = Section2:CreateToggle("UI Toggle", nil, function(State)
    Window:Toggle(State)
end)
 
Toggle7:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
    Config.Keybind = Enum.KeyCode[Key]
end)    
Toggle7:SetState(true)
 
EquipTool()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
    EquipTool()
end)
