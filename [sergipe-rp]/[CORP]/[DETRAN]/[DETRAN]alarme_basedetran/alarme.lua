RestricLocation = {}
TeleportLocation = {}
EnabledAlarm = true
ColCuboid = false

--------------------------------------- CONFIGS --------------------------------------------
RestricLocation["location1"] = {-77.550636291504,-396.93936157227,1.4296875}  --Local PARTE DE CIMA
RestricLocation["location2"] = {19.275411605835,-265.73263549805,7.502631187439}  --LOCAL PARTE DE BAIXO
TeleportLocation = {-102.57817840576,-358.48648071289,1.4296875} --LOCAL TO TELEPORT PLAYER
GroupName = "DETRAN" 
GroupNameBy = 2 ----- 2 è pra quem ta na ACL  , 1 è pra quem ta no grupo
MsgInvasao = "Base privada! Você não pode entrar aqui!"
EnableVehicleGodMode = true 
HabilitarAdmin = false 
GodMode = false 
NaoAtirar = false 


--------------------------------------- CONFIGS --------------------------------------------

function sendMsg(iplayer,msg)
  outputChatBox ( msg, iplayer, 255, 0, 0, true )
end

function EnterPlace ( theElement )
local veh = getPedOccupiedVehicle(theElement)
local accName = getAccountName(getPlayerAccount(theElement))
  if HabilitarAdmin == true then
	if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "DETRAN" ) ) ) then
	  return
	end
  end
  if (getElementType ( theElement ) == "player") and (PlayerHaveLevel (theElement) == false) then
	sendMsg(theElement,MsgInvasao)
	if veh then
	  setElementPosition( veh, TeleportLocation[1], TeleportLocation[2], TeleportLocation[3])
	else
	  setElementPosition( theElement, TeleportLocation[1], TeleportLocation[2], TeleportLocation[3])
	end
	sendMsgOwners(theElement)
  elseif getElementType ( theElement ) == "vehicle" then
	SetVehicleGodMode(theElement,true)
  end
end

function ExitPlace ( theElement )
  if GodMode == true then
	setElementData(theElement,"blood",12000)
  end
  if NaoAtirar == true then
  toggleControl(theElement, "fire", true)
  toggleControl(theElement, "vehicle_fire", true)
  toggleControl(theElement, "vehicle_secondary_fire", true)
  toggleControl(theElement, "aim_weapon", true)
  end
  if getElementType ( theElement ) == "vehicle" then
	SetVehicleGodMode(theElement,false)
  end
end

function PlayerHaveLevel( PlayerID )
  if GroupNameBy == 1 then
	if ( getElementData ( PlayerID , "gang" ) == GroupName ) then
	  if GodMode == true then
		setElementData(PlayerID,"blood",999999999999999)
	  end
	  if NaoAtirar == true then
		toggleControl (PlayerID, "fire", false)
		toggleControl (PlayerID, "vehicle_fire", false)
		toggleControl (PlayerID, "vehicle_secondary_fire", false)
		toggleControl (PlayerID, "aim_weapon", false)
	  end
	  return true
	else
	  return false
	end
  else
	local accName = getAccountName ( getPlayerAccount ( PlayerID ) )
	if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( GroupName ) ) ) then
	  if GodMode == true then
		setElementData(PlayerID,"blood",999999999999999)
	  end
	  if NaoAtirar == true then
		toggleControl (PlayerID, "fire", false)
		toggleControl (PlayerID, "vehicle_fire", false)
		toggleControl (PlayerID, "vehicle_secondary_fire", false)
		toggleControl (PlayerID, "aim_weapon", false)
	  end
	  return true
	else
	  return false
	end
  end
end

function ResourceStart( )
	LoadLocations()
	CreateCollision()
end
addEventHandler( "onResourceStart", getResourceRootElement( getThisResource() ),ResourceStart)

function LoadLocations()
	local RX, RY, RZ, WRX, WRX, WRX
	if(RestricLocation["location1"][1] > RestricLocation["location2"][1]) then
		RestricLocation["maxx"] = RestricLocation["location1"][1]
		RestricLocation["minx"] = RestricLocation["location2"][1]
	else
		RestricLocation["maxx"] = RestricLocation["location2"][1]
		RestricLocation["minx"] = RestricLocation["location1"][1]
	end
	if(RestricLocation["location1"][2] > RestricLocation["location2"][2]) then
		RestricLocation["maxy"] = RestricLocation["location1"][2]
		RestricLocation["miny"] = RestricLocation["location2"][2]
	else
		RestricLocation["maxy"] = RestricLocation["location2"][2]
		RestricLocation["miny"] = RestricLocation["location1"][2]
	end
	if(RestricLocation["location1"][3] > RestricLocation["location2"][3]) then
		RestricLocation["maxz"] = RestricLocation["location1"][3]
		RestricLocation["minz"] = RestricLocation["location2"][3]
	else
		RestricLocation["maxz"] = RestricLocation["location2"][3]
		RestricLocation["minz"] = RestricLocation["location1"][3]
	end
end

function CreateCollision()
	RX = RestricLocation["minx"]
	WRX = RestricLocation["maxx"] - RestricLocation["minx"]
	RY = RestricLocation["miny"]
	WRY = RestricLocation["maxy"] - RestricLocation["miny"]
	RZ = RestricLocation["minz"]
	WRZ = RestricLocation["maxz"] - RestricLocation["minz"]
	ColCuboid = createColCuboid ( RX, RY, RZ, WRX, WRY, WRZ )
	if ColCuboid then
		addEventHandler ( "onColShapeHit", ColCuboid, EnterPlace )
		addEventHandler ( "onColShapeLeave", ColCuboid, ExitPlace )
	else
		outputDebugString("Erro, verifique: location1 e location2")
	end
end

function ResourceStop( )
	destroyElement ( ColCuboid )
end
addEventHandler( "onResourceStop", getResourceRootElement( getThisResource() ),ResourceStop)

function sendMsgOwners( PlayerID )
	local connectedPlayers = getElementsByType ( "player" )
	for i, aPlayer in ipairs(connectedPlayers) do
		if(PlayerHaveLevel (aPlayer) == true) then
			sendMsg(aPlayer," O Jogador " ..getPlayerName ( PlayerID ) .." esta tentando invadir a sua BASE !")
		end
	end
end

function SetVehicleGodMode( VehicleID, godEoD )
	if EnableVehicleGodMode == true then
		setElementData(VehicleID, "godmode", godEoD)
		setVehicleDamageProof (VehicleID, godEoD )
	end
end