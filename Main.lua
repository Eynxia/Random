--// Services

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--// Other
local CONNECTIONS = {}
--//Services\\--
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService");
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
local LPlayer = Players.LocalPlayer;
local Mouse = LPlayer:GetMouse();

--//Variables\\--
local Remotes: Folder = ReplicatedStorage.Remotes;
local StampAsset: RemoteFunction = Remotes.StampAsset;
local DeleteAsset: RemoteFunction = Remotes.DeleteAsset;

local VARIABLES = {}
VARIABLES["Players"] = {}

local On = false
local GodMode = false
local ActiveParts: Folder;
local Plates: Model = Workspace.Plates;
local LPlate: Part;
local MSpikes = {};
local UberVipCFrame = CFrame.new(-52.117424, 17633.498, 9022.96289, 0.878907919, 8.86190747e-08, -0.476991445, -6.97595155e-08, 1, 5.72481689e-08, 0.476991445, -1.70411774e-08, 0.878907919)
local MegaVipCFrame = CFrame.new(-81.6340179, 17633.498, 9206.84863, 0.939545095, 4.39642598e-08, -0.342425227, -2.73242602e-08, 1, 5.34186313e-08, 0.342425227, -4.08326954e-08, 0.939545095)
local VipCFrame = CFrame.new(-81.0560684, 17633.498, 9339.80371, -0.0887825266, 1.13209225e-07, -0.996051013, -7.10112289e-08, 1, 1.19987604e-07, 0.996051013, 8.1383611e-08, -0.0887825266)
local ThumbnailCFrame = CFrame.new(11.279686, 0.388946712, -5551.62061, 0.791406035, 3.28139578e-08, 0.611290812, -7.06421446e-08, 1, 3.77768892e-08, -0.611290812, -7.30797538e-08, 0.791406035)

for _, Plate in pairs(Plates:GetChildren()) do
	if (Plate.Owner.Value == LPlayer) then
		LPlate = Plate.Plate;
		ActiveParts = Plate.ActiveParts;
		break;
	end;
end;

