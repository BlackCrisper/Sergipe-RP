--[[


 ################################################
 #                                              #                                                  
 #             SCRIPT PRODUZIDO POR:            #
 #            FACEBOOK.COM/VAZERNMTA            #
 #                                              #
 #                                              #
 ################################################




]]

addEventHandler("onResourceStart", resourceRoot, 
    function() 
        for i,v in ipairs(getElementsByType('player')) do 
            setElementData(v, "data.playerID", i) 
        end 
    end 
) 

addEventHandler("onPlayerJoin", root, 
    function() 
        for i,v in ipairs(getElementsByType('player')) do 
            setElementData(v, "data.playerID", i) 
        end 
    end 
) 

local blip = {}

function outputDxBox(thePlayer, text, type)
	exports.Scripts_Dxmessages:outputDx(thePlayer, text, type)
end

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


function setPlayerFallen(player, state)
	if state == true then
		toggleAllControls(player, false)  
		toggleControl(player, "chatbox", true) 
		
		setElementData(player, "playerFallen", true)
		setElementFrozen(player, true)
		triggerClientEvent(player, "startDeadTime", player)
		local timer = setTimer(
			function ()
				local chee = getElementData(source,"playerFallen") or false
				if chee == true then
					setElementHealth(source,50)
				end
			end,50,0)
	end
	if state == false then
		setElementHealth(player, 50)
		triggerClientEvent(player, "stopDeadTime", player)
		toggleAllControls(player, true)  
		setElementData(player, "playerFallen", false)
		setElementFrozen(player, false)
	end
end

function checkData()
	for i, player in pairs (getElementsByType("player")) do
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Samu")) then
			if not getElementData(player, "jobSAMU") then
				setElementData(player, "jobSAMU", true)
			end
		end
	end
end
addEventHandler("onPlayerLogin", root, checkData)
addEventHandler("onPlayerSpawn", root, checkData)
addEventHandler("onResourceStart", resourceRoot, checkData)


function checkHealth()
	for i, player in pairs (getElementsByType("player")) do
		if not getElementData(player, "playerFallen") then
			local conta = getAccountName(getPlayerAccount(player))
				if getElementHealth(player) >= 1 then
					if getElementHealth(player) <= hpFallen then 
						removePedFromVehicle(player)
						setPlayerFallen(player, true)
						setPedAnimation(player, "SWEET", "Sweet_injuredloop", 1000, false, false, false, true)
						triggerClientEvent(player, "startDeadTime", player)
		
						--if getElementData(player, "playerFallen") then	
							setTimer(function()
								if getElementData(player, "playerFallen") then	
									setElementData(player, "playerFallen", false)
									setPlayerFallen(player, false)
									triggerClientEvent(player, "stopDeadTime", player)
									if isElement ( blip[player] ) then
									    destroyElement(blip[player])
									end
									killPlayer(player)
									outputDxBox(player, "Você demorou para ser curado e acabou morrendo!", "info")
								end
							end, 300000, 1)
						--end
					end
				
			end
		end
	end
end
setTimer(checkHealth, 1000, 0)



function onWasted(killer)
		if getElementData(source, "playerFallen") then
			setPlayerFallen(source, false)
			setElementData(source, "playerFallen", false)
			setElementData(source,"ambu",false)
			triggerClientEvent(source, "stopDeadTime", source)
			if blip[source] and isElement(blip[source]) then 
				destroyElement(blip[source]) 
				blip[source] = nil 
			end
		end
	end
addEventHandler("onPlayerWasted", root, onWasted)

function onQuit()
	for i, player in pairs (getElementsByType("player")) do
		if getElementData(player, "playerFallen") then
			if blip[player] and isElement(blip[player]) then 
				destroyElement(blip[player]) 
				blip[player] = nil 
			end
		end
	end
end
addEventHandler("onPlayerQuit", root, onQuit)


function curarPlayer(thePlayer, command, nameP)
    if nameP then
        if tonumber(nameP) then
            local conta = getAccountName (getPlayerAccount(thePlayer))

            if isObjectInACLGroup("user."..conta, aclGetGroup("Samu")) then

				local namePlayer = getPlayerFromID(tonumber(nameP))
				local id = getElementData(namePlayer,"ID") or false
                local nameR = getPlayerName(namePlayer)
                local wanted = getPlayerWantedLevel(namePlayer)
				local px, py, pz = getElementPosition(thePlayer) 
				local rx, ry, rz = getElementPosition(namePlayer) 
				local distancia = getDistanceBetweenPoints3D(px, py, pz, rx, ry, rz) 
				local medKit = getElementData(thePlayer, "KitMedico") or 10000000
				if getElementData(thePlayer,"ID") == id then
            	outputDxBox(thePlayer, "Você não pode curar você mesmo.", "error")
           	return
            end

					if (distancia > 3)  then 
						outputDxBox(thePlayer, "Você precisa chegar mais perto do jogador para curá-lo.", "error")
					elseif (distancia < 2) then 
						if getElementData(namePlayer, "playerFallen") then 
							
								setPedAnimation(thePlayer, "BOMBER", "BOM_Plant", 1000, false)
								if isElement ( blip[namePlayer] ) then
								    destroyElement(blip[namePlayer])
								end
								outputDxBox(thePlayer, "Curando jogador...", "info")
								setTimer(function()
									setPedAnimation(thePlayer, "ped", "facanger")
									setPedAnimation(namePlayer, "ped", "facanger")
								end, 5000, 1)
								
								setTimer(outputDxBox, 3500, 1, thePlayer, "Você curou o jogador "..nameR, "success")
								--setTimer(outputDxBox, 5000, 1, thePlayer, "Caso fique bugado use #00ff00/debug", "success")
								setTimer(outputDxBox, 3500, 1, namePlayer, "Você foi curado por um médico!", "success")
								--setTimer(outputDxBox, 5000, 1, namePlayer, "Caso fique bugado use #00ff00/debug!", "success")
								--setTimer(givePlayerMoney, 5000, 1, thePlayer, 3000)
								setTimer(setPlayerFallen, 3500, 1, namePlayer, false)
								
								setTimer(function()
                                    setElementData ( thePlayer, "AirNewSCR_LiberarXP", "Sim" )
                                    setPedAnimation ( thePlayer )
                                    setPedAnimation ( namePlayer )
                                end, 6000, 1)								
						else
							outputDxBox(thePlayer, "O jogador não precisa ser curado.", "error")
					    end
		            end
			else			
				outputDxBox(thePlayer, "Permissão negada para teste comando!", "error") 
        end
    end
	else
		                      outputDxBox(thePlayer, "Erro! O correto é /curar ID", "error") 
	end
end
addCommandHandler("curar", curarPlayer)

function abrirsamup(source)
            local conta = getAccountName (getPlayerAccount(source))
            if isObjectInACLGroup("user."..conta, aclGetGroup("Samu")) then
            triggerClientEvent(source, "abrirpainelsamu", source)
end
end
addCommandHandler("abrirsamu",abrirsamup)
function getPlayerFromID ( id )
    for k, player in ipairs ( getElementsByType ( "player" ) ) do
            local p_id = getElementData ( player, "ID" )
            if ( p_id == tonumber(id) ) then
                    player_n = getPlayerName ( player )
                    return player, player_n
            end
    end
            
end 