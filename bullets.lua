-- bullets.lua

local class	=	require "lib.middleclass"

local Bullets	=	class( "Bullets" )

function Bullets:initialize()
	self.bullets	=	{}
	self.drawDistance	=	30	-- in px
end

function Bullets:Add( x, y, angle, vel )
	table.insert( self.bullets, { x = x, y = y, angle = angle, vel = vel } )
end

function Bullets:Remove( index )
	table.remove( self.bullets, index )
end

function Bullets:Flush()
	self.bullets	=	{}	
end

function Bullets:Iterate()
	local startx, starty = 0, 0
	local screenx, screeny = love.graphics:getDimensions()
	for index, bullet in ipairs( self.bullets ) do
		-- Calculate new position of the bullet
		
		-- Check if the new position is outside the screen
		if ( bullet.x < ( start.x - self.drawDistance ) ) or
			( bullet.x > ( screen.x + self.drawDistance ) ) or
			( bullet.y < ( start.y - self.drawDistance ) ) or
			( bullet.y > ( screen.y + self.drawDistance ) ) then
			self:Remove( index )	
		end
	end
end

return Bullets
