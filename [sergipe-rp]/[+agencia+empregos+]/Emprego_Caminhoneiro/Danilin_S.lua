--[[
/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\/
										            Curta a Minha Página <3									        
 									     	https://www.facebook.com/danilinmtascr/		
								   
                        :::::::::      :::     ::::    ::: ::::::::::: :::        ::::::::::: ::::    ::: 
                        :+:    :+:   :+: :+:   :+:+:   :+:     :+:     :+:            :+:     :+:+:   :+: 
                        +:+    +:+  +:+   +:+  :+:+:+  +:+     +:+     +:+            +:+     :+:+:+  +:+ 
                        +#+    +:+ +#++:++#++: +#+ +:+ +#+     +#+     +#+            +#+     +#+ +:+ +#+ 
                        +#+    +#+ +#+     +#+ +#+  +#+#+#     +#+     +#+            +#+     +#+  +#+#+# 
                        #+#    #+# #+#     #+# #+#   #+#+#     #+#     #+#            #+#     #+#   #+#+# 
                        #########  ###     ### ###    #### ########### ########## ########### ###    #### 
                                        						
/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\/
--]]	
Marker_Aleatorios = -- ADICIONE AQUI OS LOCAIS QUE O JOGADOR DEVE PASSAR
 {   
   {658.48792, -546.98334, 16.33594},
   {-2124.44043, 208.22417, 35.22341},
   {249.56505, 1420.55273, 10.56574},
   {1427.32214, 708.58142, 10.82031},
-- AS MESMA POS DE CIMA PRA EVITAR SAIR O MESMO TODA HORA
   {658.48792, -546.98334, 16.33594},
   {-2124.44043, 208.22417, 35.22341},
   {249.56505, 1420.55273, 10.56574},
   {1427.32214, 708.58142, 10.82031},
 }
 
local Marker_Emprego = createMarker ( 2430.1245117188, -2102.3725588938, 13.552991867065 -1, "cylinder", 1.2, 16, 111, 231, 90)
local Blip_Emprego = createBlipAttachedTo( Marker_Emprego, 51 )
setBlipVisibleDistance(Blip_Emprego, 150)

Caminhao = {}
Carga_Caminhao = {}
Marker_Carga = {}
Blip_Carga = {}
Blip_Carga2 = {}
Tempo = {}
Marker_Entregar = {}
Blip_Entregar = {}

 --[[
         ><><><><><><><><><><><><><><><><><><><><
         ><             Infos Trab             ><
         ><><><><><><><><><><><><><><><><><><><><
--]]
local Blip_Marcar = createBlipAttachedTo( Marker_Emprego, 0 )
setElementVisibleTo ( Blip_Marcar, root, false )
function Infos_Emprego ( source )
	local Emprego = getElementData ( source, "Emprego" )
	if Emprego == "Caminhoneiro" then
		if isElementVisibleTo ( Blip_Marcar, source ) then
			setElementVisibleTo ( Blip_Marcar, source, false )
			triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffSeu Local de Trabalho foi Desmarcado do Mapa", "info")
		else
			setElementVisibleTo ( Blip_Marcar, source, true )
			triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffSeu Local de Trabalho foi Marcado no Mapa", "info")
		end
	end	
end    
addCommandHandler ( "infos", Infos_Emprego )

 --[[
         ><><><><><><><><><><><><><><><><><
         ><        Pegar Caminhao        ><
         ><><><><><><><><><><><><><><><><><
--]]
function Pegar_Caminhao (source)
	local Emprego = getElementData ( source, "Emprego" )
	if not isPedInVehicle ( source ) then
		if isElementWithinMarker(source, Marker_Emprego) then
			if Emprego == "Caminhoneiro" then
				if getElementData(source, "Viagem") == false then
					if isElement(Marker_Entregar[source]) then destroyElement(Marker_Entregar[source]) end
					if isElement(Blip_Entregar[source]) then destroyElement(Blip_Entregar[source]) end
					if isElement(Caminhao[source]) then destroyElement(Caminhao[source]) end
					if isElement(Carga_Caminhao[source]) then destroyElement(Carga_Caminhao[source]) end
					if isElement(Marker_Carga[source]) then destroyElement(Marker_Carga[source]) end
					if isElement(Blip_Carga[source]) then destroyElement(Blip_Carga[source]) end
					if isElement(Blip_Carga2[source]) then destroyElement(Blip_Carga2[source]) end
					Caminhao[source] = createVehicle(514, 2435.64355, -2110.73584, 13.54688)
					warpPedIntoVehicle ( source, Caminhao[source] )
					Marker_Carga[source] = createMarker ( 2494.4099121094, -2089.4450683594, 13.546875 -1, "cylinder", 5, 16, 111, 231, 90)	
					Blip_Carga[source] = createBlipAttachedTo( Marker_Carga[source], 0 )	
	                local Recompensa = math.random(4200, 10500)
	                local Recompensa_XP = math.random(120, 210)					
					setElementData(source, "Recompensa", Recompensa)	
					setElementData(source, "Recompensa_XP", Recompensa_XP)	
					setElementVisibleTo ( Marker_Carga[source], root, false )
					setElementVisibleTo ( Marker_Carga[source], source, true )			
					setElementVisibleTo ( Blip_Carga[source], root, false )
					setElementVisibleTo ( Blip_Carga[source], source, true )
					addEventHandler("onMarkerHit", Marker_Carga[source], Pegar_Carga)
					triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffPegue a Carga no Marker Criado", "info")
				else
					triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffVocê já tem uma carga pra ser entregue", "info")
				end
			else
				triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffApenas Caminhoneiros podem pegar cargas", "info")
			end
		end
	end