CONNECTIONS[9] = ActiveParts.ChildAdded:Connect(function(Block)
	if (Block.Name == "Spikes - Moving") then
		local MSpike = Block:WaitForChild("Spike_Retracting"):WaitForChild("Spikes");
		MSpikes[#MSpikes+1] = MSpike;
		Block.AncestryChanged:Wait();
		if (not Block.Parent) then
			table.remove(MSpikes, table.find(MSpikes, MSpike));	
		end;

	elseif (Block.Name == "Weathervane") then
		if On == true then
			On = false
			print("addedtagrq")
			Block:AddTag(VARIABLES["Target"])
		end
	end;
end);

local Module = {};

function Module.Freeze(Part: Part)
	if (typeof(Part) == "Instance") then Part = {Part}; end;
	StampAsset:InvokeServer(
		56447956,
		LPlate.CFrame - Vector3.new(0, 5, 0),
		"{3ee17b14-c66d-4cdd-8500-3782d1dceab5}",
		Part,
		0
	);
end;

function Module.Weld(...)
	StampAsset:InvokeServer(
		56451715,
		LPlate.CFrame + Vector3.new(0, 200, 0),
		"{3ae31e60-5cd0-4d80-96b6-a1dd894ece8a}",
		{...},
		0
	);
end;

function Module.CreateSpike(CF: CFrame, Weld: table)
	return StampAsset:InvokeServer(41324903, CF, "{bf0c5c8b-6f25-4321-9251-300beb818121}", Weld or {}, 0);
end;

function Module.CreateMSpike(CF: CFrame, Weld: table)
	return StampAsset:InvokeServer(41324904, CF, "{fca81e11-1ead-4817-afde-4dc29e72ea1b}", Weld or {}, 0);
end;

function Module.Kill(Player)
	if (Player:IsA("Player")) then Player = Player.Character.PrimaryPart; end;
	StampAsset:InvokeServer(
		41324885,
		LPlate.CFrame - Vector3.new(0, 9e9, 0),
		"{99ab22df-ca29-4143-a2fd-0a1b79db78c2}",
		{Player},
		0
	);
end;

function Module.Fling(Player)
	if (Player:IsA("Player")) then Player = Player.Character.PrimaryPart; end;
	StampAsset:InvokeServer(
		41324885,
		LPlate.CFrame + Vector3.new(0, 9e9, 0),
		"{99ab22df-ca29-4143-a2fd-0a1b79db78c2}",
		{Player},
		0
	);
end;

function Module.Hang(Part: Part)
	Module.CreateMSpike(
		(LPlate.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)))) - Vector3.new(0, -5, 0),
		{LPlate}
	);
	Module.Weld(Part, MSpikes[#MSpikes]);
end;

function Module.Delete(Part)
	DeleteAsset:InvokeServer(Part);
end;

local Aura;
function Module.DestroyAura(Radius: number)
	if (Aura) then Aura:Destroy(); end;
	Radius = Vector3.new(Radius, Radius, Radius);
	local Blacklist = {};
	local Hrp = LPlayer.Character.PrimaryPart;
	local Weld = Instance.new("Weld", Hrp);
	Aura = Instance.new("Part", Hrp);
	Aura.Size = Radius;
	Aura.Massless = true;
	Aura.Transparency = 0;
	Aura.Material = Enum.Material.ForceField;
	Aura.Color = Color3.new(1, 0, 0);
	Aura.CanCollide = false;
	Aura.Shape = Enum.PartType.Ball;
	Aura.Touched:Connect(function(Part)
		if (Blacklist[Part] or Part.Anchored) then return; end;
		if (Part.CFrame.Y <= LPlate.CFrame.Y + 4) then return; end;
		if (Part:IsDescendantOf(LPlayer.Character)) then return; end;
		Blacklist[Part] = true;
		Module.Hang(Part);
	end);
	Weld.Part0 = Hrp;
	Weld.Part1 = Aura;
	Aura.Destroying:Wait();
	table.clear(Blacklist);
	Blacklist = nil;
end;

local Player = Players.LocalPlayer
local UserID = Player.UserId

local r,c = Players:GetUserThumbnailAsync(UserID,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)




local UI_1NormalPos = UDim2.new(0.046, 0,0.203, 0)
local UI_2NormalPos = UDim2.new(0.6, 0,0.927, 0)
local UI_3NormalPos = UDim2.new(0, 0,0, 0)
local UI_12NormalSize = UDim2.new(1, 0,0.01, 0)
local UI_16NormalPos = UDim2.new(0.033, 0,0.056, 0)
local UI_18NormalPos = UDim2.new(0.233, 0,0.161, 0)
local UI_19NormalPos = UDim2.new(0.033, 0,0.875, 0)
local UI_9NormalSize = UDim2.new(0.401, 0,0.372, 0)

local SecondAnimations = false

local UI_ELEMENTS = {}


local PATTERN_LINK = "rbxassetid://300134974"

local Set_UI = function()
	UI_ELEMENTS["UI_1"] = Instance.new("TextLabel")
	UI_ELEMENTS["UI_2"] = Instance.new("TextLabel")
	UI_ELEMENTS["UI_3"] = Instance.new("TextLabel")
	UI_ELEMENTS["UI_4"] = Instance.new("ScreenGui")
	UI_ELEMENTS["UI_5"] = Instance.new("UICorner")
	UI_ELEMENTS["UI_6"] = Instance.new("UICorner")
	UI_ELEMENTS["UI_7"] = Instance.new("UICorner")
	UI_ELEMENTS["UI_8"] = Instance.new("UIAspectRatioConstraint")
	UI_ELEMENTS["UI_9"] = Instance.new("Frame")
	UI_ELEMENTS["UI_10"] = Instance.new("ImageLabel")
	UI_ELEMENTS["UI_11"] = Instance.new("Folder")
	UI_ELEMENTS["UI_12"] = Instance.new("Frame")
	UI_ELEMENTS["UI_13"] = Instance.new("UIGradient")
	UI_ELEMENTS["UI_14"] = Instance.new("UIGradient")
	UI_ELEMENTS["UI_15"] = Instance.new("UIGradient")
	UI_ELEMENTS["UI_16"] = Instance.new("ImageLabel")
	UI_ELEMENTS["UI_17"] = Instance.new("UICorner")
	UI_ELEMENTS["UI_18"] = Instance.new("TextLabel")
	UI_ELEMENTS["UI_19"] = Instance.new("TextBox")
	UI_ELEMENTS["UI_20"] = Instance.new("UICorner")
	UI_ELEMENTS["UI_21"] = Instance.new("UICorner")
	UI_ELEMENTS["UI_22"] = Instance.new("TextButton")
end
Set_UI()

UI_ELEMENTS["UI_4"].ZIndexBehavior = Enum.ZIndexBehavior.Global
UI_ELEMENTS["UI_4"].ResetOnSpawn = false
UI_ELEMENTS["UI_4"].IgnoreGuiInset = true
UI_ELEMENTS["UI_4"].Name = "GUI"

UI_ELEMENTS["UI_1"].Size = UDim2.new(0.4, 0,0.073, 0)
UI_ELEMENTS["UI_1"].Position = UDim2.new(-1, 0,0.203, 0)
UI_ELEMENTS["UI_1"].BackgroundTransparency = 1
UI_ELEMENTS["UI_1"].ZIndex = 2
UI_ELEMENTS["UI_1"].Text = "Let's <font color='#FF7800'>pwn</font> some kids"
UI_ELEMENTS["UI_1"].TextScaled = true
UI_ELEMENTS["UI_1"].RichText = true
UI_ELEMENTS["UI_1"].TextColor3 = Color3.fromRGB(255,255,255)
UI_ELEMENTS["UI_1"].FontFace = Font.fromName("Inconsolata")

UI_ELEMENTS["UI_3"].Position = UDim2.new(0, 0,-1, 0)
UI_ELEMENTS["UI_3"].Size = UDim2.new(1, 0,0.073, 0)
UI_ELEMENTS["UI_3"].ZIndex = 2
UI_ELEMENTS["UI_3"].BackgroundTransparency = 1
UI_ELEMENTS["UI_3"].Text = "--// Unknown Script \\--"
UI_ELEMENTS["UI_3"].TextScaled = true
UI_ELEMENTS["UI_3"].FontFace = Font.fromName("Inconsolata")
UI_ELEMENTS["UI_3"].TextColor3 = Color3.fromRGB(255,255,255)


UI_ELEMENTS["UI_22"].Position = UDim2.new(0, 0,-1, 0)
UI_ELEMENTS["UI_22"].Size = UDim2.new(1, 0,0.073, 0)
UI_ELEMENTS["UI_22"].ZIndex = 2
UI_ELEMENTS["UI_22"].BackgroundTransparency = 1
UI_ELEMENTS["UI_22"].Text = "Reload Script"
UI_ELEMENTS["UI_22"].TextScaled = true
UI_ELEMENTS["UI_22"].FontFace = Font.fromName("Inconsolata")
UI_ELEMENTS["UI_22"].TextColor3 = Color3.fromRGB(255,255,255)

UI_ELEMENTS["UI_2"].Position = UDim2.new(1.5, 0,0.927, 0)
UI_ELEMENTS["UI_2"].Size = UDim2.new(0.4, 0,0.073, 0)
UI_ELEMENTS["UI_2"].ZIndex = 2
UI_ELEMENTS["UI_2"].BackgroundTransparency = 1
UI_ELEMENTS["UI_2"].Text = "Mobile Support By Eynx"
UI_ELEMENTS["UI_2"].TextScaled = true
UI_ELEMENTS["UI_2"].FontFace = Font.fromName("Inconsolata")
UI_ELEMENTS["UI_2"].TextColor3 = Color3.fromRGB(255,255,255)
UI_ELEMENTS["UI_2"].TextTransparency = 0.75

UI_ELEMENTS["UI_18"].Position = UDim2.new(0.2, 0,-0.2, 0)
UI_ELEMENTS["UI_18"].Size = UDim2.new(0.767, 0,0.064, 0)
UI_ELEMENTS["UI_18"].ZIndex = 2
UI_ELEMENTS["UI_18"].BackgroundTransparency = 1
if Player.Name == "s1qlj" then
	UI_ELEMENTS["UI_18"].Text = "Welcome, bro"
else
	UI_ELEMENTS["UI_18"].Text = "Welcome, "..Player.Name
end
UI_ELEMENTS["UI_18"].TextScaled = true
UI_ELEMENTS["UI_18"].FontFace = Font.fromName("Inconsolata")
UI_ELEMENTS["UI_18"].TextColor3 = Color3.fromRGB(255,255,255)
UI_ELEMENTS["UI_18"].TextXAlignment = Enum.TextXAlignment.Left

UI_ELEMENTS["UI_19"].TextScaled = true
UI_ELEMENTS["UI_19"].TextColor3 = Color3.fromRGB(255,255,255)
UI_ELEMENTS["UI_19"].Size = UDim2.new(0.933, 0,0.097, 0)
UI_ELEMENTS["UI_19"].Position = UDim2.new(0.033, 0,1.5, 0)
UI_ELEMENTS["UI_19"].PlaceholderText = "Type/Execute"
UI_ELEMENTS["UI_19"].BackgroundColor3 =  Color3.fromRGB(46,46,46)
UI_ELEMENTS["UI_19"].BackgroundTransparency = 0.5
UI_ELEMENTS["UI_19"].FontFace = Font.fromName("Inconsolata")

UI_ELEMENTS["UI_8"].AspectRatio = 1.667

UI_ELEMENTS["UI_9"].Size = UDim2.new(0,0,0,0)
UI_ELEMENTS["UI_9"].AnchorPoint = Vector2.new(0.5,0.5)
UI_ELEMENTS["UI_9"].Position = UDim2.new(0.5,0,0.5,0)
UI_ELEMENTS["UI_9"].BackgroundColor3 = Color3.fromRGB(64, 64, 64)
UI_ELEMENTS["UI_9"].ClipsDescendants = true

UI_ELEMENTS["UI_10"].Size = UDim2.new(1, 0,1, 0)
UI_ELEMENTS["UI_10"].Image = PATTERN_LINK
UI_ELEMENTS["UI_10"].ImageColor3 = Color3.fromRGB(0,0,0)
UI_ELEMENTS["UI_10"].ImageTransparency = 0.8
UI_ELEMENTS["UI_10"].BackgroundTransparency = 1
UI_ELEMENTS["UI_10"].ScaleType = Enum.ScaleType.Tile
UI_ELEMENTS["UI_10"].TileSize = UDim2.new(0, 90,0, 90)

UI_ELEMENTS["UI_12"].Size = UDim2.new(0,0,0,0)
UI_ELEMENTS["UI_12"].Position = UDim2.new(0.5, 0,0.303, 0)
UI_ELEMENTS["UI_12"].ZIndex = 2
UI_ELEMENTS["UI_12"].AnchorPoint = Vector2.new(0.5,0.5)

UI_ELEMENTS["UI_17"].CornerRadius = UDim.new(1,0)
UI_ELEMENTS["UI_16"].Image = r
UI_ELEMENTS["UI_16"].BackgroundTransparency = 1
UI_ELEMENTS["UI_16"].Size = UDim2.new(0.167, 0,0.278, 0)
UI_ELEMENTS["UI_16"].Position = UDim2.new(-0.5, 0,0.056, 0)
UI_ELEMENTS["UI_16"].BackgroundColor3 = Color3.fromRGB(64, 64, 64)

UI_ELEMENTS["UI_14"].Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1, 0),
	NumberSequenceKeypoint.new(0.501247, 0.2375, 0 ),
	NumberSequenceKeypoint.new(1,0.9875,0),
})

