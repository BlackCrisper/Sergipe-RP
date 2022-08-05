iniMarker = createMarker( 986.265, -2005.854, 12.178, "cylinder", 1.5, 25,25,255,222)
destroyM = createMarker( 999.275, -1981.99, 25.733, "cylinder", 3.5, 255,25,25,222)

function msg(player)
	outputChatBox("", player, 255,255,255,true)
end
addEventHandler("onMarkerHit", iniMarker, msg)

veh = {}
function spawnVehicle(player)
	if isElementWithinMarker(player, iniMarker) then
		if veh[player] and isElement( veh[player] ) then destroyElement(veh[player])
			veh[player] = nil 
        end     
        veh[player] = createVehicle(488, 984.618, -2014.143, 26.733)
        warpPedIntoVehicle(player, veh[player])
    end
end
addEventHandler("onMarkerHit", iniMarker, spawnVehicle)

function msgDestroy(player)
	outputChatBox("", player, 255,255,255,true)
end
addEventHandler("onMarkerHit", destroyM, msgDestroy)

function destroy(player)
	if isElementWithinMarker(player, destroyM) then
	if isPedInVehicle(player) == true then
		destroyElement(veh[player])
		outputChatBox("", player, 255,255,255,true)
	else
		outputChatBox("", player, 255,255,255,true)
	end
end
end
addEventHandler("onMarkerHit", destroyM, destroy)  