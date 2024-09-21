local ReplicatedStorage = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService");
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
local LPlayer = Players.LocalPlayer;
local Mouse = LPlayer:GetMouse();
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

--//Variables\\--
local Remotes: Folder = ReplicatedStorage.Remotes;
local StampAsset: RemoteFunction = Remotes.StampAsset;
local DeleteAsset: RemoteFunction = Remotes.DeleteAsset;
local FarmKills = false
local KillMode = false
local FreezeMode = false
local NotificationFolder = Instance.new("Folder")

local Connections = {}
local VARIABLES = {}
local WhitelistedPlayers = {}
VARIABLES["IsPlayerSitting"] = {}
VARIABLES["Players"] = {}

local AGJK_AE11_2233_IIII = Instance.new("Sound")
AGJK_AE11_2233_IIII.SoundId = "rbxassetid://6201094296"
AGJK_AE11_2233_IIII.Parent = workspace

local AGJK_AE11_2233_IIII2 = Instance.new("Sound")
AGJK_AE11_2233_IIII2.SoundId = "rbxassetid://17842776916"
AGJK_AE11_2233_IIII2.Parent = workspace

local CurrentPlayer = nil
local On = false
local On2 = false
local GodMode = false
local antisit = false
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

local NotificationsSent = 0

local SendNotify = function(topic,text)
	NotificationsSent += 1
	local PATTERN_LINK = "rbxassetid://300134974"
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
		pcall(function()
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
		end)

	end)()

end

for _, Plate in pairs(Plates:GetChildren()) do
	if (Plate.Owner.Value == LPlayer) then
		LPlate = Plate.Plate;
		ActiveParts = Plate.ActiveParts;
		break;
	end;
end;

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

