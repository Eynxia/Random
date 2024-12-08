--|| Services

local Players = game:GetService("Players")

--|| Other

local Player_list = Players:GetPlayers()
person_Who_fired_The_event = Client
target_list_or_variables = array

local TYPE_ = typeof(array)


warn("\n\nVariables:\n\n| Player List |: ",Player_list or nil,"\nPerson that fired the remote event: "..person_Who_fired_The_event.Name.."\ntarget & variable list: ",target_list_or_variables or nil)
