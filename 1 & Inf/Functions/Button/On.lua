local Variables = shared["Variables"]
local IsOn = Variables["Strong"]

if not IsOn then
	Variables["Strong"] = true
	for Index,Value in __BodyParts do
		if Value:IsA("BasePart") then
			Value.CustomPhysicalProperties = PhysicalProperties.new(100,1,1)
		end
	end
else
	Variables["Strong"] = false
	for Index,Value in __BodyParts do
		if Value:IsA("BasePart") then
			Value.CustomPhysicalProperties = nil
		end
	end
end
