-- bullets.lua

local class	=	require "lib.middleclass"

local Bullets	=	class( "Bullets" )

function Bullets:initialize()
	self.bullets	=	{}
end

function Bullets:Add( x, y, angle, vel )
	table.insert( self.bullets, { x = x, y = y, angle = angle, vel = vel } )
end

function Bullets:Remove( index )
	table.remove( self.bullets, index )
end

function Bullets:Iterate()
	for i, bullet in ipairs( self.bullets ) do
		-- Calculate new position of the bullet
		
		-- Check if the new position is outside the screen
	end
end

return Bullets