UI_ELEMENTS["UI_13"].Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0)),
})
UI_ELEMENTS["UI_13"].Rotation = 90

UI_ELEMENTS["UI_15"].Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(112,112,112)),
})

UI_ELEMENTS["UI_15"].Rotation = 90

UI_ELEMENTS["UI_4"].Parent = game:GetService("CoreGui") -- for testing
UI_ELEMENTS["UI_9"].Parent = UI_ELEMENTS["UI_4"]
UI_ELEMENTS["UI_13"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_10"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_11"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_5"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_6"].Parent = UI_ELEMENTS["UI_10"]
UI_ELEMENTS["UI_8"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_14"].Parent = UI_ELEMENTS["UI_12"]
UI_ELEMENTS["UI_12"].Parent = UI_ELEMENTS["UI_11"]
UI_ELEMENTS["UI_1"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_2"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_3"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_15"].Parent = UI_ELEMENTS["UI_3"]
UI_ELEMENTS["UI_16"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_17"].Parent = UI_ELEMENTS["UI_16"]
UI_ELEMENTS["UI_18"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_19"].Parent = UI_ELEMENTS["UI_9"]
UI_ELEMENTS["UI_20"].Parent = UI_ELEMENTS["UI_19"]
UI_ELEMENTS["UI_22"].Parent = UI_ELEMENTS["UI_9"]


local LOADEDANIMS = {}

local Animations = function()
	if SecondAnimations == false then
		SecondAnimations = true

		LOADEDANIMS[2] = TweenService:Create(UI_ELEMENTS["UI_1"],TweenInfo.new(1),{Position = UI_1NormalPos})

		LOADEDANIMS[3] = TweenService:Create(UI_ELEMENTS["UI_2"],TweenInfo.new(1),{Position = UI_2NormalPos})

		LOADEDANIMS[4] = TweenService:Create(UI_ELEMENTS["UI_3"],TweenInfo.new(1),{Position = UI_3NormalPos})

		LOADEDANIMS[5] = TweenService:Create(UI_ELEMENTS["UI_12"],TweenInfo.new(1),{Size = UI_12NormalSize})

		LOADEDANIMS[1] = TweenService:Create(UI_ELEMENTS["UI_9"],TweenInfo.new(1),{Size = UI_9NormalSize})
	else
		LOADEDANIMS[2] = TweenService:Create(UI_ELEMENTS["UI_1"],TweenInfo.new(1),{Position = UDim2.new(-1, 0,0.203, 0)})

		LOADEDANIMS[3] = TweenService:Create(UI_ELEMENTS["UI_2"],TweenInfo.new(1),{Position = UDim2.new(1.5, 0,0.927, 0)})

		LOADEDANIMS[4] = TweenService:Create(UI_ELEMENTS["UI_3"],TweenInfo.new(1),{Position = UDim2.new(0, 0,-1, 0)})

		LOADEDANIMS[5] = TweenService:Create(UI_ELEMENTS["UI_12"],TweenInfo.new(1),{Size = UDim2.new(0,0,0,0)})

		LOADEDANIMS[6] = TweenService:Create(UI_ELEMENTS["UI_19"],TweenInfo.new(1),{Position = UI_19NormalPos})
		LOADEDANIMS[7] = TweenService:Create(UI_ELEMENTS["UI_22"],TweenInfo.new(1),{Position = UI_3NormalPos})
	end
end

Animations()

task.wait(0.5)

for _,v in pairs(LOADEDANIMS) do
	task.wait(1)
	v:Play()
end

local FindClosestName = function(name,blacklistedname,cmdtype)
	local MatchingNames = {}
	local PlayersInGame = #Players:GetPlayers()
	local Looped = 0
	for _,v in pairs(Players:GetPlayers()) do
		Looped += 1
		local Name = v.Name:lower()


		if string.sub(Name, 1, #name) == name then
			table.insert(MatchingNames,v.Name)	
		end
		if Looped == PlayersInGame then
			if table.find(MatchingNames,blacklistedname) then table.remove(MatchingNames,table.find(MatchingNames,blacklistedname)) end
			if #MatchingNames == 1 then
				if VARIABLES["Type"] == "Kill" then
					UI_ELEMENTS["UI_19"].Text = "kill "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]
				end
				if VARIABLES["Type"] == "freeze" then

					UI_ELEMENTS["UI_19"].Text = "freeze "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]

				end
				if VARIABLES["Type"] == "unfreeze" then
					UI_ELEMENTS["UI_19"].Text = "unfreeze "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]
				end
				if VARIABLES["Type"] == "loopkill" then
					UI_ELEMENTS["UI_19"].Text = "loopkill "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]
				end
				if VARIABLES["Type"] == "unloopkill" then
					UI_ELEMENTS["UI_19"].Text = "unloopkill "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]
				end
			end
		end	



	end
