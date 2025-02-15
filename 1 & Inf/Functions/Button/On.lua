local Variables = shared["Variables"]
local IsOn = Debounce

if IsOn then
	for Index,Value in __BodyParts do
		if Value:IsA("BasePart") then
			Value.CustomPhysicalProperties = PhysicalProperties.new(100,1,1)
		end
	end
else
	for Index,Value in __BodyParts do
		if Value:IsA("BasePart") then
			Value.CustomPhysicalProperties = nil
		end
	end
end
