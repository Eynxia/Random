--|| INIT ||--

--|| Services

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

--|| Other

local Main = Instance.new("Folder")
local Folder = Instance.new("Folder")
local Event = Instance.new("RemoteEvent")
local fetch = Instance.new("Folder")
local __Cmds = Instance.new("Folder")

Main.Name = "Main"
fetch.Name = "return"
Folder.Name = "Event"
Event.Name = "Fire"
__Cmds.Name = "_cmds"

__Cmds.Parent = ServerScriptService
Main.Parent = ReplicatedStorage
fetch.Name = Main
Folder.Parent = Main
Event.Parent = Folder
