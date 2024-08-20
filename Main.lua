--[[

Hello, my name is Eynxia!
This script's owner is WrdSup1 (aka. Eynx)
Please, do not try to steal or impersonate this script or else i will take action.

--// New Commands

-killfarm
-whitelist

--]]






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
local FarmKills = false
local NotificationFolder = Instance.new("Folder")

local VARIABLES = {}
local WhitelistedPlayers = {}
VARIABLES["Seats"] = {}
VARIABLES["Players"] = {}

local On = false
local GodMode = false
local ActiveParts: Folder;
local Plates: Model = Workspace.Plates;
local LPlate: Part;
local PositionBeforeUsingFarmKills
local TempPart = nil
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



for _,v in pairs(workspace:GetDescendants()) do
	if v:IsA("Seat") then
		wait(0.01)
		table.insert(VARIABLES["Seats"],v)
	end
end

workspace.DescendantAdded:Connect(function(desc)
	if desc:IsA("Seat") then
		table.insert(VARIABLES["Seats"],desc)
	end
end)

workspace.DescendantRemoving:Connect(function(desc)
	if desc:IsA("Seat") then
		for _,v in pairs(VARIABLES["Seats"]) do
			if v == desc then
				table.remove(VARIABLES["Seats"],table.find(VARIABLES["Players"],desc))
			end
		end
	end
end)

coroutine.resume(coroutine.create(function()
	while task.wait(1) do
		pcall(function()
			for _,v in pairs(Players:GetPlayers()) do 
				if v.Character then 
					if v.Character:FindFirstChild("Humanoid") then
						v.Character.Humanoid.DisplayName = v.Name
					end
				end
			end					
		end)
	end
end))

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

local CDVAL = 0.35
local CD = false
local CD2 = false

local CooldownForFreezeAura = function(plr)

	if CD == false then
		CD = true
		if not table.find(WhitelistedPlayers,plr) then
			Module.Freeze(plr.Character.PrimaryPart)
		end
	end
	if CD2 == false then
		CD2 = true
		wait(CDVAL)
		CD = false
		CD2 = false
	end
end

local FreezeAura;
function Module.FreezeAura(Radius: number)
	if (FreezeAura) then FreezeAura:Destroy(); end;
	Radius = Vector3.new(Radius, Radius, Radius);
	local Hrp = LPlayer.Character.PrimaryPart;
	local Weld = Instance.new("Weld", Hrp);
	FreezeAura = Instance.new("Part", Hrp);
	FreezeAura.Size = Radius;
	FreezeAura.Massless = true;
	FreezeAura.Transparency = 0;
	FreezeAura.Material = Enum.Material.ForceField;
	FreezeAura.Color = Color3.new(0.439216, 1, 1);
	FreezeAura.CanCollide = false;
	FreezeAura.Shape = Enum.PartType.Ball;
	FreezeAura.Touched:Connect(function(Part)
		if Part.Parent:FindFirstChild("Humanoid") then
			if Players:FindFirstChild(Part.Parent.Name) then
				local Player = Players:GetPlayerFromCharacter(Part.Parent)
				coroutine.wrap(function()
					CooldownForFreezeAura(Player)
				end)()


			end


		end

	end);
	Weld.Part0 = Hrp;
	Weld.Part1 = FreezeAura;
end;

local CDVAL2 = 0.35
local CD4 = false
local CD3 = false

local CooldownForKillAura = function(plr)

	if CD4 == false then
		CD4 = true
		if not table.find(WhitelistedPlayers,plr) then
			Module.Kill(plr.Character.PrimaryPart)
		end

	end
	if CD2 == false then
		CD4 = true
		wait(CDVAL2)
		CD4 = false
		CD3 = false
	end
end

local KillAura;
function Module.KillAura(Radius: number)
	if (KillAura) then KillAura:Destroy(); end;
	Radius = Vector3.new(Radius, Radius, Radius);
	local Hrp = LPlayer.Character.PrimaryPart;
	local Weld = Instance.new("Weld", Hrp);
	KillAura = Instance.new("Part", Hrp);
	KillAura.Size = Radius;
	KillAura.Massless = true;
	KillAura.Transparency = 0;
	KillAura.Material = Enum.Material.ForceField;
	KillAura.Color = Color3.new(1, 0.690196, 0.690196);
	KillAura.CanCollide = false;
	KillAura.Shape = Enum.PartType.Ball;
	KillAura.Touched:Connect(function(Part)
		if Part.Parent:FindFirstChild("Humanoid") then
			if Players:FindFirstChild(Part.Parent.Name) then
				local Player = Players:GetPlayerFromCharacter(Part.Parent)
				coroutine.wrap(function()
					CooldownForKillAura(Player)
				end)()


			end


		end

	end);
	Weld.Part0 = Hrp;
	Weld.Part1 = KillAura;
