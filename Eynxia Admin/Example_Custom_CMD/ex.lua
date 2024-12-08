--|| Services

local Players = game:GetService("Players")

--|| Other

local Player_list = Players:GetPlayers()
person_Who_fired_The_event = Client
target_list_or_variables = array

local TYPE_ = typeof(array)

if TYPE_ == "table" then
	for p,d in TYPE_ do
		warn("\n\nplayer that got into the target list: "..d)
	end
	
elseif TYPE_ == "Instance" then
	warn("\n\nSince the target list was empty changed it to the default value which is the person who fire the remote event.")
end

warn("\n\nVariables:\n\n| Player List |: ",Player_list,"\nPerson that fired the remote event: "..person_Who_fired_The_event.."\ntarget & variable list: ",target_list_or_variables)