end
addCommandHandler("iniciar", Pegar_Caminhao)

-- Aviso 
function Mensagem_Aviso (source)
	local Emprego = getElementData ( source, "Emprego" )
	if Emprego == "Caminhoneiro" then
		if isElementWithinMarker(source, Marker_Emprego) then
			triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffDigite /iniciar para que inicie uma viagem", "info")
		end
	end
end
addEventHandler("onMarkerHit", Marker_Emprego, Mensagem_Aviso)

 --[[
         ><><><><><><><><><><><><><><><
         ><       Pegar Carga        ><
         ><><><><><><><><><><><><><><><
--]]
function Pegar_Carga (source)
	local Random_Pos = math.random ( #Marker_Aleatorios )
	if isElementWithinMarker(source, Marker_Carga[source]) then
		if getElementData(source, "Viagem") == false then
			if isElement(Marker_Carga[source]) then destroyElement(Marker_Carga[source]) end
			if isElement(Carga_Caminhao[source]) then destroyElement(Carga_Caminhao[source]) end
			if isElement(Blip_Carga[source]) then destroyElement(Blip_Carga[source]) end
			if isElement(Blip_Carga2[source]) then destroyElement(Blip_Carga2[source]) end
			setElementPosition(Caminhao[source], 2506.71826, -2087.49194, 13.54688)
			setElementData(source, "Viagem", true)
			setTimer(function()
				Carga_Caminhao[source] = createVehicle ( 584, 2494.4099121094, -2089.4450683594, 13.546875 )
				Blip_Carga2[source] = createBlipAttachedTo( Carga_Caminhao[source], 44 )	
				setElementRotation(Caminhao[source], 0, 0, 90)
				setElementRotation(Carga_Caminhao[source], 0, 0, 90)
				setElementVisibleTo ( Blip_Carga2[source], root, false )
			--	setElementVisibleTo ( Blip_Carga2[source], source, true )
				attachTrailerToVehicle ( Caminhao[source], Carga_Caminhao[source] )	
				Marker_Entregar[source] = createMarker ( Marker_Aleatorios[Random_Pos][1], Marker_Aleatorios[Random_Pos][2], Marker_Aleatorios[Random_Pos][3] -1, "cylinder", 5, 16, 111, 231, 90)
				Blip_Entregar[source] = createBlipAttachedTo( Marker_Entregar[source], 0 )								
				setElementVisibleTo ( Marker_Entregar[source], root, false )
				setElementVisibleTo ( Marker_Entregar[source], source, true )			
				setElementVisibleTo ( Blip_Entregar[source], root, false )
				setElementVisibleTo ( Blip_Entregar[source], source, true )
				addEventHandler("onMarkerHit", Marker_Entregar[source], Entregar_Carga)
				triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffSua carga está marcada para que você não perca ela", "info")
				triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffLeve a Carga Para O Local Marcado no Mapa", "info")
			end, 100, 1)
		end
	end
end

--[[
         ><><><><><><><><><><><><><><><><><
         ><       Destruir Emprego       ><
         ><><><><><><><><><><><><><><><><><
--]]
-- Destruir Emprego
function Exit_Veh (source)
	if getElementData(source, "Viagem") == true then
		triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffVocê tem 5 Minutos para que volte pro caminhão", "info")
		Tempo[source] = setTimer ( function()
			if isElement(Marker_Entregar[source]) then destroyElement(Marker_Entregar[source]) end
			if isElement(Blip_Entregar[source]) then destroyElement(Blip_Entregar[source]) end
			if isElement(Caminhao[source]) then destroyElement(Caminhao[source]) end
			if isElement(Carga_Caminhao[source]) then destroyElement(Carga_Caminhao[source]) end
			if isElement(Marker_Carga[source]) then destroyElement(Marker_Carga[source]) end
			if isElement(Blip_Carga[source]) then destroyElement(Blip_Carga[source]) end
			if isElement(Blip_Carga2[source]) then destroyElement(Blip_Carga2[source]) end
			setElementData(source, "Viagem", false)
			triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffVocê não voltou para o veiculo e acabou perdendo a viagem", "info")
		end, 300000, 1 )
	end
end
addEventHandler ("onVehicleExit", root, Exit_Veh)

function Enter_Veh (source)
	if (Caminhao[source]) and isElement(Caminhao[source]) then	
		if isTimer(Tempo[source]) then
			killTimer(Tempo[source])
		end
	end
end
addEventHandler ("onVehicleEnter", root, Enter_Veh)

--[[
         ><><><><><><><><><><><><><><><><
         ><       Entregar Carga       ><
         ><><><><><><><><><><><><><><><><
--]]
function Entregar_Carga (source)
	local Xp = tonumber(getElementData(source, "Exp")) or 0
	local Recompensa = math.random(4200, 10500)
	local Recompensa_XP = math.random(120, 210)
	if getElementData(source, "Viagem") == true then
		if ( getVehicleTowedByVehicle ( Caminhao[source] ) == Carga_Caminhao[source] ) then 
			if isElement(Marker_Entregar[source]) then destroyElement(Marker_Entregar[source]) end
			if isElement(Blip_Entregar[source]) then destroyElement(Blip_Entregar[source]) end
			if isElement(Carga_Caminhao[source]) then destroyElement(Carga_Caminhao[source]) end
			if isElement(Blip_Carga2[source]) then destroyElement(Blip_Carga2[source]) end
			setElementData(source, "Viagem", false)
			if isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Vip2")) then
				setElementData(source, "Recompensa", Recompensa *2)
				setElementData(source, "Recompensa_XP", Recompensa_XP *2)
				setElementData(source, "Exp", Xp + getElementData(source, "Recompensa_XP"))
				givePlayerMoney(source, Recompensa)
				triggerClientEvent(source, "addNotification", root, "#ffffffVIP: #ffffffVocê entregou a carga e ganhou R$:"..getElementData(source, "Recompensa").."", "info")
			elseif isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Vip")) then
				setElementData(source, "Recompensa", Recompensa *2)
				setElementData(source, "Recompensa_XP", Recompensa_XP *2)
				setElementData(source, "Exp", Xp + getElementData(source, "Recompensa_XP"))				
				givePlayerMoney(source, Recompensa)
				triggerClientEvent(source, "addNotification", root, "#ffffffVIP: #ffffffVocê entregou a carga e ganhou R$:"..getElementData(source, "Recompensa").."", "info")
			elseif isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Everyone")) then
				setElementData(source, "Recompensa_XP", Recompensa_XP)
				setElementData(source, "Exp", Xp + getElementData(source, "Recompensa_XP"))					
				givePlayerMoney(source, Recompensa)
				triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffVocê entregou a carga e ganhou R$:"..getElementData(source, "Recompensa").."", "info")
			end
		else
			triggerClientEvent(source, "addNotification", root, "#ffffffINFO: #ffffffSeu caminhão está sem carga, Pegue ela e entregue", "info")
		end
	end
end

--[[
         ><><><><><><><><><><><><><><><><
         ><          Anti_Bugs         ><
         ><><><><><><><><><><><><><><><><
--]]
addEventHandler( "onPlayerQuit", root,
	function()
		if getElementData ( source, "Viagem" ) == true then
			if isElement(Marker_Entregar[source]) then destroyElement(Marker_Entregar[source]) end
			if isElement(Blip_Entregar[source]) then destroyElement(Blip_Entregar[source]) end
			if isElement(Caminhao[source]) then destroyElement(Caminhao[source]) end
			if isElement(Carga_Caminhao[source]) then destroyElement(Carga_Caminhao[source]) end
			if isElement(Marker_Carga[source]) then destroyElement(Marker_Carga[source]) end
			if isElement(Blip_Carga[source]) then destroyElement(Blip_Carga[source]) end
			if isElement(Blip_Carga2[source]) then destroyElement(Blip_Carga2[source]) end
		end
	end)
  
addEventHandler( "onPlayerWasted", root,
	function()
		if getElementData ( source, "Viagem" ) == true then
			if isElement(Marker_Entregar[source]) then destroyElement(Marker_Entregar[source]) end
			if isElement(Blip_Entregar[source]) then destroyElement(Blip_Entregar[source]) end
			if isElement(Caminhao[source]) then destroyElement(Caminhao[source]) end
			if isElement(Carga_Caminhao[source]) then destroyElement(Carga_Caminhao[source]) end
			if isElement(Marker_Carga[source]) then destroyElement(Marker_Carga[source]) end
			if isElement(Blip_Carga[source]) then destroyElement(Blip_Carga[source]) end
			if isElement(Blip_Carga2[source]) then destroyElement(Blip_Carga2[source]) end
			setElementData( source, "Viagem", false )	
		end
	end)