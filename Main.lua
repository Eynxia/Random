local Module = {}
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

local ActiveParts: Folder;
local Plates: Model = Workspace.Plates;
local LPlate: Part;
local MSpikes = {};

for _, Plate in pairs(Plates:GetChildren()) do
    if (Plate.Owner.Value == LPlayer) then
        LPlate = Plate.Plate;
        ActiveParts = Plate.ActiveParts;
        break;
    end;
end;

ActiveParts.ChildAdded:Connect(function(Block)
    if (Block.Name == "Spikes - Moving") then
        local MSpike = Block:WaitForChild("Spike_Retracting"):WaitForChild("Spikes");
        MSpikes[#MSpikes+1] = MSpike;
        Block.AncestryChanged:Wait();
        if (not Block.Parent) then
            table.remove(MSpikes, table.find(MSpikes, MSpike));
        end;
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
return Module