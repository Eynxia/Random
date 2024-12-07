--!nonstrict

--// Services

local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Other

local Main = ReplicatedStorage:WaitForChild("Main")
local Event = Main:WaitForChild("Event")
local Fire = Event:WaitForChild("Fire")
local ret = Main:WaitForChild("return"):WaitForChild("fetch")
local return_ = require(ret)

local Return_Hum = function(Player_Instance:Player)
	local Character = Player_Instance.Character
	if not Character then
		print("no char")
		return nil
	else
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")
		if Humanoid then
			return Humanoid
		else
			print("no hum")
			return nil
		end
	end
end

local Return_BodyParts = function(Player_Instance:Player)
	local Character = Player_Instance.Character
	if not Character then
		return nil
	else
		local Humanoid:Humanoid = Return_Hum(Player_Instance)
		if Humanoid then
			local Descendants = Character:GetChildren()
			for p,d in Descendants do
				if d:IsA("BasePart") then
					if not Humanoid:GetBodyPartR15(d) then
						table.remove(Descendants,table.find(Descendants,d))
					end
				else
					table.remove(Descendants,table.find(Descendants,d))
				end
			end
			return Descendants
		end
	end
end

Fire.OnServerEvent:Connect(function(Player, Command,Table,Bypass_STRCHECK)
	local type_String = typeof(Table)
	if type_String ~= "table" and Bypass_STRCHECK == false then
		warn("Third argument should be an array.")
		return
	end

	if Command == "kill" then
		if Table then
			pcall(function()
				if #Table == 1 then
					local _target_:Player = return_.get(Table[1])
					local Humanoid:Humanoid = Return_Hum(_target_)

					if Humanoid then
						local HP = Humanoid.Health
						if HP > 0 then
							Humanoid.Health = 0
						end
					end
				else
					for p,d in Table do
						local tmp:Player = return_.get(d)

						if tmp then

							local rrr:Humanoid = Return_Hum(tmp)
							if rrr then
								local HP = rrr.Health
								if HP > 0 then
									rrr.Health = 0
								end
							end
						end
					end
				end
			end)
		else
			warn("Player not found.")
			return
		end
	end
end)
