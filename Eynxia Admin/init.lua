
--[[




--||  ||--

VERSION 0.0!

--||  ||--




--]]

--|| INIT ||--

--|| Services

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local HttpService = game:GetService("HttpService")

--|| Other

local Get_Request = HttpService:GetAsync("https://raw.githubusercontent.com/Eynxia/Random/refs/heads/main/Eynxia%20Admin/init.lua")

local Source = script:WaitForChild("Source")

print(Get_Request)

if Source.Value ~= Get_Request then
	warn("Script might be outdated!")
else
	warn("Success!")
end

local Client = script:WaitForChild("Client")
local Client_Server = script:WaitForChild("Client|Server")
local Fetch = Client_Server:WaitForChild("fetch")
local Chat = Client:WaitForChild("Chat")
local Main = Instance.new("Folder")
local Folder = Instance.new("Folder")
local Event = Instance.new("RemoteEvent") 
local fetch = Instance.new("Folder")
local __Cmds = Instance.new("Folder")
local Server = script:WaitForChild("Server")
local __HANDLER = Server:WaitForChild("_Handler")

Main.Name = "Main"
Fetch.Name = "fetch"
Folder.Name = "Event"
Event.Name = "Fire"
__Cmds.Name = "_cmds"
fetch.Name = "return"

__Cmds.Parent = ServerScriptService
__HANDLER.Parent = __Cmds
Main.Parent = ReplicatedStorage
Folder.Parent = Main
Event.Parent = Folder
fetch.Parent = Main

Fetch.Parent = fetch

Chat.Parent = ReplicatedFirst
Chat.Enabled = true
__HANDLER.Enabled = true