ActiveParts.ChildAdded:Connect(function(Block)
	if (Block.Name == "Spikes - Moving") then
		local MSpike = Block:WaitForChild("Spike_Retracting"):WaitForChild("Spikes");
		MSpikes[#MSpikes+1] = MSpike;
		Block.AncestryChanged:Wait();
		if (not Block.Parent) then
			table.remove(MSpikes, table.find(MSpikes, MSpike));	
		end;


	end;
	if Block.Name ==  "Spikes" then
		if On2 == true then
			On2 = false
			Block:AddTag("Solo")
		end
	end	
	if Block.Name ==  "Weathervane" then
		if On == true then
			print("stop freezing people lil bro")
			On = false
			Block:AddTag(CurrentPlayer)
		end
	end
end);

local Module = {};

function Module.Freeze(Part: Part)
	if (typeof(Part) == "Instance") then Part = {Part}; end;
	On = true
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
UI_ELEMENTS["UI_4"].Parent = game:GetService("CoreGui")
NotificationFolder.Parent = UI_ELEMENTS["UI_4"]
SendNotify("Loading","Loading the gui and important functions, please be patient!")

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


Animations()

task.wait(2.5)

for _,v in pairs(LOADEDANIMS) do
	task.wait(1)
	v:Play()
end

TweenService:Create(UI_ELEMENTS["UI_16"],TweenInfo.new(1.5),{Position = UI_16NormalPos}):Play()
TweenService:Create(UI_ELEMENTS["UI_18"],TweenInfo.new(1.5),{Position = UI_18NormalPos}):Play()

local FindClosestName = function(name,blacklistedname,cmdtype)
	local MatchingNames = {}
	local PlayersInGame = #Players:GetPlayers()
	local Looped = 0
	for _,v in pairs(Players:GetPlayers()) do
		Looped += 1
		local Name = v.Name:lower()


		if string.sub(Name, 1, #name) == name then
			table.insert(MatchingNames,v)	
		end
		if Looped == PlayersInGame then
			if table.find(MatchingNames,blacklistedname) then table.remove(MatchingNames,table.find(MatchingNames,blacklistedname)) end
			if #MatchingNames == 1 then
				return MatchingNames[1]
			else
				SendNotify("Error","There are "..#MatchingNames.." players that it's name start with: "..name.."!")
			end
		end	



	end
end

local FindTaggedBlock = function(Tag_To_Find)
	for _,v in pairs(Plates:GetChildren()) do
		for _,Block in pairs(v.ActiveParts:GetChildren()) do
			if Block:HasTag(Tag_To_Find) then
				return Block
			end

		end

	end
end

local ReturnPrimaryPart = function(plr)
	if plr then
		if plr.Character then
			if plr.Character:FindFirstChild("HumanoidRootPart") then
				local PrimaryPart = plr.Character:FindFirstChild("HumanoidRootPart")
				if PrimaryPart then
					return PrimaryPart
				else
					SendNotify("Error","Could not find "..plr.Name.."' character's PrimartPart.")
				end

			else
				SendNotify("Error","Could not find "..plr.Name.."' character's PrimartPart.")
			end
		else
			SendNotify("Error","Could not find "..plr.Name.."' character.")
		end
	end

end

local interval = 0.025
local start = tick()
local nextStep = start+interval
local iter = 1
local Prefix = ":"
local ExecuteFunction = function(plr,Command_Type,ignoreprimarypartcheck,number,String)
	pcall(function()
		if not Connections[plr.Name] then
			Connections[plr.Name] = {}
		end
	end)
	if ignoreprimarypartcheck ~= true then
		local PrimaryPart = ReturnPrimaryPart(plr)
		if PrimaryPart ~= nil then
			if Command_Type == "kill" then
				xpcall(function()
					if not table.find(WhitelistedPlayers,plr) then
						Module.Kill(PrimaryPart)
						SendNotify("Success","Successfully killed "..plr.Name.."!")
					else
						SendNotify("Error",plr.Name.." Is whitelisted.")
					end

				end, function ()
					SendNotify("Error","Failed to kill "..plr.Name.."!")
				end)
			elseif Command_Type == "freeze" then
				xpcall(function()
					if not table.find(WhitelistedPlayers,plr) then
						On = true
						CurrentPlayer = plr.Name
						wait(0.025)
						Module.Freeze(PrimaryPart)
						SendNotify("Success","Successfully froze "..plr.Name.."!")
					else
						SendNotify("Error",plr.Name.." Is whitelisted.")
					end

				end, function ()
					SendNotify("Error","Failed to freeze "..plr.Name.."!")
				end)
			elseif Command_Type == "unfreeze" then
				pcall(function()
					coroutine.wrap(function()
						for i = 1,200 do
							task.wait()
							local Block = FindTaggedBlock(plr.Name)
							if Block then
								Module.Delete(Block)
								SendNotify("Success","Successfully unfroze "..plr.Name.."!")

							else
								SendNotify("Error","Failed to unfroze "..plr.Name.."!")
								break
							end
						end

					end)()

				end)
			elseif Command_Type == "fling" then

				workspace.FallenPartsDestroyHeight = math.huge-math.huge
				local HRP = Player.Character.HumanoidRootPart

				for _,v in pairs(Player.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CustomPhysicalProperties = PhysicalProperties.new(math.huge,0.3,0.5)
					end
				end


				local FlingMogus = Instance.new("BodyAngularVelocity")
				FlingMogus.Name = "idk amogus"
				FlingMogus.Parent = Player.Character.HumanoidRootPart
				FlingMogus.AngularVelocity = Vector3.new(9e9,9e9,9e9)
				FlingMogus.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
				FlingMogus.P = math.huge

				local OGPOS = nil
				OGPOS = HRP.CFrame

				local ResetPlayer = function()
					FlingMogus:Destroy()
					if Player.Character then
						workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
						for i = 1,15 do
							for _,v in pairs(Player.Character:GetChildren()) do
								if v:IsA("BasePart") then
									v.Massless = false
									v.Velocity = Vector3.new(0,0,0)
									v.AssemblyLinearVelocity = Vector3.new(0,0,0)
									v.AssemblyAngularVelocity = Vector3.new(0,0,0)
									if not v.Name:lower():find("leg") or not v.Name:lower():find("arm") then
										v.CanCollide = true
									end
								end
							end
							if Player.Character:FindFirstChild("HumanoidRootPart") then
								Player.Character.HumanoidRootPart.CFrame = OGPOS
							end
							task.wait(0.075)
							print("resetting.")
						end

					end
				end

				Connections.fling = RunService.RenderStepped:Connect(function()
					for _,v in pairs(Player.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.Massless = true
							v.CanCollide = false
						end
					end
				end)


				local Length = 20
				workspace.CurrentCamera.CameraSubject = PrimaryPart.Parent.Humanoid
				repeat
					if Player.Character.Humanoid.Health < 1 then
						Connections.fling:Disconnect()
						ResetPlayer()

						break
					end
					for _,v in pairs(Player.Character:GetChildren()) do
						if v:IsA("BasePart") then
							v.Velocity = Vector3.new(0,0,0)
							v.AssemblyLinearVelocity = Vector3.new(0,0,0)
							v.AssemblyAngularVelocity = Vector3.new(0,0,0)
						end
					end
					if PrimaryPart then
						if PrimaryPart.CFrame.Y > 1000 then
							Connections.fling:Disconnect()
							ResetPlayer()

							break
						end
						if PrimaryPart.Parent then
							if HRP then

								TweenService:Create(HRP,TweenInfo.new(0.025),{CFrame = PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * Length}):Play()
								task.wait(0.025)
								TweenService:Create(HRP,TweenInfo.new(0.025),{CFrame = PrimaryPart.CFrame}):Play()
								task.wait(0.025)
								TweenService:Create(HRP,TweenInfo.new(0.025),{CFrame = PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * -20}):Play()
								task.wait(0.025)
							else
								Connections.fling:Disconnect()
								ResetPlayer()

								break
							end
						else
							Connections.fling:Disconnect()
							ResetPlayer()

							break
						end
					else
						Connections.fling:Disconnect()
						ResetPlayer()

						break
					end
					task.wait()
				until PrimaryPart == "dummy"

			elseif Command_Type == "spike" then
				SendNotify("Success","Adding a spike on the player.")
				coroutine.wrap(function()
					if not table.find(WhitelistedPlayers,plr) then
						On2 = true
						task.wait(0.025)
						Module.CreateSpike(LPlate.CFrame + Vector3.new(0,10,0)) 
						local Spike = FindTaggedBlock("Solo")
						if Spike ~= nil then
							xpcall(function()
								local Box = Spike.Spikes_Simple.Box
								local Completed = false
								repeat
									task.wait()
									if PrimaryPart then
										Box.CFrame = PrimaryPart.CFrame
										if plr.Character.Humanoid.Health < 1 then
											Module.Delete(Spike)
											SendNotify("Success","Successfully executed spike on player.")
											break
										end
									else
										Module.Delete(Spike)
									end
								until Completed == true
							end, function()

							end)

						end
					else
						SendNotify("Error",plr.Name.." Is whitelisted.")
					end

				end)()
			elseif Command_Type == "uber" then
				SendNotify("Success","Successfully teleported to Uber Vip.")
				PrimaryPart.CFrame = UberVipCFrame
			elseif Command_Type == "mega" then
				SendNotify("Success","Successfully teleported to Mega Vip.")
				PrimaryPart.CFrame = MegaVipCFrame

			elseif Command_Type == "vip" then
				SendNotify("Success","Successfully teleported to Vip.")
				PrimaryPart.CFrame = VipCFrame
			elseif Command_Type == "thumbnail" then
				SendNotify("Success","Successfully teleported to thumbnail.")
				PrimaryPart.CFrame = ThumbnailCFrame

			elseif Command_Type == "loopkill" then
				if not table.find(WhitelistedPlayers,plr) then
					if not Connections[plr.Name][1] then
						pcall(function()
							Module.Kill(PrimaryPart)
							SendNotify("Success","Successfully enabled loopkill on "..plr.Name..".")
						end)
						Connections[plr.Name][1] = plr.CharacterAdded:Connect(function(char)
							pcall(function()
								plr.CharacterAppearanceLoaded:Wait()
								Module.Kill(char.HumanoidRootPart)
							end)


						end)
					end

				else
					SendNotify("Error",plr.Name.." Is whitelisted.")
				end


			elseif Command_Type == "unloopkill" then
				if Connections[plr.Name][1] then
					pcall(function()
						Connections[plr.Name][1]:Disconnect()
						Connections[plr.Name][1] = nil
						SendNotify("Success","Successfully disabled loopkill on "..plr.Name..".")
					end)
				else
					SendNotify("Error","Player is not getting loopkilled.")
				end
			elseif Command_Type == "loopfreeze" then
				if not table.find(WhitelistedPlayers,plr) then
					if not Connections[plr.Name][2] then
						pcall(function()
							Module.Freeze(PrimaryPart)
							SendNotify("Success","Successfully enabled loopfreeze on "..plr.Name..".")
						end)
						Connections[plr.Name][2]  = plr.CharacterAdded:Connect(function(char)
							pcall(function()
								plr.CharacterAppearanceLoaded:Wait()
								Module.Freeze(char.HumanoidRootPart)
							end)


						end)
					end

				else
					SendNotify("Error",plr.Name.." Is whitelisted.")
				end


		
			end




		end
	end

	if ignoreprimarypartcheck == true then
		if Command_Type == "unloopfreeze" then
			if Connections[plr.Name][2]  then
				pcall(function()
					Connections[plr.Name][2]:Disconnect()
					Connections[plr.Name][2] = nil
					SendNotify("Success","Successfully disabled loopfreeze on "..plr.Name..".")
				end)
			else
				SendNotify("Error","Player is not getting loopfreezed.")
			end
		end
		local interval = 0.05
		if Command_Type == "AHeal" then
			if not Connections.HealConnection then
				local HealPads = workspace:WaitForChild("Interactables"):WaitForChild("HealPads")
				Connections.Kill_Farm = RunService.RenderStepped:Connect(function(dt)

					if (tick() >= nextStep) then
						local HRP = ReturnPrimaryPart(Player)
						iter = iter+1
						nextStep = start + (iter * interval)
						pcall(function()
							for _,v in pairs(HealPads:GetChildren()) do
								v.CanCollide = false
								v.Transparency = 1
								wait(0.05)

								for _,v in pairs(v:GetDescendants()) do
									if v:IsA("BillboardGui") or v:IsA("Decal") or v:IsA("SurfaceGui") then
										v:Destroy()
									end
								end

								TweenService:Create(v,TweenInfo.new(0.05),{CFrame = HRP.CFrame - Vector3.new(0,5,0)}):Play()
								wait(0.05)
								TweenService:Create(v,TweenInfo.new(0.05),{CFrame = HRP.CFrame - Vector3.new(0,-5,0)}):Play()
								wait(0.05)
							end

						end)
						


					
					end

				end)
			else
				SendNotify("Error","AHeal is already Enabled!")
			end
		end
		if Command_Type == "UnAHeal" then
			if Connections.HealConnection then
				Connections.HealConnection:Disconnect()
			else
				SendNotify("Error","AHeal is already disabled!")
			end
		end
		if Command_Type == "spikeall" then
			SendNotify("Success","Adding a spike on all players.")
			coroutine.wrap(function()
				On2 = true
				task.wait(0.025)
				Module.CreateSpike(LPlate.CFrame + Vector3.new(0,10,0)) 
				local Spike = FindTaggedBlock("Solo")
				if Spike ~= nil then
					xpcall(function()

						local Looped = 0
						local Sum =0
						local CurrentPlayers = #Players:GetPlayers()
						local Box = Spike.Spikes_Simple.Box

						for i = 1,5  do
							Looped += 1

							for _,v in pairs(Players:GetPlayers()) do
								task.wait(0.025)
								Sum += 1
								if v.Character:FindFirstChild("HumanoidRootPart") then
									if v.Name ~= Player.Name then
										if not table.find(WhitelistedPlayers,v) then
											Module.Freeze(v.Character.HumanoidRootPart)
											task.wait(0.025)
											if v.Character.Humanoid.Health > 1 then
												Box.CFrame = v.Character.HumanoidRootPart.CFrame
											end
										end

									end

								end
								if Sum >= CurrentPlayers then

									SendNotify("Success","Completed spikeall. (this message will repeat 5 times!)")
									for _,v in pairs(ActiveParts:GetChildren()) do
										if v.Name == "Weathervane" then
											Module.Delete(v)
										end
									end
									Sum = 0
								end
							end
							if Looped == 5 then
								Module.Delete(Spike)
								SendNotify("Success","Successfully ended the spikeall loop.")
								break
							end
							task.wait(0.75)
						end





					end, function()

					end)

				end
			end)()
		end
		if Command_Type == "killfarm" then
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
						SendNotify("Success","Successfully started killfarm.")
						PositionBeforeUsingFarmKills = Player.Character.HumanoidRootPart.CFrame
						wait(0.05)
						Player.Character.HumanoidRootPart.CFrame = CFrame.new(71, -101, -61)
					else
						SendNotify("Error","Failed to start killfarm, could not find HumanoidRootPart.")
					end
				else
					SendNotify("Error","Failed to start killfarm, could not find character.")
				end

			end
			if not Connections.Kill_Farm then
				SendNotify("Success","Enabling killfarm.")

				Connections.Kill_Farm = RunService.RenderStepped:Connect(function(dt)

					if (tick() >= nextStep) then
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
									for _,v in pairs(Players:GetPlayers()) do
										if v.Character and not table.find(WhitelistedPlayers,v) and  v ~= Player then
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
			else

				SendNotify("Error","Kill farm is already running!")
			end
		end
		if Command_Type == "freezeall" then
			SendNotify("Loop","Looping through all players.")
			for _,v in pairs(Players:GetPlayers()) do
				wait(0.01)
				pcall(function()
					if not table.find(WhitelistedPlayers,v) and v ~= Player then
						On = true
						CurrentPlayer = v.Name
						wait(0.025)
						Module.Freeze(v.Character.HumanoidRootPart)
					end

				end)
			end
		end
		if Command_Type == "killall" then
			SendNotify("Loop","Looping through all players.")
			for _,v in pairs(Players:GetPlayers()) do
				wait(0.05)
				if not table.find(WhitelistedPlayers,v) and v ~= Player then
					pcall(function()
						Module.Kill(v.Character.HumanoidRootPart)
					end)
				end
			end
		end
		if Command_Type == "unfreezeall" then
			SendNotify("Loop","Looping through all blocks.")
			for _,v in pairs(ActiveParts:GetChildren()) do
				if v.Name == "Weathervane" then
					Module.Delete(v)
				end
			end
		end
		if Command_Type == "unkillfarm" then
			SendNotify("Success","Disabling killfarm.")
			pcall(function()

				Connections.Kill_Farm:Disconnect()
				Connections.Kill_Farm = nil
				TempPart:Destroy()
				Player.Character.HumanoidRootPart.CFrame = PositionBeforeUsingFarmKills
			end)
		end
		if Command_Type == "clickkill" then
			SendNotify("Success","Successfully activated Click Kill.")
			FreezeMode = false
			KillMode = true
		end

		if Command_Type == "clickfreeze" then
			SendNotify("Success","Successfully activated Click Freeze.")
			KillMode = false
			FreezeMode = true
		end
		if Command_Type == "unclickkill" then
			SendNotify("Success","Successfully deactivated Click Kill.")
			KillMode = false
		end
		if Command_Type == "unclickfreeze" then
			SendNotify("Success","Successfully deactivated Click Freeze.")
			FreezeMode = false
		end
		if Command_Type == "circle" then
			if tonumber(number) then
				if tonumber(number) > 70 then
					SendNotify("Error","Could not execute circle, argument 2 can't be bigger than 70! (DO NOT BYPASS THIS, YOU WILL CRASH YOUR GAME IF YOU DO)")
				else
					SendNotify("Success","Successfully enabled Destroy Aura.")
					Module.DestroyAura(number)
				end

			else
				SendNotify("Error","Could not execute circle, argument 2 needs to be a number!")
			end
		end	
		if Command_Type == "uncircle" then
			xpcall(function()

				Aura:Destroy()
				Aura = nil
				SendNotify("Success","Successfully disabled Destroy Aura.")
			end, function ()
				SendNotify("Error","Player doesn't have an Destroy Aura attached to it.")
			end)
		end
		if Command_Type == "unkillaura" then
			xpcall(function()

				KillAura:Destroy()
				KillAura = nil
				SendNotify("Success","Successfully disabled Kill Aura.")
			end, function ()
				SendNotify("Error","Player doesn't have an Kill Aura attached to it.")
			end)
		end
		if Command_Type == "killaura" then
			if tonumber(number) then
				if tonumber(number) > 70 then
					SendNotify("Error","Could not execute Kill Aura, argument 2 can't be bigger than 70! (idk really just don't do it bigger than 70.)")
				else
					SendNotify("Success","Successfully enabled Kill Aura.")
					Module.KillAura(number)
				end

			else
				SendNotify("Error","Could not execute Kill Aura, argument 2 needs to be a number!")
			end
		end
		if Command_Type == "unfreezeaura" then
			xpcall(function()

				FreezeAura:Destroy()
				FreezeAura = nil
				SendNotify("Success","Successfully disabled Freeze Aura.")
			end, function ()
				SendNotify("Error","Player doesn't have an Freeze Aura attached to it.")
			end)
		end
		if Command_Type == "freezeaura" then
			if tonumber(number) then
				if tonumber(number) > 70 then
					SendNotify("Error","Could not execute Freeze Aura, argument 2 can't be bigger than 70! (idk really just don't do it bigger than 70.)")
				else
					SendNotify("Success","Successfully enabled Freeze Aura.")
					Module.FreezeAura(number)
				end

			else
				SendNotify("Error","Could not execute Freeze Aura, argument 2 needs to be a number!")
			end
		end
		if Command_Type == "antisit" then
			if not Connections.antisitconnection then
				SendNotify("Success","Successfully enabled anti-sit!")
				for _,v in pairs(workspace:GetDescendants()) do
					if v:IsA("Seat") then
						v.Disabled = true
					end
				end
				Connections.antisitconnection = workspace.DescendantAdded:Connect(function(desc)
					if desc:IsA("Seat") then
						desc.Disabled = true

					end
				end)
			end

		end
		if Command_Type == "unantisit" then

			if Connections.antisitconnection then
				for _,v in pairs(workspace:GetDescendants()) do
					if v:IsA("Seat") then
						v.Disabled = false
					end
				end
				xpcall(function()
					Connections.antisitconnection:Disconnect()
					Connections.antisitconnection = nil
				end , function ()
					SendNotify("Error","Could not disconnect Anti-Sit Connection properly.")
				end)
				SendNotify("Success","Successfully disabled anti-sit")
			else
				SendNotify("Error","Failed to disabled unantisit, antisit is not enabled!")
			end

		end

		if Command_Type == "prefix" then
			if typeof(String) == "string" then
				if #String > 1 then
					SendNotify("Error","Prefix's length can only be 1.")
				else
					SendNotify("Success","Successfully changed prefix to: "..String)
					Prefix = String
				end
			else
				SendNotify("Error","Prefix needs to be a string.")
			end
		end
		if Command_Type == "whitelist" then
			if not table.find(WhitelistedPlayers,plr) then
				table.insert(WhitelistedPlayers,plr)
				SendNotify("Success","Successfully whitelisted "..plr.Name..".")
			end
		end
		if Command_Type == "unwhitelist" then
			if table.find(WhitelistedPlayers,plr) then
				local Value = table.find(WhitelistedPlayers,plr)
				table.remove(WhitelistedPlayers,Value)
				SendNotify("Success","Successfully removed "..plr.Name.." from whitelist.")
			else
				SendNotify("Error",plr.Name.." is not whitelisted yet.")
			end
		end
		if Command_Type == "god" then
			if not Connections.godmodeconnection then
				SendNotify("Success","Enabled God Mode (don't mistake this as invincibility, god mode deletes spikes,lasers etc.)")
				for _,v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						if v.Parent.Name == "Spikes_Simple" then
							if v.Name == "Spikes" then
								v:Destroy()
							end
						end
						if v.Name:lower() == "laser1" or v.Name:lower() =="laser2" or v.Name:lower() == "laser" or v.Name:lower() =="laser4" then
							v:Destroy()
						end 
					end

				end
				Connections.godmodeconnection = workspace.DescendantAdded:Connect(function(desc)
					if desc.Parent.Name == "Spikes_Simple" then
						if desc.Name == "Spikes" then
							desc:Destroy()
						end
					end
					if desc.Name:lower() == "laser1" or desc.Name:lower() =="laser2" or desc.Name:lower() == "laser" or desc.Name:lower() =="laser4" then
						desc:Destroy()
					end
				end)
			else
				SendNotify("Error","God Mode is already enabled.")
			end

		end
		if Command_Type == "ungod" then
			if Connections.godmodeconnection then
				pcall(function()
					Connections.godmodeconnection:Disconnect()
					Connections.godmodeconnection = nil
				end)
			else
				SendNotify("Error","God Mode is already disabled.")
			end
		end
	end

end

Players.PlayerRemoving:Connect(function(plr)
	if Connections[plr.Name] then
		pcall(function()
			Connections[plr.Name][2]:Disconnect()
			Connections[plr.Name][2] = nil
		end)
	end
	if Connections[plr.Name][1] then
		pcall(function()
			Connections[plr.Name][1]:Disconnect()
			Connections[plr.Name][1] = nil
		end)
	end
end)

local Textbox = UI_ELEMENTS["UI_19"]

local Execute = function(text)
	local SeperatedText = string.split(text," ")
	local Arg2 = SeperatedText[2]
	if SeperatedText[1] == "kill" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute kill, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"kill")
	elseif SeperatedText[1] == "freeze" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute freeze, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"freeze")
	elseif SeperatedText[1] == "spike"then
		if Arg2 == nil then
			SendNotify("Error","Could not execute spike, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"spike")
	elseif SeperatedText[1] == "unfreeze" or SeperatedText[1] == "thaw" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute unfreeze, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"unfreeze")
	elseif SeperatedText[1] == "whitelist" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute Whitelist, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"whitelist",true)
	elseif SeperatedText[1] == "unwhitelist" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute UnWhitelist, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"unwhitelist",true)
	elseif SeperatedText[1] == "fling" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute fling, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"fling",false)
	elseif SeperatedText[1] == "loopkill" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute loopkill, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"loopkill",false)
	elseif SeperatedText[1] == "AHeal" then
		ExecuteFunction("no more primary part checks lil lua code","AHeal",true)
	elseif SeperatedText[1] == "UnAHeal" then
		ExecuteFunction("no more primary part checks lil lua code","UnAHeal",true)
	elseif SeperatedText[1] == "unloopkill" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute unloopkill, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"unloopkill",true)
	elseif SeperatedText[1] == "spikeall" then
		ExecuteFunction("no more primary part checks lil lua code","spikeall",true)
	elseif SeperatedText[1] == "killfarm" then
		ExecuteFunction("no more primary part checks lil lua code","killfarm",true)
	elseif SeperatedText[1] == "unkillfarm" then
		ExecuteFunction("no more primary part checks lil lua code","unkillfarm",true)
	elseif SeperatedText[1] == "circle" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute circle, argument 2 can't be empty.")
			return
		end
		ExecuteFunction("no more primary part checks lil lua code","circle",true,Arg2)
	elseif SeperatedText[1] == "killaura" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute killaura, argument 2 can't be empty.")
			return
		end
		ExecuteFunction("no more primary part checks lil lua code","killaura",true,Arg2)
	elseif SeperatedText[1] == "loopfreeze" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute loopfreeze, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"loopfreeze",false)
	elseif SeperatedText[1] == "unloopfreeze" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute freezeaura, argument 2 can't be empty.")
			return
		end
		ExecuteFunction(FindClosestName(Arg2,Player.Name),"unloopfreeze",false)
	elseif SeperatedText[1] == "prefix" then
		if Arg2 == nil then
			SendNotify("Error","Could not execute prefix, argument 2 can't be empty.")
			return
		end
		ExecuteFunction("no more primary part checks lil lua code","prefix",true,nil,Arg2)
	elseif SeperatedText[1] == "uncircle" then
		ExecuteFunction("no more primary part checks lil lua code","uncircle",true)
	elseif SeperatedText[1] == "unkillaura" then
		ExecuteFunction("no more primary part checks lil lua code","unkillaura",true)
	elseif SeperatedText[1] == "antisit" then
		ExecuteFunction("no more primary part checks lil lua code","antisit",true)
	elseif SeperatedText[1] == "unantisit" then
		ExecuteFunction("no more primary part checks lil lua code","unantisit",true)
	elseif SeperatedText[1] == "clickkill" then
		ExecuteFunction("no more primary part checks lil lua code","clickkill",true)
	elseif SeperatedText[1] == "clickfreeze" then
		ExecuteFunction("no more primary part checks lil lua code","clickfreeze",true)
	elseif SeperatedText[1] == "unclickkill" then
		ExecuteFunction("no more primary part checks lil lua code","unclickkill",true)
	elseif SeperatedText[1] == "unclickfreeze" then
		ExecuteFunction("no more primary part checks lil lua code","unclickfreeze",true)
	elseif SeperatedText[1] == "killall" then
		ExecuteFunction("no more primary part checks lil lua code","killall",true)
	elseif SeperatedText[1] == "unfreezeall" then
		ExecuteFunction("no more primary part checks lil lua code","unfreezeall",true)
	elseif SeperatedText[1] == "freezeall" then
		ExecuteFunction("no more primary part checks lil lua code","freezeall",true)
	elseif SeperatedText[1] == "god" then
		ExecuteFunction("no more primary part checks lil lua code","god",true)
	elseif SeperatedText[1] == "ungod" then
		ExecuteFunction("no more primary part checks lil lua code","ungod",true)

	elseif SeperatedText[1] == "ubervip" then
		ExecuteFunction(Player,"uber",false)	
	elseif SeperatedText[1] == "megavip" then
		ExecuteFunction(Player,"mega",false)
	elseif SeperatedText[1] == "thumbnail" then
		ExecuteFunction(Player,"thumbnail",false)	
	elseif SeperatedText[1] == "vip" then
		ExecuteFunction(Player,"vip",false)	

	end
