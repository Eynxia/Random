--// Services

local Players = game:GetService("Players")
local txtchat_ = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Other

local Main = ReplicatedStorage:WaitForChild("Main")
local Event = Main:WaitForChild("Event"):WaitForChild("Fire")
local Local = Players.LocalPlayer
local Name = Local.Name
local _Version = txtchat_.ChatVersion
local Class_Classic = Enum.ChatVersion.LegacyChatService
local Class_Txt = Enum.ChatVersion.TextChatService
local __PREFIX = "|"

local garbage = {"kill","jump"}

local fetch_cmd_ = function(__STRING:string)
	local _split = string.split(__STRING," ")
	local __cmds = {}
	local target = {}
	for data,pos in _split do
		local cmd_found_ = table.find(garbage,pos)

		if cmd_found_ then
			if not table.find(__cmds,garbage[cmd_found_]) then

				local _plus__one = _split[data+1]
				local gsub = string.gsub(_plus__one,","," ")
				local s_split = string.split(gsub," ")
				local Cmd_Name = garbage[cmd_found_]
				__cmds[Cmd_Name] = {}
				for e,v in s_split do
					if #__cmds[Cmd_Name] < 1 then
						table.insert(__cmds[Cmd_Name],v) 
					else
						for p,d in __cmds[Cmd_Name] do
							if d == v then
								warn(
									"\n"..script.Warn.Value
								)
							else
								table.insert(__cmds[Cmd_Name],v) 
							end
						end
					end


				end

			end

		end
	end
	return __cmds
end

if _Version == Class_Txt then
	txtchat_.SendingMessage:Connect(function(_INSTANCE_)
		local __string_ = _INSTANCE_.Text
		local Source = _INSTANCE_.TextSource
		local _Source__Name = Source.Name

		if _Source__Name == Name then
			local __string_lower = __string_:lower()
			local sub = string.sub(__string_lower,1,#__PREFIX)

			if sub == __PREFIX then
				local _gsub = string.gsub(__string_lower,__PREFIX,"")
				local str__,str = pcall(fetch_cmd_,_gsub)
				
				for Position,Command in garbage do
					if str[Command] then
						local cmd_name__ = Command

						Event:FireServer(cmd_name__,str[Command],false)
					end
				end

			end
		end
	end)
elseif _Version == Class_Classic then


end
