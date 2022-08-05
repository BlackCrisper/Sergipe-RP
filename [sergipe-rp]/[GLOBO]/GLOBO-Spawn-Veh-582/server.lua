iniMarker = createMarker( 988.781, -2008.896, 12.178, "cylinder", 1.5, 25,25,255,222)
destroyM = createMarker( 1023.063, -1958.471, 12.178, "cylinder", 3.5, 255,25,25,222)

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
        veh[player] = createVehicle(582, 1030.095, -1976.659, 13.178)
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