-- body.lua

local class	= 	require "lib.middleclass"

local Body	=	class( "Body" )

function Body:initialize()
	self.position	=	{ x = 0, y = 0 }
	self.angle	=	0
	self.weapon	=	"silencer"
	self.desiredAngle	=	0
	self.desiredMovementVector	=	{ x = 0, y = 0, mult = 0 }
	self.diagonalMultiplier	=	.7
	self.speed	=	500
end

function Body:SetWeapon( weaponName )
	self.weapon	=	weaponName
end

function Body:update( dt )
	self:Move( dt )
end

function Body:Move( dt )	
	self.position.x 	=	self.position.x + self.desiredMovementVector.x * self.desiredMovementVector.mult * self.diagonalMultiplier
end

return Body
