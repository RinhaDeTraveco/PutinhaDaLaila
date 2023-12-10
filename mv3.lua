if game.Players.LocalPlayer.Name:find("Seiki") then return end
repeat 
	task.wait() 
until game:IsLoaded() 
	and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") 
	and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LoadingMessage.Visible == false

for i,v in pairs(workspace.Decorations["Diamond Mask Hall"]:GetChildren()) do
    if v:FindFirstChild("GateScript") and v.Name == "Part" then
        v.CanTouch = false
    end
end

workspace.Decorations["30BeeZone"].Pit.CanTouch = false

if not LPH_OBFUSCATED then
    getgenv().LPH_NO_VIRTUALIZE = function(...) return coroutine.wrap(...) end
    getgenv().LPH_JIT = function(...) return ... end 
    getgenv().LPH_STRENC = function(str) return str end
end

local scriptType = LPH_STRENC("Paid")

ExploitSpecific = "📜"
Danger = "⚠️"
Star = "⭐"

-- Variables
local VirtualInputManager = game:GetService('VirtualInputManager')
local PathfindingService = game:GetService('PathfindingService')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local UserService = game:GetService("UserService")
local HttpService = game:GetService('HttpService')
local VirtualUser = game:GetService('VirtualUser')
local RunService = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local Lighting = game:GetService('Lighting')
local CoreGui = game:GetService('CoreGui')
local Players = game:GetService('Players')

local RoboBear = Workspace.NPCs:WaitForChild("Robo Bear")
local dupedTokensFolder = Workspace.Camera.DupedTokens
local EventsDir = ReplicatedStorage.Events
local FlowerZones = Workspace.FlowerZones
local Flowers = Workspace.Flowers

local Activatables = ReplicatedStorage.Activatables
local MemoryMatchManager = ReplicatedStorage.MemoryMatchManager
local MemoryMatchGui = ReplicatedStorage.Gui.MemoryMatch

-- Modules
local ActivatablesHives = require(ReplicatedStorage.Activatables.Hives)
local ActivatablesToys = require(ReplicatedStorage.Activatables.Toys)
local ActivatablesNPC = require(ReplicatedStorage.Activatables.NPCs)
local ActivatablesPlanters = require(ReplicatedStorage.Activatables.Planter)

local ScreenInfo = require(ReplicatedStorage.ScreenInfo)
local Events = require(ReplicatedStorage.Events)
local Quests = require(ReplicatedStorage.Quests)
local RoboBearGui = require(game.ReplicatedStorage.Gui.RoboBearGui)

local PlanterTypes = require(ReplicatedStorage.PlanterTypes)
local NectarTypes = require(ReplicatedStorage.NectarTypes)
local EggTypes = require(ReplicatedStorage.EggTypes)
local BeeTypes = require(ReplicatedStorage.BeeTypes)

local LocalPlanters = require(ReplicatedStorage.LocalPlanters)
local Accessories = require(ReplicatedStorage.Accessories)
local Collectors = require(ReplicatedStorage.Collectors)

local checkAccessory = require(ReplicatedStorage.ItemPackages.Accessory).PlayerHas
local checkTool = require(ReplicatedStorage.ItemPackages.Collector).PlayerHas
local BuffTileModule = require(ReplicatedStorage.Gui.TileDisplay.BuffTile)
local ClientMonsterTools = require(ReplicatedStorage.ClientMonsterTools)
local MemoryMatchModule = require(ReplicatedStorage.Gui.MemoryMatch)
local ClientStatCache = require(ReplicatedStorage.ClientStatCache)
local MinigameGui = require(ReplicatedStorage.Gui.MinigameGui)
local MonsterTypes = require(ReplicatedStorage.MonsterTypes)
local timeToString = require(ReplicatedStorage.TimeString)
local AlertBoxes = require(ReplicatedStorage.AlertBoxes)
local StatTools = require(ReplicatedStorage.StatTools)
local StatReqs = require(ReplicatedStorage.StatReqs)
local ServerTime = require(ReplicatedStorage.OsTime)

local PlayerActivesCommand = ReplicatedStorage.Events.PlayerActivesCommand
local RetrievePlayerStats = ReplicatedStorage.Events.RetrievePlayerStats

local ScreenGui = ScreenInfo:GetScreenGui()



-- getgenv().api = loadstring(game:HttpGet("https://raw.githubusercontent.com/Narnia1337/hi/main/api.lua"))()
-- getgenv().api = loadstring(game:HttpGet("https://ok-1.f83710296.repl.co/mv3/api.lua"))()
local bssapi = loadstring(game:HttpGet("https://raw.githubusercontent.com/Narnia1337/hi/main/bssapi.lua"))()
local library, api
do
local Library = {Enabled = true, SelectedTab = nil};

local UIS = game:GetService("UserInputService")
local AllElements = {}
local object = game:GetObjects("rbxassetid://14035404766")[1] --game:GetObjects("rbxassetid://14026953771")
local elements = object["UIElements"]
local mainUi = object["LibraryUI"]

function getElementsCount(elementText)
    local count = 0
    for i,v in pairs(AllElements) do
        if i:find(elementText) then count = count + 1 end
    end
    return count
end

