-- gun.lua

local class	=	require "lib.middleclass"

local Gun	=	class( "Gun" )

function Gun:initialize()
	self.weaponTable 	=	{}
	self.weaponTable[ "machine" ]	=	{
		velocity	=	600,
		cooldown	=	0.1,
		auto		=	true
	}
	self.weaponTable[ "pistol" ]	=	{
		velocity	=	700,
		cooldown	=	0.1,
		auto		=	true
	}
	self.weaponTable[ "silencer" ]	=	{
		velocity	=	500,
		cooldown	=	0.1,
		auto		=	true
	}
	-- Vars
	self.cooldown	=	0
	self.maxCooldown	=	3
end

function Gun:Shoot( dt, data, pos, angle )
	-- Calculate Shooting cooldown
	self.cooldown 	=	math.clamp( self.cooldown - dt, 0, self.maxCooldown )
	if self.cooldown == 0 then
		Bullets:Add( pos.x, pos.y, angle )
	end
end

return Gun
