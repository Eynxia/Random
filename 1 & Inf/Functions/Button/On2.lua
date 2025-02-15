local Variables = shared["Variables"]
local IsOn = Debounce

local Mouse:Mouse = game.Players.LocalPlayer:GetMouse()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ForceUpgrade = ReplicatedStorage:WaitForChild("ForceCombine")

if Variables["MouseConnection"] then return end

shared["Variables"]["MouseConnection"] = Mouse.Button1Down:Connect(function()
		print("click clicky")
		print(IsOn)
	if not IsOn then return end
	local Target = Mouse.Target
	if not Target then return end

local Name = Target["Name"]
		
	if tonumber(Name) then
		ForceUpgrade:FireServer(Target)
	end
end)