end

Textbox.FocusLost:Connect(function()
	local Text = Textbox.Text:lower()
	if #Text > 2 then
		Execute(Text)
	end

end)



Player.Chatted:Connect(function(msg)
	if string.sub(msg,1,1) == Prefix then
		local RealMessage = string.sub(msg,2)
		if #msg > 2 then
			Execute(RealMessage:lower())
		end
	end

end)

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
gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()

local raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {character}
raycastParams.FilterType = Enum.RaycastFilterType.Exclude

mouse.Button1Down:Connect(function()
	local raycastResult = workspace:Raycast(mouse.UnitRay.Origin, mouse.UnitRay.Direction * 250, raycastParams)

	if raycastResult then
		local raycastHit = raycastResult.Instance
		if raycastHit then
			local raycastModel = raycastHit:FindFirstAncestorOfClass("Model")
			if raycastModel then
				if Players:FindFirstChild(raycastModel.Name) then
					local v = Players:GetPlayerFromCharacter(raycastModel)
					if not table.find(WhitelistedPlayers,v) then
						if KillMode == true then
							xpcall(function()
								Module.Kill(v.Character.HumanoidRootPart)
								SendNotify("Success","Successfully killed "..v.Name..".")
							end, function()
								SendNotify("Error","Could not kill "..v.Name.." Reason is unknown.")
							end)
						elseif FreezeMode == true then
							xpcall(function()
								On = true
								CurrentPlayer = v.Name
								wait(0.025)

								Module.Freeze(v.Character.HumanoidRootPart)
								SendNotify("Success","Successfully froze "..v.Name..".")
							end, function()
								SendNotify("Error","Could not kill "..v.Name.." Reason is unknown.")
							end)

						end

					else
						SendNotify("Error",v.Name.." is whitelisted.")
					end
				end

			end
		end
	end
end)

