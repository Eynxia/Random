local fetch = {}

local Players = game:GetService("Players")

fetch.get = function(rawstring:string)
	local rawstringtype = typeof(rawstring)
	if rawstringtype ~= "string" then
		warn("First argument should be a string.")
		return
	end
	
	local Players = Players:GetPlayers()
	local rawstring = rawstring:lower()
	
	local t = {}
	
	for pos,data in Players do
		local name:string = data.Name
		local lower = name:lower()
		local sub = string.sub(lower,1,#rawstring)
		
		if sub == rawstring then
			table.insert(t,data)
		end
	end
	return t[1]
end

return fetch
