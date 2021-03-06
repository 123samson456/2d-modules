-- player.lua

local class   	=   require "lib.middleclass"
local Input		=	require "lib.input"
input	=	Input()

local PlayerControl	=	  class( "Player" )

function PlayerControl:initialize( camera, body )
 	self.camera		=	camera
 	self.body		=	body
 	self.weapons	=	{ "machine", "pistol", "silencer" }
 	self.weaponName	=	"silencer"
end

function PlayerControl:update( dt )
	local body	=	self.body
	
	body:SetWeapon( self.weaponName )
	body.desiredAngle	=	self:GetAngle()
	body.desiredMovementVector.x, body.desiredMovementVector.y, body.desiredMovementVector.mult	=	self:GetMovementVector()
end

function PlayerControl:GetAngle()
	-- Debug
	return 0
end

function PlayerControl:GetMovementVector()
	local dirx, diry, mult	=	0, 0, false
	if input:down( "game_up" ) then
		diry	=	-1
	end
	if input:down( "game_down" ) then
		diry	=	1
	end
	if input:down( "game_left" ) then
		dirx	=	-1
	end
	if input:down( "game_right" ) then
		dirx	=	1
	end
	if ( input:down( "game_up" ) and input:down( "game_left" ) ) or
		( input:down( "game_up" ) and input:down( "game_right" ) ) or
		( input:down( "game_down" ) and input:down( "game_left" ) ) or
		( input:down( "game_down" ) and input:down( "game_right" ) ) then
		mult	= 	true	
	end
	return dirx, diry, mult
end

function PlayerControl:keypressed( key )
	self.weaponName	=	self.weapons[ tonumber( key ) ] or self.weaponName
end

return PlayerControl
