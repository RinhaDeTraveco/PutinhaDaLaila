function teleport(loc)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc
end

wait(3)
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

wait(3)
    
end


if count >= 1 then

                wait(0.3)
                for i, v in pairs(game.Workspace.RandomChests:GetChildren()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        teleport (v.Bottom.CFrame)
                        wait(1.5)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
        end

wait(1.5)

if count >= 1 then

                wait(0.3)
                for i, v in pairs(game.Workspace.RandomChests:GetChildren()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        teleport (v.Bottom.CFrame)
                        wait(1.5)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
        end
