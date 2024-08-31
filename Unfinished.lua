
--// Services

local Players = game:GetService("Players")
local StarterPlayer = game:GetService("StarterPlayer")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")

--// Other

local Connections = {}
local Player = Players.LocalPlayer
local HidePlayerFolder = Instance.new("Folder")
HidePlayerFolder.Parent = ReplicatedStorage


local FindClosestName = function(name,blacklistedname)
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
			for _,v in pairs(MatchingNames) do
				if v.Name == Player.Name then
					table.remove(MatchingNames,table.find(MatchingNames,v))
				end
			end
			if #MatchingNames == 1 then
				return MatchingNames[1]
			else
				return false
			end
		end	



	end
end

local CheckIfPlayerHasAChar = function(Plr)
	if Plr then
		if Plr.Character then
			if Plr.Character:FindFirstChild("HumanoidRootPart") then
				return true
			else
				return false
			end
		else
			return false
		end
	end
end

local ReturnRigType = function(Plr)
	if Plr then
		if Plr.Character then
			if Plr.Character.Humanoid.RigType.Name == "R6" then
				return "R6"
			elseif  Plr.Character.Humanoid.RigType.Name == "R15" then
				return "R15"
			end
		end
	end
end

local GetHrp = function(Plr)
	if CheckIfPlayerHasAChar(Plr) == true then
		return Plr.Character.HumanoidRootPart
	else
		return false
	end
end

local GetHum = function(Plr)
	if CheckIfPlayerHasAChar(Plr) == true then
		return Plr.Character.Humanoid
	else
		return false
	end
end

local ReturnPlayers = function()
	local Temp = {}
	local TotalPlayers = #Players:GetPlayers()
	local Count = 0
	for _,v in pairs(Players:GetPlayers()) do
		Count += 1
		if not table.find(Temp,v) then
			table.insert(Temp,v)
		end
		if Count == TotalPlayers then
			return Temp
		end
	end
end

local Flight = false
local Ahem = false
local Fling = false
local Noclip = false
local View = false
local CurrentCamera = workspace.CurrentCamera

local ForbiddenAnimationR6 = Instance.new("Animation")
ForbiddenAnimationR6.AnimationId = "rbxassetid://148840371"

local ForbiddenAnimationR15 = Instance.new("Animation")
ForbiddenAnimationR15.AnimationId = "rbxassetid://5918726674"