end

local TakeAction = function(cmdtype,target,distance)
	if target and cmdtype then

		for _,v in pairs(Players:GetPlayers()) do
			if v.Name == target then
				if cmdtype == "Kill" then
					print(target)
					Module.Kill(v.Character.PrimaryPart)
				elseif cmdtype == "freeze" then
					On = true
					Module.Freeze(v.Character.PrimaryPart)
				elseif cmdtype == "fling" then
					Module.Fling(v.Character.PrimaryPart)
				elseif cmdtype == "unfreeze" then
					for _,v in pairs(ActiveParts:GetChildren()) do
						if v.Name == "Weathervane" then

							for _,hai in pairs(v:GetTags()) do

								if hai == target then
									local Sum = 0
									repeat
										Sum += 1
										task.wait()
										Module.Delete(v)
									until Sum > 5

								end
							end
						end
					end
				elseif cmdtype == "loopkill" then
					if CONNECTIONS[target] == nil then
						Module.Kill(v.Character.PrimaryPart)
						CONNECTIONS[target] = v.CharacterAdded:Connect(function(char)
							Module.Kill(char.PrimaryPart)
						end)
					end
					
				elseif cmdtype == "unloopkill" then
					pcall(function()
						if CONNECTIONS[target] then
							CONNECTIONS[target]:Disconnect()
							CONNECTIONS[target] = nil
						end
					end)
				
				end
				
			end
		end
	end