UserInputService.TouchTap:Connect(function()

	local raycastResult = workspace:Raycast(mouse.UnitRay.Origin, mouse.UnitRay.Direction * 250, raycastParams)

	if raycastResult then
		local raycastHit = raycastResult.Instance
		if raycastHit then
			local raycastModel = raycastHit:FindFirstAncestorOfClass("Model")
			if raycastModel then
				if Players:FindFirstChild(raycastModel.Name) then
					local v = Players:GetPlayerFromCharacter(raycastModel)
					if not table.find(WhitelistedPlayers,v) then
						if KillMode == true then
							xpcall(function()
								Module.Kill(v.Character.HumanoidRootPart)
								SendNotify("Success","Successfully killed "..v.Name..".")
							end, function()
								SendNotify("Error","Could not kill "..v.Name.." Reason is unknown.")
							end)
						elseif FreezeMode == true then
							xpcall(function()
								On = true
								CurrentPlayer = v.Name
								wait(0.025)

								Module.Freeze(v.Character.HumanoidRootPart)
								SendNotify("Success","Successfully froze "..v.Name..".")
							end, function()
								SendNotify("Error","Could not kill "..v.Name.." Reason is unknown.")
							end)

						end

					else
						SendNotify("Error",v.Name.." is whitelisted.")
					end
				end

			end
		end
	end

end)
