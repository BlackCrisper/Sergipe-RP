Spawn = createMarker(2911.946, -640.755, 10.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2970.647, -705.962, 10.038,"cylinder", 3.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "pmse") ) then
 	veh[thePlayer] = createVehicle(479, 2908.718, -646.673, 10.835, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é do #ffff00PMSE!", "error")
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

---------------------------------------------------------------------------------------------------------------

Spawn = createMarker(2929.917, -640.236, 10.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2970.647, -705.962, 10.038,"cylinder", 3.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "caatinga") ) then
 	veh[thePlayer] = createVehicle(599, 2925.662, -647.201, 11.038, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é da #ffff00CAATINGA!", "error")
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

------------------------------------------------------------------------------------------------------------------------------


Spawn = createMarker(2938.24, -640.456, 10.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2970.647, -705.962, 10.038,"cylinder", 3.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "gati") ) then
 	veh[thePlayer] = createVehicle(598, 2934.345, -647.724, 11.038, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é do #ffff00GATI!", "error")
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

------------------------------------------------------------------------------------------------------------------------------


Spawn = createMarker(2947.078, -640.414, 10.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2970.647, -705.962, 10.038,"cylinder", 3.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "choque") ) then
 	veh[thePlayer] = createVehicle(597, 2942.58, -646.957, 11.038, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é do #ffff00CHOQUE!", "error")
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

------------------------------------------------------------------------------------------------------------------------------


Spawn = createMarker(2920.944, -640.195, 10.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2970.647, -705.962, 10.038,"cylinder", 3.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "coe") ) then
 	veh[thePlayer] = createVehicle(596, 2918.534, -648.497, 10.835 , -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é do #ffff00COE!", "error")
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

------------------------------------------------------------------------------------------------------------------------------


Spawn = createMarker(2955.904, -640.641, 10.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2970.647, -705.962, 10.038,"cylinder", 3.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "prf") ) then
 	veh[thePlayer] = createVehicle(404, 2951.489, -647.602, 11.038, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é da #ffff00PRF!", "error")
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

------------------------------------------------------------------------------------------------------------------------------


Spawn = createMarker(2913.462, -774.987, 15.038,"cylinder", 1.9, 0, 0, 0, 99)
Destroy = createMarker(2967.94, -763.875, 21.219,"cylinder", 5.0, 128, 0, 0, 90)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "gta") ) then
 	veh[thePlayer] = createVehicle(447, 2907.941, -748.785, 16.038, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFSpawnado com sucesso! Não esqueça de destruí-lo após o uso", "success")
 else
 	exports.Scripts_Dxmessages:outputDx(thePlayer, "#00FF00• INFO: #FFFFFFVocê não é do #ffff00GTA!", "error")
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