function resize(object, isCanvas, count, extraPixels, maximumPixels)
	local totalHeight = object.UIListLayout.AbsoluteContentSize.Y + object.UIListLayout.Padding.Offset * (#object:GetChildren() - (count + 1))
	local newHeight = ((maximumPixels or math.huge) > totalHeight and (extraPixels and extraPixels + totalHeight or totalHeight) or maximumPixels)
	if isCanvas then
		object.CanvasSize = UDim2.new(object.Size.X.Scale, object.Size.X.Offset, 0, newHeight)
		return UDim2.new(object.Size.X.Scale, object.Size.X.Offset, 0, newHeight)
	else
		object.Size = UDim2.new(object.Size.X.Scale, object.Size.X.Offset, 0, newHeight)
		return UDim2.new(object.Size.X.Scale, object.Size.X.Offset, 0, newHeight)
	end
end

function Library:Init()
	local SearchbarTable = {Toggle = false, Hover = false, ThemeEnabled = false}
	local window = mainUi:Clone()
	window.Name = "MV3"
	local function fadeUi(shush)
		for i, v in pairs(shush.Parent:GetDescendants()) do
			if v.ClassName:lower():find("ui") then continue end
			--[[if shush.ClassName:lower():find("text") then
				game:GetService("TweenService"):Create(shush, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
			end
			game:GetService("TweenService"):Create(shush, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
]]			if v.ClassName:lower():find("text") then
				game:GetService("TweenService"):Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
			end
			game:GetService("TweenService"):Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
		end
	end
	window.MainFrame.TopBar.Themes.TextButton.MouseButton1Up:connect(function()
		if SearchbarTable.ThemeEnabled then
			SearchbarTable.ThemeEnabled = false
			game:GetService("TweenService"):Create(window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0.403, 0, 0, 0), BackgroundTransparency = 1}):Play()
			game:GetService("TweenService"):Create(window.MainFrame.TopBar.Themes, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = 0}):Play()
			window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame.Frame.Visible = false
			task.wait(0.6)
			window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame.Visible = false
		else
			SearchbarTable.ThemeEnabled = true
			game:GetService("TweenService"):Create(window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0.403, 0,0.367, 0), BackgroundTransparency = 0}):Play()
			game:GetService("TweenService"):Create(window.MainFrame.TopBar.Themes, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = 180}):Play()
			window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame.Visible = true
			task.wait(0.5)
			window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame.Frame.Visible = true
		end
	end)
	getgenv().windowa = function()
		return window
	end
	local imageLabel = window.MainFrame.SubFrame.LinesAndFrames.ImageLabel
	imageLabel.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=420&h=420", game.Players.LocalPlayer.UserId)
	imageLabel.Parent["PName"].Text = (not LPH_OBFUSCATED and "Hidden") or game.Players.LocalPlayer.Name

	-- window.Parent = player.PlayerGui

	if gethui then
		if gethui():FindFirstChild("MV3") then gethui().MV3:Destroy() end
		window.Parent = gethui()
	elseif not game:IsStudio() then
		if game.CoreGui:FindFirstChild("MV3") then game.CoreGui.MV3:Destroy() end
		window.Parent = game.CoreGui
	else
		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MV3") then game.Players.LocalPlayer.PlayerGui.MV3:Destroy() end
		window.Parent = game.Players.LocalPlayer.PlayerGui
	end

	do
		local UIS = game:GetService("UserInputService")
		function dragify(Frame)
			dragToggle = nil
			local dragSpeed = 0.8
			dragInput = nil
			dragStart = nil
			local dragPos = nil
			function updateInput(input)
				local Delta = input.Position - dragStart
				local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
				game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed/10), {Position = Position}):Play()
			end
			Frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
					dragToggle = true
					dragStart = input.Position
					startPos = Frame.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
			Frame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragToggle then
					updateInput(input)
				end
			end)
		end
		dragify(window.MainFrame)
	end

	local SearchBar = window.MainFrame.SubFrame.SearchBar.SearchbarTextbox
	local ResultElements = SearchBar.Parent.ElementsList
	SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
		Library:Search(SearchBar.Text)
		-- print(SearchBar.Text)
	end)

	function Library:ToggleSearchBar()
		if not SearchbarTable.Toggle then
			game:GetService("TweenService"):Create(SearchBar, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
			game:GetService("TweenService"):Create(SearchBar.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0, Position = UDim2.new(SearchBar.Parent.Position.X.Scale, SearchBar.Parent.Position.X.Offset, SearchBar.Parent.Position.Y.Scale, 40)}):Play()
		else
			game:GetService("TweenService"):Create(SearchBar, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
			game:GetService("TweenService"):Create(SearchBar.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 1, Position = UDim2.new(SearchBar.Parent.Position.X.Scale, SearchBar.Parent.Position.X.Offset, SearchBar.Parent.Position.Y.Scale, -20)}):Play()
		end
	end


	SearchBar.Parent.MouseEnter:Connect(function()
		SearchbarTable.Hover = true
	end)
	ResultElements.MouseEnter:Connect(function()
		SearchbarTable.Hover = true
	end)
	ResultElements.MouseLeave:Connect(function()
		SearchbarTable.Hover = false
	end)

	UIS.InputEnded:Connect(function(input, gpe)
		local TextBoxFocused = UIS:GetFocusedTextBox()

		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Semicolon and not gpe then
			if TextBoxFocused then
				return
			end
			Library:ToggleSearchBar()
			SearchBar:CaptureFocus()
			SearchbarTable.Toggle = true
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 and SearchbarTable.Toggle and not SearchbarTable.Hover then
			Library:ToggleSearchBar()
			SearchbarTable.Toggle = false
			for i, v in pairs(ResultElements:GetChildren()) do
				if v.Name:find("ListLayout") then continue end
				fadeUi(v) 
				task.wait(.7)
				for i, v in pairs(ResultElements:GetChildren()) do if v.Name:find("ListLayout") then continue end v:Destroy() end
				return
			end
		end
	end)
	function Library:ShowResult(results)
		for i, v in pairs(ResultElements:GetChildren()) do if v.Name:find("ListLayout") then continue end v:Destroy() end
		for i, v in pairs(results) do
			for e, r in pairs(AllElements) do
				if r["Name"] == v and r["Tag"] == "Toggle" then
					local toggleFrame = r.toggleFrame:Clone()
					local UiCorner = elements.SearchStuff.UICorner:Clone()
					local UiPadding = elements.SearchStuff.UIPadding:Clone()
					local SupportFrame = elements.SearchStuff.SupportFrame:Clone()
					UiCorner.Parent = toggleFrame
					UiPadding.Parent = toggleFrame.ToggleText
					SupportFrame.Parent = toggleFrame
					toggleFrame.Parent = ResultElements
					toggleFrame.BackgroundTransparency = 0
					local Callback = function() 
						local succ, err = xpcall(function() return r.callback and r.callback(r.State) or nil end, function(err) warn("[Error]:", err.."(1)") end)
					end
					local function Update() 
						if r.State == true then
							game:GetService("TweenService"):Create(toggleFrame.ToggleButton, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
						else
							game:GetService("TweenService"):Create(toggleFrame.ToggleButton, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
						end
					end
					toggleFrame.ToggleButton.MouseButton1Down:Connect(function()
						r.Set(not r.State)
						Update()
					end)
				elseif r["Name"] == v and r["Tag"] == "Button" then
					local buttonFrame = r.buttonFrame:Clone()
					local UiCorner = elements.SearchStuff.UICorner:Clone()
					local UiPadding = elements.SearchStuff.UIPadding:Clone()
					local SupportFrame = elements.SearchStuff.SupportFrame:Clone()
					UiCorner.Parent = buttonFrame
					UiPadding.Parent = buttonFrame.ButtonText
					SupportFrame.Parent = buttonFrame
					buttonFrame.Parent = ResultElements
					buttonFrame.BackgroundTransparency = 0
					local Callback = function() 
						local succ, err = xpcall(function() return r.callback and r.callback(r.State) or nil end, function(err) warn("[Error]:", err) end)
					end
					buttonFrame.MouseEnter:Connect(function()
						r.Hover = true
					end)

					buttonFrame.MouseLeave:Connect(function()
						r.Hover = false
					end)
				elseif r["Name"] == v and r["Tag"] == "Slider" then
					SliderEnabled = false
					sliderFrame = r.sliderFrame:Clone()
					sliderFrame.SliderText.Text = r.Name
					sliderFrame["Min/Max"].Min.Text = tostring(r.Min)
					sliderFrame["Min/Max"].Max.Text = tostring(r.Max)
					local UiPadding = elements.SearchStuff.UIPadding:Clone()
					local SupportFrame = elements.SearchStuff.SupportFrame:Clone()
					UiPadding.Parent = sliderFrame.SliderText
					SupportFrame.Parent = sliderFrame

					sliderFrame.Parent = ResultElements

					sliderFrame.SliderButton.MouseButton1Down:Connect(function()
						SliderEnabled = true
					end)

					game:GetService("UserInputService").InputEnded:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then
							SliderEnabled = false
						end
					end)

					local ReturnValue = 0

					local function updateSlider(Value, Percentage)
						game:GetService("TweenService"):Create(sliderFrame.CanvasGroup.Fill, TweenInfo.new(0.2, Enum.EasingStyle["Quint"], Enum.EasingDirection["Out"]), {Size = UDim2.new(Percentage, 0, 1, 0)}):Play()

						if r.Precise then
							sliderFrame["Min/Max"].Current.Text = tostring(math.round(Value*100)/100)
							pcall(r.callback, Value)
						else
							local newVal = tostring(math.round(Value))
							if sliderFrame["Min/Max"].Current.Text ~= newVal then
								-- print("Changed")
								sliderFrame["Min/Max"].Current.Text = newVal
								pcall(r.callback, math.round(Value))
							end
						end
					end

					LPH_JIT(function()
						game:GetService("RunService").RenderStepped:Connect(function()
							local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

							if SliderEnabled then
								local Percentage = math.clamp((Mouse.X - sliderFrame.CanvasGroup.AbsolutePosition.X) / sliderFrame.CanvasGroup.AbsoluteSize.X, 0, 1)
								local Value = ((r.Max - r.Min) * Percentage) + r.Min

								ReturnValue = r.Precise and math.round(Value*100)/100 or math.round(Value)

								updateSlider(Value, Percentage)
								r.Set(Value)
							end
						end)
					end)()
				elseif r.Name == v and r["Tag"] == "Box" then
					local inputFrame = r.inputFrame:Clone()
					inputFrame.Parent = ResultElements
					local UiPadding = elements.SearchStuff.UIPadding:Clone()
					local SupportFrame = elements.SearchStuff.SupportFrame:Clone()
					UiPadding.Parent = inputFrame.InputTitle
					SupportFrame.Parent = inputFrame
					local Callback = function(newText) 
						local succ, err = xpcall(function() return r.callback and r.callback(newText) or nil end, function(err) warn("[Error]:", err) end)
					end
					
					inputFrame.TextBox.FocusLost:Connect(function()
						r.CurrentText = inputFrame.TextBox.Text
						Callback(r.CurrentText)
					end)
				elseif r.Name == v and r["Tag"] == "Dropdown" then
					local Toggle = false
					local dropdownFrame = r.dropdownFrame:Clone()
					dropdownFrame.DropdownTitle.Text = r.Name
					dropdownFrame.Parent = ResultElements
					local UiPadding = elements.SearchStuff.UIPadding:Clone()
					local SupportFrame = elements.SearchStuff.SupportFrame:Clone()
					UiPadding.Parent = dropdownFrame.DropdownTitle
					SupportFrame.Parent = dropdownFrame
					local Callback = function() 
						local succ, err = xpcall(function() return r.callback and r.callback(r.Selected) or nil end, function(err) warn("[Error]:", err) end)
					end

					local function Update()
						if Toggle then
							dropdownFrame:WaitForChild("DropdownElements").DropdownContent.Visible = true
							dropdownFrame:WaitForChild("DropdownElements").DropdownContent:TweenSize(r.OldSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.5, true)
							dropdownFrame.ZIndex = 30
						else
							dropdownFrame:WaitForChild("DropdownElements").DropdownContent:TweenSize(UDim2.new(dropdownFrame.DropdownElements.DropdownContent.Size.X.Scale, dropdownFrame.DropdownElements.DropdownContent.Size.X.Offset, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.5, true)
							task.wait(0.5)			
							dropdownFrame:WaitForChild("DropdownElements").DropdownContent.Visible = false
							dropdownFrame.ZIndex = 1
						end
					end

					local deactivateButtons = Instance.new("BindableEvent")

					function reUpdate(newDropdowntable)
						for i,v in pairs(dropdownFrame:WaitForChild("DropdownElements").DropdownContent:GetChildren()) do
							if v.ClassName == "TextButton" then v:Destroy() end
						end

						if not table.find(newDropdowntable, r.Selected) then
							dropdownFrame.DropdownElements.DropdownButton.Text = "Not Selected"
						end

						for i,v in pairs(newDropdowntable) do
							local dropdownContentButton = elements.DropdownContentButton:Clone()
							dropdownContentButton.Text = v or "Unnamed"
							dropdownContentButton.Parent = dropdownFrame.DropdownElements.DropdownContent
							if r.Selected == v then
								dropdownContentButton.BackgroundTransparency = 0
							else
								dropdownContentButton.BackgroundTransparency = 1
							end
							dropdownContentButton.MouseButton1Down:Connect(function()
								deactivateButtons:Fire()
								r.Selected = v
								dropdownContentButton.BackgroundTransparency = 0
								dropdownFrame:WaitForChild("DropdownElements").DropdownButton.Text = "Selected: "..v
								r.dropdownFrame:WaitForChild("DropdownElements").DropdownButton.Text = "Selected: "..v
								Callback()
							end)
							deactivateButtons.Event:Connect(function() 
								dropdownContentButton.BackgroundTransparency = 1
							end)
						end

						r.OldSize = resize(dropdownFrame:WaitForChild("DropdownElements").DropdownContent, false, 3, 0, 210)
						resize(dropdownFrame:WaitForChild("DropdownElements").DropdownContent, true, 3)
						Update()
					end

					dropdownFrame:WaitForChild("DropdownElements").DropdownButton.MouseButton1Down:Connect(function()
						-- print("hewo")
						-- print(Toggle)
						Toggle = not Toggle
						-- print(Toggle)
						Update()
					end)

					reUpdate(r.dropdownList)
				end
			end
		end
	end

	function Library:Search(query)
		if query == "" then return end
		-- print("Querying", query)
		local result = {}
		for i, v in pairs(AllElements) do
			if v.Name:lower():find(query:lower()) and #result < 2 then
				table.insert(result, v.Name)
			end
		end
		Library:ShowResult(result)
	end

	local WindowTable = {}
	
	function WindowTable:AddTheme(id)
		local ThemeSelection = elements.ThemeStuff.ThemeSelection:Clone()
		ThemeSelection.Parent = window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame.Frame
		ThemeSelection.HoverImage = id
		ThemeSelection.Image = id
		ThemeSelection.MouseButton1Up:Connect(function()
			window.MainFrame.SubFrame.FrameBackgroundImage.Image = id
		end)
	end
	
	window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame:WaitForChild("TransparencyT"):GetPropertyChangedSignal("Text"):Connect(function()
        local val = tonumber(window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame.TransparencyT.Text)
		if val then
            if val < 0 then val = 0.6 elseif val > 1 then val = 1 else val = 0.6 + (val * 0.4) end
            -- print(val)
			window.MainFrame.SubFrame.FrameBackgroundImage.ImageTransparency = val
		end
	end)

    window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame:WaitForChild("TransparencyT").Text = "1"
	
	function WindowTable:ChangeValues(value1, value2)
		local Values = window.MainFrame.SubFrame.Values
		Values["Honey/Hr"].ImageLabel.Value.Text = value1
		Values.DailyHoney.ImageLabel.Value.Text = value2
	end

    local function makeTween(obj, time, body)
        game:GetService("TweenService"):Create(obj,TweenInfo.new(time),body):Play()
    end

	function WindowTable:Intro()
		window.MainFrame.Visible = true
		window.MainFrame.SubFrame.Intro.Visible = true
		window.MainFrame.DropShadowHolder.Visible = false
		window.MainFrame.SubFrame.GradientFrame.Visible = false
		window.MainFrame.Containers.Visible = false
		window.MainFrame.SubFrame.LinesAndFrames.Visible = false
		window.MainFrame.SubFrame.Values.Visible = false
		task.wait(.5)
        makeTween(window.MainFrame.SubFrame.FrameBackgroundImage, 3.5, {ImageTransparency=0.6})
        makeTween(window.MainFrame.SubFrame.Intro.MacroText, .3, {TextTransparency=0})
        makeTween(window.MainFrame.SubFrame.Intro.Logo1, .3, {BackgroundTransparency=0})
        makeTween(window.MainFrame.SubFrame.Intro.Logo2, .3, {BackgroundTransparency=0})
        makeTween(window.MainFrame.SubFrame.Intro.Logo3, .3, {BackgroundTransparency=0})
        makeTween(window.MainFrame, .3, {BackgroundTransparency=0})
        task.wait(2.5)
        makeTween(window.MainFrame.SubFrame.Intro.MacroText, .3, {TextTransparency=1})
        makeTween(window.MainFrame.SubFrame.Intro.Logo1, .3, {BackgroundTransparency=1})
        makeTween(window.MainFrame.SubFrame.Intro.Logo2, .3, {BackgroundTransparency=1})
        makeTween(window.MainFrame.SubFrame.Intro.Logo3, .3, {BackgroundTransparency=1})
        makeTween(window.MainFrame, .3, {BackgroundTransparency=0})
        
        task.spawn(function() 
            task.wait(1)
            window.MainFrame.SubFrame.Intro.Visible = false
            window.MainFrame.DropShadowHolder.Visible = true
            window.MainFrame.SubFrame.GradientFrame.Visible = true
            window.MainFrame.Containers.Visible = true
            window.MainFrame.SubFrame.LinesAndFrames.Visible = true
            window.MainFrame.SubFrame.Values.Visible = true
            window.MainFrame.SubFrame.LinesAndFrames.ThemeFrame:WaitForChild("TransparencyT").Text = "0"
        end)
	end

	function WindowTable:Tab(tabName)
		local tabName = tabName or "Unnamed"
		local TabTable = {}

		local tabButton = elements.TabButton:Clone()
		tabButton.Name = tabName.."Button"
		tabButton.TextLabel.Text = tabName
		tabButton.Parent = window.MainFrame.TabList

		resize(window.MainFrame.TabList, true, 1)

		local tabContainer = elements.TabContainer:Clone()
		tabContainer.Name = tabName.."Container"
		tabContainer.Parent = window.MainFrame.Containers

		function TabTable:Enable()
			if Library.SelectedTab then
				Library.SelectedTab:Disable()
			end
			Library.SelectedTab = TabTable
			tabContainer.Visible = true
			tabButton.BackgroundTransparency = 0
		end

		function TabTable:Disable()
			if Library.SelectedTab == TabTable then
				Library.SelectedTab = nil
				tabContainer.Visible = false
				tabButton.BackgroundTransparency = 1
			end
		end

		if Library.SelectedTab == nil then
			TabTable:Enable()
		end

		tabButton.MouseButton1Down:Connect(function()
			TabTable:Enable()
		end)

		function TabTable:Category(categoryName)
			local categoryName = categoryName or "Unnamed"

			local categoryFrame = elements.Category:Clone()
			categoryFrame.Name = categoryName.."Category"
			categoryFrame.CantegoryName.Text = categoryName
			categoryFrame.Parent = tabContainer

			resize(tabContainer, true, 1)
		end

		function TabTable:Button(buttonText, callback)
			local buttonText = buttonText or "Button"
            local btnName = buttonText.."_"..getElementsCount(buttonText)
			AllElements[btnName] = {Tag = "Button", Name = buttonText}
			AllElements[btnName].Hover = false

			AllElements[btnName].buttonFrame = elements.Button:Clone()
			AllElements[btnName].buttonFrame.ButtonText.Text = buttonText
			AllElements[btnName].buttonFrame.Parent = tabContainer
			UIS.InputBegan:Connect(function(inputType, GPEV)
				if inputType.UserInputType == Enum.UserInputType.MouseButton1 and AllElements[btnName].Hover then
					local succ, err = xpcall(callback, function(err) warn("[Error]:", err) end)
					--game:GetService("TweenService"):Create(buttonFrame.ButtonInstance, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
					--game:GetService("TweenService"):Create(buttonFrame.ButtonInstance, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}):Play()
				end
			end)
			AllElements[btnName].buttonFrame.MouseEnter:Connect(function()
				AllElements[btnName].Hover = true
				-- print(AllElements[btnName].Hover)
			end)

			AllElements[btnName].buttonFrame.MouseLeave:Connect(function()
				AllElements[btnName].Hover = false
				-- print(AllElements[btnName].Hover)
			end)

			resize(tabContainer, true, 1)
		end

		function TabTable:Toggle(toggleText, callback)
			local toggleText = toggleText or "Unnamed"

            local toggleName = toggleText.."_"..getElementsCount(toggleText)

			AllElements[toggleName] = {Tag = "Toggle", State = false, Name = toggleText}

			AllElements[toggleName].toggleFrame = elements.Toggle:Clone()
			AllElements[toggleName].toggleFrame.ToggleText.Text = toggleText
			AllElements[toggleName].toggleFrame.Parent = tabContainer
			AllElements[toggleName]["Callback"] = callback

			local Callback = function() 
				local succ, err = xpcall(function() return callback and callback(AllElements[toggleName].State) or nil end, function(err) warn("[Error]:", err) end)
			end
			AllElements[toggleName].Update = function() 
				if AllElements[toggleName].State == true then
					game:GetService("TweenService"):Create(AllElements[toggleName].toggleFrame.ToggleButton, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				else
					game:GetService("TweenService"):Create(AllElements[toggleName].toggleFrame.ToggleButton, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				end
			end

			AllElements[toggleName].Set = function(state)
				if state == true or state == false then
					AllElements[toggleName].State = state
					AllElements[toggleName].Update()
					Callback()
				end
			end

			AllElements[toggleName].toggleFrame.ToggleButton.MouseButton1Down:Connect(function()
				AllElements[toggleName].State = not AllElements[toggleName].State
				AllElements[toggleName].Update()
				Callback()
			end)

			resize(tabContainer, true, 1)

			return AllElements[toggleName]
		end

		function TabTable:Dropdown(dropdownText, dropdownList, callback)
			local dropdownText = dropdownText or "Unnamed"
			local dropdownList = dropdownList or {}

            local ddownName = dropdownText.."_"..getElementsCount(dropdownText)
			AllElements[ddownName] = {Tag = "Dropdown", dropdownList = dropdownList, callback = callback, Selected = nil, Toggle = false, Name = dropdownText}

			AllElements[ddownName].dropdownFrame = elements.Dropdown:Clone()
			AllElements[ddownName].dropdownFrame.DropdownTitle.Text = dropdownText
			AllElements[ddownName].dropdownFrame.Parent = tabContainer

			local Callback = function() 
				local succ, err = xpcall(function() return callback and callback(AllElements[ddownName].Selected) or nil end, function(err) warn("[Error]:", err) end)
			end

			local function Update()
				if AllElements[ddownName].Toggle then
					AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent.Visible = true
					AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent:TweenSize(AllElements[ddownName].OldSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
					AllElements[ddownName].dropdownFrame.ZIndex = 30
				else
					AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent:TweenSize(UDim2.new(AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent.Size.X.Scale, AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent.Size.X.Offset, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
					task.wait(0.2)			
					AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent.Visible = false
					AllElements[ddownName].dropdownFrame.ZIndex = 1
				end
			end

			local deactivateButtons = Instance.new("BindableEvent")

			AllElements[ddownName].Update = function(newDropdowntable)
				for i,v in pairs(AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent:GetChildren()) do
					if v.ClassName == "TextButton" then v:Destroy() end
				end

				if not table.find(newDropdowntable, AllElements[ddownName].Selected) then
					AllElements[ddownName].dropdownFrame.DropdownElements.DropdownButton.Text = "Not Selected" 
				end
               
				for i,v in pairs(newDropdowntable) do
					local dropdownContentButton = elements.DropdownContentButton:Clone()
					dropdownContentButton.Text = tostring(v) or "Unnamed"
					dropdownContentButton.Parent = AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent
					if AllElements[ddownName].Selected == v then
						dropdownContentButton.BackgroundTransparency = 0
					else
						dropdownContentButton.BackgroundTransparency = 1
					end
					dropdownContentButton.MouseButton1Down:Connect(function()
						deactivateButtons:Fire()
						AllElements[ddownName].Selected = v
						dropdownContentButton.BackgroundTransparency = 0
						AllElements[ddownName].dropdownFrame.DropdownElements.DropdownButton.Text = "Selected: "..v
						Callback()
					end)
					deactivateButtons.Event:Connect(function() 
						dropdownContentButton.BackgroundTransparency = 1
					end)
				end
				AllElements[ddownName].OldSize = resize(AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent, false, 3, 0, 210)
				resize(AllElements[ddownName].dropdownFrame.DropdownElements.DropdownContent, true, 3)
				Update()
			end

			AllElements[ddownName].Set = function(to)
				if to == nil then return end
				if table.find(AllElements[ddownName].dropdownList, to) then
					AllElements[ddownName].Selected = to
					AllElements[ddownName].dropdownFrame.DropdownElements.DropdownButton.Text = "Selected: "..AllElements[ddownName].Selected
					Callback(to)
				end
			end

			AllElements[ddownName].dropdownFrame.DropdownElements.DropdownButton.MouseButton1Down:Connect(function()
				AllElements[ddownName].Toggle = not AllElements[ddownName].Toggle
				Update()
			end)

            coroutine.wrap(function() 
                AllElements[ddownName].Update(dropdownList)
            end)()

			return AllElements[ddownName]
		end

		function TabTable:Label(labelText)
			local labelText = labelText or "Label"

			local LabelTable = {Tag = "Label"}

			local labelFrame = elements.Label:Clone()
			labelFrame.LabelText.Text = labelText
			labelFrame.Parent = tabContainer

			function LabelTable.Set(newLabelText)
				local newLabelText = newLabelText or labelFrame.LabelText.Text
				labelFrame.LabelText.Text = newLabelText
			end

            function LabelTable.Get()
				return labelFrame.LabelText.Text
			end

			return LabelTable
		end

		function TabTable:Input(inputText, placeholder, callback)
			local inputText = inputText or "Label"

            local inptName = inputText.."_"..getElementsCount(inputText)

			AllElements[inptName] = {Tag = "Box", CurrentText = nil, Name = inputText, callback = callback}

			AllElements[inptName].inputFrame = elements.Input:Clone()
			AllElements[inptName].inputFrame.InputTitle.Text = inputText
			AllElements[inptName].CurrentText = inputText
			AllElements[inptName].inputFrame.Parent = tabContainer

			local Callback = function(newText) 
				local succ, err = xpcall(function() return callback and callback(newText) or nil end, function(err) warn("[Error]:", err) end)
                --callback(newText)
			end

			AllElements[inptName].inputFrame.TextBox.FocusLost:Connect(function()
				AllElements[inptName].CurrentText = AllElements[inptName].inputFrame.TextBox.Text
				Callback(AllElements[inptName].CurrentText)
			end)

			return AllElements[inptName]
		end

		function TabTable:Slider(sliderText, callback, options)
			local sliderText = sliderText or "Unnamed"
			local Min = options.Min or 0
			local Max = options.Max or 1
			local Default = tonumber(options.Default) or 0
			local Precise = options.Precise or false

			if Default >= Max then 
				Default = Max 
			elseif Default <= Min then 
				Default = Min 
			end

            local sliderName
            if sliderText:find("Harvest") then
                local tempText = string.gsub(sliderText, " %%", "")
                -- warn(tempText)
                sliderName = tempText.."_"..getElementsCount(tempText)
                -- warn(sliderName)
            else
                sliderName = sliderText.."_"..getElementsCount(sliderText)
            end

			AllElements[sliderName] = {Tag = "Slider", Name = sliderText, Min = Min, Max = Max, Default = Default, Precise = Precise}
			local SliderEnabled = false

			AllElements[sliderName].sliderFrame = elements.Slider:Clone()
			AllElements[sliderName].sliderFrame.SliderText.Text = sliderText
			AllElements[sliderName].sliderFrame["Min/Max"].Min.Text = tostring(Min)
			AllElements[sliderName].sliderFrame["Min/Max"].Max.Text = tostring(Max)

			AllElements[sliderName].sliderFrame.Parent = tabContainer

			AllElements[sliderName].sliderFrame.SliderButton.MouseButton1Down:Connect(function()
				SliderEnabled = true
			end)

			game:GetService("UserInputService").InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					SliderEnabled = false
				end
			end)

			local ReturnValue = Default or 0

			local function updateSlider(Value, Percentage)
				game:GetService("TweenService"):Create(AllElements[sliderName].sliderFrame.CanvasGroup.Fill, TweenInfo.new(0.2, Enum.EasingStyle["Quint"], Enum.EasingDirection["Out"]), {Size = UDim2.new(Percentage, 0, 1, 0)}):Play()

				if Precise then
					AllElements[sliderName].sliderFrame["Min/Max"].Current.Text = tostring(math.round(Value*100)/100)
					xpcall(callback, function(err) warn("[Error]:", err) end, Value)
				else
					local newVal = tostring(math.round(Value))
					if AllElements[sliderName].sliderFrame["Min/Max"].Current.Text ~= newVal then
						-- print("Changed")
						AllElements[sliderName].sliderFrame["Min/Max"].Current.Text = newVal
						xpcall(callback, function(err) warn("[Error]:", err) end, math.round(Value))
					end
				end
			end

			LPH_JIT(function()
				game:GetService("RunService").RenderStepped:Connect(function()
					local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

					if SliderEnabled then
						local Percentage = math.clamp((Mouse.X - AllElements[sliderName].sliderFrame.CanvasGroup.AbsolutePosition.X) / AllElements[sliderName].sliderFrame.CanvasGroup.AbsoluteSize.X, 0, 1)
						local Value = ((Max - Min) * Percentage) + Min

						ReturnValue = Precise and math.round(Value*100)/100 or math.round(Value)

						updateSlider(Value, Percentage)
					end
				end)
			end)()

			AllElements[sliderName].Get = function()
				return ReturnValue
			end

			AllElements[sliderName].Set = function(Value)
				if Value == nil then
					Value = Min
				end
				if Value >= Max then 
					Value = Max
				elseif Value <= Min then
					Value = Min
				end

				local Percentage = math.clamp((Value - Min) / (Max - Min), 0, 1)
				local Value = ((Max - Min) * Percentage) + Min

				ReturnValue = Precise and math.round(Value*100)/100 or math.round(Value)

                updateSlider(Value, Percentage)
			end

            AllElements[sliderName].Set(Default)

            if tonumber(options.ExtraPixels) then
                resize(tabContainer, true, 1, tonumber(options.ExtraPixels), 1770)
            end

			return AllElements[sliderName]
		end
		return TabTable
	end

	return WindowTable
end

library = Library
end

do
    if not setreadonly then game.Players.LocalPlayer:Kick("x.synapse.to") end

    setreadonly(table, false)
    
    local ver = 0
    
    local mv2 = {}
    mv2['generaterandomstring'] = function(a)
        local let = ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'):split('')
        local string = '' 
        for i = 1, a do 
            string = string..let[math.random(1, #let)]
        end 
        return string 
    end
    mv2["humanoidrootpart"] = function()
        return game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end
    mv2["humanoid"] = function() 
        return game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
    end
    mv2["tween"] = function(speed, pos)
        if mv2.humanoidrootpart() then
        if typeof(pos) == "CFrame" then pos = pos.p end
            local speed = (mv2.humanoidrootpart().Position - pos).Magnitude / speed
            game:GetService("TweenService"):Create(mv2.humanoidrootpart(), TweenInfo.new(speed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)}):Play() task.wait(speed)
        end
    end
    mv2["walkTo"] = function(Pos)
        if mv2.humanoid() then
            mv2.humanoid():MoveTo(Pos)
        end
    end
    mv2["isExist"] = function(obj)
        NewObjName = mv2.generaterandomstring(10)
        oldObjName = obj and obj.Name
        obj.Name = NewObjName
        if obj ~= nil or obj.Parent:FindFirstChild(NewObjName) then
            obj.Name = oldObjName
            return true
        else
            return false
        end
    end
    mv2["player"] = game.Players.LocalPlayer
    mv2["notify"] = function(title, description, duration)
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = title;
                Text = description;
                Duration = duration;
            })
        end)
    end
    mv2["isSynapse"] = function()
        if syn then
            return true
        else
            return false
        end
    end
    mv2["isSynV3"] = function()
        local exploit = identifyexecutor and table.concat({ identifyexecutor() }, " ") or "Unknown"
        if exploit:gmatch("/") then
            exploit = exploit:split("/")[1]
        end
        if mv2.isSynapse() and exploit:lower():match("v3") then
            return true
        end
        return false
    end
    mv2['isKrnl'] = function()
        if Krnl then
            return true
        else
            return false
        end
    end
    mv2['isScriptWare'] = function()
        if identifyexecutor and tostring(identifyexecutor()):match("ScriptWare") then return true end
    end
    mv2['isFluxus'] = function()
        if identifyexecutor and tostring(identifyexecutor()):match("Fluxus") then return true end
    end
    mv2['isElectron'] = function()
        if identifyexecutor and tostring(identifyexecutor()):match("Electron") then return true end
    end
    mv2["isValyse"] = function()
        if identifyexecutor and tostring(identifyexecutor()):lower():find("val") then return true end
    end
    mv2['ver'] = ver
    mv2['magnitude'] = function(v1, v2)
        -- print(mv2.humanoidrootpart().Position, v2, v1)
        return ((v2 or mv2.humanoidrootpart().Position) - v1).magnitude
        -- return (v1-v2).Magnitude
    end
    mv2['afunc'] = function(f)
        local wa = coroutine.create(
        function()
            f()
        end)
        coroutine.resume(wa)
    end
    mv2["getField"] = function(part)
        part = part or mv2.humanoidrootpart()
        local ray = Ray.new(part.Position+Vector3.new(0, -35, 0), Vector3.new(0,100, 0))
        local hit, hitPos = workspace:FindPartOnRayWithWhitelist(ray, {game.Workspace.FlowerZones})
        if hit and hit.Parent.Name == "FlowerZones" then
            return hit
        else
            return nil
        end
    end
    
    mv2['tableFind'] = function(tt, va)
        for i,v in pairs(tt) do
            if v == va then
                return i
            end
        end
    end
    
    mv2['findValue'] = function(Table, Value)
        if type(Table) == "table" then
            for index, value in pairs(Table) do
                if value == Value then
                    return true
                end
            end
        else
            return false
        end
        return false
    end
    mv2['returnValue'] = function(tab, val)
        ok = false
        for i,v in pairs(tab) do
            if string.match(val, v) then
                ok = v
                break
            end
        end
        return ok
    end
    
    do -- secure_call things
        local oldt;oldt = hookfunction(getrenv().debug.traceback, function(lol) -- prevent debug.traceback detection
            local traceback = oldt(lol)
            if checkcaller() then
                local a = traceback:split("\n")
                return string.format("%s\n%s\n", a[1], a[3])
            end
            return traceback
        end)
        local oldi;oldi = hookfunction(getrenv().debug.info, function(lvl, a) -- prevent debug.info detection
            if checkcaller() then
                return oldi(3, a)
            end
            return oldi(lvl, a)
        end)
    end
    
    getgenv().secureCall = function(Function, Script, ...)
        assert(Script ~= nil or typeof(Script) == "Instance", string.format("invalid argument #1 to '%s' (table expected, got %s)", "secureCall", typeof(Script)))
        assert(Function ~= nil or typeof(Function) == "function", string.format("invalid argument #2 to '%s' (table expected, got %s)", "secureCall", typeof(Function)))
        assert(Script.ClassName == "LocalScript" or Script.ClassName == "ModuleScript", string.format("bad argument to #3 to '%s' (LocalScript or ModuleScript expected, got %s)", "secureCall", Script.ClassName))
    
        if mv2.isSynV3() then
            local Info = debug.getinfo(Function)
            local Options = {
                script = Script,
                identity = 2,
                env = getsenv(Script),
                thread = getscriptthread and getscriptthread(Script)
            }
            local Callstack = {Info}
    
            return syn.trampoline_call(Function, Callstack, Options, ...)
        elseif mv2.isSynapse() then
            return syn.secure_call(Function, Script, ...)
        elseif mv2.isKrnl() then
            return coroutine.wrap(function(...)
                setthreadcontext(2)
                setfenv(0, getsenv(Script))
                setfenv(1, getsenv(Script))
                return Function(...)
            end)(...)
        elseif mv2.isScriptWare() then
            local func, env = Function, Script
            local functype, envtype = typeof(func), typeof(env)
            assert(functype == "function", string.format("bad argument #1 to 'secure_call' (function expected, got %s)", functype))
            assert(envtype == "Instance", string.format("bad argument #2 to 'secure_call' (Instance expected, got %s)", envtype))
            local envclass = env.ClassName
            assert(envclass == "LocalScript" or envclass == "ModuleScript", string.format("bad argument #2 to 'secure_call' (LocalScript or ModuleScript expected, got %s)", envclass))
            local _, fenv = xpcall(function()
                return getsenv(env)
            end, function()
                return getfenv(func)
            end)
            return coroutine.wrap(function(...)
                setidentity(2)
                setfenv(0, fenv)
                setfenv(1, fenv)
                return func(...)
            end)(...)
        elseif mv2.isElectron() or mv2.isFluxus() or mv2.isValyse() then
            return coroutine.wrap(function(...)
                setthreadcontext(2)
                setfenv(0, getsenv(Script))
                setfenv(1, getsenv(Script))
                return Function(...)
            end)(...)
        else
            return coroutine.wrap(function(...) 
                (set_thread_identity or setthreadcontext)(2)
                return Function(...)
            end)(...)
        end
    end
    
    setreadonly(table, false)
    
    api = mv2
end

player = Players.LocalPlayer

local plantersCacheFilePath = "macrov3/plantercache/"..player.Name.."_customPlantersCache.json"
if not isfolder("macrov3") then makefolder("macrov3") end
if not isfolder("macrov3/plantercache") then makefolder("macrov3/plantercache") end
warn(plantersCacheFilePath)
-- Destroy other macro v2 guis
if gethui then
    for i, v in pairs(gethui():GetDescendants()) do
        if v:IsA("TextLabel") then
            if v.Text:find("Macro V") then
                v.Parent.Parent:Destroy()
            end
        end
    end
else
    for i, v in pairs(CoreGui:GetDescendants()) do
        if v:IsA("TextLabel") then
            if v.Text:find("Macro V") then
                v.Parent.Parent:Destroy()
            end
        end
    end    
end

local currentMacroV2LoadedAt = tick()
getgenv().macroV2LoadedAt = currentMacroV2LoadedAt

plrHive = nil
httpreq = (syn and syn.request) or http_request or (http and http.request) or request
setIdentity = (syn and syn.set_thread_identity) or setthreadcontodo or setidentity or setthreadidentity or set_thread_identity
getIdentity = (syn and syn.get_thread_identity) or getidentity or getthreadidentity or get_thread_identity
local origThreadIdentity = getIdentity and getIdentity() or 8

local Tasks = {_LIST={}}
function Tasks:Add(taskName, taskFunction, isLuraphNoVirtualize)
    local spawnedtask
    if isLuraphNoVirtualize then
        spawnedtask = task.spawn(function() 
            LPH_NO_VIRTUALIZE(function() taskFunction() end)()
        end)
    else
        spawnedtask = task.spawn(taskFunction)
    end
    if spawnedtask then
        Tasks._LIST[taskName] = spawnedtask
    end
end

function Tasks:Cancel(taskName)
    if Tasks._LIST[taskName] ~= nil then
        pcall(function()
            task.cancel(Tasks._LIST[taskName])
            print("cancelled")
        end)
        Tasks._LIST[taskName] = nil 
    end
end
function Tasks:Get(taskName)
    if Tasks._LIST[taskName] ~= nil then
        return Tasks._LIST[taskName]
    end
end
function Tasks:CancelAll()
    for i,v in pairs(Tasks._LIST) do
        -- print("Stopping \""..i.."\"")
        pcall(function() 
            task.cancel(v)
            -- print("Stopped \""..i.."\"")
        end)
    end
end

getgenv().macrov2 = {
    toggles = {
        autodispensers = false,
        autoboosters = false,
        automemorymatch = false,

        -- Autofarm settings
        autofarm = false,
        autodig = false,
        converthiveballoon = false,
        convertHoney = true,

        autoPlanters = false,

        -- Local Player Settings
        speedhack = false,

        --auto Toys
        autoMotherHouse = false,
        autoWealthClock = false,
        autoHoneystorm = false,
        autoFreeAntPass = false,
        autoFreeRoboPass = false,

        --auto Beesmas Toys
        autoSamovar = false,
        autoStockings = false,
        autoOnettArt = false,
        autoCandles = false,
        autoFeast = false,
        autoSnowMachine = false,
        autoHoneyWreath = false,

        -- Smart Farm Settings
        smartBlueAutofarm = false,

        --Useful i swear
        farmrares = false,
        AutoHoneyM = false,
    },
    vars = {
        equipAccessoryMethod = "Tween",
        defaultmask = "Diamond Mask",
        rares = {},
    },
    autoFarmSettings = {
        field = "Dandelion Field",

        farmShower = false,
        farmCoconuts = false,
        farmBubbles = false,
        farmFlames = false,
        farmUnderClouds = false,
        farmUnderBalloons = false,
        farmFuzzyBombs = false,

        smartBubbleBloat = false,
        smartPreciseCrosshair = false,
        smartPreciseMethod = "Fast Tween",
        -- farmPrecise = false,
        -- smartPrecise = false,
        -- farmFuzzy = false,
        -- smartFlame = false,
        -- smartBubbles = false,
        ignoreHoneyTokens = false,
        farmSprouts = false
    },
    convertSettings = {
        secondsBeforeConvert = 0,
        convertat = 100,
        convertballoonat = 0,
        instantToggle = false,
        selectedInstant = {},
    },
    autodispensersettings = {
        treatDispenser = false,
        royalJellyDispenser = false,
        blueberryDispenser = false,
        strawberryDispenser = false,
        coconutDispenser = false,
        glueDispenser = false,
        freerobopass = false,
        freeantpass = false
    },
    autoboostersettings = {
        whiteBooster = false,
        redBooster = false,
        blueBooster = false
    },
    rares = {},
    autoQuestSettings = {
        doQuests = false,
        doRepeatables = true,
        acceptAllQuests = false,

        BlackBearQuests = false,
        BrownBearQuests = false,
        PandaBearQuests = false,
        ScienceBearQuests = false,
        PolarBearQuests = false,
        SpiritsBearQuests = false,
        BuckoBeeQuests = false,
        RileyBeeQuests = false,
        HoneyBeeQuests = false,
        OnettQuests = false,

        -- Priorities
        enablePriorities = false,
        prioritizeMobKill = true,

        BlackBearPriority = 1,
        BrownBearPriority = 1,
        PandaBearPriority = 1,
        ScienceBearPriority = 1,
        PolarBearPriority = 1,
        SpiritBearPriority = 1,
        BuckoBeePriority = 1,
        RileyBeePriority = 1,
        HoneyBeePriority = 1,
        OnettPriority = 1,
        BeeBearPriority = 1,

        -- Beesmas only
        BeeBearQuests = false,

        farmPollen = false,
        farmGoo = false,
        killMobs = false,
        feedBees = false,
        useToys = false,
        useMemoryMatch = false,
        doQuestQuests = false,


        tpToNPC = false,
        doAnts = false,

        bestBlueField = "Pine Tree Forest",
        bestRedField = "Rose Field",
        bestWhiteField = "Pumpkin Patch"

    },
    webhookSettings = {
        useWebhook = false,
        onlyTruncated = false,
        showTotalHoney = false,
        showHoneyPerHour = false,
        showDailyHoney = false,
        showPlanters = false,
        showNectars = false,
        showItems = false,
        sendQuests = false,

        discordId = LRM_LinkedDiscordID or "0",
        webhookUrl = "",
        webhookColor = "0xfcdf03",
        pingUser = false,
        messageFrequency = 30,

        itemsList = {},
    },
    autoPlantersSettings = {
        doPlanters = false,
        planterHarvestAt = 20,
        doCustomPlanters = false,
        blacklistedNectars = {},
        blacklistedPlanters = {}
    },
    autoPuffshroomSettings = {
        farmPuffshrooms = false,
        farmRemaining = true,
        rarityPriority = "Mythic > Common",
        levelPriority = "High > Low",
        minimumLevel = 1,
        maximumLevel = 16
    },
    localPlayerSettings = {
        walkSpeed = 60,
        tweenSpeed = 5
    },
    combatSettings = {
        trainCrab = false,
        trainKingBeetle = false,
        trainTunnelBear = false,
        trainStumpSnail = false,
        snailConvertHoney = false,
        killVicious = false,
        viciousMinLevel = 1,
        viciousMaxLevel = 12,

        killSpidor = false,
        killMantis = false,
        killScorpion = false,
        killWerewolf = false
    },
    customPlanterSettings = {
        customPlanters1 = {
            [1] = {planter = "", field = "", harvestAmount = 75},
            [2] = {planter = "", field = "", harvestAmount = 75},
            [3] = {planter = "", field = "", harvestAmount = 75},
            [4] = {planter = "", field = "", harvestAmount = 75},
            [5] = {planter = "", field = "", harvestAmount = 75}
        },
        customPlanters2 = {
            [1] = {planter = "", field = "", harvestAmount = 75},
            [2] = {planter = "", field = "", harvestAmount = 75},
            [3] = {planter = "", field = "", harvestAmount = 75},
            [4] = {planter = "", field = "", harvestAmount = 75},
            [5] = {planter = "", field = "", harvestAmount = 75}
        },
        customPlanters3 = {
            [1] = {planter = "", field = "", harvestAmount = 75},
            [2] = {planter = "", field = "", harvestAmount = 75},
            [3] = {planter = "", field = "", harvestAmount = 75},
            [4] = {planter = "", field = "", harvestAmount = 75},
            [5] = {planter = "", field = "", harvestAmount = 75}
        },
    },
    alertSettings = {
        viciousAlert = true
    },
    RoboBearChallangeSettings = {
        autoRBC = false
    },
    raresList = {}
}

local defaultMacroV2Config = macrov2

getgenv().temptable = {
    version = "0.0.4b",
    convertingHoney = false,
    stopAll = false,
    activeMemoryMatch = nil,
    
    honeyAtStart = ClientStatCache.Get(nil,{"Totals", "Honey"}),
    lastWebhookSent = 0,

    tokenpath = Workspace.Collectibles,
    fieldDecosFolder = Workspace:FindFirstChild("FieldDecos") or ReplicatedStorage:FindFirstChild("FieldDecos"),
    lastWalkToNearest = 0,

    fieldSelected,
    fieldPosition,
    floversRow = {},

    customWalkSpeed = {enabled = false, speed = 50},

    plantingPlanter = false,

    detected = {
        vicious = false,
        windy = false
    },

    doingShower = false,
    doingMonster = false,
    doingTokens = false,

    lastClientStatCacheUpdate = 0,
    lastBalloonPollen = 0,

    showerStars = {},

    stopAutofarm = false,

    autoRJSettings = {
        requireGifted = false,
        requireAnyGifted = false,
        xCoord = 3,
        yCoord = 1,
        runningAutoRJ = false,
        selectedBees = {},
        selectedRarities = {}
    },
    showersTable = {},
    coconutsTable = {},
    lastShowerRegistered = 0,

    sproutsTable = {},
    susTokenPositions = {},

    leafTable = {},
    sparklesTable = {},
    balloonsTable = {},

    codesTable = {
        "Wax",
        "Roof",
        "Nectar",
        "Crawlers",
        "Connoisseur",
        "Cog",
        "Buzz",
        "Bopmaster",
        "38217",
        "GumdropsForScience",
        "ClubConverters",
        "BeesBuzz123",
        "PlushFriday",
    }, codesActivated = false,

    stopEverything = false,

    puffsDetected = false,
    popStarActive = false,

    lastConvertAtHive = 0,
    lastFullBag = 0,

    MConverterUsedAt = 0,
    IConverterUsedAt = 0,

    tokensTable = {},
    lastTweenToRare = 0,

    selectedPriorityNpc = "Black Bear",
    npcPrioLabel = nil,
    npcPrioSlider = nil,

    autoRBC = {
        isActive = false,
        isUnlocked = nil,
        latestRBC = 0
    },

    questUseItemCooldown = false,
    questFeedCooldown = false,
    questUseToyCooldown = false,

    dupedTokensTable = {}
}

-- Important Parts 
local cocoPad = Instance.new("Part")
cocoPad.Position = Workspace.Territories.CoconutTerritory.Position + Vector3.new(0,15,0)
cocoPad.Size = Workspace.Territories.CoconutTerritory.Size * Vector3.new(1,0,1) + Vector3.new(0,1,0)
cocoPad.Anchored = true
cocoPad.CanCollide = false
cocoPad.Transparency = 1
cocoPad.Parent = Workspace

local tunnelPart = Instance.new("Part")
tunnelPart.Anchored = true
tunnelPart.CanCollide = true
tunnelPart.Position = Vector3.new(410, 29, -48)
tunnelPart.Size = Vector3.new(10,1,10)
tunnelPart.Transparency = 1
tunnelPart.Parent = Workspace
Workspace.Decorations.TrapTunnel["Tunnel Ceiling"].CanCollide = false


function removeFromTable(Table, element)
    return table.remove(Table, table.find(Table, element))
end

function calculateTweenSpeed(magnitude, speed)
    return magnitude / (speed or 40)
end

function bssAlert(style, text)
    secureCall(AlertBoxes.Push, player.PlayerScripts.AlertBoxes, nil, text, nil, style)
end

local Tween = {
    ["_State"] = false,
    ["_NoClip"] = nil,
    ["_AntiFall"] = nil,
    ["_CurrentAnimation"] = {TerminateEvent = nil, Animation = nil},
    ["_Processing"] = false,
    ["calculateSpeed"] = function(magnitude, speed)
        return magnitude / (speed or 40)
    end,
    
}
Tween["_UpdateState"] = function(state) 
    if state == true then
        if Tween["_NoClip"] == nil then
            Tween["_NoClip"] = game.RunService.Stepped:Connect(function() 
                pcall(function() api.humanoidrootpart().Velocity = Vector3.new(0,0,0) end)
            end)
        end
        
        if Tween["_AntiFall"] == nil or Tween["_AntiFall"].Parent ~= api.humanoidrootpart() then
            if Tween["_AntiFall"] and Tween["_AntiFall"].Parent ~= api.humanoidrootpart() then Tween["_AntiFall"]:Destroy() end
            Tween["_AntiFall"] = Instance.new("BodyVelocity", api.humanoidrootpart())
            Tween["_AntiFall"].Velocity = Vector3.new(0, 0, 0)
            Tween["_AntiFall"].Name = "Tween_AntiFall"
        end
        Tween["_State"] = true
    elseif state == false then
        if Tween["_NoClip"] then
            pcall(function() Tween["_NoClip"]:Disconnect() end)
        end
        if Tween["_AntiFall"] then
            pcall(function() Tween["_AntiFall"]:Destroy() end)
            if api.humanoidrootpart() and api.humanoidrootpart():FindFirstChild("Tween_AntiFall") then
                pcall(function() api.humanoidrootpart():FindFirstChild("Tween_AntiFall"):Destroy() end)
            end
        end
        Tween["_State"] = false
    end
end
Tween["getState"] = function() 
    return Tween["_State"]
end

Tween["getSpeed"] = function() 
    return macrov2.localPlayerSettings.tweenSpeed * 10
end
Tween["_Stop"] = function()
    if Tween["_CurrentAnimation"].Animation then 
        local s,e = pcall(function() Tween["_CurrentAnimation"].TerminateEvent:Fire() end)
        local s1,e1 = pcall(function() 
            Tween["_CurrentAnimation"].Animation:Cancel() 
            Tween["_CurrentAnimation"].Animation = nil 
        end) 
        local s2,e2 = pcall(function() 
            Tween["_CurrentAnimation"].TerminateEvent:Destroy() 
            Tween["_CurrentAnimation"].TerminateEvent = nil 
        end)
        if not s then warn("e: "..e) end
        if not s1 then warn("e1: "..e1) end
        if not s2 then warn("e2: "..e2) end
    end
    Tween["_UpdateState"](false)
end
Tween["_Start"] = function(position, speed, secondsOnly)
    -- warn(position, speed, secondsOnly)
    -- warn(typeof(position), typeof(speed), typeof(secondsOnly))
    if Tween["_Processing"] then return false, "Another tween already starting..." end
    Tween["_Processing"] = true

    if Tween["getState"] == true then
        Tween["_UpdateState"](false)
    end

    Tween["_UpdateState"](true)

    local humanoidRootPart
    while not humanoidRootPart do humanoidRootPart = api.humanoidrootpart() task.wait() end
    
    local magnitude = (humanoidRootPart.Position - position).magnitude
    local mainSpeed = Tween["getSpeed"]()
    local newSpeed

    if speed and secondsOnly then newSpeed = speed
    elseif speed and not secondsOnly then newSpeed = Tween.calculateSpeed(magnitude, speed)
    else newSpeed = Tween.calculateSpeed(magnitude, Tween["getSpeed"]()) end
    -- print(newSpeed)

    local tweenInfo = TweenInfo.new(newSpeed, Enum.EasingStyle.Linear)
    local tweenProperties = {CFrame = CFrame.new(position)}
    Tween["_CurrentAnimation"].TerminateEvent = Instance.new("BindableEvent")
    Tween["_CurrentAnimation"].Animation = TweenService:Create(humanoidRootPart, tweenInfo, tweenProperties)

    local tweenCompleted = false
    local tweenStarted = tick()

    local isHumanoidDead = false
    local isTweenTerminated = false
    
    local humanoid
    while not humanoid do humanoid = api.humanoid() task.wait() end

    Tween["_CurrentAnimation"].Animation.Completed:Connect(function() 
        tweenCompleted = true
    end)

    humanoid.Died:Connect(function()
        isHumanoidDead = true
    end)
    
    Tween["_CurrentAnimation"].TerminateEvent.Event:Connect(function() isTweenTerminated = true end)
    Tween["_CurrentAnimation"].Animation:Play()
    Tween["_Processing"] = false

    while not tweenCompleted and task.wait() do
        if isTweenTerminated then return false, "Terminate Tween" end

        if isHumanoidDead then return false, "Humanoid Dead" end

        if not secondsOnly and not speed and mainSpeed ~= Tween["getSpeed"]() then return false, "Speed changed" end
    end

    return true, "Success"
end

Tween["MakeTween"] = function(position, speed, secondsOnly)
    local tweenSuccess = false
    local originalArgs = {position, speed, secondsOnly}
    local newArgs = nil
    while not tweenSuccess do
        local tweenDone, message, args = Tween["_Start"](unpack((newArgs or originalArgs)))
        -- warn(tweenDone, message)
        Tween["_Stop"]()

        if not tweenDone or message ~= "Success" then
            if message == "Terminate Tween" then return false, "Tween Terminated"
            elseif message == "Speed changed" then continue 
            else
                newArgs = args or nil
                -- print("ffwegwr: "..(message or "NOTHING"))
                if message == "Humanoid Dead" then 
                    player.CharacterAdded:Wait(30)
                    repeat task.wait() until api.humanoidrootpart() and api.humanoid()
                    print("respawned")
                end
            end
            task.wait()
        else
            tweenSuccess = true
            break
        end
    end
    return tweenSuccess
end

function startTween(...)
    local tweenCompleted = nil
    coroutine.wrap(function(...) 
        tweenCompleted = pcall(Tween.MakeTween(...), ...)
    end)(...)
    repeat task.wait() until tweenCompleted ~= nil
end

function moveTo(pos)
    startTween(pos+Vector3.new(0,3,0))
    -- if not tween(macrov2.localPlayerSettings.tweenSpeed * 10, pos+Vector3.new(0, 2, 0)) then setTweenState(false) error("Tween failed - main") end
    -- setTweenState(false)
end

function jsonEncode(tbl)
    local jsonString
    pcall(function() jsonString = HttpService:JSONEncode(tbl) end)
    return jsonString
end

function jsonDecode(json)
    local luaTable
    local a,s = pcall(function() luaTable = HttpService:JSONDecode(json) end)
    return luaTable
end

if macrov2.webhookSettings.discordId ~= "0" then
    api.notify("Macro V3", "Loaded discord id\n"..macrov2.webhookSettings.discordId, 3)
end

if _G.debugging then
    warn("Claim hive.")
end

function walkTo(pos, timeout)
    timeout = timeout or 30
    local startedWalking = tick()
    local walkFinished = false
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    api.humanoid():MoveTo(pos)
    local walkFinishedSignal = api.humanoid().MoveToFinished:Connect(function() walkFinished = true end)

    repeat 
        task.wait()
    until walkFinished or (tick() - startedWalking) > timeout
    pcall(function() walkFinishedSignal:Disconnect() end)
    api.humanoid():MoveTo(api.humanoidrootpart().Position)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.UserChoice
    return walkFinished
end

while not player:FindFirstChild("Honeycomb") do 
    for i = 8,3,-1 do
        local hive = Workspace.Honeycombs:FindFirstChild("Hive"..i)
        if hive and not hive.Owner.Value then
            repeat
                if api.magnitude(hive.SpawnPos.Value.p, api.humanoidrootpart().Position) < 10 then
                    secureCall(ActivatablesHives.ButtonEffect, Activatables, player, hive.Platform.Value)
                    -- setIdentity(2)
                    -- ActivatablesHives.ButtonEffect(player, hive.Platform.Value)
                    -- setIdentity(7)
                    task.wait(.75)
                else 
                    moveTo(hive.SpawnPos.Value.p)
                end
                task.wait()
            until hive.Owner.Value or player:FindFirstChild("Honeycomb")
            if player:FindFirstChild("Honeycomb") then break end
        end
    end
end

plrHive = player:FindFirstChild("Honeycomb").Value

function isBeesmas()
    local active = Workspace:WaitForChild"Toys":FindFirstChild"Beesmas Tree" and true
    -- if not active then
    --     local deadline = ReplicatedStorage:FindFirstChild"Xmas2022Deadline"
    --     if deadline and (tick() - tonumber(deadline.Value)) > 0 then
    --         active = true
    --     end
    -- end
    return active
end

if _G.debugging then
    warn("Claim hive done. Waiting 1 second")
    task.wait(1)
end

function findField(position)
    local ray = Ray.new(position+Vector3.new(0, -35, 0), Vector3.new(0,100, 0))
    local hit, hitPos = workspace:FindPartOnRayWithWhitelist(ray, {game.Workspace.FlowerZones})
    if hit and hit.Parent.Name == "FlowerZones" then
        return hit
    else
        return nil
    end
end

function getNumbers(str)
    local nums = {}
    for num in str:gmatch("%d+") do
        table.insert(nums, tonumber(num))
    end
    return nums
end

function truncate(num)
	num = tonumber(math.round(num))
	if num <= 0 then
		return 0
	end
	local savenum = ""
	local i = 0
	local suff = ""
	local suffixes = {"k","M","B","T","qd","Qn","sx","Sp","O","N"}
	local length = math.floor(math.log10(num)+1)
	while num > 999 do
		i = i + 1
		suff = suffixes[i] or "???"
		num = num/1000
		savenum = (math.floor(num*100)/100)..suff
	end
	if i == 0 then
		return num
	end
	return savenum
end

function truncatetime(sec)
	local second = tostring(sec%60)
	local minute = tostring(math.floor(sec / 60 - math.floor(sec / 3600) * 60))
	local hour = tostring(math.floor(sec / 3600))

	return (#hour == 1 and "0"..hour or hour)..":"..(#minute == 1 and "0"..minute or minute)..":"..(#second == 1 and "0"..second or second)
end

function pressButton(button)
	VirtualInputManager:SendKeyEvent(true, button, false, game)
	game:GetService("RunService").Heartbeat:Wait()
	VirtualInputManager:SendKeyEvent(false, button, false, game)
end

function addcommas(num)
	local str = tostring(num):reverse():gsub("(%d%d%d)", "%1,"):reverse()
	if str:sub(1,1) == "," then
		str = str:sub(2)
	end
	return str
end

function getTokenId(token)
    local id = "0"
    if token and token.Parent and token:FindFirstChildOfClass("Decal") then
        local texture = token:FindFirstChildOfClass("Decal").Texture
        local tempId = tonumber(tostring(texture):match("%d+"))
        if tempId then id = tempId end
    end
    return id
end

local accessoryShopsLocations = {
    ["Diamond Mask Shop"] = Vector3.new(-335, 132, -391),
    ["Demon Mask Shop"] = Vector3.new(297, 27, 274),
    ["Master Shop"] = Vector3.new(-486, 69, 0)
}

local accessoryShops = {
    ["Diamond Mask"] = accessoryShopsLocations["Diamond Mask Shop"],
    ["Demon Mask"] = accessoryShopsLocations["Demon Mask Shop"],
    ["Honey Mask"] = accessoryShopsLocations["Master Shop"]
}

function remoteEquipAccessory(accessory)
    Events.ClientCall("ItemPackageEvent", "Equip", {
        Mute = false,
        Type = accessory,
        Category = "Accessory"
    })
end

function requestAccessoryEquip(accessory)
    local shopPosition = accessoryShops[accessory]
    if not shopPosition then
        return false, "Invalid input!"
    end

    local accessoryType = accessoriesTable[accessory]
    if not accessoryType then
        return false, "Accessory not found!"
    end

    -- warn(accessoryType)

    if not checkAccessory({Type = accessory}, getClientStatCache()) then 
        return false, "Player does not have "..accessory
    end

    local currentAccessory = updateClientStatCache("EquippedAccessories", accessoryType)
    -- warn("Current Mask:",currentAccessory)
    -- warn("Requested Mask:",accessory)

    if currentAccessory == accessory then
        return false, "Already equipped " .. accessory
    end

    if macrov2.vars.equipAccessoryMethod == "Tween" then
        moveTo(shopPosition)
    elseif macrov2.vars.equipAccessoryMethod == "Teleport" then
        api.humanoidrootpart().CFrame = CFrame.new(shopPosition)
    end

    task.wait(0.1)
    if (api.magnitude(shopPosition) < 25) or macrov2.vars.equipAccessoryMethod == "Remote" then
        remoteEquipAccessory(accessory)
        return true
    else
        return false
    end
end

function getRandomRareToken()
    for i=#temptable.tokensTable, 1, -1 do
        local token = temptable.tokensTable[i]
        if not token or not token.Parent then continue end

        local tokenId = tostring(getTokenId(token))
        -- print(tokenId)
        if table.find(macrov2.vars.raresList, tokenId) then
            return token
        end
    end
    -- for _,token in ipairs(temptable.tokensTable) do
    --     local tokenId = tostring(getTokenId(token))
    --     print(tokenId)
    --     if table.find(macrov2.vars.raresList, tokenId) then
    --         return token
    --     end
    -- end
end

function getMinePlanters()
	local minePlantersTable = {}
    pcall(function()
        local plantedPlanters = debug.getupvalues(LocalPlanters.LoadPlanter)[4]
        for i, v in pairs(plantedPlanters) do
            if v.IsMine and v.PotModel and v.Active and not v.Collected then
                table.insert(minePlantersTable,v)
            end
        end
    end)
	return minePlantersTable
end

function updateClientStatCache(...)
    return ClientStatCache.Update(nil,{...})
end

function getClientStatCache(...)
    return ClientStatCache.Get(nil,{...})
end

function getDailyHoney()
    return ClientStatCache.GetDailyTotal(nil, "Honey") - (ClientStatCache.GetDailyTotal(nil, "ChallengeHoney") - (ClientStatCache.GetDailyTotal(nil, {"EggsReceived","SysHoney"})))
end

function getWarningDisks()
    local warningDisks = {}
    for i,v in pairs(game.Workspace.Particles:GetChildren()) do
          if v.Name == "WarningDisk" or v.Name == "Thorn" then 
              table.insert(warningDisks,v) 
          end
    end
    return warningDisks
  end

if _G.debugging then
    warn("Tables init.")
end

--Tables

local npcIconsEndpoint = "https://static.wikia.nocookie.net/bee-swarm-simulator/images/"
local npcsIcons = {
	["Polar Bear"]   = npcIconsEndpoint.."2/23/Polar.png",
	["Bucko Bee"]    = npcIconsEndpoint.."3/3d/GiftedBuckoBeeNPCTransparent.png",
	["Black Bear"]   = npcIconsEndpoint.."7/71/Black.png",
	["Mother Bear"]  = npcIconsEndpoint.."a/af/MotherBearTrans.png",
	["Brown Bear"]   = npcIconsEndpoint.."0/06/Brown.png",
	["Panda Bear"]   = npcIconsEndpoint.."0/00/Panda.png",
	["Science Bear"] = npcIconsEndpoint.."a/a5/Science.png",
	["Dapper Bear"]  = npcIconsEndpoint.."4/4b/DapperBear.png",
	["Spirit Bear"]  = npcIconsEndpoint.."2/21/Spirit_bear333.png",
	["Riley Bee"]    = npcIconsEndpoint.."b/b0/GiftedRileyBeeNPCTransparent.png"
}

local miscEmojis = {
    ["Polar Power"] = "<:PolarPower:1080979354030444594>"
}

local nectarEmojis = {
	["Refreshing Nectar"]   = "<:Refreshing:1080956994070007818>",
	["Invigorating Nectar"] = "<:Invigorating:1080967902800392354>",
	["Comforting Nectar"]   = "<:Comforting:1080968750888652960>",
	["Motivating Nectar"]   = "<:Motivating:1080969173536096357>",
	["Satisfying Nectar"]   = "<:Satisfying:1080969460288073748>"
}

local plantersEmojis = {
	["Paper Planter"]         = "<:PaperPlanter:1084965375965405265>",
	["Ticket Planter"]        = "<:TicketPlanter:1084965386757345361>",
	["Festive Planter"]       = "<:FestivePlanter:1084965370579914854>",
	["Plastic Planter"]       = "<:PlasticPlanter:1084965381711597598>",
	["Candy Planter"]         = "<:CandyPlanter:1084965368147226716>",
	["Red Clay Planter"]      = "<:RedClayPlanter:1084965382911168583>",
	["Blue Clay Planter"]     = "<:BlueClayPlanter:1084950550946250833>",
	["Tacky Planter"]         = "<:TackyPlanter:1084965385222246470>",
	["Pesticide Planter"]     = "<:PesticidePlanter:1084965377727025372>",
	["Petal Planter"]         = "<:PetalPlanter:1084965380394598500>",
	["Heat-Treated Planter"]  = "<:HeatTreatedPlanter:1084950774989213797>",
	["Hydroponic Planter"]    = "<:HydroponicPlanter:1084965372442198177>",
	["The Planter Of Plenty"] = "<:ThePlanterOfPlenty:1084950301393567854>",
}

AllToysTable = {
    ["toysTable"] = {
        ['autoWealthClock'] = "Wealth Clock",
        ['autoHoneystorm'] = "Honeystorm",
        ['autoFreeAntPass'] = "Free Ant Pass Dispenser",
        ['autoFreeRoboPass'] = "Free Robo Pass Dispenser"
    },
    ["boostersTable"] = {
        ['whiteBooster'] = 'Field Booster',
        ['redBooster'] = 'Red Field Booster',
        ['blueBooster'] = 'Blue Field Booster'
    },
    ["dispensersTable"] = {
        ['treatDispenser'] = "Treat Dispenser",
        ['royalJellyDispenser'] = "Free Royal Jelly Dispenser",
        ['blueberryDispenser'] = "Blueberry Dispenser",
        ['strawberryDispenser'] = "Strawberry Dispenser",
        ['coconutDispenser'] = "Coconut Dispenser",
        ["glueDispenser"] = "Glue Dispenser"
    },
    ["memoryMatchTable"] = {}
}

if isBeesmas() then
    AllToysTable["beesmasToysTable"] = {
        ['autoSamovar'] = "Samovar",
        ['autoStockings'] = "Stockings",
        ['autoOnettArt'] = "Onett's Lid Art",
        ['autoCandles'] = "Honeyday Candles",
        ['autoFeast'] = "Beesmas Feast",
        ['autoSnowMachine'] = "Snow Machine",
        ['autoHoneyWreath'] = "Honey Wreath"
    }
    AllToysTable["toysTable"]["autoMotherHouse"] = "Gingerbread House"
end

fieldsTable = {}
blueFields = {}
redFields = {}
whiteFields = {}

monstersTable = {}
plantersTable = {}
plantersDropdownTable = {}
nectarsTable = {}
accessoriesTable = {}

sproutRarities = {
    [Color3.fromRGB(103,162,201)] = "Moon",
    [Color3.fromRGB(180, 190, 186)] = "Common",
    
}

showerTable = {}
beesTable = {namesOnly = {}, fullData = {}, raritiesTable = {"Any Common", "Any Rare", "Any Epic", "Any Legendary", "Any Mythic"}}
npcsTable = {"Black Bear", "Brown Bear", "Panda Bear", "Science Bear", "Polar Bear", "Spirit Bear", "Bucko Bee", "Riley Bee", "Honey Bee", "Onett", "Bee Bear 5"}

nectarsDropdownTable = {
	"Comforting Nectar",
	"Satisfying Nectar",
	"Invigorating Nectar",
	"Refreshing Nectar",
	"Motivating Nectar"
}

if _G.debugging then
    warn("Tables init done. Waiting 1 second")
    task.wait(1)
end

if _G.debugging then
    warn("Tables init 2.")
end

--Tables init
for fieldIndex, field in pairs(Workspace.FlowerZones:GetChildren()) do
    table.insert(fieldsTable, field.Name)
    if not field:FindFirstChild("ColorGroup") then
        local colorGroup = Instance.new("StringValue")
        colorGroup.Name = "ColorGroup"
        colorGroup.Value = "White"
        colorGroup.Parent = field
    end
    if field.ColorGroup.Value == "Blue" then table.insert(blueFields, field.Name)
    elseif field.ColorGroup.Value == "Red" then table.insert(redFields, field.Name)
    elseif field.ColorGroup.Value == "White" then table.insert(whiteFields, field.Name)
    end
end

for i,v in pairs(Accessories.GetTypes()) do
    if v.Slot then
        accessoriesTable[i] = v.Slot
    end
end

for i,v in pairs(PlanterTypes.GetTypes()) do
    if v.Description == "Test planter." or i == "Plastic" or i == "Ticket" or i == "Festive" then continue end
    local planterData = {
        systemName = v.Name,
        displayName = v.DisplayName,
        nectarMultipliers = v.NectarMultipliers,
        pollenMultipliers = v.PollenMultipliers
    }
    plantersTable[v.Name] = planterData
    table.insert(plantersDropdownTable, v.DisplayName)
end

writefile("newPlanters.json", game.HttpService:JSONEncode(plantersTable))

for i,v in pairs(NectarTypes.GetTypes()) do
    nectarsTable[i] = v.Fields
end

for i,v in pairs(temptable.tokenpath:GetChildren()) do
    table.insert(temptable.susTokenPositions, v.Position)
end


for i,v in pairs(Workspace.MonsterSpawners:GetChildren()) do
    monstersTable[v.Name] = {RespawnCooldown = 0, MonsterType = nil}
    monstersTable[v.Name].MonsterType = v.MonsterType.Value
    monstersTable[v.Name].RespawnCooldown = MonsterTypes.Get(v.MonsterType.Value).Stats.RespawnCooldown
    monstersTable[v.Name].Spawner = v
    if v.Name == "WerewolfCave" then
        monstersTable[v.Name].Territory = v.Territory.Value.w
    elseif v.Name == "MushroomBush" then
        monstersTable[v.Name].Territory = v.Territory.Value.Part
    else
        monstersTable[v.Name].Territory = v.Territory.Value
    end
end

for i,v in pairs(Workspace.Toys:GetChildren()) do
    if v.Name:find("Memory Match") then table.insert(AllToysTable["memoryMatchTable"], v.Name) end
end

for i,v in pairs(require(game:GetService("ReplicatedStorage").BeeTypes).GetTypes()) do
    table.insert(beesTable.namesOnly, i.." Bee")
    beesTable.fullData[i] = {Rarity = v.Rarity}
end

if _G.debugging then
    warn("Tables init 2. Waiting 1 second")
    task.wait(1)
end

--Functions

function markAsCollected(object)
    local collectedCache = Instance.new("Folder")
    collectedCache.Name = "Collected"
    collectedCache.Parent = object
end

local cachedFieldFlowers = {}

function getAllFlowers(field)
    local fieldId = field.ID.Value
    local fieldFlowers
    if cachedFieldFlowers[field.Name] then
        -- print("cached")
        fieldFlowers = cachedFieldFlowers[field.Name]
    else
        print("firstInit")
        fieldFlowers = {}
        for flowerIndex, flower in pairs(Workspace.Flowers:GetChildren()) do
            local flowerInfo = getNumbers(flower.Name)
            if #flowerInfo == 3 and flowerInfo[1] == fieldId then
                table.insert(fieldFlowers, flower)
            end
        end
        if not (#fieldFlowers <= 1) then 
            cachedFieldFlowers[field.Name] = fieldFlowers 
        else
            return 
        end
    end
    return fieldFlowers
end

function getRandomFlower(field)
    local fieldId = field.ID.Value
    local fieldFlowers
    if cachedFieldFlowers[field.Name] then
        -- print("cached!")
        fieldFlowers = cachedFieldFlowers[field.Name]
    else
        print("firstInit")
        fieldFlowers = {}
        for flowerIndex, flower in pairs(Workspace.Flowers:GetChildren()) do
            local flowerInfo = getNumbers(flower.Name)
            if #flowerInfo == 3 and flowerInfo[1] == fieldId then
                table.insert(fieldFlowers, flower)
            end
        end
        if not (#fieldFlowers <= 1) then 
            cachedFieldFlowers[field.Name] = fieldFlowers 
        else
            return 
        end
    end
    return fieldFlowers[math.random(1,#fieldFlowers)]
end

local cachedFieldCenters = {farm = {}, sprinkler = {}}

function getNewFarmCenter(field, sprinkler)
    if not (field:FindFirstChild("ColorGroup") and field.ColorGroup.Value == "Blue") then return end
    if sprinkler and cachedFieldCenters["sprinkler"][field.Name] then 
        return cachedFieldCenters["sprinkler"][field.Name] 
    elseif not sprinkler and cachedFieldCenters["farm"][field.Name] then
        return cachedFieldCenters["farm"][field.Name] 
    end
    local flowers = getAllFlowers(field)
    local minX = math.huge
    local minY = math.huge
    local maxX = -math.huge
    local maxY = -math.huge
    
    for i, flower in ipairs(flowers) do
        local flowerSettings = getNumbers(flower.Name)
        minX = math.min(minX, flowerSettings[2])
        minY = math.min(minY, flowerSettings[3])
        maxX = math.max(maxX, flowerSettings[2])
        maxY = math.max(maxY, flowerSettings[3])
    end

    local flowerCenter 
    if maxX - minX >= maxY - minY then -- x is longer
        local centerFlowerX = sprinkler and maxX - 5 or maxX
        local centerFlowerY = sprinkler and maxY - 5 or maxY --math.floor((minY + maxY) / 2 + 0.5)
        for i,v in pairs(flowers) do
            if v.Name == "FP"..field.ID.Value.."-"..centerFlowerX.."-"..centerFlowerY then
                flowerCenter = v
                break
            end
        end
    else -- y is longer
        local centerFlowerX = sprinkler and maxX - 5 or maxX --math.floor((minX + maxX) / 2 + 0.5)
        local centerFlowerY = sprinkler and maxY - 5 or maxY
        for i,v in pairs(flowers) do
            if v.Name == "FP"..field.ID.Value.."-"..centerFlowerX.."-"..centerFlowerY then
                flowerCenter = v
                break
            end
        end
    end
    if flowerCenter then
        if sprinkler and not cachedFieldCenters["sprinkler"][field.Name] then 
            cachedFieldCenters["sprinkler"][field.Name] = flowerCenter
        elseif not sprinkler and not cachedFieldCenters["farm"][field.Name] then
            cachedFieldCenters["farm"][field.Name] = flowerCenter
        end
    end
    return flowerCenter
end

function jump()
    if not player.Character.Humanoid.Jump then
        player.Character.Humanoid.Jump = true
    end
end

function getPlanterData(planterName)
    local planterData
    if plantersTable[planterName] then 
        planterData = plantersTable[planterName] 
    else
        for i,v in pairs(plantersTable) do
            if v.displayName == planterName then
                planterData = v
                break
            end
        end
    end
    return planterData
end

function gethiveballoon()
    for _,balloon in pairs(Workspace.Balloons.HiveBalloons:GetChildren()) do
        if balloon:FindFirstChild("BalloonRoot") then
            if balloon.BalloonRoot.CFrame.p.X == player.SpawnPos.Value.p.X then
                return true
            end
        end
    end
    return false
end

function getBuffTime(buffName, convertToHMS)
    local buff = BuffTileModule.GetBuffTile(buffName)
    if not buff or not buff.TimerDur or not buff.TimerStart then 
        return 0 
    end

    local toReturn = buff.TimerDur - (math.floor(ServerTime()) - buff.TimerStart)
    if convertToHMS then 
        toReturn = timeToString(toReturn) 
    end
    
    return toReturn
end

function getBuffStack(buffName)
    local buff = BuffTileModule.GetBuffTile(buffName)

    return (buff and tostring(buff.Combo)) or 0
end

function getCurrentTime()
    local CurrentTime = Lighting.ClockTime
    return (CurrentTime > 10 and "Day") or "Night"
end

function disableall()
    temptable.disableAll = true
end

function enableall()
    temptable.disableAll = false
end

function dig()
    local tool = player.Character:FindFirstChildOfClass("Tool") or nil
    if not tool or not tool:FindFirstChild("ClientScriptMouse") then return end
    task.spawn(function() 
        getsenv(tool.ClientScriptMouse).collectStart(player:GetMouse())
    end)
end

function isFieldSame(pos1, pos2)
    return findField(pos1) == findField(pos2)
end

if _G.debugging then
    warn("Functions init.")
end

function canTaskBeSpawned(taskName)
    if taskName == "getToys" then
        if temptable.puffsDetected and macrov2.autoPuffshroomSettings.farmPuffshrooms then return false end

        return true
    elseif taskName == "farmPlanters" then
        if temptable.puffsDetected and macrov2.autoPuffshroomSettings.farmPuffshrooms then return false end

        return true
    elseif taskName == "killVicious" then

        return true
    elseif taskName == "trainBosses" then
        if temptable.puffsDetected and macrov2.autoPuffshroomSettings.farmPuffshrooms then return false end

        return true
    end
end

function canCollectToken(token)
    return 
    token.Parent and 
    ((api.humanoidrootpart().Position * Vector3.new(0,1,0)) - (token.Position * Vector3.new(0,1,0))).magnitude < 6 and
    token.CFrame.YVector.Y == 1
end

function canFarmTask(taskName) 
    if taskName == "getNearestBubble" and macrov2.autoFarmSettings.farmBubbles  
    or taskName == "getNearestFuzz" and macrov2.autoFarmSettings.farmFuzzyBombs  
    or taskName == "getNearestCloud" and macrov2.autoFarmSettings.farmUnderClouds  
    or taskName == "getNearestFlame" and macrov2.autoFarmSettings.farmFlames  
    or taskName == "getNearestToken" and true
    then return true else return false end
end

local NearestTable = {}

NearestTable.getNearestBubble = function(callback) --Sakata Jump delete if you see
    local nearest = {bubble = nil, distance = math.huge}
    for _,bubble in pairs(Workspace.Particles:GetChildren()) do
        if bubble.Name ~= "Bubble" then continue end
        if callback and not callback(bubble) then continue end
        local distance = api.magnitude(bubble.Position)
        if distance < nearest.distance then
            nearest = {bubble = bubble, distance = distance}
        end
    end
    return nearest.bubble, nearest.distance
end

NearestTable.getNearestFuzz = function(callback)
    local nearest = {fuzz = nil, distance = math.huge}
    for _,fuzz in pairs(Workspace.Particles:GetChildren()) do
        if fuzz.Name ~= "DustBunnyInstance" then continue end
        if callback and not callback(fuzz.Plane) then continue end
        local distance = api.magnitude(fuzz.Plane.Position)
        if distance < nearest.distance then
            nearest = {fuzz = fuzz.Plane, distance = distance}
        end
    end
    return nearest.fuzz, nearest.distance
end

NearestTable.getNearestToken = function(blacklistedTokens, callback)
    local nearest = {token = nil, distance = math.huge}
    for _, token in ipairs(temptable.tokenpath:GetChildren()) do
        if blacklistedTokens and table.find(blacklistedTokens, token) then warn("Token blacklisted") continue end
        if callback and not callback(token) then continue end
        if canCollectToken(token) then
            local distance = api.magnitude(token.Position)
            -- print(distance, nearest.distance)
            if distance < nearest.distance then
                nearest = {token = token, distance = distance}
            end
        end
    end
    return nearest.token, nearest.distance
end

NearestTable.getNearestCloud = function(callback)
    local nearest = {cloud = nil, distance = math.huge}
    for _, cloud in ipairs(Workspace.Clouds:GetChildren()) do
        if not cloud:FindFirstChild("Plane") then continue end
        if callback and not callback(cloud.Plane) then continue end
        local distance = api.magnitude(cloud.Plane.Position)
        if distance < nearest.distance then
            nearest = {cloud = cloud.Plane, distance = distance}
        end
    end
    return nearest.cloud, nearest.distance
end

NearestTable.getNearestFlame = function(callback)
    local nearest = {flame = nil, distance = math.huge}
    for _, flame in ipairs(Workspace.PlayerFlames:GetChildren()) do
        if not flame:FindFirstChild("PF") or flame:FindFirstChild("PF") and flame.PF.Color.Keypoints[1].Value.G == 0 then continue end
        if callback and not callback(flame) then continue end
        local distance = api.magnitude(flame.Position)
        if distance < nearest.distance then
            nearest = {flame = flame, distance = distance}
        end
    end
    return nearest.flame, nearest.distance
end

getNearestBalloon = function(callback) 
    local nearest = {token = nil, distance = math.huge}
    for _, balloon in pairs(temptable.balloonsTable) do
        if callback and not callback(balloon.BalloonBody) then continue end
        if not balloon:FindFirstChild("BalloonBody") then continue end
        local distance = api.magnitude(balloon.BalloonBody.Position)
        -- print(distance, nearest.distance)
        if distance < nearest.distance then
            nearest = {balloon = balloon.BalloonBody, distance = distance}
        end
    end
    return nearest.balloon, nearest.distance
end

function getNearestTask(callback)
    local nearest = {taskName = "", distance = math.huge, object = nil}
    local distanceTable = {}
    for i, v in pairs(NearestTable) do
        if not canFarmTask(i) then continue end

        if i ~= "getNearestToken" then
            local temp = string.gsub(i, "getNearest", "")
            local Name = tostring(temp)
            local values = {v(callback)}
            local tableToAdd={Name, i, values[1], values[2]}
            table.insert(distanceTable, tableToAdd)
        else
            local temp = string.gsub(i, "getNearest", "")
            local Name = tostring(temp)
            local values = {v(nil, callback)}
            local tableToAdd={Name, i, values[1], values[2]}
            table.insert(distanceTable, tableToAdd)
        end
    end
    for i, v in pairs(distanceTable) do
        if v[4] < nearest.distance then
            nearest = {taskName = v[1], distance = v[4], object = v[2]}
        end
    end
    return nearest.taskName, nearest.object
end

function farmNearest(callback)
    local nearestName = getNearestTask(callback)
    if nearestName == "Bubble" then
        return farmBubble(callback)
    elseif nearestName == "Token" then
        return farmToken(callback)
    elseif nearestName == "Fuzz" then
        return farmFuzzy(callback)
    end
    return false
end

function getTokenLink()
    local nearestTokenLink = {token = nil, distance = math.huge}
    for _,token in ipairs(temptable.tokenpath:GetChildren()) do
        if getTokenId(token) == 1629547638 and token.CFrame.YVector.Y == 1 and not token:FindFirstChild("Collected") then
            local distance = (token.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance < nearestTokenLink.distance then
                nearestTokenLink = {token = token, distance = distance}
            end
        end
    end
    return nearestTokenLink.token
end

function collectToken(token)
    if not token.Parent or token:FindFirstChild("Collected") then return false end
    local startedCollecting = tick()
    local moveToCalled = -1
    local collected = false
    while true do
        --print("Collecting")
        if (api.humanoidrootpart().Position - token.Position).magnitude < 4 or
            token.CFrame.YVector.Y ~= 1 or
            not workspace:FindPartOnRay(Ray.new(api.humanoidrootpart().Position, token.Position - api.humanoidrootpart().Position)) or
            (token.Position - api.humanoidrootpart().Position).magnitude < 4 or
            (tick() - startedCollecting) >= 3
        then
            if (tick() - startedCollecting) >= 3 then break end
            collected = true
            break
        elseif (api.humanoidrootpart().Position - token.Position).magnitude > 200 then break end
        
        if tick() - moveToCalled > 0.25 then
            if (tick() - temptable.lastTweenToRare) < 5 then break end
            if not pcall(function()
                api.humanoid():MoveTo(token.Position)
            end) then break end
            moveToCalled = tick()
        end

        task.wait()
    end
    -- api.humanoid():MoveTo(api.humanoidrootpart().Position)
    if collected then
        markAsCollected(token)
        return true
    else
        return false
    end
end

function farmToken(customCallback)
    local nearestTokenLink = getTokenLink()
    if nearestTokenLink then
        -- print("Token Link")
        collectToken(nearestTokenLink)
        return true
    else
        local tokenToCollect = NearestTable.getNearestToken(nil, function(token)
            if customCallback and not customCallback(token) then 
                return false
            end
            if token.CFrame.YVector.Y == 1 and not token:FindFirstChild("Collected") and not table.find(temptable.susTokenPositions, token.Position) then 
                return true 
            end 
        end)
        if not tokenToCollect then return end
        collectToken(tokenToCollect)
        return true
    end
end

function farmBubble(customCallback)
    local nearestBubble = NearestTable.getNearestBubble(function(bubble)
        if not bubble or customCallback and not customCallback(bubble) then 
            return false
        end    
        if not bubble:FindFirstChild("Collected") then return true end
    end)
    if not nearestBubble then return false end

    local startedCollecting = tick()
    local moveToCalled = -1

    while true do
        if api.magnitude(nearestBubble.Position) < 8.5 or
        not nearestBubble.Parent or
        (tick() - startedCollecting) >= 8 then
            break
        end
        
        if tick() - moveToCalled > 0.5 then
            api.humanoid():MoveTo(nearestBubble.Position)
            moveToCalled = tick()
        end

        RunService.Heartbeat:Wait()
    end

    markAsCollected(nearestBubble)
    return true
end

function farmFuzzy(customCallback) --Sakata Jump Delete if you see this
    local nearestFuzz = NearestTable.getNearestFuzz(function(fuzz)
        if customCallback and not customCallback(fuzz) then 
            return false
        end    
        if not fuzz:FindFirstChild("Collected") then return true end
    end)
    if not nearestFuzz then return false end

    local startedCollecting = tick()
    local moveToCalled = -1

    while true do
        if api.magnitude(nearestFuzz.Position) < 8.5 or
        not nearestFuzz.Parent or
        (tick() - startedCollecting) >= 8 then
            break
        end
        
        if tick() - moveToCalled > 0.5 then
            api.humanoid():MoveTo(nearestFuzz.Position)
            moveToCalled = tick()
        end

        RunService.Heartbeat:Wait()
    end

    markAsCollected(nearestFuzz)
    return true
end

function farmCoco() --will be added after priority system

end

function farmFire()  --will be added after priority system

end

function farmCloud()  --will be added after priority system

end

-- Sort items and tokens to make it easier to use
local Items = EggTypes.GetTypes()

local FormattedItems = {FullData = {}, NamesOnly = {}}

EggItems = {}

task.spawn(function()
    for i,v in pairs(Items) do
        if not v.Hidden then
            if v.DisplayName then
                local succ,err = xpcall(function()
                    HttpService:JSONEncode(v)
                end, function(err) warn("[Error]:", err) end)
                v["SystemName"] = i
                FormattedItems["FullData"][v.DisplayName] = v
                table.insert(FormattedItems["NamesOnly"], v.DisplayName)
                table.insert(EggItems, v.DisplayName)
            end
        end
    end
    for i,v in pairs(ReplicatedStorage.Collectibles:GetChildren()) do
        if v:IsA("ModuleScript") then
            if v:FindFirstChild("Icon") then
                FormattedItems["FullData"][v.Name] = {Icon = tostring(v.Icon.Texture)}
                table.insert(FormattedItems["NamesOnly"], v.Name)
                if v:FindFirstChild("IconPlus") then
                    FormattedItems["FullData"][v.Name.."Plus"] = {DisplayName = v.Name, Icon = tostring(v.IconPlus.Texture)}
                    table.insert(FormattedItems["NamesOnly"], v.Name.."Plus")
                end
            end
        end
    end
    for i,v in pairs(ReplicatedStorage.Buffs:GetChildren()) do
        if v.Name:find("Icon") then
            local tokenName = v.Name:gsub(" Icon", "")
            -- print(tokenName, v.Texture)
            FormattedItems["FullData"][tokenName] = {DisplayName = tokenName, Icon = tostring(v.Texture)}
            table.insert(FormattedItems["NamesOnly"], tokenName)
        end
    end
end)

function getItemByName(name)
    if not table.find(FormattedItems["NamesOnly"],tostring(name)) then return nil, tostring(name).." not found in the NamesOnly list" end
    for i,v in pairs(FormattedItems["FullData"]) do
        if v.DisplayName == name then
            return v
        end
    end
    return nil, "Not found full data of "..name
end

function gotoNearestBalloon(waitForMoveFinish)
    local semiFarmed = false
    -- print("Called gotoNearestBalloon")
    local balloon = getNearestBalloon(function(balloon) 
        if balloon and balloon.Parent and balloon:FindFirstChild("BalloonBody") and isFieldSame((temptable.fieldSelected and temptable.fieldSelected.Position or api.humanoidrootpart().Position), balloon.BalloonBody.Position - Vector3.new(0,15,0)) then return true end
    end)
    if balloon and balloon:FindFirstChild("BalloonBody") and api.magnitude(balloon.BalloonBody.Position) > 10 then
        api.humanoid():MoveTo(balloon.BalloonBody.Position)
        if waitForMoveFinish then
            local startMove = tick()
            repeat task.wait() until api.magnitude(balloon.BalloonBody.Position) < 6 or (tick() - startMove) > 1
            semiFarmed = true
        else
            task.wait()
        end
    end
    return semiFarmed
end

local puffsRarityList = {
    Common = 1,
    Rare = 2,
    Epic = 3,
    Legendary = 4,
    Mythic = 5
}

function checkPuffshrooms()
    local puffFound = false
    if #Workspace.Happenings.Puffshrooms:GetChildren() > 0 then
        puffFound = true
    else
        for i,v in pairs(Workspace.Particles:GetChildren()) do
            if v.Name == "SporeCloud" then
                puffFound = true
                break
            end
        end
    end
    temptable.puffsDetected = puffFound
    return puffFound
end

function checkPopStar()
    if not Workspace.Particles:FindFirstChild("PopStars") then return false end
    local popStarFound = false
    for i,v in pairs(Workspace.Particles.PopStars:GetChildren()) do
        if (player.Character.HumanoidRootPart.Position - v.Position).magnitude < 13
        and getBuffTime("Pop Star Aura") > 0 then
            popStarFound = true
            break 
        end
    end
    temptable.popStarActive = popStarFound
    return popStarFound
end

-- function checkLeafsAndSparkles()
--     local leafTable = {}
--     for _, flower in ipairs(Flowers:GetChildren()) do
--         if flower:FindFirstChild("LeafBurst") then
--             table.insert(leafTable, flower)
--         elseif flower:FindFirstChild("Sparkles")then
--             table.insert(sparklesTable, flower)
--         end
--     end
--     temptable.leafTable = leafTable
--     return leafTable
-- end

function getPuffsOnField(field)
    local puffsOnField = {}
    for i,v in pairs(Workspace.Happenings.Puffshrooms:GetChildren()) do
        if findField(v.PrimaryPart.Position) == field then
            table.insert(puffsOnField, v)
        end
    end
    return puffsOnField
end

function getBestPuffshroom()
    local puffs = Workspace.Happenings.Puffshrooms:GetChildren()
    if #puffs == 0 then return nil end
    local bestPuffs = {}

    local maxRarity = macrov2.autoPuffshroomSettings.rarityPriority == "Mythic > Common" and 0 or 6

    for i, puff in ipairs(puffs) do
        local puffName
        pcall(function()
            puffName = puff["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
        end)
        if not puffName then warn("No puff name") return {} end
        local puffRarity = string.match(puffName, "(%a*)%s+Puffshroom") or "Common"
        local puffLevel = tonumber(string.match(puffName, "Lvl (%d+)"))
        if not tonumber(puffLevel)
          or not puffLevel 
          or tonumber(puffLevel) < macrov2.autoPuffshroomSettings.minimumLevel
          or tonumber(puffLevel) > macrov2.autoPuffshroomSettings.maximumLevel 
          or not puff:FindFirstChild("Puffball Stem")
          or not findField(puff["Puffball Stem"].Position)
        then continue end
        local rarityValue = puffsRarityList[puffRarity] or 1

        if (macrov2.autoPuffshroomSettings.rarityPriority == "Mythic > Common" and rarityValue > maxRarity) or
           (macrov2.autoPuffshroomSettings.rarityPriority == "Common > Mythic" and rarityValue < maxRarity) then
            maxRarity = rarityValue
            bestPuffs = { puff }
        elseif rarityValue == maxRarity then
            table.insert(bestPuffs, puff)
        end
    end

    table.sort(bestPuffs, function(a, b)
        local aName = a["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
        local aRarity, aLevel = string.match(aName, "(%a*)%s+Puffshroom") or "Common", tonumber(string.match(aName, "Lvl (%d+)"))
        
        local bName = b["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
        local bRarity, bLevel = string.match(bName, "(%a*)%s+Puffshroom") or "Common", tonumber(string.match(bName, "Lvl (%d+)"))
        -- local aRarity, aLevel = a.Name:match("(%a*)%s+Puffshroom%s+%(%a*%s*(%d+)%)")
        -- local bRarity, bLevel = b.Name:match("(%a*)%s+Puffshroom%s+%(%a*%s*(%d+)%)")
        aLevel, bLevel = tonumber(aLevel), tonumber(bLevel)
        local aRarityValue, bRarityValue = puffsRarityList[aRarity] or 1, puffsRarityList[bRarity] or 1
        if aRarityValue == bRarityValue then
            if macrov2.autoPuffshroomSettings.levelPriority == "High > Low" then
                return aLevel > bLevel
            else
                return aLevel < bLevel
            end
        else
            if macrov2.autoPuffshroomSettings.rarityPriority == "Mythic > Common" then
                return aRarityValue > bRarityValue
            else
                return aRarityValue < bRarityValue
            end
        end
    end)

    local bestPuff = bestPuffs[1]
    -- print(bestPuff["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text)
    if bestPuff then
        local puffName = bestPuff["Puffball Top"].Attachment.Gui.NameRow.TextLabel.Text
        local puffRarity = string.match(puffName, "(%a*)%s+Puffshroom") or "Common"
        local puffLevel = tonumber(string.match(puffName, "Lvl (%d+)"))
        return { Rarity = puffRarity, Level = tonumber(puffLevel), Model = bestPuff }
    end

    return nil
end

function farmPuffshroom(puffToFarm)
    local farmed = false
    local stem = puffToFarm.PrimaryPart
    if stem and puffToFarm.Parent == Workspace.Happenings.Puffshrooms then
        local stemPos = stem.Position
        if not isFieldSame(api.humanoidrootpart().Position, stemPos) then
            moveTo(stemPos)
        end
        placeSprinkler(stemPos, true, true)
        while task.wait() and puffToFarm.Parent == Workspace.Happenings.Puffshrooms and macrov2.autoPuffshroomSettings.farmPuffshrooms and macrov2.toggles.autofarm do
            if getBagPercentage() >= 99 then return false, "Bag is full" end
            if not isFieldSame(api.humanoidrootpart().Position, stemPos) then
                moveTo(stemPos)
            elseif api.magnitude(stemPos) >= 20 then
                task.wait()
                local temp1 = nil
                task.spawn(function() temp1 = walkTo(stemPos, 0.5) end)
                repeat task.wait() until temp1 ~= nil
            elseif api.magnitude(stemPos) < 20 then
                collectNearestTokens(stemPos, 30)
                task.wait()
            else
                moveTo(stemPos)
            end
            farmed = true
        end
        if farmed and puffToFarm.Parent ~= Workspace.Happenings.Puffshrooms and macrov2.toggles.autofarm and macrov2.autoPuffshroomSettings.farmPuffshrooms then
            task.wait(0.5)
            for i=1,2 do
                collectNearestTokens()
                task.wait()
            end
            return true
        end
    end
    return false
end

function farmPuffshrooms()
    local firstPuff = getBestPuffshroom()
    if not firstPuff or not firstPuff.Model then return end
    local puffsOnField = {}

    local puffSelected = firstPuff.Model
    local fieldSelected = findField(firstPuff.Model.PrimaryPart.Position)

    while puffSelected and puffSelected.Parent do
        task.wait()
        local done, msg = farmPuffshroom(puffSelected)
        if msg == "Bag is full" then return false end
        task.wait()
        if macrov2.autoPuffshroomSettings.farmRemaining then
            puffsOnField = getPuffsOnField(fieldSelected)
            if #puffsOnField > 0 then
                for i,v in pairs(puffsOnField) do
                    if v.Parent then
                        puffSelected = v
                        break
                    end
                end
            end
            task.wait()
        end
    end
end

function avoidWarningDisks()
    local playerPos = api.humanoidrootpart().Position
    local warningDisks = getWarningDisks()

    local ray = Ray.new(playerPos + Vector3.new(0, 100, 0), Vector3.new(1, -735, 1))
    local touchedWarningDisk = Workspace:FindPartOnRayWithWhitelist(ray, warningDisks)

    if touchedWarningDisk then
        local diskRadius = touchedWarningDisk.Size.X / 2
        local dirToPlayer = (playerPos - touchedWarningDisk.Position).Unit
        
        -- Calculate the safe position to move to
        local diskCenter = touchedWarningDisk.Position
        local playerToCenter = (playerPos - diskCenter).Magnitude
        local playerToDisk = playerToCenter - diskRadius
        local safePos = diskCenter + dirToPlayer * (diskRadius + 4 + playerToDisk + 5)
        if (safePos - api.humanoidrootpart().Position).magnitude < 0.5 then safePos = api.humanoidrootpart().Position + Vector3.new(1,0,0) end
        api.humanoid():MoveTo(safePos + Vector3.new(1,0,1))
        task.wait()
        return true
    end
    task.wait()
    return false
end

function shouldIConvert(converting, check1)
    check1 = check1 or true
    local timeSinceLastFullBag = tick() - temptable.lastFullBag -- Calculate the time elapsed since the last conversion

    if timeSinceLastFullBag < macrov2.convertSettings.secondsBeforeConvert then -- Check if the user wants to wait before converting, and if enough time has elapsed
        return false
    elseif converting and getBagPercentage() > 0 or getBagPercentage() >= macrov2.convertSettings.convertat then -- Check if the bag is full or if the user wants to convert manually
        if macrov2.convertSettings.instantToggle and check1 then
            instaConvFunc()
            task.wait(1.5)
            return shouldIConvert()
        end
        return true
    else
        if temptable.puffsDetected and macrov2.autoPuffshroomSettings.farmPuffshrooms then return false end

        if macrov2.toggles.converthiveballoon and gethiveballoon() then
            if macrov2.convertSettings.convertballoonat == 0 and converting then
                return true
            elseif macrov2.convertSettings.convertballoonat ~= 0 and (tonumber(getBuffTime("Balloon Blessing"))/60) <= macrov2.convertSettings.convertballoonat then
                return true
            else
                return false
            end
        else
            return false
        end
    end
end

function getBagPercentage()
    local pollencount = player.CoreStats:FindFirstChild("Pollen") and player.CoreStats.Pollen.Value or 0
    local maxpollen = player.CoreStats:FindFirstChild("Capacity") and player.CoreStats.Capacity.Value or 0
    -- print(pollencount, maxpollen)

    local percentage = (pollencount / maxpollen * 100) or 0

    if temptable.lastFullBag == 0 and percentage >= macrov2.convertSettings.convertat then
        temptable.lastFullBag = tick()
    elseif not (percentage >= macrov2.convertSettings.convertat) then
        temptable.lastFullBag = 0
    end

    return percentage
end

function canToyBeUsed(toyName)
    local toy = Workspace.Toys[toyName]
    if toy then
        local _, buttonColor = secureCall(ActivatablesToys.ButtonText, Activatables, nil, toy)
        if not buttonColor then
            return true
        elseif buttonColor == "Red" then
            return false    
        end
    end
end

function useToy(toyName, collectTokens)
    if not canToyBeUsed(toyName) then return end
    local used = false
    local patformPosition = Workspace.Toys[toyName].Platform.Position + Vector3.new(0,3,0)
    task.wait()
    while 
     not temptable.convertingHoney
     and canToyBeUsed(toyName) 
    do
        if api.magnitude(patformPosition) > 20 then
            moveTo(patformPosition)
            task.wait(0.25)
        end
        if api.magnitude(patformPosition) < 20 then
            secureCall(ActivatablesToys.ButtonEffect, Activatables, player, workspace.Toys[toyName])
            -- setIdentity(2)
            -- ActivatablesToys.ButtonEffect(player, workspace.Toys[toyName])
            -- setIdentity(7)
        end
        task.wait(2)
    end
    if collectTokens then 
        task.wait(1.5)
        local tokensNear = {}
        for _, token in pairs(temptable.tokenpath:GetChildren()) do
            if api.magnitude(token.Position, patformPos) < 25
            and token.CFrame.YVector.Y == 1
            and getTokenId(token) ~= 65867881 then
                table.insert(tokensNear, token)
            end
        end
        while #tokensNear > 0 do
            for _, token in pairs(tokensNear) do
                if api.magnitude(patformPosition) > 25 then
                    moveTo(patformPosition)
                end
                if not token.Parent then table.remove(tokensNear, _) continue end
                collectToken(token)
            end
            task.wait()
        end 
    end
end

local InstantConverterNames = {"Instant Converter","Instant Converter B","Instant Converter C"}

local instantConvList = {"All", "Ticket/Instant Converter", "Micro-Converter"}

function instaConvFunc()
    print(macrov2.convertSettings.selectedInstant)
    local isConverted = false
    for i,v in pairs(macrov2.convertSettings.selectedInstant) do
         --sakata jump
        if v:find("Ticket") and getClientStatCache("Eggs", "Ticket") ~= 0 and (tick() - temptable.IConverterUsedAt) > 15  then
            for _,c in pairs(InstantConverterNames) do
                if canToyBeUsed(c) then
                    useToy(c)
                    task.wait(1)
                    temptable.IConverterUsedAt = tick()
                    if not canToyBeUsed(c) then isConverted = true break end
                end
            end
        --  elseif v:find("Coconuts") and getClientStatCache("Eggs", "Coconut") ~= 0 then
        --     Events.ClientCall("PlayerActivesCommand", {Name = "Coconut"})
        --     isConverted = true 
        --     break
        elseif v:find("Micro") and getClientStatCache("Eggs", "Micro-Converter") ~= 0 and (tick() - temptable.MConverterUsedAt) > 15 then
            Events.ClientCall("PlayerActivesCommand", {Name = "Micro-Converter"})
            temptable.MConverterUsedAt = tick()
            isConverted = true 
            break
         elseif v == "All" then
            for _,c in pairs(InstantConverterNames) do
                if getClientStatCache("Eggs", "Ticket") == 0 then continue end
                if canToyBeUsed(c) then
                    useToy(c)
                    task.wait(1)
                    if not canToyBeUsed(c) then isConverted = true break end
                end
            end
            -- if getClientStatCache("Eggs", "Coconut") ~= 0 then
            --     Events.ClientCall("PlayerActivesCommand", {Name = "Coconut"})
            --     isConverted = true 
            --     break
            -- end
            if getClientStatCache("Eggs", "Micro-Converter") ~= 0 then
                Events.ClientCall("PlayerActivesCommand", {Name = "Micro-Converter"})
                isConverted = true 
                break
            end
         end
    end
    return isConverted
end

function convertHoney(defaultMask)
    -- print("Convert Honey Called")
    local hivePos = (player.SpawnPos.Value * CFrame.fromEulerAnglesXYZ(0, 110, 0) + Vector3.new(0, 0, 9)).p
    while shouldIConvert(true) and macrov2.toggles.convertHoney do
        if macrov2.toggles.AutoHoneyM then requestAccessoryEquip("Honey Mask") end
        temptable.convertingHoney = true
        if api.magnitude(player.SpawnPos.Value.p) > 10 then
            moveTo(hivePos)
        end
        setIdentity(2)
        local hiveInfo = ActivatablesHives.ButtonText(player)
        setIdentity(origThreadIdentity)
        -- print(hiveInfo)
        if hiveInfo == "Make Honey" then
            print("Making honey")
            secureCall(ActivatablesHives.ButtonEffect, Activatables, player, plrHive.Platform.Value)
            -- setIdentity(2)
            -- ActivatablesHives.ButtonEffect(player, plrHive.Platform.Value)
            -- setIdentity(7)
            task.wait(3)
        elseif hiveInfo == "To Make Honey, Collect Pollen From Flower Fields." then
            print("Everything converted")
            break
        end
        task.wait(1)
    end
    task.wait(5)
    temptable.convertingHoney = false
    if defaultMask == nil or defaultMask == true then
        if macrov2.toggles.AutoHoneyM then requestAccessoryEquip(macrov2.vars.defaultmask) end
    end
    print("converted")
    temptable.lastConvertAtHive = tick()
end

function useMemoryMatch(memoryMatch, isQuest)
    if canToyBeUsed(memoryMatch) and not temptable.convertingHoney then disableall() else return "first" end
    local patformPos = Workspace.Toys[memoryMatch].Platform.Position
    local used = false
    while canToyBeUsed(memoryMatch) 
          and (not isQuest and macrov2.toggles.automemorymatch or isQuest and macrov2.autoQuestSettings.useMemoryMatch)
          and not temptable.activeMemoryMatch
    do
        moveTo(patformPos)
        task.wait(0.5)
        if (patformPos - api.humanoidrootpart().Position).Magnitude < 15 then
            secureCall(ActivatablesToys.ButtonEffect, Activatables, player, workspace.Toys[memoryMatch])
            used = true
            -- setIdentity(2)
            -- ActivatablesToys.ButtonEffect(player, workspace.Toys[memoryMatch])
            -- setIdentity(7)
            -- api:pressButton("E")
        end
        task.wait(1)
    end
    if not used then return end
    warn("MM step 1")
    repeat task.wait() until temptable.activeMemoryMatch
    warn("MM step 2")
    repeat task.wait() until not temptable.activeMemoryMatch
    warn("MM step 3: Done.")
    enableall()
end
-- ^^^
function getAllNectar(bool)
	if bool then
		local tablereturn = {}
		for i, v in pairs(nectarsDropdownTable) do
			table.insert(tablereturn, {name = v, time = getBuffTime(v, true)})
		end
		return tablereturn
	end
end

function useGlueDispenser()
    local gumdropsCount = getClientStatCache("Eggs", "Gumdrops")
    local used = false
    while canToyBeUsed("Glue Dispenser") and gumdropsCount and gumdropsCount > 0 do
        moveTo(Vector3.new(4, 87, 487))
        task.wait(0.5)
        if api.magnitude(Vector3.new(4, 87, 487)) > 0.75 then continue end
        gumdropsCount = getClientStatCache("Eggs", "Gumdrops")
        task.wait()
        PlayerActivesCommand:FireServer({["Name"] = "Gumdrops"})
        task.wait(0.5)
        while getClientStatCache("Eggs", "Gumdrops") == gumdropsCount do task.wait() end
        if api.magnitude(Vector3.new(272, 25260, -744)) > 30 then continue end
        api.humanoid():MoveTo(Vector3.new(270.8, 25257, -722.5))
        api.humanoid().MoveToFinished:Wait(2)
        task.wait(0.5)
        useToy("Glue Dispenser")
        used = true
    end
    if used then 
        player.Character:BreakJoints()
        player.CharacterAdded:Wait(10)
        task.wait(5)
    end
end

function getToys()
    for toysTableName, toysTable in pairs(AllToysTable) do
        for configToyName, toyName in pairs(toysTable) do 
            if toysTableName == "toysTable" and macrov2.toggles[configToyName]
            or toysTableName == "boostersTable" and macrov2.autoboostersettings[configToyName] and macrov2.toggles.autoboosters
            or toysTableName == "dispensersTable" and macrov2.autodispensersettings[configToyName] and macrov2.toggles.autodispensers
            then
                if toyName ~= "Glue Dispenser" then
                    useToy(toyName)
                else
                    useGlueDispenser()
                end
            elseif toysTableName == "beesmasToysTable" and macrov2.toggles[configToyName] and scriptType == LPH_STRENC("Paid") then
                useToy(toyName, true)
            elseif toysTableName == "memoryMatchTable" and macrov2.toggles.automemorymatch then
                useMemoryMatch(toyName)
            end
        end
    end
end

function lockMovement(bool)
    if bool then
        setIdentity(origThreadIdentity)
        player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    else
        setIdentity(origThreadIdentity)
        player.DevComputerMovementMode = Enum.DevComputerMovementMode.UserChoice
    end
end

function getCrosshairs()
    local crosshairs = {all = {}, purple = {}}
    for i,v in pairs(Workspace.Particles:GetChildren()) do
        if v.Name == "Crosshair" and findField(v.Position) == findField(api.humanoidrootpart().Position) then
            if not v:FindFirstChild("Collected") then
                if v.BrickColor == BrickColor.new("Red flip/flop") then
                    table.insert(crosshairs.all, v)
                elseif v.BrickColor == BrickColor.new("Alder") then
                    table.insert(crosshairs.all, v)
                    table.insert(crosshairs.purple, v)
                end
            end
        end
    end
    return {all = crosshairs.all, purple = crosshairs.purple}
end

function updateCrosshairs(shouldLock,exception) 
    for i,v in pairs(getCrosshairs().all) do
        if shouldLock and v ~= exception and v.BrickColor == BrickColor.new("Red flip/flop") then
            v.CanCollide = true
        elseif not shouldLock then
            v.CanCollide = false
        end
    end
end

function farmCrosshair(crosshair, save_height)
    local Path = PathfindingService:CreatePath({
		AgentRadius = 5,
        WaypointSpacing = 6,
		Costs = {
			Crosshair = math.huge
		}
	})
    updateCrosshairs(true, crosshair)
	Path:ComputeAsync(api.humanoidrootpart().Position, crosshair.Position)
	if Path then
		local points = Path:GetWaypoints()
        lockMovement(true)
		for _,v in pairs(points) do
            if (crosshair.Position - api.humanoidrootpart().Position).magnitude < 4 then break end
            if not crosshair.Parent or save_height ~= crosshair.Position.y then return lockMovement(false) end
			local moveComplete = false
			local startTime = tick()
			api.humanoid():MoveTo(v.Position)
			local signal
			signal = api.humanoid().MoveToFinished:Connect(function() moveComplete = true signal:Disconnect() end)
			repeat task.wait() until moveComplete or (tick() - startTime) > 0.85 or not crosshair.Parent or save_height ~= crosshair.Position.y or api.magnitude(crosshair.Position) < 5
		end
        lockMovement(false)
	end
    markAsCollected(crosshair)
    repeat task.wait() api.humanoid():MoveTo(crosshair.Position) until not crosshair.Parent or save_height ~= crosshair.Position.y
    updateCrosshairs(false)
end

function smartFarmCrosshairs()
    local buffStack = tonumber(getBuffStack("Precision"))
    local buffTime = tonumber(getBuffTime("Precision"))
    local isFarmed = false

    if (buffStack < 10 or buffTime <= 30) then
        for _,crosshair in pairs(getCrosshairs().all) do
            if not crosshair.Parent then continue end
            local MoveToFinished, started = false, tick()
            local save_height = crosshair.Position.y
            if crosshair.BrickColor == BrickColor.new("Forest green") or crosshair.BrickColor == BrickColor.new("Royal purple") then continue end
            lockMovement(true)
            api.humanoid():MoveTo(crosshair.Position)
            local signal
            signal = api.humanoid().MoveToFinished:Connect(function() MoveToFinished = true signal:Disconnect() end)
            repeat task.wait() until MoveToFinished or save_height ~= crosshair.Position.y or (tick() - started) > 5 or api.magnitude(crosshair.Position) < 4 or not crosshair.Parent
            lockMovement(false)
            markAsCollected(crosshair)
            isFarmed = true
        end
    elseif (buffStack == 10 and buffTime > 30) then
        for _,crosshair in pairs(getCrosshairs().purple) do
            if not crosshair.Parent then continue end
            local save_height = crosshair.Position.y
            if macrov2.autoFarmSettings.smartPreciseMethod == "Walk" then
                isFarmed = true
                farmCrosshair(crosshair, save_height)
            else
                repeat task.wait() 
                    if api.magnitude(crosshair.Position) > 5 then
                        startTween(crosshair.Position - Vector3.new(0,1.8,0), 0.06, true)
                        -- tween(0.06,crosshair.Position - Vector3.new(0,1.8,0), true)
                    end
                until not crosshair.Parent or save_height ~= crosshair.Position.y or (#getCrosshairs().purple > 1)
                markAsCollected(crosshair)
                isFarmed = true
            end
            break
        end
    end
    return isFarmed
end

function getSpawnerTime(spawner, extraSeconds)
    local spawnerInfo = monstersTable[spawner.Name]
    if not spawnerInfo then return math.huge end

    local lastKillTime = getClientStatCache("MonsterTimes", spawner.Name) or 0
    local spawnerCooldown = ClientMonsterTools.GetSpawnerCooldown(spawner.Name)
    local currentTime = ServerTime()

    if not spawnerCooldown then return math.huge end

    -- warn((lastKillTime + spawnerCooldown - currentTime))

    local timeLeft = (lastKillTime + spawnerCooldown - currentTime) + (tonumber(extraSeconds) or 0)
    if timeLeft < 0 then
        timeLeft = 0
    end
    
    return timeLeft
end

function getSpawnerCooldownText(spawnerName)
    local spawner = ClientMonsterTools.GetSpawner(spawnerName)
    if not spawner then return "???", -1 end

    local timeLeft = math.round(getSpawnerTime(spawner))
    if timeLeft == math.huge then 
        return "???", -1 
    end
    
    local cooldownText
    if timeLeft == 0 then
        cooldownText = "✅"
    else
        cooldownText = truncatetime(timeLeft)
    end

    return cooldownText, timeLeft
end

function getAliveMonsters(monsterName)
    local aliveMonsters = {}
    for i,v in pairs(Workspace.Monsters:GetChildren()) do
        if v.Name:find(monsterName) and v.Target.Value == player.Character then
            table.insert(aliveMonsters, v)
        end
    end
    return aliveMonsters
end

function getSpawnedMonsters(mob)
    local respawnedMonsters = {}
    for spawnerName,spawnerConfig in pairs(monstersTable) do
        if spawnerConfig.MonsterType == mob then
            local timeLeft = getSpawnerTime(spawnerConfig.Spawner, 30)
            -- warn(spawnerConfig.MonsterType..": "..(timeLeft == 0 and "Spawned") or timeLeft)
            if timeLeft == 0 then
                table.insert(respawnedMonsters, spawnerConfig)
            end
        end
    end
    return respawnedMonsters
end

function isMonsterKilled(mobSpawner)
    local spawner = ClientMonsterTools.GetSpawner(mobSpawner)
    if not mobSpawner or not spawner then --[[warn(1)]] return true end

    local timeLeft = getSpawnerTime(spawner)
    -- warn(timeLeft)
    if timeLeft > 0 then
        return true
    else 
        return false
    end
end

function killMonster(territory, spawner)
    -- print(isMonsterKilled(spawner.Name))
    local startTimeStamp = tick()
    temptable.doingMonster = true
    while not isMonsterKilled(spawner.Name) do
        -- print("OK")
        if (tick() - startTimeStamp) > 60 then break end
        -- print(not isMonsterKilled(spawner))
        if api.magnitude(territory.Position) > 45 then
            moveTo(territory.Position + Vector3.new(10,0,-5))
            task.wait(1)
        end
        jump()
        task.wait(2)
    end
    temptable.doingMonster = false
    return isMonsterKilled(spawner)
end

function killVicious()
    if macrov2.combatSettings.killVicious and temptable.detected.vicious then
        local viciousModel
        for i, v in pairs(Workspace.Particles:GetChildren()) do
            if v.Name:find("Vicious") then
                for i2, v2 in pairs(Workspace.Monsters:GetChildren()) do 
                    if v2.Name:find("Vicious") and v2:FindFirstChild("HumanoidRootPart") then
                        local level = tonumber(string.gmatch(v2.Name, "%d+")())
                        if level and level >= macrov2.combatSettings.viciousMinLevel and level <= macrov2.combatSettings.viciousMaxLevel then
                            viciousModel = v2
                            moveTo(v.Position)
                            task.wait(0.5)
                        end
                    end
                end
            end
        end
        if viciousModel then
            local viciousOnField = findField(viciousModel.HumanoidRootPart.Position)
            -- warn(viciousOnField)
            local level = tonumber(string.gmatch(viciousModel.Name, "%d+")())
            while viciousModel and viciousOnField and viciousModel.Parent and macrov2.combatSettings.killVicious and temptable.detected.vicious and level and level >= macrov2.combatSettings.viciousMinLevel and level <= macrov2.combatSettings.viciousMaxLevel do
                if not viciousModel.Parent then viciousModel = nil break end
                if viciousOnField then
                    -- warn(findField(api.humanoidrootpart().Position))
                    if findField(api.humanoidrootpart().Position) ~= viciousOnField then
                        moveTo(viciousOnField.Position)
                    end
                    if api.magnitude(viciousModel.HumanoidRootPart.Position) > 50 then
                        api.humanoid():MoveTo(viciousModel.HumanoidRootPart.Position)
                        task.wait(0.75)
                    end
                    collectNearestTokens(nil, 70)
                    avoidWarningDisks()
                end
                task.wait()
            end
        end
    end
end

function getQuestInfo(questName)
	local toReturn = Quests.Get(nil, questName)
	return toReturn
end

function getQuestProgress(questName)
	local toReturn = Quests.Progress(nil, questName, getClientStatCache())
	return toReturn
end

function getQuestSetting(npc, Type)
    return(npc == "Black Bear" and (Type == "prio" and macrov2.autoQuestSettings.BlackBearPriority or Type == "toggle" and macrov2.autoQuestSettings.BlackBearQuests))
       or (npc == "Brown Bear" and (Type == "prio" and macrov2.autoQuestSettings.BrownBearPriority or Type == "toggle" and macrov2.autoQuestSettings.BrownBearQuests))
       or (npc == "Panda Bear" and (Type == "prio" and macrov2.autoQuestSettings.PandaBearPriority or Type == "toggle" and macrov2.autoQuestSettings.PandaBearQuests))
       or (npc == "Science Bear" and (Type == "prio" and macrov2.autoQuestSettings.ScienceBearPriority or Type == "toggle" and macrov2.autoQuestSettings.ScienceBearQuests))
       or (npc == "Polar Bear" and (Type == "prio" and macrov2.autoQuestSettings.PolarBearPriority or Type == "toggle" and macrov2.autoQuestSettings.PolarBearQuests))
       or (npc == "Spirit Bear" and (Type == "prio" and macrov2.autoQuestSettings.SpiritBearPriority or Type == "toggle" and macrov2.autoQuestSettings.SpiritsBearQuests))
       or (npc == "Bucko Bee" and (Type == "prio" and macrov2.autoQuestSettings.BuckoBeePriority or Type == "toggle" and macrov2.autoQuestSettings.BuckoBeeQuests))
       or (npc == "Riley Bee" and (Type == "prio" and macrov2.autoQuestSettings.RileyBeePriority or Type == "toggle" and macrov2.autoQuestSettings.RileyBeeQuests))
       or (npc == "Honey Bee" and (Type == "prio" and macrov2.autoQuestSettings.HoneyBeePriority or Type == "toggle" and macrov2.autoQuestSettings.HoneyBeeQuests))
       or (npc == "Onett" and (Type == "prio" and macrov2.autoQuestSettings.OnettQuests or Type == "toggle" and macrov2.autoQuestSettings.OnettQuests))
       or (npc == "Bee Bear 5" and (Type == "prio" and macrov2.autoQuestSettings.BeeBearPriority or Type == "toggle" and macrov2.autoQuestSettings.BeeBearQuests))
       or (Type == "prio" and 100 or Type == "toggle" and false)
end

function prioritizeQuests(quests)
    local prioritizedQuests = {}
    local tempQuestsTable = {}
    for i,questData in pairs(quests) do
        local prio = getQuestSetting(questData.npc, "prio") or 101
        table.insert(tempQuestsTable, {prio, i, questData.Name})
    end
    table.sort(tempQuestsTable, function(a, b)
        if a[1] == b[1] then
            return a[2] < b[2]
        else
            return a[1] < b[1]
        end
    end)
    for i,v in pairs(tempQuestsTable) do
        table.insert(prioritizedQuests, v[3])
    end
    return prioritizedQuests
end

function getActiveQuests(NPC)
    local quests = {}
	for _, v in pairs(getClientStatCache("Quests", "Active")) do
		local quest = getQuestInfo(v.Name)
		
		if quest and not quest.Hidden then
            local npc = quest.NPC
			if (not NPC and getQuestSetting(npc, "toggle")) or (NPC and npc == NPC) then
				table.insert(quests, {Name = v.Name, npc = npc})
			end
		end
	end

    local questNames = prioritizeQuests(quests)

	return questNames
end

function collectNearestTokens(nearqui, magnitude)
    if not nearqui or typeof(nearqui) ~= "Vector3" then
        if (typeof(nearqui) == "Instance" and not nearqui.Position) then
            nearqui = nearqui.Position
        else
            nearqui = api.humanoidrootpart().Position
        end
    end

    for i,v in pairs(Workspace.Collectibles:GetChildren()) do
        if not v.Parent or not v.Position or table.find(temptable.susTokenPositions, v.Position) then continue end
        if api.magnitude(nearqui, v.Position) < (magnitude or 30)
        and api.magnitude(nearqui * Vector3.new(0,1,0), v.Position * Vector3.new(0,1,0)) < 10 then
            collectToken(v)
            task.wait()
        end
    end
end

function farmBubbles()
    local speedModified = false
    local bubblesToCollect = {}
    local bubbleRadius = macrov2.toggles
    for i,v in pairs(Workspace.Particles:GetChildren()) do
        if v.Name:find("Bubble") and findField(v.Position) == temptable.fieldSelected then
            if #bubblesToCollect == 0 then 
                if not macrov2.toggles.smartBlueAutofarm then
                    table.insert(bubblesToCollect, v)
                else
                    if temptable.fieldPosition and api.magnitude(temptable.fieldPosition, v.Position) < 30 then
                        table.insert(bubblesToCollect, v)
                    end
                end
            else
                -- print(#bubblesToCollect)
                -- Check for nearest bubbles
                if api.magnitude(v.Position, bubblesToCollect[#bubblesToCollect].Position) < 15 then
                    table.insert(bubblesToCollect, v)
                    -- print("bubble added,", #bubblesToCollect,"bubbles to collect")
                end
            end
        end
    end
    if #bubblesToCollect >= 3 then
        if temptable.speedMultiplier == 1 then speedModified = true temptable.speedMultiplier = 1.3 end
        for i,bubble in ipairs(bubblesToCollect) do
            repeat task.wait()
                api.humanoid():MoveTo(bubble.Position)
            until api.magnitude(api.humanoidrootpart().Position, bubble.Position) <= 14 or not macrov2.toggles.autofarm or not bubble.Parent
        end
    end
    if speedModified then temptable.speedMultiplier = 1 end
end

function farmShowerAndCoco()
    if #temptable.showersTable > 0 and macrov2.autoFarmSettings.farmShower then
        while #temptable.showersTable > 0 do
            local key, warningisk = next(temptable.showersTable)
            if warningisk and warningisk.Parent and warningisk.Transparency > 0.09 then
                startTween(warningisk.Position, 0.05, true)
                -- tween(0.05, warningisk.Position, true)
                repeat task.wait()
                until not warningisk.Parent or warningisk.Transparency <= 0.08
                temptable.showersTable[key] = nil
            else
                temptable.showersTable[key] = nil
            end
            task.wait()
        end
        collectNearestTokens()
    elseif #temptable.coconutsTable > 0 and macrov2.autoFarmSettings.farmCoconuts then
        local key, warningisk = next(temptable.coconutsTable)
        if warningisk and warningisk.Parent and warningisk.Transparency > 0.09 then
            startTween(warningisk.Position, 150)
            -- tween(150, warningisk.Position)
            repeat task.wait()
            until not warningisk.Parent or warningisk.Transparency <= 0.08
            temptable.coconutsTable[key] = nil
        else
            temptable.coconutsTable[key] = nil
        end
        task.wait()
        collectNearestTokens()
    end
end

function farmSprout(sprout, field)
    if not sprout or not sprout.Parent or not macrov2.autoFarmSettings.farmSprouts then return end

    local farmed = false

    while sprout and sprout.Parent and macrov2.autoFarmSettings.farmSprouts and macrov2.toggles.autofarm do
        -- print(findField(api.humanoidrootpart().Position), field)
        if getBagPercentage() >= 99 then
            convertHoney()
        end
        if findField(api.humanoidrootpart().Position) ~= field then
            moveTo(field.Position)
            task.wait()
        end
        collectNearestTokens(field.Position, 60)
        farmed = true
        task.wait()
    end

    return macrov2.autoFarmSettings.farmSprouts and macrov2.toggles.autofarm and farmed 
end

function farmSprouts()
    if next(temptable.sproutsTable) then
        while next(temptable.sproutsTable) and macrov2.autoFarmSettings.farmSprouts and macrov2.toggles.autofarm do
            local key, sprout = next(temptable.sproutsTable)
            if sprout and sprout.Model.Parent then
                if farmSprout(sprout.Model, sprout.Field) then
                    for i = 1, 30 do
                        collectNearestTokens(sprout.Field.Position, 100)
                        task.wait()
                    end
                end
            else
                temptable.sproutsTable[key] = nil
            end
            task.wait()
        end
    end
end

function selectField(fieldName)
    if fieldName == nil then
        temptable.fieldSelected = nil
        temptable.fieldPosition = nil
        return "Unselected field"
    end
    if temptable.fieldSelected and temptable.fieldSelected.Name == fieldName then return "Field already selected" end
    temptable.fieldSelected = Workspace.FlowerZones[fieldName] or "Dandelion Field"
    temptable.fieldPosition = temptable.fieldSelected.Position
    -- print("Selected field "..fieldName)
end

-- whitelistedTasks = {
--     "Collect Pollen", 
--     "Collect Goo",
--     "Defeat Monsters",
--     "Use Items",
--     "Use Toy",
--     "Match Pairs",
--     "Complete Quests"
-- }

function getQuestTasks(NPC)
    NPC = NPC or false
    local quests = getActiveQuests(NPC)
    local defeatMonstersTasks = {} -- table to hold the "Defeat Monsters" tasks
    local tasksToDo = {}

    for _, quest in pairs(quests) do
        local questData = getQuestInfo(quest)
        local questName = questData.Name
        if not macrov2.autoQuestSettings.doRepeatables and questData.Repeatable then continue end

        for index, questTask in pairs(getQuestProgress(questName)) do
            local iscompleted = questTask[1]

            if iscompleted >= 1 then continue end

            local fullTask = questData.Tasks[index]
            fullTask.Progress = questTask

            local taskDescription = fullTask.Description
            if typeof(taskDescription) ~= "string" then 
                setIdentity(2)
                taskDescription = taskDescription(getClientStatCache()) 
                setIdentity(origThreadIdentity)
            end

            local add = false

            if fullTask.Type == "Collect Pollen" and macrov2.autoQuestSettings.farmPollen
            or fullTask.Type == "Collect Goo" and macrov2.autoQuestSettings.farmGoo
            or fullTask.Type == "Defeat Monsters" and macrov2.autoQuestSettings.killMobs
            or fullTask.Type == "Use Toy" and macrov2.autoQuestSettings.useToys
            or fullTask.Type == "Match Pairs" and macrov2.autoQuestSettings.useMemoryMatch
            or fullTask.Type == "Complete Quests" and macrov2.autoQuestSettings.doQuestQuests
            or fullTask.Type == "Use Items" and taskDescription:find("Feed") and macrov2.autoQuestSettings.feedBees
            then
                add = true
            end

            if not add then continue end

            if fullTask.Type == "Defeat Monsters" then
                table.insert(defeatMonstersTasks, fullTask)
            else
                table.insert(tasksToDo, fullTask)
            end
        end
    end

    -- merge the defeatMonstersTasks table with the tasksToDo table
    if macrov2.autoQuestSettings.prioritizeMobKill then
        for _, task in ipairs(defeatMonstersTasks) do
            table.insert(tasksToDo, 1, task)
        end
    else
        for _, task in ipairs(defeatMonstersTasks) do
            table.insert(tasksToDo, task)
        end
    end

    -- writefile("tasks/task_"..tick()..".json", game.HttpService:JSONEncode(tasksToDo))

    return tasksToDo
end

function getQuestTaskField(questTask)
    if questTask.Type == "Collect Pollen" or questTask.Type == "Collect Goo" then
        if questTask.Zone then
            return questTask.Zone
        elseif questTask.Color then
            -- print(1, macrov2.autoQuestSettings["best"..questTask.Color.."Field"])
            return macrov2.autoQuestSettings["best"..questTask.Color.."Field"]
        end
    end
end

function claimQuests()
    for i, v in next, Workspace.NPCs:GetChildren() do
		if getQuestSetting(v.Name, "toggle") or 
        (macrov2.autoQuestSettings.acceptAllQuests and v.Name ~= "Honey Bee" and v.Name ~= "Gummy Bear" and v.Name ~= "Bubble Bee Man 2" and v.Name ~= "Ant Challenge Info" and v.Name ~= "Wind Shrine")
			and macrov2.autoQuestSettings.doQuests
		then
			local image = v.Platform.AlertPos.AlertGui.ImageLabel
			if image.ImageTransparency == 0 then
				if macrov2.toggles.tptonpc then
					api.humanoidrootpart().CFrame = CFrame.new(v.Platform.Position + Vector3.new(0,3,0))
				else
					moveTo(v.Platform.Position)
                    task.wait(0.03)
				end
                

				local attempts = 0
				while image.ImageTransparency == 0 and api.magnitude(v.Platform.Position) <= 25 and attempts < 5 do
					if api.magnitude(v.Platform.Position) <= 25 and not ScreenGui.NPC.Visible then
						while not ScreenGui.NPC.Visible do
                            if not (api.magnitude(v.Platform.Position) < 25) then break end
                            -- secureCall(ActivatablesNPC.ButtonEffect, Activatables, player, v)
				            setIdentity(2)
							ActivatablesNPC.ButtonEffect(player, Workspace.NPCs[v.Name])
                            setIdentity(origThreadIdentity)
							task.wait(1.5)
						end
					end

					local tempTimestamp = tick()

					repeat task.wait() until ScreenGui.NPC.Visible or tick() - tempTimestamp > 10

					while ScreenGui.NPC.Visible do
						if ScreenGui.NPC.OptionFrame.Visible 
                          and ScreenGui.NPC.OptionFrame.Option2.Visible 
                          and ScreenGui.NPC.OptionFrame.Option2.Text:find("Talk to") then
                            setIdentity(2)
							firesignal(ScreenGui.NPC.OptionFrame.Option2.MouseButton1Click)
                            setIdentity(origThreadIdentity)
						else
                            setIdentity(2)
							firesignal(ScreenGui.NPC.ButtonOverlay.MouseButton1Click)
                            setIdentity(origThreadIdentity)
						end
						task.wait()
					end

					task.wait(2.5)
					attempts = attempts + 1
				end
				task.wait(0.5)
			end
		end
	end
end

function doQuests(NPC)
    NPC = NPC or false
    claimQuests()
    local questTasks = getQuestTasks(NPC)
    for taskIndex, questTask in pairs(questTasks) do
        -- print(questTask.Type, questTask.MonsterType, questTask.Amount)
        if questTask then
            local taskDescription = questTask.Description
            if typeof(taskDescription) ~= "string" then 
                setIdentity(2)
                taskDescription = taskDescription(getClientStatCache()) 
                setIdentity(origThreadIdentity)
            end

            if questTask.Type == "Collect Pollen" or questTask.Type == "Collect Goo" then
                local newField = getQuestTaskField(questTask)
                if newField and Workspace.FlowerZones:FindFirstChild(newField) then
                    selectField(newField)
                    break
                end
            elseif questTask.Type == "Defeat Monsters" then
                local monsterToKill = questTask.MonsterType
                local numberOfMonsters = questTask.Amount
                local monsterSpawners = getSpawnedMonsters(monsterToKill)
                local remainingAmount = numberOfMonsters - questTask.Progress[2]
                -- print("Alive",monsterToKill,":",#monsterSpawners)
                if #monsterSpawners > 0 then
                    local monstersKilled = 0
                    for i,v in pairs(monsterSpawners) do
                        if remainingAmount <= 0 then print("brk!") break end
                        if not isMonsterKilled(v.Spawner.Name) then
                            local isKilled = killMonster(v.Territory, v.Spawner)
                            if isKilled then
                                monstersKilled += 1
                                task.wait(1)
                                for i=1,5 do
                                    collectNearestTokens(nil, 20)
                                end
                                remainingAmount = remainingAmount - 1
                            end
                        end
                    end
                end
            elseif questTask.Type == "Use Items" then
                if false and not string.find(taskDescription, "Feed") and not questTask.Item:find("Jelly") then
                    --UseItem
                    if not temptable.questUseItemCooldown then
                        game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer({["Name"]=questTask.Item})
                        task.spawn(function()
                            temptable.questUseItemCooldown = true
                            task.wait(100)
                            temptable.questUseItemCooldown = false                        
                        end)
                    end
                elseif string.find(taskDescription, "Feed") then
                    --Feed
                    if not temptable.questFeedCooldown then
                        Events.ClientCall("ConstructHiveCellFromEgg", math.random(1,5), 1, questTask.Item, questTask.Amount, false) 
                        temptable.questFeedCooldown = true
                        task.wait(5)
                        temptable.questFeedCooldown = false  
                    end
                end
            elseif questTask.Type == "Use Toy" then
                if canToyBeUsed(questTask.Toy) and not temptable.questUseToyCooldown then
                    if not questTask.Toy:find("Glue") then
                        useToy(questTask.Toy)
                    else
                        useGlueDispenser()
                    end
                    temptable.questUseToyCooldown = true
                    task.wait(15)
                    temptable.questUseToyCooldown = false 
                    continue
                end
            elseif questTask.Type == "Match Pairs" then
                for i,v in pairs(AllToysTable["memoryMatchTable"]) do
                    useMemoryMatch(v, true)
                end
            elseif questTask.Type == "Complete Quests" then
                doQuests(questTask.Pool or "Polar Bear")
            end
        end
    end
end

function handleMonsterKill(monsterName)
    for _,monster in pairs(getSpawnedMonsters(monsterName)) do
        if monster.Spawner and monster.Territory then
            killMonster(monster.Territory, monster.Spawner)
            task.wait(1)
            for i=1,3 do
                collectNearestTokens(nil, 20)
            end
        end
   end
end

function tryKillMonsters()
    if macrov2.combatSettings.killSpidor then
        handleMonsterKill("Spider")
    end
    if macrov2.combatSettings.killMantis then
        handleMonsterKill("Mantis")
    end
    if macrov2.combatSettings.killScorpion then
        handleMonsterKill("Scorpion")
    end
    if macrov2.combatSettings.killWerewolf then
        handleMonsterKill("Werewolf")
    end
end

function trainTunnelBear()
    if macrov2.combatSettings.trainTunnelBear then
        if #getSpawnedMonsters("Tunnel Bear") == 1 then
            tunnelPart.CanCollide = true
            local spawner = getSpawnedMonsters("Tunnel Bear")[1].Spawner
            while macrov2.combatSettings.trainTunnelBear and not isMonsterKilled(spawner.Name) do
                if api.magnitude(tunnelPart.Position) > 10 then
                    moveTo(tunnelPart.Position)
                    task.wait()
                end
                task.wait(0.1)
            end
            tunnelPart.CanCollide = false
            task.wait(1)
            if #getSpawnedMonsters("Tunnel Bear") == 0 then
                task.wait(0.5)
                for i=1,10 do
                    if api.magnitude(tunnelPart.Position) > 250 then
                        moveTo(tunnelPart.Position - Vector3.new(0,17,0))
                    end
                    collectNearestTokens(nil, 250)
                end
                task.wait(0.5)
            end
        end
    end
end

function trainCrab()
    if macrov2.combatSettings.trainCrab then
        if #getSpawnedMonsters("Coconut Crab") == 1 then
            local coconutField = Workspace.FlowerZones["Coconut Field"]
            local oldMask = getClientStatCache("EquippedAccessories", "Hat")
            if oldMask ~= "Demon Mask" and oldMask ~= "Gummy Mask" then
                requestAccessoryEquip("Demon Mask")
            end
            print("Started Crab Training")
            cocoPad.CanCollide = true
            local spawner = getSpawnedMonsters("Coconut Crab")[1].Spawner
            while macrov2.combatSettings.trainCrab and not isMonsterKilled(spawner.Name) do
                if api.magnitude(Vector3.new(-258, 109, 483)) > 50 then
                    moveTo(Vector3.new(-441, 123, 498))
                    task.wait(6)
                    moveTo(Vector3.new(-258, 109, 483))
                    task.wait()
                elseif api.magnitude(Vector3.new(-258, 109, 483)) > 15 then
                    api.humanoid():MoveTo(Vector3.new(-258, 109, 483))
                    api.humanoid().MoveToFinished:Wait(2)
                end
                if api.magnitude(Vector3.new(-258, 109, 483)) < 20 then
                    collectNearestTokens(Vector3.new(-258, 109, 483), 20)
                end
                task.wait()
            end
            cocoPad.CanCollide = false
            if #getSpawnedMonsters("Coconut Crab") == 0 then
                task.wait(1)
                for i=1,25 do
                    if findField(player.Character.HumanoidRootPart.Position) ~= coconutField then
                        moveTo(coconutField.Position)
                    end
                    collectNearestTokens(coconutField.Position, 50)
                end
                task.wait(0.5)
            end
            if oldMask == "Diamond Mask" then
                requestAccessoryEquip("Diamond Mask")
            end
        end
    end
end

function trainStumpSnail()
    if not macrov2.combatSettings.trainStumpSnail then return false end
    if not (#getSpawnedMonsters("Stump Snail") >= 1) then return false end

    if macrov2.combatSettings.snailConvertHoney and getBagPercentage() >= 99 then return convertHoney(false) end

    if not isFieldSame(api.humanoidrootpart().Position, FlowerZones["Stump Field"].Position) then
        moveTo(FlowerZones["Stump Field"].Position)
        task.wait(2)
        placeSprinkler(nil, true, true)
    end
    
    local importantCallback = function(token) 
        if not (findField(token.Position) == FlowerZones["Stump Field"]) then return false end
        local Snail = getAliveMonsters("Stump Snail")[1]
        if not Snail then 
            return true
        else
            if Snail:FindFirstChild("Head") and api.magnitude(token.Position, (Snail.Head.Position - Vector3.new(0,10,0))) < 21 then return false end
            return true
        end
    end
    local isFarmed = false
    for i=1,5 do
        local farmed = farmToken(importantCallback)
        isFarmed = isFarmed or farmed
    end
    if not isFarmed and (tick() - temptable.lastWalkToNearest > 1.5) then
        local randomFlower = getRandomFlower(FlowerZones["Stump Field"])
        local Snail = getAliveMonsters("Stump Snail")[1]
        if randomFlower and 
            Snail and Snail:FindFirstChild("Head") and 
            api.magnitude(randomFlower.Position, (Snail.Head.Position - Vector3.new(0,10,0))) > 40
        then
            temptable.lastWalkToNearest = tick()
            api.humanoid():MoveTo(randomFlower.Position)
            task.wait(0.1)
        end
    end
    return true
end

function trainKingBeetle()
    if macrov2.combatSettings.trainKingBeetle then
        if #getSpawnedMonsters("King Beetle") == 1 then
            local spawner = getSpawnedMonsters("King Beetle")[1].Spawner

            temptable.customWalkSpeed.enabled = true
            temptable.customWalkSpeed.speed = 18

            while macrov2.combatSettings.trainKingBeetle and not isMonsterKilled(spawner.Name) do
                if api.magnitude(Vector3.new(179, 4, 194)) > 100 then
                    moveTo(Vector3.new(172, 4, 144))
                    task.wait(1)
                    -- moveTo(Vector3.new(108, 4, 227))
                    -- task.wait()
                    api.humanoid():MoveTo(Vector3.new(109, 4, 253))
                end
                task.wait()
            end
            temptable.customWalkSpeed.speed = 50
            task.wait(1)
            if #getSpawnedMonsters("King Beetle") == 0 then
                for i=1,10 do
                    collectNearestTokens(Vector3.new(179, 4, 194), 60)
                end
                task.wait(0.5)
            end
            temptable.customWalkSpeed.enabled = false
        end
    end
end

function isFieldOccupied(field)
    local planters = getMinePlanters()
    for _,planter in pairs(planters) do
        if planter.PotModel and planter.PotModel.Parent and planter.PotModel.PrimaryPart then
            if findField(planter.PotModel.PrimaryPart.Position).Name == field then
                return true
            end
        end
    end
    return false
end

function isPlanterPlanted(planterName)
    local planters = getMinePlanters()
    local planterData = getPlanterData(planterName)
    for _,planter in pairs(planters) do
        -- warn(planter.Type, planterData.systemName)
        if planter.Active and not planter.Collected and planter.Type == planterData.systemName then
            return true
        end
    end
    return false
end

function getBestPlanter(nectar, field, blacklisted)
    local bestPlanter = ""
    local bestZone = ""
    local bestNectarMultiplier = 0
    local bestZoneMultiplier = 0

    for planterName, planter in pairs(plantersTable) do
        if not table.find(macrov2.autoPlantersSettings.blacklistedPlanters, planter.systemName) 
        and not isPlanterPlanted(planterName) 
        and (planterName ~= "Plenty" and getClientStatCache("Eggs", planterName.."Planter") or getClientStatCache("Eggs", "The Planter Of Plenty")) then
            local fieldColor = Workspace.FlowerZones[field].ColorGroup.Value
            local nectarMultiplier = planter.nectarMultipliers[nectar] or 1
            local zoneMultiplier = planter.pollenMultipliers.Zones[fieldColor] or 1
            local colorMultiplier = planter.pollenMultipliers.Colors[fieldColor] or 1
            local overallMultiplier = nectarMultiplier * zoneMultiplier * colorMultiplier

            if overallMultiplier > bestNectarMultiplier * bestZoneMultiplier then
                bestPlanter = planterName
                bestZone = fieldColor
                bestNectarMultiplier = nectarMultiplier
                bestZoneMultiplier = zoneMultiplier * colorMultiplier
            end
        end
    end

    return bestPlanter, bestZone
end

function isNectarPending(nectartype)
	local planters = getMinePlanters()
	for i, v in pairs(planters) do
		local location = findField(v.PotModel.PrimaryPart.Position)
		if location then
			local conftype = NectarTypes.PickForField(location.Name)
			if conftype then
				if conftype.." Nectar" == nectartype then
					return true
				end
			end
		end
	end
	return false
end

function getBestNectarField(nectar)
    nectar = tostring(nectar)
    local nectar = nectar:gsub(" Nectar", "")
    if not nectarsTable[nectar] then return --[[warn(nectar, "not found")]] end
    local bestField = ""
    for index, nectarField in pairs(nectarsTable[nectar]) do
        if not isFieldOccupied(nectarField) and not (nectarField == "Ant Field") then
            bestField = nectarField
        end
    end
    return bestField
end

function calculateLeastNectar()
    local blacklistedNectars = macrov2.autoPlantersSettings.blacklistedNectars
    local leastNectar
    local leastNectarTime = math.huge
    for i,v in pairs(nectarsDropdownTable) do
        if table.find(blacklistedNectars, v) or isNectarPending(v) then continue end
        -- print(table.find(blacklistedNectars, v), isNectarPending(v))
        local currentNectarTime = getBuffTime(v)
        if currentNectarTime < leastNectarTime then
            leastNectar = v
            leastNectarTime = currentNectarTime
        end
    end
    -- warn(leastNectar)
    return leastNectar
end

function collectSpecificPlanter(planterPart, id)
    if planterPart and api.humanoid() and api.humanoid().Health > 0 and api.humanoidrootpart() then
        moveTo(planterPart.Position - Vector3.new(0,3,0))
        task.wait(1)
        if api.magnitude(api.humanoidrootpart().Position, planterPart.Position) < 20 then
            setIdentity(2)
            Events.ClientCall("PlanterModelCollect", id)
            -- LocalPlanters.PromptCollect(id)
            setIdentity(origThreadIdentity)
            task.wait(3)
            for i = 1, 5 do
                collectNearestTokens(nil, 50)
            end
            task.wait()
        end
    end
end

if _G.debugging then
    warn("Functions init done. Waiting 1 second")
    task.wait(1)
end

if _G.debugging then
    warn("Other Functions init.")
end

-- writefile("plantersData.json", jsonEncode(plantersTable))

function isPlanterExists(pNum)
	local exists = false
	local stuffs = getMinePlanters()
	if stuffs ~= {} then
		for i, v in pairs(stuffs) do
			if v["ActorID"] == pNum and v.Active and not v.Collected then
				exists = true
			end
		end
	end
	return exists
end

function plantPlanter(planterName, fieldName)
    if not planterName or not fieldName then return end
    local planterData = getPlanterData(planterName)
    -- print(planterName)
    local fieldSelected = Workspace.FlowerZones:FindFirstChild(fieldName)
    if not fieldSelected then return end
    local stepTable = {field = fieldName, planter = planterName}
    temptable.plantingPlanter = true
    while api.humanoidrootpart() and api.humanoid().Health > 0 and not checkIfPlanted(stepTable) and not isFieldOccupied(fieldName) do
        while not (api.magnitude(fieldSelected.Position) < 8) do
            moveTo(fieldSelected.Position)
            task.wait()
        end
        task.wait(0.5)
        PlayerActivesCommand:FireServer({["Name"] = planterData.displayName})
        task.wait(1)
    end
    plantingPlanter = false
end

function collectAllPlanters(collectPercentage)
    local plantersToCollect = {}
    for _,planter in pairs(getMinePlanters()) do
        if planter.GrowthPercent ~= nil then
            
            if planter.GrowthPercent >= ((collectPercentage or macrov2.autoPlantersSettings.planterHarvestAt) / 100) then
                table.insert(plantersToCollect, {
                    ["PM"] = planter["PotModel"].PrimaryPart,
					["AID"] = planter["ActorID"]
                })
            end
        end
    end
    if #plantersToCollect > 0 then
        for _,planter in pairs(plantersToCollect) do
            while isPlanterExists(planter.AID) do
                collectSpecificPlanter(planter.PM, planter.AID)
                task.wait(1)
            end
        end
    end
end

function getPlantersCacheFromFile()
    if not isfile(plantersCacheFilePath) then
        local defaultPlantersCache = {
            customPlanters1 = 1,
            customPlanters2 = 1,
            customPlanters3 = 1
        }
        writefile(plantersCacheFilePath, game.HttpService:JSONEncode(defaultPlantersCache))
    end
    return game.HttpService:JSONDecode(readfile(plantersCacheFilePath))
end

function getPlantersCache() 
    local Cache = plantersCache
    local isFromCache = true
    if not Cache then 
        isFromCache = false
        Cache = getPlantersCacheFromFile()
        plantersCache = Cache
    end
    -- print((isFromCache and "Loaded from Cache") or "Loaded from File")
    return Cache
end

function updatePlantersCache(cycle, newValue)
    local Cache = getPlantersCache()
    Cache["customPlanters"..cycle] = newValue
    plantersCache = Cache
    writefile(plantersCacheFilePath, game.HttpService:JSONEncode(Cache))
end

function checkIfPlanted(stepTable)
    local isPlanted,planter = false,nil
    for i,v in pairs(getMinePlanters()) do
        local planterName = getPlanterData(v.Type).displayName
        local planterField = findField(v.Pos)
        -- warn(stepTable.planter, planterName)
        
        if (stepTable.field == (planterField and planterField.Name))
        and(stepTable.planter == planterName) then
            -- print("FOUND PLANTER!")
            isPlanted = true
            planter = v
            break
        end
    end
    -- warn(isPlanted,planter)
    return isPlanted,planter
end

function isPlanterInConfig(planter)
    for i=1,3 do
        local cycleName = "customPlanters"..i
        local stepsTable = macrov2.customPlanterSettings[cycleName]
        for j=1,5 do
            local stepTable = stepsTable[j]
            if not (stepTable.planter and table.find(plantersDropdownTable, stepTable.planter))
            or not (stepTable.field and table.find(fieldsTable, stepTable.field))
            then
                continue
            else
                local isInConfig = (getPlanterData(stepTable.planter).displayName == planter.Name and stepTable.field == planter.Field)
                if isInConfig then return true end
            end
        end
    end
    return false
end

function autoPlanters()
    local shouldReturn = false
    if macrov2.autoPlantersSettings.doCustomPlanters then
        local planterCycles = macrov2.customPlanterSettings

        local steps = {
            customPlanters1 = 5, 
            customPlanters2 = 5, 
            customPlanters3 = 5
        }

        for i=1,3 do
            local cycleName = "customPlanters"..i
            local stepsTable = planterCycles[cycleName]
            for j=1,5 do
                local stepTable = stepsTable[j]
                if not (stepTable.planter and table.find(plantersDropdownTable, stepTable.planter))
                or not (stepTable.field and table.find(fieldsTable, stepTable.field))
                then
                    steps[cycleName] -= 1
                else
                    local isPlanted = checkIfPlanted(stepTable)
                    -- warn("Is Planted: "..tostring(isPlanted))
                    if isPlanted then updatePlantersCache(i,j) break end
                end
            end
        end

        local currentSteps = getPlantersCache()
        
        for i,planter in pairs(getMinePlanters()) do
            local planterName = getPlanterData(planter.Type).displayName
            local planterField = findField(planter.Pos) and findField(planter.Pos).Name

            if not isPlanterInConfig({Name = planterName, Field = planterField}) then
                -- print("NOT IN CONFIG")
                collectSpecificPlanter(planter.PotModel.PrimaryPart, planter.ActorID)
                shouldReturn = true
            end
        end

        for i=1,3 do
            local cycleName = "customPlanters"..i
            local stepsTable = planterCycles[cycleName]

            if steps[cycleName] == 0 then continue end
            local currentStep = currentSteps[cycleName]
            local config = stepsTable[currentStep]
            if currentStep > steps[cycleName] then 
                -- print("Step limit ",cycleName,currentStep,steps[cycleName])
                currentStep = 1 
                updatePlantersCache(i,1)
                currentSteps = getPlantersCache()
            end
            local isPlanted,Planter = checkIfPlanted(config)
            -- print(isPlanted, config)
            if not isPlanted and #getMinePlanters() < 3 then
                -- print("Not Planted")
                local planter = config.planter
                if planter:find("Plenty") then planter = "The Planter Of Plenty" elseif not table.find(plantersDropdownTable, planter) then continue end
                local planterData = getPlanterData(planter)
                local planterCount = getClientStatCache("Eggs", (planter:find("Plenty") and "Plenty" or planterData.systemName).."Planter") or 0
                if isFieldOccupied(config.field) or planterCount <= 0 or isPlanterPlanted(planterData.systemName) then
                    warn("Skipped", cycleName, planter, config.field)
                    updatePlantersCache(i,currentStep + 1)
                    currentSteps = getPlantersCache()
                    warn(currentSteps[cycleName])
                else
                    plantPlanter(planterData.systemName, config.field)
                    task.wait()
                    shouldReturn = true
                end
            else
                if Planter.GrowthPercent >= (config.harvestAmount / 100) then
                    if Planter.PotModel.Name == config.planter and findField(Planter.PotModel.PrimaryPart.Position).Name == config.field then
                        collectSpecificPlanter(Planter.PotModel.PrimaryPart, Planter.ActorID)
                        updatePlantersCache(i,currentStep + 1)
                        currentSteps = getPlantersCache()
                        shouldReturn = true
                    end
                end
            end
        end
    end
    return shouldReturn
end

function farmDupedTokens()
    if #temptable.dupedTokensTable > 0 then
        local dupedToken = next(temptable.dupedTokensTable)
        if tonumber(dupedToken) then dupedToken = temptable.dupedTokensTable[dupedToken] end
        local succ,err = pcall(function()
            while dupedToken.Attachment.BillboardGuiFront.Smile.ImageColor3 ~= Color3.fromRGB(255, 0, 255) do
                local pos = dupedToken.Position - Vector3.new(0,10,0)

                player.Character.Humanoid:MoveTo(pos)

                task.wait(.05)
            end
            local index = table.find(temptable.dupedTokensTable, dupedToken)
            table.remove(temptable.dupedTokensTable, index)
        end)
        if not succ then warn(err) end
        if succ then return true end
    end
    return false
end

function mainAutofarmFunction()
    local function importantFarmTaskCallback(token)
        return findField(token.Position) == temptable.fieldSelected
    end

    while task.wait() do
        xpcall(function() 
            if temptable.stopEverything then return task.wait(.03) end
            -- print(1)

            if temptable.autoRBC.isActive then return task.wait(.03) end
            -- print(2)

            if canTaskBeSpawned("getToys") then
                getToys() -- Starting main function with checking all toys
            end
            -- print(3)

            if macrov2.autoPlantersSettings.doCustomPlanters and canTaskBeSpawned("farmPlanters") then
                if autoPlanters() then return end-- Second step, check all planters
            end
            -- print(4)

            if macrov2.combatSettings.killVicious and temptable.detected.vicious and canTaskBeSpawned("killVicious") then
                killVicious() -- Third step, kill vicious if found.
            end
            -- print(5)
            
            tryKillMonsters()
            -- print(6)

            if canTaskBeSpawned("trainBosses") then
                if macrov2.combatSettings.trainKingBeetle then
                    trainKingBeetle()
                end
        
                if macrov2.combatSettings.trainTunnelBear then
                    trainTunnelBear()
                end
        
                if macrov2.combatSettings.trainCrab then
                    trainCrab()
                end
                -- print(7)

                if macrov2.combatSettings.trainStumpSnail then
                    if trainStumpSnail() then return end
                end
            end
            -- print()
            if not macrov2.toggles.convertHoney or not shouldIConvert() then

                if temptable.shouldEquipDefaultMask then
                    temptable.shouldEquipDefaultMask = false
                    -- warn(macrov2.vars.defaultmask)
                    requestAccessoryEquip(macrov2.vars.defaultmask)
                    return
                end

                if temptable.puffsDetected and macrov2.autoPuffshroomSettings.farmPuffshrooms then
                    farmPuffshrooms()
                    return
                end

                if macrov2.autoFarmSettings.farmSprouts then
                    farmSprouts()
                end

                selectField(macrov2.autoFarmSettings.field)

                if macrov2.autoQuestSettings.doQuests then
                    doQuests()
                end

                if not isFieldSame(api.humanoidrootpart().Position, temptable.fieldPosition) then
                    moveTo(temptable.fieldPosition + Vector3.new(0,3,0))
                    task.wait()
                    placeSprinklers(temptable.fieldPosition)
                end

                if macrov2.autoFarmSettings.smartPreciseCrosshair and #getCrosshairs().all > 0 then
                    if smartFarmCrosshairs() then return end 
                end

                if macrov2.autoFarmSettings.farmDupedTokens then
                    farmDupedTokens()
                end

                if macrov2.autoFarmSettings.farmShower or macrov2.autoFarmSettings.farmCoconuts then
                    farmShowerAndCoco()
                end

                local isFarmed = false
                isFarmed = farmNearest(importantFarmTaskCallback)
                -- for i=1,3 do
                    -- isFarmed = isFarmed or farmed
                -- end
                
                if math.random(68,70) == 69 then
                    local farmed = gotoNearestBalloon()
                    isFarmed = isFarmed or farmed
                end

                if not isFarmed and (tick() - temptable.lastWalkToNearest > 1.5) then
                    local randomFlower = getRandomFlower(temptable.fieldSelected)
                    if randomFlower then
                        temptable.lastWalkToNearest = tick()
                        api.humanoid():MoveTo(randomFlower.Position)
                    end
                end
            elseif macrov2.toggles.convertHoney and shouldIConvert(false, false) then
                convertHoney(macrov2.toggles.converthiveballoon)
            end
        end, function(err) warn(("%s | An error has occurred: %s"):format(temptable.version, err)) end)
    end
end

local autoDig

local autoRBC = {
    Listeners = {}, 
    Functions = {takeRBQuest, getActiveChallange}, 
    redBeesPriorityList = {["Rage"] = 6,["Bear"] = 1,["Shy"] = 15,["Rad"] = 16,["Shy"] = 15,["Rad"] = 16,["Shy"] = 15,["Rad"] = 16,["Brave"] = 9,["Baby"] = 13,["Windy"] = 5,["Spicy"] = 7,["Fire"] = 20,["Tabby"] = 2,["Cool"] = 36,["Demo"] = 32,["Lion"] = 41,["Honey"] = 30,["Demon"] = 37,["Riley"] = 26,["Vector"] = 8,["Hasty"] = 40,["Ninja"] = 42,["Bucko"] = 34,["Fuzzy"] = 23,["Music"] = 14,["Gummy"] = 17,["Puppy"] = 43,["Basic"] = 18,["Bumble"] = 27,["Bomber"] = 31,["Bubble"] = 33,["Cobalt"] = 35,["Frosty"] = 39,["Rascal"] = 44,["Tadpole"] = 21,["Precise"] = 3,["Digital"] = 4,["Looker"] = 10,["Photon"] = 12,["Shocked"] = 45,["Diamond"] = 28,["Buoyant"] = 29,["Vicious"] = 22,["Festive"] = 24,["Crimson"] = 11,["Stubborn"] = 46,["Carpenter"] = 19,["Commander"] = 25,["Exhausted"] = 38 },
    farmField = function(field)
        if not (findField(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) == field)  then
            moveTo(field.Position + Vector3.new(0,3,0))
            task.wait(.5)
            PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})
            task.wait()
        end

        if not macrov2.toggles.autodig then
            autoDig.Set(true)
        end

        local function importantFarmTaskCallback(token)
            return findField(token.Position) == field
        end

        local isFarmed = farmNearest(importantFarmTaskCallback)

        if not isFarmed and (tick() - temptable.lastWalkToNearest > 3) then
            local randomFlower = getRandomFlower(field)
            if randomFlower then
                temptable.lastWalkToNearest = tick()
                api.humanoid():MoveTo(randomFlower.Position)
            end
        end
    end,
    getTaskField = function(questTask)
    if questTask.Zone then
        return questTask.Zone
    elseif questTask.Color then
        return macrov2.autoQuestSettings["best"..questTask.Color.."Field"]
    else
        return macrov2.autoQuestSettings["bestRedField"]
    end
end
}


autoRBC.Functions = {
    getActiveChallange = function() 
        return secureCall(RoboBearGui.GetActiveChallengeData, Activatables)
    end,

    selectQuest = function()
        Events.ClientCall("RoboBearQuestSelect", math.random(1,2))
    end,

    selectBee = function(beesTable)
        local playerFile = getClientStatCache()
        local bestBee = {priority = math.huge, index = 1, beeName = nil}
        for beeIndex=1, #beesTable do
            local obfuscatedBee = beesTable[beeIndex]
            local obfuscatedBeeX = obfuscatedBee[1]
            local obfuscatedBeeY = obfuscatedBee[2]
    
            local beeFile = secureCall(StatTools.GetBeeFile, Activatables, playerFile, obfuscatedBeeX, obfuscatedBeeY)
            if beeFile then
                local beePriority = autoRBC.redBeesPriorityList[beeFile.Type]
                if beePriority and beePriority < bestBee.priority then
                    bestBee.priority = beePriority
                    bestBee.index = beeIndex
                    bestBee.beeName = beeFile.Type
                end
            end
        end
        Events.ClientCall("RoboBearBeeSelect", bestBee.index or 1)
    end,

    chooseUpgrades = function()
        Events.ClientCall("RoboBearRoundStart")
    end,

    onRoundStart = function()
        while task.wait() do
            local currentChallangeData = autoRBC.Functions.getActiveChallange()
            if not currentChallangeData then return end
    
            local playerFile = getClientStatCache()

            local ActiveQuest = currentChallangeData.ActiveQuest

            if not ActiveQuest or not ActiveQuest.Tasks then continue end

            local tasks = ActiveQuest.Tasks
            local progress = secureCall(Quests.GetProgression, Activatables, nil, tasks, playerFile)
            if progress then
                writefile("rbc/progress_1.json", game.HttpService:JSONEncode(progress))
                writefile("rbc/teasks_1.json", game.HttpService:JSONEncode(tasks))
                for i,v in ipairs(tasks) do
                    if progress[i][1] < 1 then
                        local taskType = tasks[i].Type
                        if taskType == "Collect Pollen" or taskType == "Make Honey" or taskType == "Collect Goo" then
                            local taskTable = {}
                            if taskType == "Collect Pollen" then
                                taskTable.Color = tasks[i].Color
                                taskTable.Zone = tasks[i].Zone
                            elseif taskType == "Make Honey" or taskType == "Collect Goo" then
                                taskTable.Color = "Red"
                            end
                            local fieldName = autoRBC.getTaskField(taskTable)
                            -- print(fieldName)
                            if fieldName and game.Workspace.FlowerZones:FindFirstChild(fieldName) then
                                pcall(function() 
                                    autoRBC.farmField(game.Workspace.FlowerZones:FindFirstChild(fieldName))
                                end)
                            end
                        end
                        break
                    end
                end
            end
        end
    end,

    onRoundEnd = function()
        local playerInventory = getClientStatCache("Eggs")
        if playerInventory.Cogs then
            local function buyDrive(driveName)
                if player:DistanceFromCharacter(Vector3.new(-473, 60, 106)) > 25 then
                    moveTo(Vector3.new(-473, 60, 106))
                    task.wait(.25)
                end
                task.wait(.25)
                Events.ClientCall("ItemPackageEvent", "Purchase", {
                    Type = "Robo Bear "..driveName, Amount = 1, Category = "Bundle"
                })
                task.wait(.1)
            end
            while playerInventory.Cogs >= 50 do
                if (playerInventory.WhiteDrive or 0) < 5 then
                    buyDrive("White Drive")
                elseif (playerInventory.RedDrive or 0) < 5 then
                    buyDrive("Red Drive")
                elseif (playerInventory.BlueDrive or 0) < 5 then
                    buyDrive("Blue Drive")
                elseif (playerInventory.GlitchedDrive or 0) < 5 then
                    buyDrive("Gitched Drive")
                else break end
            end
            task.wait()
        end
        autoRBC.Functions.takeRBQuest()
    end,

    onChallangeEnd = function() 
        for i,v in pairs(autoRBC["Listeners"]) do
            pcall(function() v:Disconnect() end)
        end

        Events.ClientCall("RoboBearClaimRewards")

        temptable.autoRBC.latestRBC = tick() + 5
        
        task.wait(2.5)

        temptable.autoRBC.isActive = false
    end,
    takeRBQuest = function()
        warn(2)
        local attempts = 0
        local activaChallange = autoRBC.Functions.getActiveChallange()
        while (not activaChallange or activaChallange.RoundState ~= "Running") and attempts < 5 do
            
            if api.magnitude(RoboBear.Platform.Position) <= 25 and not ScreenGui.NPC.Visible then
            	while not ScreenGui.NPC.Visible and not (api.magnitude(RoboBear.Platform.Position) > 25) do
                    secureCall(ActivatablesNPC.ButtonEffect, Activatables, player, RoboBear)
                    task.wait(.5)
                    continue
            	end
            elseif api.magnitude(RoboBear.Platform.Position) > 25 then
                moveTo(RoboBear.Platform.Position + Vector3.new(0,3,0))
                task.wait(.5)
                continue
            end

            local tempTimestamp = tick()

            repeat task.wait() until ScreenGui.NPC.Visible or tick() - tempTimestamp > 10

            while ScreenGui.NPC.Visible do
                local optionText = ScreenGui.NPC.OptionFrame.Option1.Text
            	if ScreenGui.NPC.OptionFrame.Visible 
                  and ScreenGui.NPC.OptionFrame.Option1.Visible 
                  and (optionText:find("Spend 1 Robo Pass") or optionText:find("Start Round")) then
                    setIdentity(2)
            		firesignal(ScreenGui.NPC.OptionFrame.Option1.MouseButton1Click)
                    setIdentity(origThreadIdentity)
            	else
                    setIdentity(2)
            		firesignal(ScreenGui.NPC.ButtonOverlay.MouseButton1Click)
                    setIdentity(origThreadIdentity)
            	end
            	task.wait()
            end

            task.wait(2.5)
            attempts = attempts + 1
            activaChallange = autoRBC.Functions.getActiveChallange()
        end
        task.wait(0.5)
        return autoRBC.Functions.getActiveChallange()
    end
}
    


function mainAutoRBCFunction()
    warn(1)
    autoRBC["Listeners"][1] = EventsDir.RoboBearQuestSelect.OnClientEvent:Connect(autoRBC.Functions.selectQuest)
    autoRBC["Listeners"][2] = EventsDir.RoboBearBeeSelect.OnClientEvent:Connect(autoRBC.Functions.selectBee)
    autoRBC["Listeners"][3] = EventsDir.RoboBearUpgradeSelect.OnClientEvent:Connect(autoRBC.Functions.chooseUpgrades)
    autoRBC["Listeners"][4] = EventsDir.RoboBearRoundStart.OnClientEvent:Connect(autoRBC.Functions.onRoundStart)
    autoRBC["Listeners"][5] = EventsDir.RoboBearRoundEnd.OnClientEvent:Connect(autoRBC.Functions.onRoundEnd)
    autoRBC["Listeners"][6] = EventsDir.RoboBearChallengeEnd.OnClientEvent:Connect(autoRBC.Functions.onChallangeEnd)

    if autoRBC.Functions.takeRBQuest() then temptable.autoRBC.isActive = true end
end

function webhookFieldsList()
    local currentHoney = getClientStatCache("Totals","Honey")
	local timePassed = math.round(tick() - currentMacroV2LoadedAt)
    -- print(currentHoney, temptable.honeyAtStart)
	local honeyGained = currentHoney - temptable.honeyAtStart
    -- print(currentHoney, timePassed, honeyGained)

    local honeyPerHour = math.floor(honeyGained / timePassed) * 3600
    local dailyHoney = getDailyHoney()

	local totalHoneyString = truncate(currentHoney)
	local honeyGainedString = truncate(honeyGained)
	local honeyPerHourString = truncate(honeyPerHour)
	local honeyPerDayString = truncate(dailyHoney)

	if not macrov2.webhookSettings.onlyTruncated then
		totalHoneyString = addcommas(currentHoney).." ("..totalHoneyString..")"
		honeyGainedString = addcommas(honeyGained).." ("..honeyGainedString..")"
		honeyPerHourString = addcommas(honeyPerHour).." ("..honeyPerHourString..")"
		honeyPerDayString = addcommas(dailyHoney).." ("..honeyPerDayString..")"
	end

	local uptimeString = truncatetime(timePassed)
	local fields = {}

    if macrov2.webhookSettings.showTotalHoney then
		table.insert(fields, {
			["name"] = "Total Honey:",
			["value"] = totalHoneyString,
			["inline"] =  false
		})
	end
	table.insert(fields, {
		["name"] = "Session Honey:       ",
		["value"] = honeyGainedString,
		["inline"] =  true
	})
	table.insert(fields, {
		["name"] = "Session Uptime:     ",
		["value"] = uptimeString,
		["inline"] =  true
	})
	if macrov2.webhookSettings.showHoneyPerHour then
		table.insert(fields, {
			["name"] = "Honey Per Hour:       ",
			["value"] = honeyPerHourString,
			["inline"] = false
		})
	end
    if macrov2.webhookSettings.showDailyHoney then
		table.insert(fields, {
			["name"] = "Honey Per Day:     ", -- 
			["value"] = honeyPerDayString,
			["inline"] = false
		})
	end
	if macrov2.webhookSettings.showNectars then
		local nectars = getAllNectar(true)
		local nectarsString = ""
		for index, nectar in pairs(nectars) do
			if nectar.time == 0 then continue end
			nectarsString = nectarsString..""..(nectarEmojis[nectar.name] or nectar.name..":").." "..nectar.time
			nectarsString = nectarsString.."\n"
		end
		if #nectarsString > 1 then
			table.insert(fields, {
				["name"] = "Nectars:",
				["value"] = nectarsString,
				["inline"] =  false
			})
		end
	end
	if macrov2.webhookSettings.showPlanters then
		local plantersString = ""
        pcall(function()
            local minePlanters = getMinePlanters()
            for i,v in pairs(minePlanters) do
                plantersString = plantersString..""..plantersEmojis[v.PotModel.Name].." "..math.floor(v.GrowthPercent*1000)/10 .. "%\n"
            end
        end)
        if plantersString ~= "" then
            table.insert(fields, {
                name = "Active Planters",
                value = plantersString,
                inline = false
            })
        end
	end
	if macrov2.webhookSettings.showItems then
		local itemsString = ""
		for index, item in pairs(macrov2.webhookSettings.itemsList) do
			local systemItem = getItemByName(item)
			if systemItem and systemItem.SystemName then 
				local systemName = systemItem.SystemName
				local count = getClientStatCache("Eggs", systemName) or 0
				itemsString = itemsString .. item .. ": **" .. tostring(count) .. "**\n"
			end
		end
		if itemsString ~= "" then
			table.insert(fields, {
				name = "Items",
				value = itemsString,
				inline = false
			})
		end
	end
	return fields
end

function generateWebhookBody(settings)
	local body = {
		["username"] = player.Name,
		["avatar_url"] = "https://cdn.discordapp.com/icons/1024873171867942933/a_9c03ad84c8288aa059c9cfb3ed65aa9d.gif?size=48",
		["content"] = settings.content or "",
		["embeds"] = {{
			["title"] = "**"..settings.embedTitle.."**",
			["description"] = settings.embedDescription or "",
			["type"] = "rich",
			["color"] = tonumber(settings.color) or tonumber(macrov2.webhookSettings.webhookColor),
			["thumbnail"] = {url = settings.thumbnail or "https://cdn.discordapp.com/icons/1024873171867942933/a_9c03ad84c8288aa059c9cfb3ed65aa9d.gif?size=96"},
			["fields"] = settings.fields or {},
			["footer"] = {
				["text"] = os.date("%x").." • "..os.date("%I")..":"..os.date("%M")..--[[":"..os.date("%S")..]]" "..os.date("%p")
			}
		}}
	}
	return body
end

function sendWebhook(body)
	local headers = {
		["content-Type"] = "application/json"
	}
    xpcall(function()
        httpreq({
            Url = macrov2.webhookSettings.webhookUrl, 
            Body = HttpService:JSONEncode(body), 
            Method = "POST", 
            Headers = headers
        })
        task.wait()
        temptable.lastWebhookSent = math.round(tick())
    end, function(err) warn(("%s | Failed to send webhook: %s"):format(temptable.version, err)) end)
end

function questWebhook(npc,fields)
	local thumbnail = npcsIcons[npc]
	local data = generateWebhookBody({
		embedTitle = "Macro V3 | Quests",
		thumbnail = thumbnail,
		fields = fields
	})
	sendWebhook(data)
end

function sendHourlyWebhook(isTest)
    local ping = macrov2.webhookSettings.pingUser and "<@"..macrov2.webhookSettings.discordId..">" or ""
	local data = generateWebhookBody({
		content = (isTest and ping ~= "" and ping..", your webhook is working!") or (isTest and ping == "" and "Your webhook is working!") or ping,
		embedTitle = isTest and "Webhook Test" or "Honey Update",
		fields = webhookFieldsList()
	})
    -- writefile("datanew.json", game.HttpService:JSONEncode(data))
	-- print("sending webhook")
	sendWebhook(data)
end

function sendTestWebhook()
    local data = generateWebhookBody({
		embedTitle = "Test Webhook",
        embedDescription = "Hey lol - Narnia"
	})
    sendWebhook(data)
end

if _G.debugging then
    warn("Other Functions init done. Waiting 5 seconds")
    task.wait(5)
end

if _G.debugging then
    warn("Auto Memory Match init.")
end

local newMemoryMatchStartGame = function() end
local MemoryMatchStartGame

if not getgenv().autoMMConfigured then
    getgenv().autoMMConfigured = true
    LPH_NO_VIRTUALIZE(function() -- Auto Memory Match
        MemoryMatchStartGame = MinigameGui.StartGame
        
        local function UpdateGameTable(a)
            local dupes = {}
            local exclude = a.Game.MatchedTiles
        
            for index, value in pairs(a.Game.RevealedTiles) do
                if exclude[index] == nil then  -- skip excluded indexes
                    if dupes[value] == nil then
                        dupes[value] = {Indexes = {index}}
                    else
                        table.insert(dupes[value]["Indexes"], index)
                    end
                end
            end
        
            for i,v in pairs(dupes) do
            if #v.Indexes < 2 then dupes[i] = nil end
            end
        
            return dupes
        end
        
        newMemoryMatchStartGame = function(a)
            if not macrov2.toggles.automemorymatch and not macrov2.autoQuestSettings then return end
            repeat task.wait() until a and a.Game and a.Game.Grid and a.Game.Grid.InputActive
            temptable.activeMemoryMatch = a
            --print("You have",a.Game.Chances,"Chances")
            for Index = 1, a.Game.NumTiles do
                task.wait()
                warn("You have",a.Game.Chances,"chances left")
                if a.Game.Chances == 0 then break end
                setIdentity(2)
                local tile
                xpcall(function()tile=a.Game.Grid:GetTileAtIndex(Index)end,function(err)warn("Err:",err)end)
                setIdentity(origThreadIdentity)
        
                if a.Game.LastSelectedIndex ~= nil then
                    local searchFor = a.Game.RevealedTiles[a.Game.LastSelectedIndex]
                    local dupes = UpdateGameTable(a)
                    -- print(searchFor)
                    for i2,v2 in pairs(dupes) do
                        if i2 == searchFor and v2.Indexes[1] ~= Index then 
                            setIdentity(2)
                            tile = a.Game.Grid:GetTileAtIndex(v2.Indexes[1]) --[[print("found matched tile")]] 
                            setIdentity(origThreadIdentity)
                            break 
                        end
                    end
                else
                    local dupes = UpdateGameTable(a)
                    for i,v in pairs(dupes) do
                        if #v.Indexes > 1 then
                            -- secureCall(MemoryMatchModule.RegisterTileSelected, MemoryMatchGui, a.Game, a.Game.Grid:GetTileAtIndex(v.Indexes[1]))
                            setIdentity(2)
                            MemoryMatchModule.RegisterTileSelected(a.Game, a.Game.Grid:GetTileAtIndex(v.Indexes[1]))
                            setIdentity(origThreadIdentity)
                            repeat task.wait() until a.Game.Grid.InputActive or a.Game.Chances <= 0
                            setIdentity(2)
                            tile = a.Game.Grid:GetTileAtIndex(v.Indexes[2])
                            setIdentity(origThreadIdentity)
                            task.wait()
                            break
                        end
                    end
                end
                -- secureCall(MemoryMatchModule.RegisterTileSelected, MemoryMatchGui, a.Game, tile)
                setIdentity(2)
                MemoryMatchModule.RegisterTileSelected(a.Game, tile)
                setIdentity(origThreadIdentity)
                repeat task.wait() until a.Game.Grid.InputActive or a.Game.Chances <= 0
                task.wait()
            end
            warn("Finishing memory Match")
            -- secureCall(MemoryMatchModule.Finish, a.Game)
            -- MemoryMatchModule.Finish(a.Game)
            Events.ClientCall("MemoryMatchEvent", {
                Action = "Finish"
            })
            warn("Ending Game")
            -- secureCall(MinigameGui.EndGame, MemoryMatchManager)
            setIdentity(2)
            MinigameGui.EndGame()
            setIdentity(origThreadIdentity)
            warn("Game ended successfully")
            temptable.activeMemoryMatch = nil
        end
        local hookedMemoryMatchStartGame; hookedMemoryMatchStartGame = hookfunction(MemoryMatchStartGame, function(...)
            -- warn(1)
            local a = hookedMemoryMatchStartGame(...)
            -- warn(2)
            coroutine.wrap(function() task.wait(1) newMemoryMatchStartGame(a) end)()
            -- print(3)
            return a
        end)
    end)()
end

function hiddenQuestWebhookListener(isPoolQuest, arg1)
    task.wait(3)
    if not macrov2.webhookSettings.sendQuests then return end

    local fullQuest = (not isPoolQuest and getQuestInfo(arg1)) or nil
    local originalNPC = (not isPoolQuest and fullQuest and fullQuest.NPC) or arg1
    local NPC = originalNPC
    local QuestName = (not isPoolQuest and fullQuest and fullQuest.DisplayName) or nil

    local polarPower = tostring(getClientStatCache("Modifiers", "MaxBeeEnergy", "_", "Mods", 1, "Combo") or 0)
    local questCount = tostring(getClientStatCache("Totals", "QuestPoolCounts", originalNPC) or 0)
    pcall(function() NPC = originalNPC:gsub("Bear 2", "Bear") end)

    if isPoolQuest then
        local temp = getClientStatCache("Quests", "PoolLastQuests", tostring(originalNPC))
        local tempQuestInfo = getQuestInfo(temp)
        if temp then QuestName = (tempQuestInfo.DisplayName or tempQuestInfo.Name) end
    end

    local suffix = 
        (NPC=="Polar Bear" and "\n\n"..miscEmojis["Polar Power"].." x"..polarPower) or 
        ("\n\n"..(tonumber(questCount) and "Total "..NPC.."'s quests completed: "..questCount) or "...")

    local fields = {}

    if isPoolQuest then
        table.insert(fields,{
            name = "Completed Repeatable Quest",
            value = (QuestName or NPC)..suffix
        })
    else
        table.insert(fields,{
            name = "Completed Quest",
            value = QuestName
        })
    end

    questWebhook(NPC, fields)
end

getgenv().questWebhookListener = setmetatable({Active = true}, {
    __index = function(tbl, key) 
        if key == "HiddenListener" then
            return hiddenQuestWebhookListener
        else
            return rawget(tbl, key)
        end
    end
})

if false then

if not getgenv().questListener then
    getgenv().questListener = true

    LPH_NO_VIRTUALIZE(function()
        local a = require(game:GetService("ReplicatedStorage").Events)
        local oldClientCall
        oldClientCall = hookfunction(a.ClientCall, function(...)
            local event, arg1 = ...
            if event == "CompleteQuest" or event == "CompleteQuestFromPool" then
                xpcall(function()
                    coroutine.wrap(function(event, arg1) 
                        setIdentity(8)
                        questWebhookListener.HiddenListener((event == "CompleteQuest" and false) or true, arg1)
                    end)(event, arg1)
                end, function(err) if macrov2.webhookSettings.sendQuests then warn("Cannot send ") end end)
            end
            return oldClientCall(...)
        end)
    end)()
end

end

function placeSprinkler(position, withoutWait, withoutJump)
    -- Place a sprinkler at the specified position
    local humanoid = api.humanoid()
    if position then
        local temp1 = nil
        task.spawn(function() temp1 = walkTo(position, 2) end)
        repeat task.wait() until temp1 ~= nil
    end

    if not withoutJump then
        task.wait(.1)
        humanoid.Jump = true
        task.wait(.2)
    end
    PlayerActivesCommand:FireServer({["Name"] = "Sprinkler Builder"})
    if not withoutWait then
        task.wait(1)
    end
end

local sprinklerCounts = {
    ["The Supreme Saturator"] = 1,
    ["Basic Sprinkler"] = 1,
    ["Silver Soakers"] = 2,
    ["Golden Gushers"] = 3,
    ["Diamond Drenchers"] = 4
}

function placeSprinklers(fieldPos)
    if not fieldPos then return end
    print("sprinklers")
    local sprinkler = getClientStatCache("EquippedSprinkler")
    local flowerSize = 4

    local sprinklersToPlace = sprinklerCounts[sprinkler] or 0
    local placedSprinklersCount = 0

    local centerPos = fieldPos

    for _,v in pairs(Workspace.Gadgets:GetChildren()) do
        if v.Name == sprinkler and isFieldSame(centerPos, v.Base.Position) then
            placedSprinklersCount += 1
        end
    end

    if placedSprinklersCount >= sprinklersToPlace then return --[[print("sprinklers already placed!")]] end

    -- Check number of sprinklers to place and use appropriate pattern
    if sprinklersToPlace == 1 then
        -- Place one sprinkler in the center
        placeSprinkler(centerPos, true, true)
    elseif sprinklersToPlace == 2 then
        -- Place two sprinklers in a diagonal pattern
        placeSprinkler(centerPos + Vector3.new(-3*flowerSize, 0, -3*flowerSize))
        placeSprinkler(centerPos + Vector3.new(3*flowerSize, 0, 3*flowerSize), true, false)
    elseif sprinklersToPlace == 3 then
        -- Place three sprinklers in a "T" pattern
        placeSprinkler(centerPos + Vector3.new(3*flowerSize, 0, -3*flowerSize))
        placeSprinkler(centerPos + Vector3.new(-4*flowerSize, 0, -3*flowerSize))
        placeSprinkler(centerPos + Vector3.new(0*flowerSize, 0, 3*flowerSize), true, false)
    elseif sprinklersToPlace == 4 then
        -- Place four sprinklers in a "square" pattern
        placeSprinkler(centerPos + Vector3.new(-4*flowerSize, 0, 0*flowerSize))
        placeSprinkler(centerPos + Vector3.new(4*flowerSize, 0, 0*flowerSize))
        placeSprinkler(centerPos + Vector3.new(0*flowerSize, 0, 4*flowerSize))
        placeSprinkler(centerPos + Vector3.new(0*flowerSize, 0, -4*flowerSize), true, false)
    end
end

-- Auto Royal Jelly Functions
function getBeeRarity(beeName)
    local fullBeeData = beesTable.fullData[beeName:gsub(" Bee", "")]
    if fullBeeData then return fullBeeData.Rarity end
    return "Error 401 :skull:"
end

function isBeeExpected(beeCell)
    local beeName = beeCell.CellType.Value:gsub("Bee", " Bee")
    local beeRarity = getBeeRarity(beeName)
    local isGifted = beeCell:FindFirstChild("GiftedCell") and true or false
    
    local stop = false

    if temptable.autoRJSettings.requireAnyGifted and isGifted then 
        stop = true 
    end

    if table.find(temptable.autoRJSettings.selectedRarities, "Any "..beeRarity) or table.find(temptable.autoRJSettings.selectedRarities, "Gifted Any "..beeRarity) and isGifted then
        stop = true
    end

    if table.find(temptable.autoRJSettings.selectedBees, beeName) or table.find(temptable.autoRJSettings.selectedBees, "Gifted "..beeName) and isGifted then
        stop = true
    end
    return stop
end

function useJelly(x, y)
    -- secureCall(Events.ClientCall, ReplicatedStorage.Events, x, y, "RoyalJelly")
    Events.ClientCall("ConstructHiveCellFromEgg", x, y, "RoyalJelly")
    -- game:GetService("ReplicatedStorage").Events.ConstructHiveCellFromEgg:InvokeServer(x, y, "RoyalJelly") 
end

function startAutoRJ() 
    temptable.autoRJSettings.runningAutoRJ = true
    local x,y = temptable.autoRJSettings.xCoord,temptable.autoRJSettings.yCoord
    local cell = plrHive.Cells[("C%s,%s"):format(x, y)]
    --[[print(cell)]]
    while not isBeeExpected(cell) and temptable.autoRJSettings.runningAutoRJ do
        useJelly(x, y)
    end
end

function stopAutoRJ() 
    temptable.autoRJSettings.runningAutoRJ = false 
end

if _G.debugging then
    warn("Memory Match init done. Waiting 5 seconds")
    task.wait(5)
end

if _G.debugging then
    warn("Loading UI")
end

UIConfig = {
    --WindowName = "Macro V2 - v"..temptable.version.." Made By Narnia",
    WindowName = "Macro V3",
    Keybind = _G.keybind and Enum.KeyCode[_G.keybind] or Enum.KeyCode.Semicolon
}

Window = library:Init(UIConfig)
Window:Intro()
Window:AddTheme('rbxassetid://13338353633')
Window:AddTheme('rbxassetid://13338328479')

if _G.debugging then
    warn("UI loaded. task.waiting 5 seconds")
    task.wait(5)
end

guiElements = {
    toggles = {},
    vars = {},
    rares = {},
    bestfields = {},
    autodispensersettings = {},
    autoboostersettings = {},
    autoQuestSettings = {},
    webhookSettings = {},
    autoPlantersSettings = {},
    blacklistedNectars = {},
    autoPuffshroomSettings = {},
    combatSettings = {},
    autoFarmSettings = {},
    alertSettings = {},
    convertSettings = {},
    localPlayerSettings = {},
    RoboBearChallangeSettings = {}
}

function createTab(name)
    return Window:Tab(name)
end

function createSection(tab, sectionName)
    tab:Category(sectionName)
    return tab
end

function createLabel(section, labelText)
    return section:Label(labelText)
end

function updatedLabel(label, newText)
    return label.Set(newText)
end

function createDropdown(section, dropDownText, dropDownTable, config, callback)
    Callback = function(Option)
        if not (config == false or config == nil) and callback == true then
            if typeof(config) == "table" then
                macrov2[config[1]][config[2]] = Option
            elseif typeof(config) == "string" then
                macrov2.vars[config] = Option
            end
        end
        
        -- warn(typeof(callback))
        if typeof(callback) == "function" then
            callback(Option)
        end
    end
    local newDropdown = section:Dropdown(dropDownText, dropDownTable, Callback)
    if config then
        if typeof(config) == "table" then
            -- print(config[2])
            guiElements[config[1]][config[2]] = newDropdown
        elseif typeof(config) == "string" then
            guiElements.vars[config] = newDropdown
        end
    end
    return newDropdown
end

function createToggle(section, toggleText, config, callback)
    Callback = function(state)
        if not (config == false or config == nil) then
            if typeof(config) == "table" then
                macrov2[config[1]][config[2]] = state
            elseif typeof(config) == "string" then
                macrov2.toggles[config] = state
            end
        end
        
        -- warn(typeof(callback))
        if typeof(callback) == "function" then
            callback(state)
        end
    end
    
    local newToggle = section:Toggle(toggleText, Callback)
    if config and typeof(config) == "string" then
        guiElements["toggles"][config] = newToggle
    elseif config and typeof(config) == "table" then
        guiElements[config[1]][config[2]] = newToggle
    end
    return newToggle
end

function createSlider(section, sliderText, settings, config, callback)
    if callback == true then
        callback = function(newValue)
            -- warn("changed", (config[1] and config[1].."/"..config[2] or config), "to", newValue)
            if typeof(config) == "table" then
                macrov2[config[1]][config[2]] = newValue
            elseif typeof(config) == "string" then
                macrov2.vars[config] = newValue
            end
        end
    end
    local newSlider = section:Slider(sliderText, callback, settings)
    if config and typeof(config) == "string" then
        guiElements["vars"][config] = newSlider
    elseif config and typeof(config) == "table" then
        guiElements[config[1]][config[2]] = newSlider
    end
    return newSlider
end

function createInput(section, inputText, inputPlaceholder, config, callback)
    if callback == true then
        callback = function(newValue)
            -- warn("changed", (config[1] and config[1].."/"..config[2] or config), "to", newValue)
            if typeof(config) == "table" then
                macrov2[config[1]][config[2]] = newValue
            elseif typeof(config) == "string" then
                macrov2.vars[config] = newValue
            end
        end
    end
    local newInput = section:Input(inputText, inputPlaceholder, callback)
    if config and typeof(config) == "string" then
        guiElements["vars"][config] = newInput
    elseif config and typeof(config) == "table" then
        guiElements[config[1]][config[2]] = newInput
    end
    return newInput
end

function createButton(section, buttonText, callback)
    section:Button(buttonText, callback)
end

function saveConfig()
    print("Saving config...")
    local success, err = xpcall(function()
        local configString = jsonEncode(macrov2)
        if not configString then error("Can't convert config into file.") end
        if not writefile then error("Save config is not supported by your executor.") end

        writefile("macrov3/BSS_"..player.Name..".json",configString)
    end, function(err) warn("[Error]:", err) end)
    if success then
        api.notify("Macro V3 - Config", "Config successfully saved.",3)
    elseif err then
        api.notify("Macro V3 - Config", "Error while saving config: \n"..err:split(":")[3],3)
    end
end

function loadConfig(configName)
    -- warn(("Config name: BSS_%s.json"):format(configName))
    local success, err = pcall(function()
        if not readfile or not isfile then error("Load config is not supported by your executor.") end
        if not isfile("macrov3/BSS_"..configName..".json") then error("You don't have a saved config.") end

        local oldConfig = macrov2

        local loadedConfig = jsonDecode(readfile("macrov3/BSS_"..configName..".json"))
        if not loadedConfig or typeof(loadedConfig) ~= "table" then error("Config not loaded.") end

        for settingsCategory, settingsTable in pairs(macrov2) do
            if loadedConfig[settingsCategory] then
                for settingName, settingValue in pairs(settingsTable) do
                    if loadedConfig[settingsCategory][settingName] ~= nil then
                        macrov2[settingsCategory][settingName] = loadedConfig[settingsCategory][settingName]
                    end
                end
            end
        end

        -- warn(111)

        -- getgenv().macrov2 = loadedConfig
    for settingsType,v in pairs(guiElements) do
        -- warn(settingsType)
        for settingName,k in pairs(v) do
            local tag = k["Tag"]
            -- warn(tag)
            if tag == "Dropdown" then
                pcall(function()
                    if typeof(macrov2[settingsType][settingName]) == "table" then
                        k.Update(macrov2[settingsType][settingName])
                    else
                        k.Set(macrov2[settingsType][settingName])
                    end
                end)
            elseif tag == "Slider" then
                pcall(function()
                    k.Set(tonumber(macrov2[settingsType][settingName]))
                end)
            elseif tag == "Toggle" then
                pcall(function()
                    k.Set(macrov2[settingsType][settingName])
                end)
            elseif tag == "Box" then
                pcall(function()
                    k.Set(macrov2[settingsType][settingName])
                end)
            end
        end
    end
    temptable.shouldEquipDefaultMask = true
end)

    for cycleName, cycleTable in pairs(customPlanterSections) do
        for cycleStep, stepUIs in pairs(cycleTable) do
            if cycleStep == "section" then continue end

            stepUIs.HarvestAmount.Set(macrov2.customPlanterSettings[cycleName][cycleStep].harvestAmount)
            stepUIs.Field.Set(macrov2.customPlanterSettings[cycleName][cycleStep].field)
            stepUIs.Planter.Set(macrov2.customPlanterSettings[cycleName][cycleStep].planter)
        end
    end

    if success then
        api.notify("Macro V3 - Config", "Config successfully loaded.",3)
    elseif err then
        local errMsg
        if api.isSynV3() then
            errMsg = err:split(":")[1]
        else
            errMsg = err:split(":")[3]
        end
        api.notify("Macro V3 - Config", "Error while loading config: \n"..(errMsg or "no error"),3)
    end
end

if _G.debugging then
    warn("UI init.")
end

--Tabs Init
homeTab = createTab("Home")

informationSection = createSection(homeTab, "Information")
-- welcomeLabel = createLabel(informationSection, "Welcome, "..--[[ api.nickname]]"Onett".."!")
createButton(informationSection, "Redeem Codes", function() 
    for _,code in pairs(temptable.codesTable) do
        Events.ClientCall("PromoCodeEvent", code)
        task.wait(0.5)
    end
end)
createToggle(informationSection, "Stop Everything", nil, function(state) 
    temptable.stopEverything = state
end)

statsTrackerSection = createSection(homeTab, "Stats Tracker")

--uptimeLabel = createLabel(statsTrackerSection, "Uptime: 00:00:00?")
--honeyPerHourLabel = createLabel(statsTrackerSection, "Honey Per Hour: 0?")
gainedHoneyLabel = createLabel(statsTrackerSection, "Gained Honey: 0?")
--dailyHoneyLabel = createLabel(statsTrackerSection, "Daily Honey: 0?")
balloonPollenLabel = createLabel(statsTrackerSection, "Balloon Pollen: 0?")

bossTimersSection = createSection(homeTab, "Boss Timers")

kingBeetleTimerLabel = createLabel(bossTimersSection, "King Beetle: 0?")
tunnelBearTimerLabel = createLabel(bossTimersSection, "Tunnel Bear: 0?")
coconutCrabTimerLabel = createLabel(bossTimersSection, "Coconut Crab: 0?")
stumpSnailTimerLabel = createLabel(bossTimersSection, "Stump Snail: 0?")


farmingTab = createTab("Farming")

farmingSection = createSection(farmingTab, "Farming")

createDropdown(farmingSection, "Field", fieldsTable, {"autoFarmSettings", "field"}, true).Set(macrov2.autoFarmSettings.field)

createToggle(farmingSection, "Autofarm [⚙]", "autofarm", function(State)
    macrov2.toggles.autofarm = State
    -- print(State)
    if State then
        -- print("Autofarmss")
        Tasks:Add("Autofarm", mainAutofarmFunction, true)
    else
        if Tasks:Get("Autofarm") then Tasks:Cancel("Autofarm") end
        player.DevComputerMovementMode = Enum.DevComputerMovementMode.UserChoice
    end
end)

autoDig = createToggle(farmingSection, "Auto Dig", "autodig", function(State) 
    macrov2.toggles.autodig = State
    if State then
        Tasks:Add("Auto Dig", function() 
            while task.wait(0.03) do
                local a,b = pcall(function() dig() end)
                if not a then error(b) end
            end
        end, true)
    else
        if Tasks:Get("Auto Dig") then Tasks:Cancel("Auto Dig") end
    end
end)
-- warn("AA")
-- for i,v in pairs(autoDig) do
--     print(i,v)
-- end
-- warn("BB")

createToggle(farmingSection, "Ignore Honey Tokens", {"autoFarmSettings", "ignoreHoneyTokens"}, true)
createToggle(farmingSection, "Farm Flames", {"autoFarmSettings", "farmFlames"}, true)
createToggle(farmingSection, "Farm Bubbles", {"autoFarmSettings", "farmBubbles"}, true)
createToggle(farmingSection, "Farm Fuzzy Bombs", {"autoFarmSettings", "farmFuzzyBombs"}, true)
createToggle(farmingSection, "Farm Under Clouds", {"autoFarmSettings", "farmUnderClouds"}, true)
createToggle(farmingSection, "Farm Under Balloons", {"autoFarmSettings", "farmUnderBalloons"}, true)
createToggle(farmingSection, "Farm Shower", {"autoFarmSettings", "farmShower"}, true)
createToggle(farmingSection, "Farm Coconuts", {"autoFarmSettings", "farmCoconuts"}, true)
createToggle(farmingSection, "Farm Glitched Tokens", {"autoFarmSettings", "farmDupedTokens"}, true)

createToggle(farmingSection, "Farm Sprouts", {"autoFarmSettings", "farmSprouts"}, true)
createToggle(farmingSection, "Smart Bubble Bloat"..Star, {"autoFarmSettings", "smartBubbleBloat"}, true)
createToggle(farmingSection, "Smart Precise Crosshair"..Star, {"autoFarmSettings", "smartPreciseCrosshair"}, true)
createDropdown(farmingSection, "Smart Crosshair farm", {"Fast Tween", "Walk"}, {"autoFarmSettings", "smartPreciseMethod"}, true).Set(macrov2.autoFarmSettings.smartPreciseMethod)

createToggle(farmingSection, "Use Instant Convertion", {"convertSettings", "instantToggle"}, true)
local instantC = {}
createDropdown(farmingSection, "Instant Convertion Add", instantConvList, nil, function(item)
    if table.find(macrov2.convertSettings.selectedInstant, item) then return api.notify("Macro V3 | Error", item.." has already been added") end
    table.insert(macrov2.convertSettings.selectedInstant, item)
    api.notify("Macro V3 | Success", item.." has been added")
    instantC.Update(macrov2.convertSettings.selectedInstant)
end)
instantC = createDropdown(farmingSection, "Instant Convertion Remove", macrov2.convertSettings.selectedInstant, nil, function(item)
    if not table.find(macrov2.convertSettings.selectedInstant, item) then return api.notify("Macro V3 | Error", item.." doesn't exist") end
    table.remove(macrov2.convertSettings.selectedInstant, table.find(macrov2.convertSettings.selectedInstant, item))
    api.notify("Macro V3 | Success", item.." has been removed")
    instantC.Update(macrov2.convertSettings.selectedInstant)
end)

createDropdown(farmingSection, "Default Mask", {"Diamond Mask", "Demon Mask", "Honey Mask"}, {"vars", "defaultmask"}, function() 
    temptable.shouldEquipDefaultMask = true
end)
createToggle(farmingSection, "Auto Honey Mask", {"toggles", "AutoHoneyM"}, true)
-- createToggle(farmingSection, "Farm Precise Croshairs", {"autoFarmSettings", "farmPrecise"}, true)

automatisationFarmSection = createSection(farmingTab, "Automatisation")

createToggle(automatisationFarmSection, "Auto Dispensers", "autodispensers", true)
createToggle(automatisationFarmSection, "Auto Boosters", "autoboosters", true)
createToggle(automatisationFarmSection, "Auto Memory Match", "automemorymatch", true)

for i,v in pairs(AllToysTable.toysTable) do
    createToggle(automatisationFarmSection, "Auto "..v, {"toggles", i}, true)
end

combatTab = createTab("Combat")

autoBossesSection = createSection(combatTab, "Auto Bosses")
createToggle(autoBossesSection, "Auto kill Crab", {"combatSettings", "trainCrab"}, true)
createToggle(autoBossesSection, "Auto kill King Beetle", {"combatSettings", "trainKingBeetle"}, true)
createToggle(autoBossesSection, "Auto kill Tunnel Bear", {"combatSettings", "trainTunnelBear"}, true)
createToggle(autoBossesSection, "Auto kill Stump Snail", {"combatSettings", "trainStumpSnail"}, true)
createToggle(autoBossesSection, "Convert Honey (When killing Snail)", {"combatSettings", "snailConvertHoney"}, true)

autoMonstersSection = createSection(combatTab, "Auto Monsters")
createToggle(autoMonstersSection, "Auto kill Spider", {"combatSettings", "killSpidor"}, true)
createToggle(autoMonstersSection, "Auto kill Mantis", {"combatSettings", "killMantis"}, true)
createToggle(autoMonstersSection, "Auto kill Scorpion", {"combatSettings", "killScorpion"}, true)
createToggle(autoMonstersSection, "Auto kill Werewolf", {"combatSettings", "killWerewolf"}, true)

autoViciousSection = createSection(combatTab, "Auto Vicious")
createToggle(autoViciousSection, "Auto Vicious", {"combatSettings", "killVicious"}, true)
createSlider(autoViciousSection, "Minimum Level", {Min = 1, Max = 12, Default = 1}, {"combatSettings", "viciousMinLevel"}, true)
createSlider(autoViciousSection, "Maximum Level", {Min = 1, Max = 12, Default = 12}, {"combatSettings", "viciousMaxLevel"}, true)

autoQuestTab = createTab("Auto Quest")

questsToDoSection = createSection(autoQuestTab, "Quests to do")
createToggle(questsToDoSection, "Auto Quests", {"autoQuestSettings", "doQuests"}, true)
createToggle(questsToDoSection, "Auto Repeatable Quests", {"autoQuestSettings", "doRepeatables"}, true).Set(true)
createToggle(questsToDoSection, "Accept All Quests", {"autoQuestSettings", "acceptAllQuests"}, true)
createLabel(questsToDoSection, "")
createToggle(questsToDoSection, "Black Bear Quests", {"autoQuestSettings", "BlackBearQuests"}, true)
createToggle(questsToDoSection, "Brown Bear Quests", {"autoQuestSettings", "BrownBearQuests"}, true)
createToggle(questsToDoSection, "Panda Bear Quests", {"autoQuestSettings", "PandaBearQuests"}, true)
createToggle(questsToDoSection, "Science Bear Quests", {"autoQuestSettings", "ScienceBearQuests"}, true)
createToggle(questsToDoSection, "Polar Bear Quests", {"autoQuestSettings", "PolarBearQuests"}, true)
createToggle(questsToDoSection, "Spirit Bear Quests", {"autoQuestSettings", "SpiritsBearQuests"}, true)
createToggle(questsToDoSection, "Bucko Bee Quests", {"autoQuestSettings", "BuckoBeeQuests"}, true)
createToggle(questsToDoSection, "Riley Bee Quests", {"autoQuestSettings", "RileyBeeQuests"}, true)
createToggle(questsToDoSection, "Honey Bee Quests", {"autoQuestSettings", "HoneyBeeQuests"}, true)
createToggle(questsToDoSection, "Onett Quests", {"autoQuestSettings", "OnettQuests"}, true)
if scriptType == LPH_STRENC("Paid") then
    createToggle(questsToDoSection, "Bee Bear Quests "..Star, {"autoQuestSettings", "BeeBearQuests"}, true)
end

questSettingsSection = createSection(autoQuestTab, "Quests Settings")
createToggle(questSettingsSection, "Teleport to npc", {"autoQuestSettings", "tpToNPC"}, true)
-- createToggle(questSettingsSection, "Teleport ants", {"autoQuestSettings", "doAnts"}, true)
createToggle(questSettingsSection, "Do Pollen Quests", {"autoQuestSettings", "farmPollen"}, true)
createToggle(questSettingsSection, "Do Goo Quests", {"autoQuestSettings", "farmGoo"}, true)
createToggle(questSettingsSection, "Kill Mobs For Quests", {"autoQuestSettings", "killMobs"}, true)
createToggle(questSettingsSection, "Feed Bees For Quests", {"autoQuestSettings", "feedBees"}, true)
createToggle(questSettingsSection, "Use Toys For Quests", {"autoQuestSettings", "useToys"}, true)
createToggle(questSettingsSection, "Do Memory Match Quests", {"autoQuestSettings", "useMemoryMatch"}, true)
createToggle(questSettingsSection, "Do Quests For Quests", {"autoQuestSettings", "doQuestQuests"}, true)
-- createDropdown(questSettingsSection, "Blacklisted Nectars List", {})
temptable.npcPrioSlider = {}
temptable.npcPrioSlider.Set = function() return end
questFarmSettingsSection = createSection(autoQuestTab, "Quests Farm Settings")
createDropdown(questFarmSettingsSection, "Blue Pollen From", blueFields, {"autoQuestSettings", "bestBlueField"}, true).Set(macrov2.autoQuestSettings.bestBlueField)
createDropdown(questFarmSettingsSection, "Red Pollen From", redFields, {"autoQuestSettings", "bestRedField"}, true).Set(macrov2.autoQuestSettings.bestRedField)
createDropdown(questFarmSettingsSection, "White Pollen From", whiteFields, {"autoQuestSettings", "bestWhiteField"}, true).Set(macrov2.autoQuestSettings.bestWhiteField)

questPrioritySettingsSection = createSection(autoQuestTab, "Quests Priority Settings")
createToggle(questPrioritySettingsSection, "Prioritize Mob Kill Quests", {"autoQuestSettings", "prioritizeMobKill"}, true).Set(true)
createToggle(questPrioritySettingsSection, "Enable NPC Priorities", {"autoQuestSettings", "enablePriorities"}, true)
createDropdown(questPrioritySettingsSection, "Select NPC", npcsTable, false, function(selectedNpc) 
    if temptable.selectedPriorityNpc == selectedNpc then return end
    temptable.selectedPriorityNpc = selectedNpc
    local npcPriority = getQuestSetting(selectedNpc, "prio")
    temptable.npcPrioSlider.Set(tonumber(npcPriority))
end).Set("Polar Bear")

temptable.npcPrioSlider = createSlider(questPrioritySettingsSection, "Select Npc Priority", {Min = 1, Max = 15, Default = 1}, false, function(newPrio)
    if temptable.selectedPriorityNpc == "Bee Bear 5" then
        macrov2.autoQuestSettings.BeeBearPriority = newPrio
    else
        pcall(function()
            macrov2.autoQuestSettings[temptable.selectedPriorityNpc:gsub(" ","").."Priority"] = newPrio
        end)
    end
end)


plantersTab = createTab("Planters")

autoPlantersNectarsSection = createSection(plantersTab, "Automatic Planters & Nectars")
-- createToggle(autoPlantersNectarsSection, "Auto Planters", {"autoPlantersSettings", "doPlanters"}, true)
createToggle(autoPlantersNectarsSection, "Do Custom Planters", {"autoPlantersSettings", "doCustomPlanters"}, true)
-- createToggle(autoPlantersNectarsSection, "Harvest With Puffsrooms", {"autoPlantersSettings", "planterHarvestWithPuffs"}, true).Set(true)
--[[
local blacklistedNectarsDropdown
blacklistedNectarsDropdown = autoPlantersNectarsSection:Dropdown("Blacklisted Nectars List", macrov2.autoPlantersSettings.blacklistedNectars, function(selectedOption)
	if selectedOption == nil or selectedOption == "" then return end
    removeFromTable(macrov2.autoPlantersSettings.blacklistedNectars, selectedOption)
	api.notify("Macro V3 | Success", "Unblacklisted "..selectedOption, 2)
	task.spawn(function()
		blacklistedNectarsDropdown.Update(macrov2.autoPlantersSettings.blacklistedNectars)
		wait()
		blacklistedNectarsDropdown.Set("")
	end)
end); guiElements["autoPlantersSettings"]["blacklistedNectars"] = blacklistedNectarsDropdown

createDropdown(autoPlantersNectarsSection, "Blacklist Nectar", nectarsDropdownTable, nil, function(selectedOption) 
    if not table.find(macrov2.autoPlantersSettings.blacklistedNectars, selectedOption) then
        table.insert(macrov2.autoPlantersSettings.blacklistedNectars, selectedOption)
        blacklistedNectarsDropdown.Update(macrov2.autoPlantersSettings.blacklistedNectars)
	    api.notify("Macro V3 | Success", "Blacklisted "..selectedOption, 1)
    end
end)

createSlider(autoPlantersNectarsSection, "Harvest At", {Min = 1, Max = 100, Default = 20} ,{"autoPlantersSettings", "planterHarvestAt"}, true)

local blacklistedPlantersDropdown
blacklistedPlantersDropdown = autoPlantersNectarsSection:Dropdown("Blacklisted Planters List", macrov2.autoPlantersSettings.blacklistedPlanters, function(selectedOption)
	if selectedOption == nil or selectedOption == "" then return end
    removeFromTable(macrov2.autoPlantersSettings.blacklistedPlanters, selectedOption)
	api.notify("Macro V3 | Success", "Unblacklisted "..selectedOption, 2)
	task.spawn(function()
		blacklistedPlantersDropdown.Update(macrov2.autoPlantersSettings.blacklistedPlanters)
		wait()
		blacklistedPlantersDropdown.Set("")
	end)
end); guiElements["autoPlantersSettings"]["blacklistedPlanters"] = blacklistedPlantersDropdown

createDropdown(autoPlantersNectarsSection, "Blacklist Planters", plantersDropdownTable, nil, function(selectedOption) 
    if not table.find(macrov2.autoPlantersSettings.blacklistedPlanters, selectedOption) then
        table.insert(macrov2.autoPlantersSettings.blacklistedPlanters, selectedOption)
        blacklistedPlantersDropdown.Update(macrov2.autoPlantersSettings.blacklistedPlanters)
	    api.notify("Macro V3 | Success", "Blacklisted "..selectedOption, 1)
    end
end)
]]
if _G.debugging then
    warn("Planters tab init")
end

customFieldDropdown = table.clone(fieldsTable)
customPlanterDropdown = table.clone(plantersDropdownTable)
table.insert(customFieldDropdown, "None")
table.insert(customPlanterDropdown, "None")
customPlanterSections = {
    customPlanters1 = {},
    customPlanters2 = {},
    customPlanters3 = {}
}

for i = 1,3 do
    local cycleName = "customPlanters"..i
    local cycleTable = macrov2.customPlanterSettings[cycleName]
    
    createSection(plantersTab, "Custom Planters "..tostring(i))
    customPlanterSections[cycleName].section = plantersTab

    for cycleStep = 1,5 do
        local stepConfig = cycleTable[cycleStep]

        if not customPlanterSections[cycleName][cycleStep] then customPlanterSections[cycleName][cycleStep] = {} end

        -- print("Dropdown1")

        customPlanterSections[cycleName][cycleStep].Planter = 
            customPlanterSections[cycleName].section:Dropdown("Field "..cycleStep.." Planter", customPlanterDropdown, function(newPlanter) 
                macrov2["customPlanterSettings"][cycleName][cycleStep].planter = newPlanter
            end)

        -- print("Dropdown2")

        customPlanterSections[cycleName][cycleStep].Field = 
            customPlanterSections[cycleName].section:Dropdown("Field "..cycleStep, customFieldDropdown, function(newField) 
                macrov2["customPlanterSettings"][cycleName][cycleStep].field = newField
            end)

        -- print("Slider1")

        customPlanterSections[cycleName][cycleStep].HarvestAmount = 
            customPlanterSections[cycleName].section:Slider("Field "..cycleStep.." Harvest %", function(newPercentage) 
                macrov2["customPlanterSettings"][cycleName][cycleStep].harvestAmount = newPercentage 
            end, {Min = 1, Max = 100, Default = 75, ExtraPixels = 231})

        -- print("Updating")
        customPlanterSections[cycleName][cycleStep].Planter.Set("None")
        customPlanterSections[cycleName][cycleStep].Field.Set("None")
        customPlanterSections[cycleName][cycleStep].HarvestAmount.Set(75)
    end
end


if _G.debugging then
    warn("Planters tab initialized. Waiting 1 second")
    task.wait(1)
end

-- writefile("planterSection.json", jsonEncode(customPlanterSections))

-- warn(111)
-- for i,v in pairs(customPlanterSections) do
--     for i2,v2 in pairs(v) do
--         for i3,v3 in pairs(v2) do
--             print(i3,v3)
--         end
--         break
--     end
-- end
if scriptType == LPH_STRENC("Paid") then
local puffshroomsTab = createTab("Puffshrooms "..Star)

local puffshroomSettingsSection = createSection(puffshroomsTab, "Puffshroom Settings "..Star)
createToggle(puffshroomSettingsSection, "Farm Puffshrooms", {"autoPuffshroomSettings", "farmPuffshrooms"}, true)
createSlider(puffshroomSettingsSection, "Minimum Level", {Min = 1, Max = 15, Default = 1}, {"autoPuffshroomSettings", "minimumLevel"}, true)
createSlider(puffshroomSettingsSection, "Maximum Level", {Min = 1, Max = 30, Default = 16}, {"autoPuffshroomSettings", "maximumLevel"}, true)
createToggle(puffshroomSettingsSection, "Farm Remaining Puffs", {"autoPuffshroomSettings", "farmRemaining"}, true)

local puffshroomPrioSettingsSection = createSection(puffshroomsTab, "Puffshroom Priority Settings "..Star)
createDropdown(puffshroomPrioSettingsSection, "Puffshroom Rarity", {"Mythic > Common", "Common > Mythic"}, {"autoPuffshroomSettings", "rarityPriority"}, true):Set(macrov2.autoPuffshroomSettings.rarityPriority)
createDropdown(puffshroomPrioSettingsSection, "Puffshroom Level", {"High > Low", "Low > High"}, {"autoPuffshroomSettings", "levelPriority"}, true):Set(macrov2.autoPuffshroomSettings.levelPriority)
end



miscellaneousTab = createTab("Misc")
-- createToggle(miscellaneousTab,)
createButton(miscellaneousTab,"Hide all textures", function() 
    if temptable.gpuSaverActivated then return end
    temptable.gpuSaverActivated = true
    local function _(ok)
        for __,v in pairs(ok:GetChildren()) do
            if v.Name == "Gates" then continue end
            pcall(function() 
                if v.ClassName == "Decal" then v:Destroy()
                else v.Material = "Plastic"
                end
            end)
            _(v)
        end
    end
    _(game.Workspace)
end)

settingsTab = createTab("Settings")

autoFarmSettingsSection = createSection(settingsTab, "AutoFarm settings")
createSlider(autoFarmSettingsSection, "Convert Honey At", {Min = 0, Max = 100, Default = 100}, {"convertSettings", "convertat"}, true)
createToggle(autoFarmSettingsSection, "Convert Hive Balloon", "converthiveballoon", true)
createSlider(autoFarmSettingsSection, "Convert Balloon At (blessing minutes)", {Min = 0, Max = 60, Default = 0} , {"convertSettings", "convertballoonat"}, true)
createSlider(autoFarmSettingsSection, "Farm In Field When Full", {Min = 0, Max = 60, Default = 0} , {"convertSettings", "secondsBeforeConvert"}, true)
createToggle(autoFarmSettingsSection, "Convert Honey", "convertHoney", true).Set(true)

localPlayerSettingsSection = createSection(settingsTab, "Local Player Settings")
createSlider(localPlayerSettingsSection, "Walk Speed", {Min = 20, Max = 90, Default = 60} ,{"localPlayerSettings","walkSpeed"}, true)
createSlider(localPlayerSettingsSection, "Tween Speed", {Min = 1, Max = 10, Default = 5} ,{"localPlayerSettings","tweenSpeed"}, true)

createToggle(localPlayerSettingsSection, "Speedhack", "speedhack", function(State) 
    macrov2.toggles.speedhack = State
end)

Tasks:Add("Walk Speed", function() 
    while task.wait() do
        if temptable.customWalkSpeed.enabled then
            api.humanoid().WalkSpeed = temptable.customWalkSpeed.speed
        else
            if macrov2.toggles.speedhack then
                local newSpeed = macrov2.localPlayerSettings.walkSpeed
                pcall(function()
                    local systemSpeed = getClientStatCache("ModifierCaches","Value","PlayerMovespeed","_")
                    if tonumber(systemSpeed) and systemSpeed > newSpeed then newSpeed = systemSpeed end
                end)
                pcall(function() 
                    player.Character.Humanoid.WalkSpeed = newSpeed
                end)
            end
        end
    end
end, true)

createToggle(localPlayerSettingsSection, "Hide Decorations", nil, function(state) 
    if state then
        temptable.fieldDecosFolder.Parent = ReplicatedStorage
    else
        temptable.fieldDecosFolder.Parent = Workspace
    end
end)

raresSettingsSection = createSection(settingsTab, "Rares Settings")

local raresListDropdown
raresListDropdown = createDropdown(raresSettingsSection, "Rares List (select to remove)", macrov2.vars.rares, {"vars", "rares"}, function(tokenId) 
	if type(macrov2.vars.rares) ~= "table" then return end
	table.remove(macrov2.vars.rares, table.find(macrov2.vars.rares, tokenId))
	api.notify("Macro V3 | Success", "Removed "..tokenId.."\nfrom rares list", 2)
	raresListDropdown.Update(macrov2.vars.rares)
end)

createInput(raresSettingsSection, "Add Rares", "Names only", false, function(tokenId) 
    if not table.find(FormattedItems["NamesOnly"], tokenId) then
        api.notify("Macro V3 | Error", "Token not found!", 2)
        return
    elseif table.find(macrov2.vars.rares, tokenId) then
        api.notify("Macro V3 | Error", "Token already added!", 2)
        return
    end
    table.insert(macrov2.vars.rares,tokenId)
    raresListDropdown.Update(macrov2.vars.rares)
    api.notify("Macro V3 | Success", "Added "..tokenId.."\nto rares list", 2)
end)


safetySettingsSection = createSection(settingsTab, "Safety Settings")
createDropdown(safetySettingsSection, "Accessory Equip Method", {"Tween", "Teleport", "Remote"}, {"vars", "equipAccessoryMethod"}, true).Set(macrov2.vars.equipAccessoryMethod)
createDropdown(safetySettingsSection, "Movement Method", {"Tween"}, false, function()end).Set("Tween")


autoDispenserSection = createSection(settingsTab, "Auto Dispensers")
for i,v in pairs(AllToysTable.dispensersTable) do
    createToggle(autoDispenserSection, "Auto "..v, {"autodispensersettings", i}, true)
end

autoBoosterSection = createSection(settingsTab, "Auto Boosters")
for i,v in pairs(AllToysTable.boostersTable) do
    createToggle(autoBoosterSection, "Auto "..v, {"autoboostersettings", i}, true)
end

webhookTab = createTab("Webhook")
webhookSection = createSection(webhookTab, "Webhook")
createToggle(webhookSection, "Use webhook", {"webhookSettings", "useWebhook"}, function(State) 
    if State then
        Tasks:Add("Webhook", function() 
            while task.wait(1) do
                if tick() - temptable.lastWebhookSent > macrov2.webhookSettings.messageFrequency * 60 then
                    sendHourlyWebhook()
                end
            end
        end, true)
    else
        if Tasks:Get("Webhook") then Tasks:Cancel("Webhook") end
    end
end)
createSlider(webhookSection, "Message frequency", {Min = 1, Max = 120, Default = 30}, {"webhookSettings", "messageFrequency"}, true)

createInput(webhookSection, "Webhook Url", "ex: https://discord.com/api/...", {"webhookSettings", "webhookUrl"}, true)
createInput(webhookSection, "Discord User Id", "ex: 123456", {"webhookSettings", "discordId"}, true)
createInput(webhookSection, "Webhook Color", "ex: 0xfcdf03 or #fcdf03", {"webhookSettings", "webhookColor"}, function(Color) 
    local done = false
    -- print(Color)
	if string.match(Color, "^".."0x") then 
        -- print(1)
		done = true
		macrov2.webhookSettings.webhookColor = Color
	end
	if not done then
        -- print(2)
		local newColor,_ = string.gsub(Color, "#", "0x") 
		if _ == 1 then
			-- print(newValue)
			macrov2.webhookSettings.webhookColor = newColor
		else
            -- warn("error")
			api.notify("Macro V3 - v" .. temptable.version, "Invalid Color!", 2)
			api.notify("Macro V3 - v" .. temptable.version, "Make sure you're using Hex color.", 5)
		end
	end
end)

createToggle(webhookSection, "Ping discord id", {"webhookSettings", "pingUser"}, true)

createButton(webhookSection, "Test Webhook", function()
    sendHourlyWebhook(true)
end)

webhookSettingsSection = createSection(webhookTab, "Webhook Settings")
createToggle(webhookSettingsSection, "Show Total Honey", {"webhookSettings", "showTotalHoney"}, true)
createToggle(webhookSettingsSection, "Show Honey Per Hour", {"webhookSettings", "showHoneyPerHour"}, true)
createToggle(webhookSettingsSection, "Show Daily Honey", {"webhookSettings", "showDailyHoney"}, true)
createToggle(webhookSettingsSection, "Show Nectars", {"webhookSettings", "showNectars"}, true)
createToggle(webhookSettingsSection, "Show Planters", {"webhookSettings", "showPlanters"}, true)
-- createToggle(webhookSettingsSection, "Show Items", {"webhookSettings", "showItems"}, true)
createToggle(webhookSettingsSection, "Truncated only", {"webhookSettings", "onlyTruncated"}, true)
-- createToggle(webhookSettingsSection, "Send on quest completed", {"webhookSettings", "sendQuests"}, true)

configTab = createTab("Config")
defaultConfigSection = createSection(configTab, "Default Config")
createButton(defaultConfigSection, "Save Settings", saveConfig)

if scriptType == LPH_STRENC("Paid") then

premiumTab = createTab("Premium")
-- smartFarmSection = createSection(premiumTab, "Smart Farming")
-- createToggle(smartFarmSection, "Smart Blue Farm (End Game Only)", {"toggles", "smartBlueAutofarm"}, true)
-- createToggle(smartFarmSection, "Smart Red Farm", {"toggles", "smartRedAutofarm"}, true)

if isBeesmas() then

beesmasFeaturesSection = createSection(premiumTab, "Beesmas Features")
for i,v in pairs(AllToysTable.beesmasToysTable) do
    createToggle(beesmasFeaturesSection, "Auto "..v, {"toggles", i}, true)
end

end

paidMiscSection = createSection(premiumTab, "Misc")
createToggle(paidMiscSection, "Alert on Vicious Spawn", {"alertSettings", "viciousAlert"}, true).Set(true)

local autoRJSection = createSection(premiumTab, "Auto Royal Jelly")

local selectedBeesDropdown
local selectedRaritiesDropdown

local RJSettings = temptable.autoRJSettings

autoRJSection:Dropdown("Add Bee", beesTable.namesOnly, function(selectedBee) 
    if not table.find(RJSettings.selectedBees, selectedBee) then
        if RJSettings.requireGifted then selectedBee = "Gifted "..selectedBee end
        table.insert(RJSettings.selectedBees, selectedBee)
        selectedBeesDropdown.Update(RJSettings.selectedBees)
    end
end)

autoRJSection:Dropdown("Add Rarity", beesTable.raritiesTable, function(selectedRarity) 
    if not table.find(RJSettings.selectedRarities, selectedRarity) then
        if RJSettings.requireGifted then selectedRarity = "Gifted "..selectedRarity end
        table.insert(RJSettings.selectedRarities, selectedRarity)
        selectedRaritiesDropdown.Update(RJSettings.selectedRarities)
    end
end)

autoRJSection:Toggle("Require Gifted", function(newState) 
    RJSettings.requireGifted = newState
end)

selectedBeesDropdown = autoRJSection:Dropdown("Selected Bees", RJSettings.selectedBees, function(selectedBee)
    local selectedIndex = table.find(RJSettings.selectedBees, selectedBee)
    RJSettings.selectedBees[selectedIndex] = nil
    selectedBeesDropdown.Update(RJSettings.selectedBees)
end)

selectedRaritiesDropdown = autoRJSection:Dropdown("Selected Rarities", RJSettings.selectedRarities, function(selectedRarity)
    local selectedIndex = table.find(RJSettings.selectedRarities, selectedRarity)
    RJSettings.selectedRarities[selectedIndex] = nil
    selectedRaritiesDropdown.Update(RJSettings.selectedRarities)
end)

autoRJSection:Toggle("Stop on any gifted", function(newState) 
    RJSettings.requireAnyGifted = newState
end)

autoRJSection:Slider("Left > Right", function(newCoordinate) RJSettings.xCoord = newCoordinate end, {Min = 1, Max = 5, Default = 3})
autoRJSection:Slider("Down > Up", function(newCoordinate) RJSettings.yCoord = newCoordinate end, {Min = 1, Max = 10, Default = 1})

createButton(autoRJSection, "Start Auto RJ", startAutoRJ)
createButton(autoRJSection, "Emergency Stop", stopAutoRJ)

premiumTab:Category("TP To Rare")

createToggle(premiumTab, "TP To Rare (Dangerous if used incorrectly)", {"toggles", "farmrares"}, function(State)
    macrov2.toggles.farmrares = State
    if State then
        Tasks:Add("FarmRares", function()
            while task.wait() do
                if macrov2.toggles.farmrares then
                    for k, v in next, temptable.tokenpath:GetChildren() do
                        if v.CFrame.YVector.Y == 1 then
                            if v.Transparency < 0.5 then
                                decal = v:FindFirstChildOfClass("Decal")
				if type(macrov2.vars.rares) ~= "table" then return end
                                for e, r in pairs(macrov2.vars.rares) do
                                    local rare, rareError = getItemByName(tostring(r))
                                    local rareTexture = rare and rare.Icon
                                    if rareTexture and decal and v ~= nil and rareTexture == decal.Texture then
                                        local oldPos = api.humanoidrootpart().CFrame
                                        for i=1, 5 do 
                                            api.humanoidrootpart().CFrame = v.CFrame
                                            task.wait()
                                        end
                                        api.humanoidrootpart().CFrame = oldPos
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if Tasks:Get("FarmRares") then Tasks:Cancel("FarmRares") end
    end
end)

-- createButton(autoRJSection, "Check Bee", function() 
--     print(isBeeExpected(plrHive.Cells[("C%s,%s"):format(RJSettings.xCoord, RJSettings.yCoord)]))
-- end)

local RoboBearChallangeSection = createSection(premiumTab, "Robo Bear Challange")
createToggle(RoboBearChallangeSection, "Auto RBC", {"RoboBearChallangeSettings", "autoRBC"}, function(State) 
    if State then
        Tasks:Add("Auto RBC", function() 
            while task.wait() do
                local roboPassCount = getClientStatCache("Eggs", "RoboPass") or 0
                if not temptable.autoRBC.isUnlocked then
                    temptable.autoRBC.isUnlocked = secureCall(StatTools.CheckReqs, Activatables, 
                        getClientStatCache(), {Type = "Completed Quests", Name = "Robo1"})
                    task.wait(1)
                    continue
                end
                if roboPassCount > 0 then
                    if not temptable.autoRBC.isActive and tick() - temptable.autoRBC.latestRBC > 30 then 
                        mainAutoRBCFunction()
                    end
                end
            end
        end, true)
    else
        if Tasks:Get("Auto RBC") then Tasks:Cancel("Auto RBC") end
    end
end)


end

if _G.debugging then
    warn("UI init done. waiting 5 seconds")
    task.wait(5)
end

if _G.debugging then
    warn("Calling functions")
end

Tasks:Add("Stats Tracker", function() 
    while task.wait(1) do
        local currentHoney = getClientStatCache("Totals","Honey")
        local timePassed = math.round(tick() - currentMacroV2LoadedAt)
        local honeyGained = currentHoney - temptable.honeyAtStart
        local honeyPerHour = math.floor(honeyGained / timePassed) * 3600
        local dailyHoney = getDailyHoney()
        local balloonPolen = temptable.lastBalloonPollen
        if tick() - temptable.lastClientStatCacheUpdate > 5 then
            local temp = updateClientStatCache("HiveBalloon")
            balloonPolen = temp and temp["Pollen"] or 0
            temptable.lastBalloonPollen = balloonPolen
            temptable.lastClientStatCacheUpdate = tick()
        end
    
        local honeyGainedString = truncate(honeyGained)
        local honeyPerHourString = truncate(honeyPerHour)
        local honeyPerDayString = truncate(dailyHoney)
        local uptimeString = truncatetime(timePassed)
        local honeyPerDayString = truncate(dailyHoney)
        local balloonPolenString = truncate(balloonPolen)
        
        windowa().MainFrame.SubFrame.LinesAndFrames.UptimeText.Text = "Uptime: "..uptimeString
        --honeyPerHourLabel.Set("Honey Per Hour: "..honeyPerHourString)
        gainedHoneyLabel.Set("Gained Honey: "..honeyGainedString)
        --dailyHoneyLabel.Set("Honey Per Day: "..honeyPerDayString)
        Window:ChangeValues(honeyPerHourString.."/hr",honeyPerDayString.."/d")
        balloonPollenLabel.Set("Balloon Pollen: "..balloonPolenString)
    
        kingBeetleTimerLabel.Set("King Beetle: "..getSpawnerCooldownText("King Beetle Cave"))
        tunnelBearTimerLabel.Set("Tunnel Bear: "..getSpawnerCooldownText("TunnelBear"))
        coconutCrabTimerLabel.Set("Coconut Crab: "..getSpawnerCooldownText("CoconutCrab"))
        stumpSnailTimerLabel.Set("Stump Snail: "..getSpawnerCooldownText("StumpSnail"))
    end
end, true)

Tasks:Add("Important Listeners", function() 
    while task.wait(.5) do
        checkPuffshrooms()
        checkPopStar()

        temptable.isRBCActive = getClientStatCache("RoboChallenges", "ActiveChallenge") and true or false

        -- checkLeafsAndSparkles()
    end
end, true)


for i, v in pairs(Workspace.Particles:GetChildren()) do
    if v.Name:find("Vicious") then
        temptable.detected.vicious = true
    end
end

for i,instance in pairs(Workspace.Particles.Folder2:GetChildren()) do
    if instance.Name == "Sprout" then
        local sproutRarity = sproutRarities[instance.Color]
        local sproutField = findField(instance.Position)
        --[[print(sproutRarity)]]
        local sproutId = math.round(tick()*10)/10
        local temp = Instance.new("StringValue",instance)
        temp.Name = "SproutId"
        temp.Value = sproutId
        if sproutRarity ~= "Moon" then
            temptable.sproutsTable[sproutId] = {Model = instance, Field = sproutField}
        end
    end
end

-- for i,v in pairs(temptable.tokenpath:GetChildren()) do
--     table.insert(temptable.tokensTable, v)
-- end

-- Listening
local addedListener1 = Workspace.Particles.ChildAdded:Connect(function(instance)
    task.wait()
	if string.find(instance.Name, "Vicious") then
		temptable.detected.vicious = true

    elseif instance.Name == "Guiding Star" then 
        print("guiding added handler")

    elseif instance.Name == "WarningDisk" and instance.BrickColor == BrickColor.new("Lime green") then
        if instance.Size.X == 8 and true then
            if tick() - temptable.lastShowerRegistered < 0.05 then return end
            table.insert(temptable.showersTable, instance)
            temptable.lastShowerRegistered = tick()
        elseif instance.Size.X == 30 and true then
            if tick() - temptable.lastShowerRegistered < 0.05 then return end
            table.insert(temptable.coconutsTable, instance)
            temptable.lastShowerRegistered = tick()
        end
	end
end)

local removedListener1 = Workspace.Particles.ChildRemoved:Connect(function(instance)
	if string.find(instance.Name, "Vicious") then
		temptable.detected.vicious = false

    elseif instance.Name == "Guiding Star" then
        print("guiding removed handler")

    elseif instance.Name == "WarningDisk" and instance.BrickColor == BrickColor.new("Lime green") then
        if instance.Size.X == 8 and true then
            local index = table.find(temptable.showersTable, instance)
            if index then table.remove(temptable.showersTable, index) end
        elseif instance.Size.X == 30 and true then
            local index = table.find(temptable.coconutsTable, instance)
            if index then table.remove(temptable.coconutsTable, index) end
        end

	end
end)

local addedListener2 = Workspace.Particles.Folder2.ChildAdded:Connect(function(instance)
    task.wait()
    if instance.Name ~= "Sprout" then return end
	local sproutRarity = sproutRarities[instance.Color]
    local sproutField = findField(instance.Position)
    -- print("Spawned sprout rarity:", sproutRarity)
    local sproutId = math.round(tick()*10)/10
    local temp = Instance.new("StringValue",instance)
    temp.Name = "SproutId"
    temp.Value = sproutId
    if sproutRarity ~= "Moon" then
        temptable.sproutsTable[sproutId] = {Model = instance, Field = sproutField}
    end
end)

local removedListener2 = Workspace.Particles.Folder2.ChildRemoved:Connect(function(instance)
    task.wait()
    if instance.Name ~= "Sprout" then return end
	local sproutId = instance:FindFirstChild("SproutId")
    if sproutId then
        temptable.sproutsTable[sproutId.Value] = nil
    else
        -- warn("no sprout id :skull:")
    end
end)

local addedListener3 = Workspace.Monsters.ChildAdded:Connect(function(monster)
    task.wait()
    if monster.Name:find("Vicious") then
        local viciousOnField = findField(monster.HumanoidRootPart.Position)
        bssAlert("Vicious", monster.Name.." spawned on "..viciousOnField.Name)
    end
end)

local leafSparkleAddedListener = Flowers.DescendantAdded:Connect(function(instance)
    task.wait()
    if instance.Name == "LeafBurst" then
        table.insert(temptable.leafTable, instance)
    elseif instance.Name == "Sparkles" then
        table.insert(temptable.sparklesTable, instance)
    end
end)

local leafSparkleRemovedListener = Flowers.DescendantRemoving:Connect(function(instance)
    task.wait()
    if instance.Name == "LeafBurst" then
        local index = table.find(temptable.leafTable, instance)
        if index then
            table.remove(temptable.leafTable, index)
        end
    elseif instance.Name == "Sparkles" then
        local index = table.find(temptable.sparklesTable, instance)
        if index then
            table.remove(temptable.sparklesTable, index)
        end
    end
end)

local tokenAddedListener = temptable.tokenpath.ChildAdded:Connect(function(token)
    task.wait()
    if token.Name == "C" then
        table.insert(temptable.tokensTable, token)
    end
end)

local tokenRemovedListener = temptable.tokenpath.ChildRemoved:Connect(function(token)
    local tokenIndex = table.find(temptable.tokensTable, token)
    if tokenIndex then
        table.remove(temptable.tokensTable, tokenIndex)
    end
end)

local balloonAddedListener
local balloonRemovedListener
task.spawn(function() 
    repeat task.wait(1) until Workspace:FindFirstChild("Balloons") and Workspace.Balloons:FindFirstChild("FieldBalloons")
    balloonAddedListener = Workspace.Balloons.FieldBalloons.ChildAdded:Connect(function(balloon) 
        task.wait()
        if balloon:FindFirstChild("PlayerName") and balloon.PlayerName.Value == player.Name then
            local balloonId = balloon.Name:gsub("Balloon", "")
            temptable.balloonsTable[tonumber(balloonId)] = balloon
        end
    end)
    balloonRemovedListener = Workspace.Balloons.FieldBalloons.ChildRemoved:Connect(function(balloon)
        if balloon:FindFirstChild("PlayerName") and balloon.PlayerName.Value == player.Name then
            local balloonId = balloon.Name:gsub("Balloon", "")
            if balloonId then
                temptable.balloonsTable[tonumber(balloonId)] = nil
            end
        end
    end)
end)

local whitelistedDupedTokens = {
    "1629547638",
    "5877939956"
}

local dupedTokensAddedListener
local dupedTokensRemovedListener
task.spawn(function() 
    repeat task.wait(1) until Workspace:FindFirstChild("Camera") and Workspace.Camera:FindFirstChild("DupedTokens")
    dupedTokensAddedListener = Workspace.Camera.DupedTokens.ChildAdded:Connect(function(instance) 
        task.wait(.05)
        local texture = instance.FrontDecal.Texture
        local tokenId = tostring(tostring(texture):match("%d+"))
        pcall(function() appendfile("DupedTokens.txt", tostring(tokenId).."\n") end)
        if table.find(whitelistedDupedTokens, tokenId) then
            table.insert(temptable.dupedTokensTable, instance)
        end
    end)
    dupedTokensRemovedListener = Workspace.Camera.DupedTokens.ChildRemoved:Connect(function(instance) 
        task.wait(.05)
        local index = table.find(temptable.dupedTokensTable, instance)
        if index then
            table.remove(temptable.dupedTokensTable, index)
        end
    end)
end)



player.Idled:Connect(function()
	VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	task.wait(1)
	VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

if _G.debugging then
    warn("Calling functions done. WaiTINg 5 Seconds")
    task.wait(5)
end

if _G.debugging then
    warn("Loading config")
end

-- warn(player.Name)

loadConfig(player.Name)
if _G.debugging then
    warn("Loading config donee. Waiting..")
    task.wait(5)
end



-- Remove/Hide decorations
task.spawn(function() 
    for _, v in pairs(Workspace.Decorations.Misc:GetDescendants()) do
        if v.Parent.Name == "Mushroom" then
            v.CanCollide = false
            v.Transparency = 0.3
        end
    end
    for _,v in pairs(Workspace.MonsterBarriers:GetChildren()) do
        v.CanCollide = false
    end
    for _,v in pairs(Workspace.Paths:GetChildren()) do
        v.CanCollide = false
    end
    for _, v in pairs(temptable.fieldDecosFolder:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.Transparency = 0.3
        end
    end
    for _, v in pairs(Workspace.Decorations:GetDescendants()) do
        if v:IsA("BasePart") and
            (v.Parent.Name == "Bush" or v.Parent.Name == "Blue Flower") then
            v.CanCollide = false
            v.Transparency = 0.3
        end
    end
    Workspace.Gates["15 Bee Gate"].Frame.CanCollide = false
end)



local killMV2 = Instance.new("BindableEvent")

killMV2.Event:connect(function() 
    print("Killing Macro V3")
    macrov2 = defaultMacroV2Config
    pcall(function() Tasks:CancelAll() end)
    pcall(function() addedListener1:Disconnect() end)
    pcall(function() removedListener1:Disconnect() end)

    pcall(function() addedListener2:Disconnect() end)

    pcall(function() addedListener3:Disconnect() end)

    pcall(function() tokenAddedListener:Disconnect() end)
    pcall(function() tokenRemovedListener:Disconnect() end)

    pcall(function() balloonAddedListener:Disconnect() end)
    pcall(function() balloonRemovedListener:Disconnect() end)

    
    pcall(function() dupedTokensAddedListener:Disconnect() end)
    pcall(function() dupedTokensRemovedListener:Disconnect() end)
end)

LPH_NO_VIRTUALIZE(function() 
    while task.wait(.5) do
        if currentMacroV2LoadedAt ~= macroV2LoadedAt then
            killMV2:Fire()
            return
        end
    end
end)()