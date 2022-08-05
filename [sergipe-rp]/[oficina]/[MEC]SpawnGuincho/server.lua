iniMarker = createMarker(2050.939, -1890.156, 17.352, "cylinder", 1.5, 0,0,0,50)
destroyM = createMarker(2043.229, -1885.542, 13.82, "cylinder", 1.9, 255,255,255,100)

function msg(player)
	outputChatBox("#ffffff»Voce Pegou a Viatura Do MEC«®", player, 255,255,255,true)
end
addEventHandler("onMarkerHit", iniMarker, msg)

veh = {}
function spawnVehicle(player)
	if isElementWithinMarker(player, iniMarker) then
		if veh[player] and isElement( veh[player] ) then destroyElement(veh[player])
			veh[player] = nil 
        end     
        veh[player] = createVehicle(525, 2067.591, -1919.45, 14.812)
        warpPedIntoVehicle(player, veh[player])
    end
end
addEventHandler("onMarkerHit", iniMarker, spawnVehicle)

function msgDestroy(player)
	outputChatBox("Voce Destroiu a Viatura Do MEC", player, 255,255,255,true)
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