function Exec(String,Plr,Args)
	if String == "speed" then
		local Humanoid = GetHum(Plr)
		if Humanoid ~= false then
			if tonumber(Args[2]) then
				Humanoid.WalkSpeed = Args[2]
			end
		end
	elseif String == "jp" then
		local Humanoid = GetHum(Plr)
		if Humanoid ~= false then
			if tonumber(Args[2]) then
				if StarterPlayer.CharacterUseJumpPower == true then
					Humanoid.JumpPower = Args[2]
				else
					Humanoid.JumpHeight = Args[2]
				end

			end
		end
	elseif String == "esp" then

		if Args[2] then
			Plr = FindClosestName(Args[2])
			if Plr ~= false then
				if not Connections[Plr] then
					Connections[Plr] = {}
					Connections[Plr][1] = nil
				end

				local Highlight = Instance.new("Highlight")
				Highlight.FillColor = Color3.fromRGB(118, 255, 97)
				Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
				Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

				if CheckIfPlayerHasAChar(Plr) ~= false then
					if not Plr.Character:FindFirstChildWhichIsA("Highlight") then
						Highlight.Parent = Plr.Character

						if Connections[Plr][1] then
							Connections[Plr][1]:Disconnect()
						else
							Connections[Plr][1] = Plr.CharacterAdded:Connect(function(char)
								local Highlight = Instance.new("Highlight")
								Highlight.FillColor = Color3.fromRGB(118, 255, 97)
								Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
								Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

								Highlight.Parent = char
							end)
						end

					else
						Highlight:Destroy()
					end
				else
					Highlight:Destroy()
				end
			end
		end
	elseif String == "unesp" then
		if Args[2] then
			Plr = FindClosestName(Args[2])
			if Plr ~= false then
				if Plr.Character:FindFirstChild("Highlight") then
					local Highlight = Plr.Character:FindFirstChild("Highlight")
					Highlight:Destroy()
				end
				if Connections[Plr] then
					if Connections[Plr][1] then
						Connections[Plr][1]:Disconnect()
					end
				end
			end

		end

	elseif String == "reset" then
		Exec("clip")
		Exec("unwfling")
		Exec("unfly")
		local Humanoid = GetHum(Player)
		Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
	elseif String == "rspeed" then
		local Humanoid = GetHum(Player)
		if Humanoid ~= false then
			Humanoid.WalkSpeed = StarterPlayer.CharacterWalkSpeed
		end
	elseif String == "rjp" then
		local Humanoid = GetHum(Player)
		if Humanoid ~= false then
			if StarterPlayer.CharacterUseJumpPower == true then
				Humanoid.JumpPower = StarterPlayer.CharacterUseJumpPower
			else
				Humanoid.JumpHeight = StarterPlayer.CharacterJumpHeight
			end
		end
	elseif String == "rstr" then
		for _,v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.CustomPhysicalProperties = nil
			end
		end
	elseif String == "resetvals" then
		Exec("clip")
		Exec("unwfling")
		Exec("unfly")
		Exec("rspeed")
		Exec("rjp")
		Exec("rstr")
		Noclip = false
		Fling = false
		Flight = false
	elseif String == "bang (One Punch Man reference!!1!!1111!!11)" then
		if Ahem == false then
		
			if Args[2] and tonumber(Args[3]) then
				Plr = FindClosestName(Args[2],Player.Name)
				if Plr ~= false then
					Ahem = true
					local Hum = GetHum(Player)
					local RigType = ReturnRigType(Player)
					if RigType == "R6" then
						if Hum ~= false then
							local Animator = Hum.Animator

							local Load = Animator:LoadAnimation(ForbiddenAnimationR6)
							Load.Looped = true
							Load:Play()
							Load:AdjustSpeed(tonumber(Args[3]))

						end
					elseif RigType == "R15" then
						if Hum ~= false then
							local Animator = Hum.Animator

							local Load = Animator:LoadAnimation(ForbiddenAnimationR15)
							Load.Looped = true
							Load:Play()
							Load:AdjustSpeed(tonumber(Args[3]))

						end

					end


					Connections.bang = RunService.RenderStepped:Connect(function()
						pcall(function()
							local Hrp = GetHrp(Player)

							if Hrp ~= false then

								Hrp.CFrame = Plr.Character.HumanoidRootPart.CFrame + Plr.Character.HumanoidRootPart.CFrame.LookVector * -1
							end
						end)	
					end)
				end
			
			

			end
		end
	
		
	elseif String == "unbang" then
		local Hum = GetHum(Player)
		
		if Hum ~= false and Ahem == true then
			Ahem = false
			Connections.bang:Disconnect()
			for _,v in pairs(Hum.Animator:GetPlayingAnimationTracks()) do
				v:Stop()
			end
		end
	elseif String == "str" then
		if tonumber(Args[2]) then
			for _,v in pairs(Player.Character:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("MeshPart") then
					v.CustomPhysicalProperties = PhysicalProperties.new(Args[2],0.3,0.5)
				end
				
			end
		end
	elseif String == "noclip" then
		if Noclip == false then
			local Hum = GetHum(Player)
			Hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
			Hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
			Noclip = true
			Connections.noclip = RunService.RenderStepped:Connect(function()
				for _,v in pairs(Player.Character:GetDescendants()) do
					if v:IsA("BasePart") or v:IsA("MeshPart") then
						v.CanCollide = false
					end
					
				end
			end)
		end
	elseif String == "clip" then
		if Noclip == true then
			Noclip = false
			Connections.noclip:Disconnect()
			local Hum = GetHum(Player)
			Hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
			Hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		end
	elseif String == "fb" then
		Lighting.Brightness = 2
		Lighting.FogEnd = 9e9
		Lighting.ClockTime = 12
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	elseif String == "night" then
		Lighting.ClockTime = 0
	elseif String == "day" then
		Lighting.ClockTime = 12
	elseif String == "fly" then
		local HRP = GetHrp(Player)
		local hum = GetHum(Player)

		if HRP ~= false and Flight == false then
			coroutine.wrap(function()
				local flightforce = Instance.new("BodyVelocity")
				flightforce.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				flightforce.P = 10^6

				local flightGryo = Instance.new("AlignOrientation")
				flightGryo.MaxTorque = math.huge
				flightGryo.Mode = Enum.OrientationAlignmentMode.OneAttachment
				flightGryo.Attachment0 = HRP.RootAttachment
				flightGryo.Responsiveness = 50


				local player = game.Players.LocalPlayer
				local char = player.Character or player.CharacterAdded:Wait()
				local hum = char:WaitForChild("Humanoid")
				local hrp = char:WaitForChild("HumanoidRootPart")

				local controlModule = require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
				local UIS = game:GetService("UserInputService")



				local camera = workspace.CurrentCamera

				Flight = true


				flightGryo.Parent = Flight and hrp or nil
				flightforce.Parent = Flight and hrp or nil
				flightGryo.CFrame = hrp.CFrame
				flightforce.Velocity = Vector3.new()

				char.Animate.Disabled = Flight
				for _,v in pairs(char.Humanoid.Animator:GetPlayingAnimationTracks()) do
					v:Stop()
				end

				if Flight then
					while Flight do
						for _,v in pairs(char.Humanoid.Animator:GetPlayingAnimationTracks()) do
							v:Stop()
						end

						local movevector = controlModule:GetMoveVector()

						local direction = camera.CFrame.RightVector * (movevector.X) + camera.CFrame.LookVector * (movevector.Z * -1)

						if direction:Dot(direction) > 0 then
							direction = direction.Unit
						end


						if Args[2] == nil then
							flightforce.Velocity = direction * 50
						else
							flightforce.Velocity = direction * Args[2]
						end


						flightGryo.CFrame = camera.CFrame


						wait()
					end
				end

			end)()
		
		
			




		end
	elseif String == "wfling" then
		Exec("noclip")
		Fling = true
		repeat RunService.Heartbeat:Wait()
			local HRP = GetHrp(Player)
			local RootVelocity, Velocity = nil, 0.1
			HRP = GetHrp(Player)

			RootVelocity = HRP.Velocity
			HRP.Velocity = RootVelocity * 1000000 + Vector3.new(0, 1000000, 0)

			RunService.RenderStepped:Wait()
			if Player.Character and Player.Character.Parent and HRP and HRP.Parent then
				HRP.Velocity = RootVelocity
			end

			RunService.Stepped:Wait()
			if Player.Character and Player.Character.Parent and HRP and HRP.Parent then
				HRP.Velocity = RootVelocity + Vector3.new(0, Velocity, 0)
				RootVelocity = Velocity * -1
			end
		until Fling == false
	elseif String == "view" then
		if View == false and Args[2] then
			View = true
			Plr = FindClosestName(Args[2])
			if Plr ~= false then
				if not Connections[Plr] then
					Connections[Plr] = {}
					Connections[Plr][2] = nil
				end
				local Hum = GetHum(Plr)
				if Hum ~= false then
					CurrentCamera.CameraSubject = Hum
					Connections[Plr][2] = Plr.CharacterAdded:Connect(function(char)
						Plr.CharacterAppearanceLoaded:Wait()
							CurrentCamera.CameraSubject = char.Humanoid
					end)

				end

			end
		end
	elseif String == "unview" then
		if View == true then
			View = false
			local Hum = GetHum(Player)
			if Hum ~= false then
				CurrentCamera = Hum
			end
			for _,v in pairs(ReturnPlayers()) do
				if Connections[v] then
					pcall(function()
						Connections[v][2]:Disconnect()
					end)
				end
			end
			
		end
	
	elseif String == "unwfling" then
		if Fling == true then
			Fling = false
			Exec("clip")
		end
	
	elseif String == "unfly" then
		local HRP = GetHrp(Player)

		if HRP ~= false and Flight == true then
			Flight = false
			HRP.Parent.Animate.Enabled = true
			if HRP:FindFirstChild("BodyVelocity") then
				HRP:FindFirstChild("BodyVelocity"):Destroy()
			end
			if HRP:FindFirstChild("AlignOrientation") then
				HRP:FindFirstChild("AlignOrientation"):Destroy()
			end

		end
	
	end


end

local Prefix = "."

if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
	Player.Chatted:Connect(function(Message)
		local Low = Message:lower()
		local FirstLetter = string.sub(Low,1,1)
		if FirstLetter == Prefix then
			local Real = string.sub(Low,2)
			local Args = string.split(Real," ")
			if Args[1] == "speed" then
				Exec("speed",Player,Args)
			elseif Args[1] == "reset" then
				Exec("reset")
			elseif Args[1] == "fly" then
				Exec("fly","nil",Args)
			elseif Args[1] == "unfly" then
				Exec("unfly")
			elseif Args[1] == "jp" then
				Exec("jp",Player,Args)
			elseif Args[1] == "noclip" then
				Exec("noclip")
			elseif Args[1] == "clip" then
				Exec("clip")
			elseif Args[1] == "wfling" then
				Exec("wfling")
			elseif Args[1] == "fb" then
				Exec("fb")
			elseif Args[1] == "day" then
				Exec("day")
			elseif Args[1] == "night" then
				Exec("night")
			elseif Args[1] == "resetvals" then
				Exec("resetvals",Player)
			elseif Args[1] == "esp" then
				Exec("esp","nil",Args)
			elseif Args[1] == "unesp" then
				Exec("unesp","nil",Args)
			elseif Args[1] == "bang" then
				Exec("bang (One Punch Man reference!!1!!1111!!11)","nil",Args)
			elseif Args[1] == "unbang" then
				Exec("unbang")
			elseif Args[1] == "str" then
				Exec("str","nil",Args)
			elseif Args[1] == "unwfling" then
				Exec("unwfling")
			elseif Args[1] == "rspeed" then
				Exec("rspeed")
			elseif Args[1] == "rjp" then
				Exec("rjp")
			elseif Args[1] == "rstr" then
				Exec("rstr")
			elseif Args[1] == "view" then
				Exec("view","nil",Args)
			elseif Args[1] == "unview" then
				Exec("unview","nil",Args)
			elseif Args[1] == "prefix" then
				if Args[2] then
					if #Args[2] == 1 then
						Prefix = Args[2]
					end
				end
			end
		end
	end)
end

if TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService then
	TextChatService.MessageReceived:Connect(function(msg)
		if msg.TextSource  ~= nil then
			if msg.TextSource.Name == Player.Name then
				local Low = msg.Text:lower()
				local FirstLetter = string.sub(Low,1,1)
				if FirstLetter == Prefix then
					local Real = string.sub(Low,2)
					local Args = string.split(Real," ")
					if Args[1] == "speed" then
						Exec("speed",Player,Args)
					elseif Args[1] == "reset" then
						Exec("reset")
					elseif Args[1] == "fly" then
						Exec("fly","nil",Args)
					elseif Args[1] == "unwfling" then
						Exec("unwfling")
					elseif Args[1] == "unfly" then
						Exec("unfly")
					elseif Args[1] == "rspeed" then
						Exec("rspeed")
					elseif Args[1] == "rjp" then
						Exec("rjp")
					elseif Args[1] == "rstr" then
						Exec("rstr")
					elseif Args[1] == "jp" then
						Exec("jp",Player,Args)
					elseif Args[1] == "noclip" then
						Exec("noclip")
					elseif Args[1] == "clip" then
						Exec("clip")
					elseif Args[1] == "fb" then
						Exec("fb")
					elseif Args[1] == "day" then
						Exec("day")
					elseif Args[1] == "night" then
						Exec("night")
					elseif Args[1] == "resetvals" then
						Exec("resetvals",Player)
					elseif Args[1] == "esp" then
						Exec("esp","nil",Args)
					elseif Args[1] == "unesp" then
						Exec("unesp","nil",Args)
					elseif Args[1] == "bang" then
						Exec("bang (One Punch Man reference!!1!!1111!!11)","nil",Args)
					elseif Args[1] == "unbang" then
						Exec("unbang")
					elseif Args[1] == "str" then
						Exec("str","nil",Args)
					elseif Args[1] == "wfling" then
						Exec("wfling")
					elseif Args[1] == "view" then
						Exec("view","nil",Args)
					elseif Args[1] == "unview" then
						Exec("unview","nil",Args)
					elseif Args[1] == "prefix" then
						if Args[2] then
							if #Args[2] == 1 then
								Prefix = Args[2]
							end
						end
					end
				end
			end
		end
		
	end)
end
