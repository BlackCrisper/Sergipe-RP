Spawn = createMarker(1881.45, -1652.299, 20.077,"cylinder", 1.9, 255, 140, 0, 99)
Destroy = createMarker(1836.705, -1659.159, 12.6,"cylinder", 3.0, 128, 0, 0, 99)

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "DETRAN") ) then
 	veh[thePlayer] = createVehicle(443, 1853.524, -1667.876, 13.6, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é do #ffff00DETRAN!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVeículo guardado!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)