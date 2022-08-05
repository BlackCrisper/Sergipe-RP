function showPanellr(thePlayer)
  accountname = getAccountName(getPlayerAccount(thePlayer))
  if isObjectInACLGroup("user." .. accountname, aclGetGroup("Staff")) then ---So Mude  "PCC" Grupo que vai poder abrir o painel !
    triggerClientEvent(thePlayer, "painelrota", getRootElement())
  end
end
function onResStartlr()
  for index, player in ipairs(getElementsByType("player")) do
    bindKey(player, "o", "down", showPanellr)------"K" Botao Para Abrir O Painel
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), onResStartlr)
function onPlayerJoinlr()
  bindKey(source, "o", "down", showPanellr)------"K" Botao Para Abrir O Painel
end
addEventHandler("onPlayerJoin", getRootElement(), onPlayerJoinlr)
function cleanAlllr(player)
  for index, player in ipairs(getElementsByType("player")) do
    unbindKey(player, "o", "down", showPanellr)------"K" Botao Para Abrir O Painel
  end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), cleanAlllr)

-----------------------------------------------------------------------------------------------------------------------

veh = {}
function carro ()
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(490, x,y,z)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carropl",true)
addEventHandler("carropl",root,carro)

-----------------------------------------------------------------------------------------------------------------------

function moto ()
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(581, x,y,z)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("motopl",true)
addEventHandler("motopl",root,moto)

-----------------------------------------------------------------------------------------------------------------------

function destrui ()---------DESTRUIR CARRO
destroyElement ( veh[source] )
outputChatBox ('( #00ff00INFO#ffffff )#ffff00Voce Destruiu Seu #00ff00Veiculo !',source,255,255,255,true)
end
addEvent ("destruipl", true)
addEventHandler ("destruipl", getRootElement(), destrui)

-----------------------------------------------------------------------------------------------------------------------

function skinm ()
     setPedSkin ( source, 217 )
	 outputChatBox ('( #00ff00INFO#ffffff )#ffff00Voce Pegou #00ff00Skin Masculina !',source,255,255,255,true)
end
addEvent("skinmpl",true)
addEventHandler ( "skinmpl", getRootElement(), skinm )

-----------------------------------------------------------------------------------------------------------------------

function skinf()
     setPedSkin ( source, 211 )
	 outputChatBox ('( #00ff00INFO#ffffff )#ffff00Voce Pegou #00ff00Skin Feminina !',source,255,255,255,true)
end
addEvent("skinfpl",true)
addEventHandler ( "skinfpl", getRootElement(), skinf )

-----------------------------------------------------------------------------------------------------------------------

function teleport()
	setElementPosition ( source, 1164, -2037, 71)
end
addEvent("teleportpl",true)
addEventHandler ( "teleportpl", getRootElement(), teleport )

-----------------------------------------------------------------------------------------------------------------------

function blindar (thePlayer)
    local theVehicle = getPedOccupiedVehicle (source)
    if theVehicle and isElement (theVehicle) then
        if isVehicleDamageProof (theVehicle) then
            setVehicleDamageProof (theVehicle, false)
            outputChatBox ("Você desblindou seu veículo!", source, 255)
        else
            setVehicleDamageProof (theVehicle, true)
            outputChatBox ("Você blindou seu veículo!", source, 0, 255)
        end
    else
        outputChatBox ("Você deve estar em um veículo para blindar", source, 255, 0, 0)
    end
end
addEvent("blindarpl",true)
addEventHandler ( "blindarpl", getRootElement(), blindar )

