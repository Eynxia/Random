local Variables = shared["Variables"]
local IsOn = Variables["ForceUpgrade"]

local Mouse:Mouse = game.Players.LocalPlayer:GetMouse()
print("fired")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ForceUpgrade = ReplicatedStorage:WaitForChild("ForceCombine")

if not IsOn then
	Variables["ForceUpgrade"] = true
else
	Variables["ForceUpgrade"] = false
end

if Variables["MouseConnection"] then return end

shared["Variables"]["MouseConnection"] = Mouse.Button1Down:Connect(function()
		print("click clicky")
	if not IsOn then return end

	local Target = Mouse.Target
	if not Target then return end

local Name = Target["Name"]
		
	if tonumber(Name) then
		ForceUpgrade:FireServer(Target)
	end
end)
