-- body.lua

local class	= 	require "lib.middleclass"

local Gun	=	require "gun"

local Body	=	class( "Body" )

function Body:initialize()
	self.position	=	{ x = 0, y = 0 }
	self.angle	=	0
	self.weapon	=	"silencer"
	self.attack	=	true
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
	if self.attack then
		self:Shoot( dt, Gun )	
	end
end

function Body:Move( dt )
	local velocityMultiplier	=	1
	if self.desiredMovementVector.mult then
		velocityMultiplier	=	self.diagonalMultiplier
	end
	self.position.x 	=	self.position.x + self.desiredMovementVector.x * velocityMultiplier
	self.position.y		=	self.position.y + self.desiredMovementVector.y * velocityMultiplier
end

function Body:Shoot( dt, Gun )
	local gun	=	Gun
	local weapon	=	self.weapon
	local data	=	gun.weaponTable[ self.weapon ]
	gun:Shoot( dt, data, self.position, angle )
end

return Body
