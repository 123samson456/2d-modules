-- game.lua

local class 	= 	require "lib.middleclass"
local states	=	require "lib.stateful"
local controls	= 	require "lib.controls"

local Game	=	class( "Game" ):include( states )

function Game:initialize( config )
	self.config	= 	config
	self.controls	=	controls
	self.state
end

function Game:update( dt )

end

function Game:draw()

end

return Game
