local Variables = shared["Variables"]
local IsOn = Variables["ForceUpgrade"]

local Mouse:Mouse = __Client:GetMouse()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ForceUpgrade = ReplicatedStorage:WaitForChild("ForceCombine")

if not IsOn then
	Variables["ForceUpgrade"] = true
else
	Variables["ForceUpgrade"] = false
end

if Variables["MouseConnection"] then return end

shared["Variables"]["MouseConnection"] = Mouse.Button1Down:Connect(function()
	if not IsOn then return end

	local Target = Mouse.Target
	if not Target then return end

local Name = Target["Name"]
		
	if tonumber(Name) then
		ForceUpgrade:FireServer(Target)
	end
end)
