-- main.lua

local Game	= 	require "game"
local media	= 	require "media"

function love.load()
	game	= 	Game:new()
	media.load()
end

function love.update( dt )
	game:update()
end

function love.draw()
	game:draw()
end
