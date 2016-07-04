-- controls.lua

local c		=	require "data.controls"
local Input	=	require "lib.input"
input	=	Input()

for action, data in pairs( c ) do
	input:bind( data.key, action )	
end

return c