end;

--// Creating The Gui
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

UI_ELEMENTS["UI_4"].Parent = game:GetService("CoreGui")
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
NotificationFolder.Parent = UI_ELEMENTS["UI_4"]

--// Setting Up Animations
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

--// This function finds the closest Player.Name from a string
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
				if VARIABLES["Type"] == "whitelist" then
					UI_ELEMENTS["UI_19"].Text = "whitelist "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]
				end
				if VARIABLES["Type"] == "unwhitelist " then
					UI_ELEMENTS["UI_19"].Text = "unwhitelist "..MatchingNames[1]
					VARIABLES["Target"] = MatchingNames[1]
				end
			end
		end	



	end
end


local NotificationsSent = 0

local SendNotify = function(topic,text)
	NotificationsSent += 1
	coroutine.wrap(function()
		if NotificationFolder:FindFirstChild("Notification "..NotificationsSent - 1) then
			local Frame = NotificationFolder:FindFirstChild("Notification "..NotificationsSent - 1)
			Frame:TweenPosition(UDim2.new(1.25, 0,0.886, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quad,1,true)
			task.wait(1.1)
			Frame:Destroy()
		end
	end)()

	local TXT1 = Instance.new("TextLabel") --// Topic/Command Name
	local TXT2 = Instance.new("TextLabel") --// Error/warning
	local MAINFR = Instance.new("Frame")
	local EFF = Instance.new("Frame")
	local PAT = Instance.new("ImageLabel")
	local GRAD = Instance.new("UIGradient")
	local GRAD2 = Instance.new("UIGradient")
	local UICOR = Instance.new("UICorner")
	local UITEXTSIZE = Instance.new("UITextSizeConstraint")

	UITEXTSIZE.MaxTextSize = 17
	UITEXTSIZE.MinTextSize = 1

	GRAD.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0)),
	})
	GRAD.Rotation = 90

	GRAD2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1, 0),
		NumberSequenceKeypoint.new(0.501247, 0.2375, 0 ),
		NumberSequenceKeypoint.new(1,0.9875,0),
	})

	TXT1.Size = UDim2.new(1, 0,0.293, 0)
	TXT1.Position = UDim2.new(0, 0,0, 0)
	TXT1.TextScaled = true
	TXT1.TextColor3 = Color3.fromRGB(255,255,255)
	TXT1.TextXAlignment = Enum.TextXAlignment.Left
	TXT1.TextYAlignment = Enum.TextYAlignment.Top
	TXT1.ZIndex = 2
	TXT1.Text = topic
	TXT1.BackgroundTransparency = 1
	TXT1.TextXAlignment = Enum.TextXAlignment.Center
	TXT1.Font = Enum.Font.Montserrat
	TXT1.TextTransparency = 1

	TXT2.Size = UDim2.new(0.957, 0,0.568, 0)
	TXT2.Position = UDim2.new(0.021, 0,0.346, 0)
	TXT2.TextScaled = true
	TXT2.TextColor3 = Color3.fromRGB(255,255,255)
	TXT2.TextXAlignment = Enum.TextXAlignment.Left
	TXT2.TextYAlignment = Enum.TextYAlignment.Top
	TXT2.ZIndex = 2
	TXT2.Text = text
	TXT2.BackgroundTransparency = 1
	TXT2.Font = Enum.Font.Montserrat
	TXT2.TextTransparency = 1


	UICOR.CornerRadius = UDim.new(0.1, 0)

	PAT.Image = PATTERN_LINK
	PAT.Size = UDim2.new(1,0,1,0)
	PAT.Position = UDim2.new(0,0,0,0)
	PAT.ScaleType = Enum.ScaleType.Tile
	PAT.TileSize = UDim2.new(0, 90,0, 90)
	PAT.ImageTransparency = 0.8
	PAT.ImageColor3 = Color3.fromRGB(0,0,0)
	PAT.ZIndex = 1
	PAT.BackgroundTransparency = 1

	MAINFR.Size = UDim2.new(0.18, 0,0.106, 0)
	MAINFR.Position = UDim2.new(1.25, 0,0.886, 0)
	MAINFR.BackgroundColor3 = Color3.fromRGB(48,48,48)
	MAINFR.Name = "Notification "..NotificationsSent

	EFF.Size = UDim2.new(0,0,0,0)
	EFF.Position = UDim2.new(0.5, 0,0.303, 0)
	EFF.BackgroundColor3 = Color3.fromRGB(255,255,255)
	EFF.AnchorPoint = Vector2.new(0.5,0.5)
	EFF.ZIndex = 2

	MAINFR.Parent = NotificationFolder
	UICOR.Parent = MAINFR
	GRAD.Parent = MAINFR
	EFF.Parent = MAINFR
	TXT1.Parent = MAINFR
	TXT2.Parent = MAINFR
	PAT.Parent = MAINFR
	GRAD2.Parent = EFF
	UITEXTSIZE.Parent = TXT2

	coroutine.wrap(function()
		MAINFR:TweenPosition(UDim2.new(0.813, 0,0.886, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quad,1,true)
		task.wait(0.25)
		TweenService:Create(TXT1,TweenInfo.new(1),{TextTransparency = 0}):Play()
		task.wait(0.25)
		TweenService:Create(EFF,TweenInfo.new(1),{Size = UDim2.new(1, 0,0.02, 0)}):Play()
		task.wait(0.25)
		TweenService:Create(TXT2,TweenInfo.new(1),{TextTransparency = 0}):Play()
		task.wait(2)
		MAINFR:TweenPosition(UDim2.new(1.25, 0,0.886, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quad,1,true)
		task.wait(1)
		MAINFR:Destroy()
	end)()

end

--// This is pretty straight forward, this function loopkills a player
local LoopKill = function(target)
	if target then
		if Players:FindFirstChild(target) then
			if CONNECTIONS[target] == nil then
				local targetPlr = Players:FindFirstChild(target)
				if targetPlr:IsA("Player") then
					SendNotify("loopkill","Successfully turned on loopkill for: "..target..".")
					Module.Kill(targetPlr.Character.PrimaryPart)
					CONNECTIONS[target] = targetPlr.CharacterAdded:Connect(function(Char)

						task.wait(0.5)

						Module.Kill(Char.PrimaryPart)


					end)
				end
			end
		end
	end
end


--// This is pretty straight forward, this function removes loopkill from a player
local UnLoopKill = function(target)
	if target then
		if Players:FindFirstChild(target) then
			if CONNECTIONS[target] ~= nil then
				pcall(function()
					CONNECTIONS[target]:Disconnect()
					CONNECTIONS[target] = nil
					SendNotify("unloopkill","Successfully turned off loopkill for: "..target..".")
				end)

			end
		end
	end
end



Players.PlayerRemoving:Connect(function(target)
	pcall(function()
		if CONNECTIONS[target] ~= nil then
			CONNECTIONS[target]:Disconnect()
			CONNECTIONS[target] = nil
		end
	end)
end)


local AllPlayers = {}

for _,v in pairs(Players:GetPlayers()) do
	if v.Name ~= Player.Name then
		if not table.find(AllPlayers,v) then
			table.insert(AllPlayers,v)
		end
	end
end

Players.PlayerAdded:Connect(function(plr)
	if not table.find(AllPlayers,plr) then
		table.insert(AllPlayers,plr)
	end
end)

Players.PlayerRemoving:Connect(function(plr)
	if table.find(AllPlayers,plr) then
		table.remove(AllPlayers,table.find(AllPlayers,plr))
	end
end)

--// This function fires a function from a given string, {cmdtype}.
local TakeAction = function(cmdtype,target,distance)
	if target and cmdtype then

		for _,v in pairs(Players:GetPlayers()) do
			if v.Name == target then
				if cmdtype == "Kill" then
					if v.Character then
						if v.Character:FindFirstChild("Humanoid") then
							local Hum = v.Character.Humanoid
							if Hum.Sit == true then
								for _,seat in pairs(VARIABLES["Seats"]) do
									if seat.Occupant ~= nil then
										if seat.Occupant.Parent.Name == v.Name then
											SendNotify("kill","Couldn't kill "..v.Name..", player is currently sitting.")
											return
										end
									end
									
								end
							end
							
						end
					end
					if not table.find(WhitelistedPlayers,v) then
						local s,e = pcall(function()
							Module.Kill(v.Character.PrimaryPart)
						end)
						if s then
							SendNotify("kill","Successfully killed: "..v.Name)
						else
							SendNotify("kill","Failed to kill: "..v.Name..", player's PrimaryPart is missing.")
						end
					
					end

				elseif cmdtype == "freeze" then
					if not table.find(WhitelistedPlayers,v) then
						local s,e = pcall(function()
							On = true

							Module.Freeze(v.Character.PrimaryPart)
						end)
						
						if s then
							SendNotify("freeze","Successfully froze: "..v.Name)
						else
							SendNotify("freeze","Failed to froze: "..", player's PrimaryPart is missing.")
						end
					end

				elseif cmdtype == "fling" then
				
						Module.Fling(v.Character.PrimaryPart)
					

				elseif cmdtype == "unfreeze" then
					SendNotify("unfreeze","Unfreezing: "..v.Name..".")
					for _,v in pairs(ActiveParts:GetChildren()) do
						if v.Name == "Weathervane" then

							for _,hai in pairs(v:GetTags()) do

								if hai == target then
									local Sum = 0
									repeat
										Sum += 1
										task.wait()
										Module.Delete(v)
									until Sum > 200

								end
							end
						end
					end
				elseif cmdtype == "loopkill" then
					if not table.find(WhitelistedPlayers,v) then
						LoopKill(target)
					end


				elseif cmdtype == "unloopkill" then

					UnLoopKill(target)
				elseif cmdtype == "whitelist" then

					if not table.find(WhitelistedPlayers,v) then
						SendNotify("Whitelist","Successfully whitelisted: "..v.Name)
						table.insert(WhitelistedPlayers,v)
					end
					for _,v in pairs(WhitelistedPlayers) do
						print(v)
					end
				elseif cmdtype == "unwhitelist" then

					SendNotify("UnWhitelist","Successfully unwhitelisted: "..v.Name)
					table.remove(WhitelistedPlayers,table.find(WhitelistedPlayers,v))


				end

			end
		end
	end
end

--// This is pretty straight forward, this function sets up all the important functions.
local Set = function()
	local Prefix = ":"
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
		if FirstCharacter == Prefix then
			local PrefixRemoved = string.gsub(msg:lower(),Prefix,"")
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
			elseif Args[1] == "freeze" or Args[1] == "thaw" then
				local Target = Args[2]
				VARIABLES["Type"] = "freeze"
				VARIABLES["Target"] = Target
			elseif Args[1] == "whitelist" then
				local Target = Args[2]
				VARIABLES["Type"] = "whitelist"
				VARIABLES["Target"] = Target
			elseif Args[1] == "unwhitelist" then
				local Target = Args[2]
				VARIABLES["Type"] = "unwhitelist"
				VARIABLES["Target"] = Target
			elseif Args[1] == "killall" then
				for _,v in pairs(Players:GetPlayers()) do
					local BasePart = v.Character.PrimaryPart
					if BasePart then
						if v.Name ~= Player.Name and not table.find(WhitelistedPlayers,v) then
							Module.Kill(BasePart)
						end
					end
				end
			elseif Args[1] == "freezeall" then
					SendNotify("freezeall","Froze all players.")
				for _,v in pairs(Players:GetPlayers()) do
					
					local BasePart = v.Character.PrimaryPart
					if BasePart then
						if v.Name ~= Player.Name and not table.find(WhitelistedPlayers,v) then
							VARIABLES["Target"] = v.Name
							On = true
							task.wait(0.05)
							Module.Freeze(BasePart)
						end
					end
				end
			elseif Args[1] == "unfreeze" then
				local Target = Args[2]
				VARIABLES["Target"] = Target
				VARIABLES["Type"] = "unfreeze"
			elseif Args[1] == "prefix" then
				local Target = Args[2]

				if #Target == 1 then
					Prefix = Target
					SendNotify("Prefix","Successfully changed prefix to: "..Target)
				else
					SendNotify("Prefix","Failed to change prefix to: "..Target..", character length too long.")
				end

			elseif Args[1] == "ubervip" then
				local s,e = pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = UberVipCFrame
				end)
				if s then
					SendNotify("Teleport","Successfully teleported to ubervip.")
				else
					SendNotify("Teleport","Failed to teleport to ubervip, could not found HumanoidRootPart or Character.")
				end
			elseif Args[1] == "vip" then
				local s,e = pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = VipCFrame
				end)
				if s then
					SendNotify("Teleport","Successfully teleported to vip.")
				else
					SendNotify("Teleport","Failed to teleport to vip, could not found HumanoidRootPart or Character.")
				end
			elseif Args[1] == "freezeaura" then
				if tonumber(Args[2]) then
					local Target = Args[2]

					Module.FreezeAura(Target)
				else
					SendNotify("freezeaura","Failed to execute freezeaura, Argument 2 needs to be a number!")
				end
			elseif Args[1] == "killaura" then
				if tonumber(Args[2]) then
					local Target = Args[2]

					Module.KillAura(Target)
				else
					SendNotify("killaura","Failed to execute killaura, Argument 2 needs to be a number!")
				end
			elseif Args[1] == "unkillaura" then
				KillAura:Destroy()
			elseif Args[1] == "unfreezeaura" then
				FreezeAura:Destroy()
			elseif Args[1] == "megavip" then
				local s,e = pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = MegaVipCFrame
				end)
				if s then
					SendNotify("Teleport","Successfully teleported to megavip.")
				else
					SendNotify("Teleport","Failed to teleport to megavip, could not found HumanoidRootPart or Character.")
				end
			elseif Args[1] == "thumbnail" then
				local s,e = pcall(function()
					local HRP = Player.Character.HumanoidRootPart
					HRP.CFrame = ThumbnailCFrame
				end)
				if s then
					SendNotify("Teleport","Successfully teleported to thumbnail.")
				else
					SendNotify("Teleport","Failed to teleport to thumbnail, could not found HumanoidRootPart or Character.")
				end
			elseif Args[1] == "killfarm" then
				if TempPart == nil then
					TempPart = Instance.new("Part")
					TempPart.Size = Vector3.new(100,0.1,100)
					TempPart.CFrame = CFrame.new(71, -101, -61)
					TempPart.Parent = workspace
					TempPart.Anchored = true
					TempPart.Transparency = 0.5
					TempPart.Color = Color3.fromRGB(0,0,0)
					TempPart.CanCollide = true
					TempPart.Name = "Safe"
					if Player.Character then
						if Player.Character:FindFirstChild("HumanoidRootPart") then
							SendNotify("killfarm","Successfully started killfarm.")
							PositionBeforeUsingFarmKills = Player.Character.HumanoidRootPart.CFrame
							wait(0.05)
							Player.Character.HumanoidRootPart.CFrame = CFrame.new(71, -101, -61)
							FarmKills = true
						else
							SendNotify("killfarm","Failed to start killfarm, could not find HumanoidRootPart.")
						end
					else
						SendNotify("killfarm","Failed to start killfarm, could not find character.")
					end

				end

			elseif Args[1] == "unkillfarm" then
				TempPart:Destroy()
				TempPart = nil
				FarmKills = false
				if Player.Character then
					if Player.Character:FindFirstChild("HumanoidRootPart") then
						Player.Character.HumanoidRootPart.CFrame = PositionBeforeUsingFarmKills
						SendNotify("killfarm","Successfully stopped killfarm.")
					else
						SendNotify("unkillfarm","Could not find player's HumanoidRootPart.")
					end
				else
					SendNotify("unkillfarm","Could not find player's character.")
				end
			elseif Args[1] == "unfreezeall" then
				pcall(function()
					SendNotify("unfreezeall","unfreezing all players.")
					repeat
						task.wait()
						for _,v in pairs(ActiveParts:GetChildren()) do
							if v.Name == "Weathervane" then
								Module.Delete(v)		
							end				
						end
					until not ActiveParts:FindFirstChild("Weathervane")


				end)
			elseif Args[1] == "dunparts" then

				pcall(function()
					for _,v in pairs(workspace.Plates:GetChildren()) do

						for _,Active in pairs(v.ActiveParts:GetChildren()) do
							wait(0.05)
							if Active.Name == "Block - Brick" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.Brick2
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)

							end
							if string.find(Active.Name,"Block") and not string.find(Active.Name,"Corner") then
								for _,wow in pairs(Active:GetChildren()) do
									if wow:IsA("BasePart") then
										local fling = Instance.new("BodyAngularVelocity")
										fling.Name = "f"
										fling.Parent = wow
										fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
										fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
										fling.P = math.huge
										game:GetService("Debris"):AddItem(fling,5)
									end
								end
							end
							if Active.Name == "Window - Tall Corner" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.houseWindowDiagonal.castleDiagWindowTop
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if string.find(Active.Name,"Wedge") and not string.find(Active.Name,"Long Wedge") then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.GrassWedge.Wedge
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if string.find(Active.Name,"Corner")  then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.GrassWedge.Wedge
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if string.find(Active.Name,"Long Wedge") then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.GrassLongWedge.Wedge
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Spikes" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.Spikes_Simple.Box
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Spikes - Moving" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.Spike_Retracting.Box
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Friend Only Door - Hostile" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.FriendOnlyDoorHostile.Head
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Chair - Tall" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceChairLrg.Wedge
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Captain's Chair" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceChairCaptain.Wedge
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Chair - Short" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceChairSmall.Wedge
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Space Wall" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceWall
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Space Wall" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceWall
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Space Wall - Corner" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceWallCorner
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Control Panel - Wall" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.spaceControlPanelWall.Part
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Window - Small" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.Model.Window
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Window - Tall" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.Model.Window
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Chimney" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.Model.Brick2
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
							if Active.Name == "Drawbridge" then
								local fling = Instance.new("BodyAngularVelocity")
								fling.Name = "f"
								fling.Parent = Active.CastleDrawBridge.CastleDbridgeArchLeft2
								fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
								fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								fling.P = math.huge
								game:GetService("Debris"):AddItem(fling,5)
							end
						end

					end
				end)
			elseif Args[1] == "uufreeze" then
				pcall(function()
					local PositionBeforeDeath = Player.Character.HumanoidRootPart.CFrame	
					Player.Character.Humanoid.Health = 0
					Player.CharacterAdded:Wait()
					task.wait(1)
					Player.Character.HumanoidRootPart.CFrame = PositionBeforeDeath
				end)
			elseif Args[1] == "god" then
				if CONNECTIONS[7] == nil then
					GodMode = true
					task.spawn(function()
						SendNotify("God Mode","Successfully started god mode.")
						while GodMode == true and task.wait(0.0025) do
							for _,v in pairs(workspace.Plates:GetChildren()) do
								if v.Owner.Value ~= Player then
									for _,Active in pairs(v.ActiveParts:GetChildren()) do
										if string.find(Active.Name:lower(),"spikes") or string.find(Active.Name:lower(),"hostile") then
											for _,Spikes in pairs(Active:GetChildren()) do
												if Spikes.Name == "Spikes_Simple" then
													for _,gh in pairs(Spikes:GetChildren()) do
														if gh.Name == "Spikes" then
															gh:Destroy()
														end
													end
												elseif Spikes.Name == "Spike_Retracting" then
													for _,gh in pairs(Spikes:GetChildren()) do
														if gh.Name == "Spikes" then
															gh:Destroy()
														end
													end	
												elseif string.find(Spikes.Name:lower(),"friend") then
													for _,gh in pairs(Spikes:GetChildren()) do
														if string.find(gh.Name:lower(),"laser") then
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
					SendNotify("God Mode","Successfully stopped god mode.")
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
			--// This i don't even know what to call determines what command that is going to be executed. VARIABLES["Type"]
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
				elseif VARIABLES["Type"] == "whitelist" then
					TakeAction("whitelist",VARIABLES["Target"])
					TextBox.Text = ""
				elseif VARIABLES["Type"] == "unwhitelist" then
					TakeAction("unwhitelist",VARIABLES["Target"])
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

		elseif #TextBox.Text > 2 and Args[1] == "freeze" or Args[1] == "thaw" then
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
		elseif #TextBox.Text > 2 and Args[1] == "whitelist" then
			local Target = Args[2]
			VARIABLES["Target"] = Target
			VARIABLES["Type"] = "whitelist"
		elseif #TextBox.Text > 2 and Args[1] == "unwhitelist" then
			local Target = Args[2]
			VARIABLES["Target"] = Target
			VARIABLES["Type"] = "unwhitelist"


		elseif #TextBox.Text > 2 and Args[1] == "circle" then
			if tonumber(Args[2]) then
				local Target = Args[2]

				Module.DestroyAura(Target)
					else
					SendNotify("circle","Failed to execute circle, Argument 2 needs to be a number!")
			end
		elseif #TextBox.Text > 2 and Args[1] == "freezeaura" then
			if tonumber(Args[2]) then
				local Target = Args[2]

				Module.FreezeAura(Target)
			else
				SendNotify("killaura","Failed to execute killaura, Argument 2 needs to be a number!")
			end
		elseif #TextBox.Text > 2 and Args[1] == "killaura" then
			if tonumber(Args[2]) then
				local Target = Args[2]

				Module.KillAura(Target)
			else
				SendNotify("killaura","Failed to execute killaura, Argument 2 needs to be a number!")
			end
		elseif #TextBox.Text > 2 and Args[1] == "prefix" then
			local Target = Args[2]

			if #Target == 1 then
				Prefix = Target
				SendNotify("Prefix","Successfully changed prefix to: "..Target)
			else
				SendNotify("Prefix","Failed to change prefix to: "..Target..", character length too long.")
			end


		elseif TextBox.Text:lower() == "uncircle" then
			pcall(function()
				Aura:Destroy()
			end)
		elseif TextBox.Text:lower() == "unfreezeaura" then
			pcall(function()
				Aura:Destroy()
			end)
		elseif TextBox.Text:lower() == "unkillaura" then
			pcall(function()
				KillAura:Destroy()
			end)
		elseif TextBox.Text:lower() == "killfarm" then

			if TempPart == nil then
				TempPart = Instance.new("Part")
				TempPart.Size = Vector3.new(100,0.1,100)
				TempPart.CFrame = CFrame.new(71, -101, -61)
				TempPart.Parent = workspace
				TempPart.Anchored = true
				TempPart.Transparency = 0.5
				TempPart.Color = Color3.fromRGB(0,0,0)
				TempPart.CanCollide = true
				TempPart.Name = "Safe"
				if Player.Character then
					if Player.Character:FindFirstChild("HumanoidRootPart") then
						SendNotify("killfarm","Successfully started killfarm.")
						PositionBeforeUsingFarmKills = Player.Character.HumanoidRootPart.CFrame
						wait(0.05)
						Player.Character.HumanoidRootPart.CFrame = CFrame.new(71, -101, -61)
						FarmKills = true
					else
						SendNotify("killfarm","Failed to start killfarm, could not find HumanoidRootPart.")
					end
				else
					SendNotify("killfarm","Failed to start killfarm, could not find character.")
				end

			end
		elseif TextBox.Text:lower() == "unkillfarm" then
			TempPart:Destroy()
			TempPart = nil
			FarmKills = false
			if Player.Character then
				if Player.Character:FindFirstChild("HumanoidRootPart") then
					Player.Character.HumanoidRootPart.CFrame = PositionBeforeUsingFarmKills
					SendNotify("killfarm","Successfully stopped killfarm.")
				else
					SendNotify("unkillfarm","Could not find player's HumanoidRootPart.")
				end
			else
				SendNotify("unkillfarm","Could not find player's character.")
			end
		elseif TextBox.Text:lower() == "killall" then
			for _,v in pairs(Players:GetPlayers()) do
				local BasePart = v.Character.PrimaryPart
				if BasePart then
					if v.Name ~= Player.Name  and not table.find(WhitelistedPlayers,v) then
						Module.Kill(BasePart)
					end
				end
			end

		elseif TextBox.Text:lower() == "freezeall" then
			for _,v in pairs(Players:GetPlayers()) do
					SendNotify("freezeall","Froze all players.")
				local BasePart = v.Character.PrimaryPart
				if BasePart then
					if v.Name ~= Player.Name  and not table.find(WhitelistedPlayers,v) then
						VARIABLES["Target"] = v.Name
						On = true
						task.wait(0.05)
						Module.Freeze(BasePart)
					end
				end
			end
		elseif TextBox.Text:lower() == "ubervip" then
			local s,e = pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = UberVipCFrame
			end)
			if s then
				SendNotify("Teleport","Successfully teleported to ubervip.")
			else
				SendNotify("Teleport","Failed to teleport to ubervip, could not found HumanoidRootPart or Character.")
			end
		elseif TextBox.Text:lower() == "vip" then
			local s,e = pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = VipCFrame
			end)
			if s then
				SendNotify("Teleport","Successfully teleported to vip.")
			else
				SendNotify("Teleport","Failed to teleport to vip, could not found HumanoidRootPart or Character.")
			end
		elseif TextBox.Text:lower() == "megavip" then
			local s,e = pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = MegaVipCFrame
			end)
			if s then
				SendNotify("Teleport","Successfully teleported to megavip.")
			else
				SendNotify("Teleport","Failed to teleport to megavip, could not found HumanoidRootPart or Character.")
			end
		elseif TextBox.Text:lower() == "thumbnail" then
			local s,e = pcall(function()
				local HRP = Player.Character.HumanoidRootPart
				HRP.CFrame = ThumbnailCFrame
			end)
			if s then
				SendNotify("Teleport","Successfully teleported to thumbnail.")
			else
				SendNotify("Teleport","Failed to teleport to thumbnail, could not found HumanoidRootPart or Character.")
			end
		elseif TextBox.Text:lower() == "unfreezeall" then
			pcall(function()
				SendNotify("unfreezeall","unfreezing all players.")
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
		elseif TextBox.Text:lower() == "dunparts" then
			pcall(function()
				for _,v in pairs(workspace.Plates:GetChildren()) do

					for _,Active in pairs(v.ActiveParts:GetChildren()) do
						if Active.Name == "Block - Brick" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.Brick2
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)

						end
						if string.find(Active.Name,"Block") and not string.find(Active.Name,"Corner") then
							for _,wow in pairs(Active:GetChildren()) do
								if wow:IsA("BasePart") then
									local fling = Instance.new("BodyAngularVelocity")
									fling.Name = "f"
									fling.Parent = wow
									fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
									fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
									fling.P = math.huge
									game:GetService("Debris"):AddItem(fling,5)
								end
							end
						end
						if Active.Name == "Window - Tall Corner" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.houseWindowDiagonal.castleDiagWindowTop
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if string.find(Active.Name,"Wedge") and not string.find(Active.Name,"Long Wedge") then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.GrassWedge.Wedge
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if string.find(Active.Name,"Corner")  then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.GrassWedge.Wedge
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if string.find(Active.Name,"Long Wedge") then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.GrassLongWedge.Wedge
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Spikes" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.Spikes_Simple.Box
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Spikes - Moving" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.Spike_Retracting.Box
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Friend Only Door - Hostile" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.FriendOnlyDoorHostile.Head
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Chair - Tall" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceChairLrg.Wedge
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Captain's Chair" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceChairCaptain.Wedge
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Chair - Short" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceChairSmall.Wedge
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Space Wall" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceWall
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Space Wall" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceWall
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Space Wall - Corner" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceWallCorner
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Control Panel - Wall" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.spaceControlPanelWall.Part
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Window - Small" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.Model.Window
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Window - Tall" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.Model.Window
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Chimney" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.Model.Brick2
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
						if Active.Name == "Drawbridge" then
							local fling = Instance.new("BodyAngularVelocity")
							fling.Name = "f"
							fling.Parent = Active.CastleDrawBridge.CastleDbridgeArchLeft2
							fling.AngularVelocity = Vector3.new(9^9,9^9,9^9)
							fling.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							fling.P = math.huge
							game:GetService("Debris"):AddItem(fling,5)
						end
					end

				end
			end)




		elseif TextBox.Text:lower() == "god" then
			if CONNECTIONS[7] == nil then
				GodMode = true
				task.spawn(function()
							SendNotify("God Mode","Successfully started god mode.")
					if CONNECTIONS[7] == nil then
						GodMode = true
						task.spawn(function()
							while GodMode == true and task.wait(0.0025) do
								for _,v in pairs(workspace.Plates:GetChildren()) do
									if v.Owner.Value ~= Player then
										for _,Active in pairs(v.ActiveParts:GetChildren()) do
											if string.find(Active.Name:lower(),"spikes") or string.find(Active.Name:lower(),"hostile") then
												for _,Spikes in pairs(Active:GetChildren()) do
													if Spikes.Name == "Spikes_Simple" then
														for _,gh in pairs(Spikes:GetChildren()) do
															if gh.Name == "Spikes" then
																gh:Destroy()
															end
														end
													elseif Spikes.Name == "Spike_Retracting" then
														for _,gh in pairs(Spikes:GetChildren()) do
															if gh.Name == "Spikes" then
																gh:Destroy()
															end
														end	
													elseif string.find(Spikes.Name:lower(),"friend") then
														for _,gh in pairs(Spikes:GetChildren()) do
															if string.find(gh.Name:lower(),"laser") then
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
				SendNotify("God Mode","Successfully stopped god mode.")
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
			elseif VARIABLES["Type"] == "whitelist" then
				TakeAction("whitelist",VARIABLES["Target"])
				TextBox.Text = ""
			elseif VARIABLES["Type"] == "unwhitelist" then
				TakeAction("unwhitelist",VARIABLES["Target"])
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

--// This chunk of code makes the gui draggable.
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

--// FarmKills Loop

local interval = 0.0025
local Secondinterval = 1.25
local start = tick()
local nextStep = start+interval
local nextStep2 = start+Secondinterval
local iter = 1
local iter2 = 1

game:GetService("RunService").Heartbeat:Connect(function(dt)
	if (tick() >= nextStep) and FarmKills == true then
		iter = iter+1
		nextStep = start + (iter * interval)

		if Player.Character then
			if not Player.Character:FindFirstChild("3 Sword") then
				if Player.Character:FindFirstChild("Humanoid") then
					if Player.Backpack:FindFirstChild("3 Sword") then
						Player.Character:FindFirstChild("Humanoid"):EquipTool(Player.Backpack["3 Sword"])
					end

				end
			else
				pcall(function()
					Player.Character.HumanoidRootPart.CFrame = CFrame.new(71, -99, -61)
					local Tool = Player.Character:FindFirstChild("3 Sword")
					local Handle = Tool.Handle
					Handle.Massless = true
					for _,v in pairs(AllPlayers) do
						if v.Character and not table.find(WhitelistedPlayers,v) then
							if v.Character:FindFirstChild("Humanoid") then
								wait(0.00125)
								Handle.Position = v.Character.PrimaryPart.Position
							end
						end
					end
				end)
			end


		end
	end
end)
