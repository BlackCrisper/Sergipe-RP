local screenW, screenH = guiGetScreenSize( );

local infobox = { };
local font = dxCreateFont( "files/fonts/regular.ttf", 9 )

addEventHandler( "onClientRender", getRootElement( ),
	function( )

		for i, box in ipairs( infobox ) do

			if i > 6 then

				table.remove( infobox, 1 )

			end
 
			local width_text = dxGetTextWidth( box.text, 1, "defalt", true )

			if ( box.visible ) then

				box.alpha = box.alpha + 10

				if ( box.alpha > 255 ) then

					box.alpha = 255

				end
 
			end

			if ( getTickCount( ) - box.tick > 10000 ) then
 
 				table.remove( infobox, 1 )

			end

			local progress = ( getTickCount( ) - box.tick ) / 1000 
			local animation = interpolateBetween( screenW - 20 * 5 - width_text, 0, 0, 0, 0, 0, progress, "OutQuad" )

			dxDrawRectangle( animation + screenW - 20 * 5 - width_text, screenH / 2 - screenH / 2 + 20 * 4 + i * 39 - 10 * 4, 100 + width_text, 38, tocolor( 22, 22, 22, box.alpha ), true )
			dxDrawRectangle( animation + screenW - 20 * 5 - width_text, screenH / 2 - screenH / 2 + 20 * 4 + i * 39 - 10 * 4, 38, 38, tocolor( box.color[ 1 ], box.color[ 2 ], box.color[ 3 ], box.alpha ), true )
			dxDrawImage( animation + screenW - 20 * 5 - width_text, screenH / 2 - screenH / 2 + 20 * 4 + i * 39 - 10 * 4, 38, 38, "files/icons/"..box.type..".png", 0, 0, 0, tocolor( 255, 255, 255, box.alpha ), true )
			dxDrawText( box.text, animation + screenW - 20 * 5 + 6 * 2 - width_text + 10 * 6 - 10, screenH / 2 - screenH / 2 + 20 * 4 + 4 * 3 - 1 + i * 39 - 10 * 4, 100, 38, tocolor( 255, 255, 255, box.alpha ), 1, font, "left", "top", false, true, true, true )
 
		end

	end
)

function showBoxSide( text, type )

	local self = setmetatable( {

		text = text,
		type = type,
		alpha = 0,
		visible = true,
		tick = getTickCount( ),
		color = { }, 

	}, infobox )

	if ( self ) then
 
		if ( self.type == "info" ) then

			self.color = { 129, 135, 255 }
			playSound( "files/sounds/info.mp3" )
 
		elseif ( self.type == "error" ) then

			self.color = { 255, 80, 80 }
			playSound( "files/sounds/error.mp3" )
 
		elseif ( self.type == "help" ) then

			self.color = { 205, 242, 119 }
			playSound( "files/sounds/help.mp3" )
 
		elseif ( self.type == "shop" ) then

			self.color = { 237, 235, 114 }
			playSound( "files/sounds/shop.mp3" )
 
		elseif ( self.type == "danger" ) then

			self.color = { 245, 190, 71 }
			playSound( "files/sounds/danger.wav" )
 
		elseif ( self.type == "staff" ) then

			self.color = { 110, 186, 240 }
			playSound( "files/sounds/staff.mp3" )

		elseif ( self.type == "success" ) then

			self.color = { 188, 240, 105 }
			playSound( "files/sounds/success.mp3" )
 
		end

		table.insert( infobox, self )

	end

	return self;
end
addEvent( "N3xT.dxNotification", true )
addEventHandler( "N3xT.dxNotification", getRootElement( ), showBoxSide )