end

local Set = function()

	VARIABLES["Target"] = nil
	VARIABLES["Type"] = nil
	VARIABLES["Distance"] = nil
	VARIABLES["Pos"] = nil
	local TextBox = UI_ELEMENTS["UI_19"]

	CONNECTIONS[6] = Player.Chatted:Connect(function(msg)
		VARIABLES["Target"] = nil
		VARIABLES["Type"] = nil
		VARIABLES["Distance"] = nil
		local FirstCharacter = string.sub(msg:lower(),1,1)
		if FirstCharacter == ":" then
			local PrefixRemoved = string.gsub(msg:lower(),":","")
			local Args = string.split(PrefixRemoved:lower()," ")
			if Args[1] == "kill" then
				local Target = Args[2]
				VARIABLES["Type"] = "Kill"
				VARIABLES["Target"] = Target
			elseif Args[1] == "loopkill" then
				local Target = Args[2]
				VARIABLES["Type"] = "loopkill"
				VARIABLES["Target"] = Target
			elseif Args[1] == "unloopkill" then
				local Target = Args[2]
				VARIABLES["Type"] = "unloopkill"
				VARIABLES["Target"] = Target
			elseif Args[1] == "freeze" then
				local Target = Args[2]
				VARIABLES["Type"] = "freeze"
				VARIABLES["Target"] = Target
			elseif Args[1] == "killall" then
				for _,v in pairs(Players:GetPlayers()) do
					local BasePart = v.Character.PrimaryPart
					if BasePart then
						if v.Name ~= Player.Name then
							Module.Kill(BasePart)
						end
					end
				end
			elseif Args[1] == "freezeall" then
				for _,v in pairs(Players:GetPlayers()) do
					local BasePart = v.Character.PrimaryPart
					if BasePart then
						if v.Name ~= Player.Name then
							Module.Freeze(BasePart)
						end
					end
				end
			elseif Args[1] == "unfreeze" then
				local Target = Args[2]
				VARIABLES["Target"] = Target
				VARIABLES["Type"] = "unfreeze"
			elseif Args[1] == "ubervip" then
				pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = UberVipCFrame
				end)
			elseif Args[1] == "vip" then
				pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = VipCFrame
				end)
			elseif Args[1] == "megavip" then
				pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = MegaVipCFrame
				end)
			elseif Args[1] == "thumbnail" then
				pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = ThumbnailCFrame
				end)
			elseif Args[1] == "unfreezeall" then
				pcall(function()
					repeat
						task.wait()
						for _,v in pairs(ActiveParts:GetChildren()) do
							if v.Name == "Weathervane" then
								Module.Delete(v)		
							end				
						end
					until not ActiveParts:FindFirstChild("Weathervane")


				end)
			elseif Args[1] == "uufreeze" then
				pcall(function()
					local PositionBeforeDeath = Player.Character.HumanoidRootPart.CFrame	
					Player.Character.Humanoid.Health = 0
					Player.CharacterAdded:Wait()
					task.wait(1)
					Player.Character.HumanoidRootPart.CFrame = PositionBeforeDeh
				end)
			elseif Args[1] == "god" then
				if CONNECTIONS[7] == nil then
					GodMode = true
					task.spawn(function()
						while GodMode == true and task.wait(0.0025) do
							for _,v in pairs(workspace.Plates:GetChildren()) do
								if v.Owner.Value ~= Player.Name then
									for _,Active in pairs(v.ActiveParts:GetChildren()) do
										if string.find(Active.Name:lower(),"spikes") then
						                                    for _,Spikes in pairs(Active:GetChildren()) do
                                                                                            if Spikes.Name == "Spikes_Simple" then
  										               for _,gh in pairs(Spikes:GetChildren()) do
												   if gh.Name == "Spikes" then
													gh:Destroy()
													end
												end
											 end
										     end
										end
									end
								end
							end
						end
					end)
					CONNECTIONS[8] = Player.Character.Humanoid.Died:Connect(function()
						pcall(function()
							VARIABLES["Pos"] = Player.Character.HumanoidRootPart.CFrame

						end)
					end)
					CONNECTIONS[7] = Player.CharacterAdded:Connect(function(char)
						CONNECTIONS[8]:Disconnect()
						pcall(function()
							if VARIABLES["Pos"] ~= nil then
								task.wait(1)						
								char.HumanoidRootPart.CFrame = VARIABLES["Pos"]						
							end
						end)
						task.wait(0.5)
						CONNECTIONS[8] = Player.Character.Humanoid.Died:Connect(function()
							pcall(function()
								VARIABLES["Pos"] = Player.Character.HumanoidRootPart.CFrame
								CONNECTIONS[8]:Disconnect()
							end)
						end)
					end)

				end
			elseif Args[1] == "ungod" then
				GodMode = false
				pcall(function()
					CONNECTIONS[8]:Disconnect()
					CONNECTIONS[8] = nil
				end)
				pcall(function()
					CONNECTIONS[7]:Disconnect()
					CONNECTIONS[7] = nil
				end)
			end
			if VARIABLES["Target"] ~= nil and VARIABLES["Type"] ~= nil then
				FindClosestName(VARIABLES["Target"],"noonenoneaıfzxj",VARIABLES["Type"])
				if 	VARIABLES["Type"] == "Kill" then
					TakeAction("Kill",VARIABLES["Target"])
					TextBox.Text = ""
				elseif VARIABLES["Type"] == "freeze" then
					TakeAction("freeze",VARIABLES["Target"])
					TextBox.Text = ""
				elseif VARIABLES["Type"] == "unfreeze" then
					TakeAction("unfreeze",VARIABLES["Target"])
					TextBox.Text = ""
				elseif VARIABLES["Type"] == "loopkill" then
					TakeAction("loopkill",VARIABLES["Target"])
					TextBox.Text = ""
				elseif VARIABLES["Type"] == "unloopkill" then
					TakeAction("unloopkill",VARIABLES["Target"])
					TextBox.Text = ""
				end
			end
		end
	end) 

	CONNECTIONS[1] = UI_ELEMENTS["UI_19"].FocusLost:Connect(function()
		VARIABLES["Target"] = nil
		VARIABLES["Type"] = nil
		VARIABLES["Distance"] = nil
		local Args = string.split(TextBox.Text:lower()," ")
		if #TextBox.Text > 2 and Args[1] == "kill" then
			local Target = Args[2]
			VARIABLES["Target"] = Target
			VARIABLES["Type"] = "Kill"

		elseif #TextBox.Text > 2 and Args[1] == "freeze" then
			local Target = Args[2]
			VARIABLES["Target"] = Target
			VARIABLES["Type"] = "freeze"
		elseif #TextBox.Text > 2 and Args[1] == "unfreeze" then
			local Target = Args[2]
			VARIABLES["Target"] = Target
			VARIABLES["Type"] = "unfreeze"
		elseif #TextBox.Text > 2 and Args[1] == "fling" then
			local Target = Args[2]
			VARIABLES["Target"] = Target
			VARIABLES["Type"] = "fling"


		elseif #TextBox.Text > 2 and Args[1] == "circle" then
			if tonumber(Args[2]) then
				local Target = Args[2]

				Module.DestroyAura(Target)
			end


		elseif TextBox.Text == "uncircle" then
			pcall(function()
				Aura:Destroy()
			end)
		elseif TextBox.Text == "killall" then
			for _,v in pairs(Players:GetPlayers()) do
				local BasePart = v.Character.PrimaryPart
				if BasePart then
					if v.Name ~= Player.Name then
						Module.Kill(BasePart)
					end
				end
			end

		elseif TextBox.Text == "freezeall" then
			for _,v in pairs(Players:GetPlayers()) do
				local BasePart = v.Character.PrimaryPart
				if BasePart then
					if v.Name ~= Player.Name then
						Module.Freeze(BasePart)
					end
				end
			end
		elseif TextBox.Text == "reload" then
			pcall(function()
				game:GetService("CoreGui"):FindFirstChild("GUI"):Destroy()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Eynxia/Test/main/Main.lua"))()
			end)
			for _,v in pairs(CONNECTIONS) do
				v:Disconnect()


			end
		elseif TextBox.Text:lower() == "ubervip" then
			pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = UberVipCFrame
			end)
		elseif TextBox.Text:lower() == "vip" then
			pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = VipCFrame
			end)
		elseif TextBox.Text:lower() == "megavip" then
			pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = MegaVipCFrame
			end)
		elseif TextBox.Text:lower() == "thumbnail" then
			pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = ThumbnailCFrame
			end)
		elseif TextBox.Text:lower() == "unfreezeall" then
			pcall(function()
				repeat
					task.wait()
					for _,v in pairs(ActiveParts:GetChildren()) do
						if v.Name == "Weathervane" then
							Module.Delete(v)		
						end				
					end
				until not ActiveParts:FindFirstChild("Weathervane")
			end)
		elseif #TextBox.Text > 2 and Args[1] == "loopkill" then
			local Target = Args[2]
			VARIABLES["Type"] = "loopkill"
			VARIABLES["Target"] = Target
		elseif #TextBox.Text > 2 and Args[1] == "unloopkill" then
			local Target = Args[2]
			VARIABLES["Type"] = "unloopkill"
			VARIABLES["Target"] = Target
		elseif TextBox.Text:lower() == "uufreeze" then
			pcall(function()
				local PositionBeforeDeath = Player.Character.HumanoidRootPart.CFrame	
				Player.Character.Humanoid.Health = 0
				Player.CharacterAdded:Wait()
				task.wait(1)
				Player.Character.HumanoidRootPart.CFrame = PositionBeforeDeath
			end)
		elseif TextBox.Text:lower() == "god" then
			if CONNECTIONS[7] == nil then
				GodMode = true
				task.spawn(function()
					while GodMode == true and task.wait(0.0025) do
							for _,v in pairs(workspace.Plates:GetChildren()) do
								if v.Owner.Value ~= Player.Name then
									for _,Active in pairs(v.ActiveParts:GetChildren()) do
										if string.find(Active.Name:lower(),"spikes") then
						                                    for _,Spikes in pairs(Active:GetChildren()) do
                                                                                            if Spikes.Name == "Spikes_Simple" then
  										               for _,gh in pairs(Spikes:GetChildren()) do
												   if gh.Name == "Spikes" then
													gh:Destroy()
													end
												end
											 end
										     end
										end
									end
								end
							end
						end
				end)

				CONNECTIONS[8] = Player.Character.Humanoid.Died:Connect(function()
					pcall(function()
						VARIABLES["Pos"] = Player.Character.HumanoidRootPart.CFrame

					end)
				end)
				CONNECTIONS[7] = Player.CharacterAdded:Connect(function(char)
					CONNECTIONS[8]:Disconnect()
					pcall(function()
						if VARIABLES["Pos"] ~= nil then
							task.wait(1)					
							char.HumanoidRootPart.CFrame = VARIABLES["Pos"]						
						end
					end)
					task.wait(0.5)
					CONNECTIONS[8] = Player.Character.Humanoid.Died:Connect(function()
						pcall(function()
							VARIABLES["Pos"] = Player.Character.HumanoidRootPart.CFrame
							CONNECTIONS[8]:Disconnect()
						end)
					end)
				end)

			end
		elseif TextBox.Text:lower() == "ungod" then
			GodMode = false
			pcall(function()
				CONNECTIONS[8]:Disconnect()
				CONNECTIONS[8] = nil
			end)
			pcall(function()
				CONNECTIONS[7]:Disconnect()
				CONNECTIONS[7] = nil
			end)
		end
		if VARIABLES["Target"] ~= nil and VARIABLES["Type"] ~= nil then
			FindClosestName(VARIABLES["Target"],"noonenoneaıfzxj",VARIABLES["Type"])
			if 	VARIABLES["Type"] == "Kill" then
				TakeAction("Kill",VARIABLES["Target"])
				TextBox.Text = ""
			elseif VARIABLES["Type"] == "freeze" then
				TakeAction("freeze",VARIABLES["Target"])
				TextBox.Text = ""
			elseif VARIABLES["Type"] == "unfreeze" then
				TakeAction("unfreeze",VARIABLES["Target"])
				TextBox.Text = ""
			end
		end

	end)

end

Set()
Animations()

task.wait(2.5)

for _,v in pairs(LOADEDANIMS) do
	task.wait(1)
	v:Play()
end

TweenService:Create(UI_ELEMENTS["UI_16"],TweenInfo.new(1.5),{Position = UI_16NormalPos}):Play()
TweenService:Create(UI_ELEMENTS["UI_18"],TweenInfo.new(1.5),{Position = UI_18NormalPos}):Play()

local UserInputService = game:GetService("UserInputService")

local gui = UI_ELEMENTS["UI_9"]

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	TweenService:Create(UI_ELEMENTS["UI_9"],TweenInfo.new(0.25),{Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
end
CONNECTIONS[2] = gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		CONNECTIONS[3] = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

CONNECTIONS[4] = gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

CONNECTIONS[5] = UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
