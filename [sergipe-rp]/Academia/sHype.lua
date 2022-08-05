
local blip = createBlip(1063.873, -1783.363, 12.643, 54)
setElementData(blip, "blipName", "Academia")

local my = createColSphere (1063.922, -1785.153, 12.647, 3)


local atendente = createPed(251, 1063.873, -1783.363, 13.643)
setElementData(atendente, "Hype>Academia", true)

setElementData(atendente, "Ped:Name", "Academia CMR")


setElementFrozen(atendente, true)
setElementRotation(atendente, 0, 0, 180)


addEventHandler("onColShapeHit", getRootElement(),
function (thePlayer)
     if (source == my) then
	     outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
	     outputChatBox("#FFA000  ***  #FFFFFFACADEMIA INFORMAÇÔES  #FFA000***  ", thePlayer, 255,255,255, true)
		 if (getElementData(thePlayer, "academia:serie")) then
		    outputChatBox("#FFA000[CMR Academia] #FFFFFFSeu total de séries #FFA000"..getElementData(thePlayer, "academia:serie"), thePlayer, 255,255,255, true)
		 end
	     outputChatBox("#FFA000[CMR Academia] #FFFFFFTreinos diários #FFA00010", thePlayer, 255,255,255, true)
	     outputChatBox("#FFA000[CMR Academia] #FFFFFFValor por aula #FFA000R$100,00", thePlayer, 255,255,255, true)
		 outputChatBox("#FFA000[CMR Academia] #FFFFFFSéries diarias #FFA0000/10", thePlayer, 255,255,255, true)
		 outputChatBox("#FFA000[CMR Academia] #FFFFFFTempo por Exercicio #FFA0001 Minuto", thePlayer, 255,255,255, true)
		 outputChatBox("#FFA000[ATENÇÂO] #FFFFFFSe quiser começar as aulas clique no PED para pagar sua matricula.", thePlayer, 255,255,255, true)
	 end
end)


function pagarMensalidade (thePlayer)
     if (getPlayerMoney(thePlayer) < 100) then
	     outputChatBox("#FFA000[ACADEMIA: ERROR] #FFFFFFVocê não possui o valor para matricula.", thePlayer, 255,255,255, true)  
		 else
		 if (getElementData(thePlayer, "academia:matricula") == true) then
		     outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já possui uma matricula.", thePlayer, 255,255,255, true)
			 else
			     setElementData(thePlayer, "academia:matricula", true)
				 outputChatBox("#FFA000[ACADEMIA] #FFFFFFMatricula feita com sucesso, Bom treino!.", thePlayer, 255,255,255, true)
				 setElementData(thePlayer, "academia:exercicio", 0)
				 takePlayerMoney(thePlayer, 100)
				 if (getElementData(thePlayer, "academia:serie")) then
				     setElementData(thePlayer, "academia:serie", getElementData(thePlayer, "academia:serie") + 1)
					 else
					 setElementData(thePlayer, "academia:serie", 0)
					 setElementData(thePlayer, "academia:serie", getElementData(thePlayer, "academia:serie") + 1)
				 end
		 end
	 end
end
addEvent("Hype>Mensalidade", true)
addEventHandler("Hype>Mensalidade", getRootElement(), pagarMensalidade)

function esteira (thePlayer, Esteira)
local x,y,z = getElementPosition(Esteira)
     if (getElementData(Esteira, "Esteira:Ocupada") == true) then
	 outputChatBox("#FFA000[ACADEMIA] #FFFFFFEssa esteira está sendo usada.", thePlayer, 255,255,255, true)
     else
		 if not (getElementData(thePlayer, "academia:matricula") == true) then
		 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê não tem matricula na academia.", thePlayer, 255,255,255, true)
		 else 
			 if  (getElementData(thePlayer, "Exercicio") == true) then
		     outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já está fazendo um exercicio.", thePlayer, 255,255,255, true)
		     else 
			     if (getElementData(thePlayer, "academia:exercicio") >= 10) then
				     cancelMatricula(thePlayer) 
			         outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	     	         outputChatBox(" ", thePlayer, 255,255,255, true)
	     		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já atingiu os #FFA00010 treinos.", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFRenove seu contrato com a academia.", thePlayer, 255,255,255, true)
	    			 return
				 end
		         setElementData(Esteira, "Esteira:Ocupada", true)
			     setElementRotation(thePlayer, 0, 0, 92.352)
		     	 setElementPosition(thePlayer, x + 1.5, y, z + 0.5)
				 setElementData(thePlayer, "academia:exercicio", getElementData(thePlayer, "academia:exercicio") + 1)
		    	 setPedAnimation(thePlayer, "GYMNASIUM", "gym_tread_geton", -1, true, false, false )
		    	 setTimer(setPedAnimation, 2000, 1,thePlayer, "GYMNASIUM", "gym_tread_walk", -1, true, false, false )
				 setTimer(setPedAnimation, 20000, 1,thePlayer, "GYMNASIUM", "gym_tread_jog", -1, true, false, false )
				 setTimer(setPedAnimation, 40000, 1,thePlayer, "GYMNASIUM", "gym_tread_sprint", -1, true, false, false )
				 setTimer(setPedAnimation, 50000, 1,thePlayer, "GYMNASIUM", "gym_tread_jog", -1, true, false, false )
				 setTimer(setPedAnimation, 55000, 1,thePlayer, "GYMNASIUM", "gym_tread_walk", -1, true, false, false )
		    	 setTimer(setElementFrozen, 1900, 1, thePlayer, true)
				 setTimer(triggerClientEvent, 1900, 1,thePlayer, "openProgress", root)
				 setTimer(function (thePlayer)
				  setElementFrozen(thePlayer, false)
				  setElementData(thePlayer, "Exercicio", false)
				  setPedAnimation(thePlayer, "GYMNASIUM", "gym_tread_getoff", -1, true, false, false )
				  setTimer(setPedAnimation, 3000, 1,thePlayer)
				  setElementData(Esteira, "Esteira:Ocupada", false)
				  triggerClientEvent(thePlayer, "openProgress", root)
				  setPedStat(thePlayer, 21, getPedStat ( thePlayer, 21 ) - 250)
				 end, 61900, 1, thePlayer)
		    	 setElementData(thePlayer, "Exercicio", true)
		    	 outputChatBox("#FFA000[ACADEMIA] #FFFFFFFazendo Esteira. Treinos ("..getElementData(thePlayer, "academia:exercicio").."#FFA000/10#FFFFFF).", thePlayer, 255,255,255, true)
			 end
	     end
	 end
end
addEvent("Academia:Esteira", true)
addEventHandler("Academia:Esteira", getRootElement(), esteira)

function bike (thePlayer, Bike)
local x,y,z = getElementPosition(Bike)
     if (getElementData(Bike, "Bike:Ocupada") == true) then
	 outputChatBox("#FFA000[ACADEMIA] #FFFFFFEssa Bicileta está sendo usada.", thePlayer, 255,255,255, true)
     else
		 if not (getElementData(thePlayer, "academia:matricula") == true) then
		 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê não tem matricula na academia.", thePlayer, 255,255,255, true)
		 else 
			 if  (getElementData(thePlayer, "Exercicio") == true) then
		     outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já está fazendo um exercicio.", thePlayer, 255,255,255, true)
		     else 
			     if (getElementData(thePlayer, "academia:exercicio") >= 10) then
				     cancelMatricula(thePlayer) 
			         outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	     	         outputChatBox(" ", thePlayer, 255,255,255, true)
	     		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já atingiu os #FFA00010 treinos.", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFRenove seu contrato com a academia.", thePlayer, 255,255,255, true)
	    			 return
				 end
		         setElementData(Bike, "Bike:Ocupada", true)
			     setElementRotation(thePlayer, 0, 0, 180)
		     	 setElementPosition(thePlayer, x + 0.5, y + 0.4, z + 1)
				 setElementData(thePlayer, "academia:exercicio", getElementData(thePlayer, "academia:exercicio") + 1)
		    	 setPedAnimation(thePlayer, "GYMNASIUM", "gym_bike_geton", -1, true, false, false )
		    	 setTimer(setPedAnimation, 1500, 1,thePlayer, "GYMNASIUM", "gym_bike_pedal", -1, true, false, false )
				 setTimer(setPedAnimation, 20000, 1,thePlayer, "GYMNASIUM", "gym_bike_slow", -1, true, false, false )
				 setTimer(setPedAnimation, 40000, 1,thePlayer, "GYMNASIUM", "gym_bike_fast", -1, true, false, false )
				 setTimer(setPedAnimation, 50000, 1,thePlayer, "GYMNASIUM", "gym_bike_slow", -1, true, false, false )
				 setTimer(setPedAnimation, 52000, 1,thePlayer, "GYMNASIUM", "gym_bike_still", -1, true, false, false )
				 setTimer(setPedAnimation, 60000, 1,thePlayer, "GYMNASIUM", "gym_bike_celebrate", -1, true, false, false )
		    	 setTimer(setElementFrozen, 1400, 1, thePlayer, true)
				 setTimer(triggerClientEvent, 1000, 1,thePlayer, "openProgress", root)
				 setTimer(function (thePlayer)
				  setElementFrozen(thePlayer, false)
				  setElementData(thePlayer, "Exercicio", false)
				  setPedAnimation(thePlayer, "GYMNASIUM", "gym_bike_getoff", -1, true, false, false )
				  setTimer(setPedAnimation, 800, 1,thePlayer)
				  setElementData(Bike, "Bike:Ocupada", false)
				  triggerClientEvent(thePlayer, "openProgress", root)
				  setPedStat(thePlayer, 21, getPedStat ( thePlayer, 21 ) - 250)
				 end, 61900, 1, thePlayer)
		    	 setElementData(thePlayer, "Exercicio", true)
		    	 outputChatBox("#FFA000[ACADEMIA] #FFFFFFFazendo Exercicio de Bicileta. Treinos ("..getElementData(thePlayer, "academia:exercicio").."#FFA000/10#FFFFFF).", thePlayer, 255,255,255, true)
			 end
	     end
	 end
end
addEvent("Academia:Bike", true)
addEventHandler("Academia:Bike", getRootElement(), bike)

local malhar2 = createColCuboid(1075.02136, -1807.30298, 12.75367, 9.382080078125, 6.935546875, 4.000001335144)

addEventHandler("onColShapeHit", malhar2,
function (thePlayer)
    -- if (source == malhar) then
	     outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox("#FFA000[ACADEMIA] #FFFFFFDigite #FFA000/malhar #FFFFFFPara iniciar.", thePlayer, 255,255,255, true)
	 --end
end)

peso  = {}
peso2 = {}

addCommandHandler("malhar",
function (thePlayer)
	     if ( tonumber(getElementData(thePlayer, "academia:serie") or 0) > 10) then
		     return
		 end
         if isElementWithinColShape (thePlayer, malhar2) then
		 if not (getElementData(thePlayer, "academia:matricula") == true) then
		 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê não tem matricula na academia.", thePlayer, 255,255,255, true)
		 else 
			 if (getElementData(thePlayer, "Exercicio") == true) then
		     outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já está fazendo um exercicio.", thePlayer, 255,255,255, true)
		     return
             end			 
			     if (getElementData(thePlayer, "academia:exercicio") >= 10) then
				     cancelMatricula(thePlayer) 
			         outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	     	         outputChatBox(" ", thePlayer, 255,255,255, true)
	     		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já atingiu os #FFA00010 treinos.", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFRenove seu contrato com a academia.", thePlayer, 255,255,255, true)
	    			 return
				 end
		     peso[thePlayer]  = createObject(3071, 0, 0, 0)
			 peso2[thePlayer] = createObject(3071, 0, 0, 0)
			 setElementData(thePlayer, "Exercicio", true)
			 setTimer(function(thePlayer)
			 exports.bone_attach:attachElementToBone(peso[thePlayer],thePlayer,11, 0,0,0,0,-90,0) 
			 exports.bone_attach:attachElementToBone(peso2[thePlayer],thePlayer,12, 0,0,0,0,-90,0)		 
			 triggerClientEvent(thePlayer, "openProgress", root)
			 end, 2000, 1, thePlayer)
			 setElementFrozen(thePlayer, true)
			 setPedAnimation(thePlayer, "Freeweights", "gym_free_pickup", -1, true, false, false )
			 setTimer(setPedAnimation, 2000, 1,thePlayer, "Freeweights", "gym_free_up_smooth", -1, true, false, false )
			 setElementData(thePlayer, "academia:exercicio", getElementData(thePlayer, "academia:exercicio") + 1)
			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFFazendo Exercicio de Bicpes. Treinos ("..getElementData(thePlayer, "academia:exercicio").."#FFA000/10#FFFFFF).", thePlayer, 255,255,255, true)
		      setTimer(function (thePlayer)
				  setElementFrozen(thePlayer, false)
				  setElementData(thePlayer, "Exercicio", false)
				  setPedAnimation(thePlayer, "Freeweights", "gym_free_putdown", -1, true, false, false )
				  if isElement(peso[thePlayer]) then
				     destroyElement(peso[thePlayer])
				  end
				  if isElement(peso2[thePlayer]) then
				     destroyElement(peso2[thePlayer])
				  end
				  setPedStat(thePlayer, 23, getPedStat ( thePlayer, 23 ) + 250)
				  triggerClientEvent(thePlayer, "openProgress", root)
				  setTimer(setPedAnimation, 1500, 1,thePlayer)
		     end, 62000, 1, thePlayer)
		 end
	 end
end)

function malharPeso (thePlayer, Peso)
local x,y,z = getElementPosition(Peso)
     if (getElementData(Peso, "Peso:Ocupada") == true) then
	 outputChatBox("#FFA000[ACADEMIA] #FFFFFFEssa Bicileta está sendo usada.", thePlayer, 255,255,255, true)
     else
		 if not (getElementData(thePlayer, "academia:matricula") == true) then
		 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê não tem matricula na academia.", thePlayer, 255,255,255, true)
		 else 
			 if  (getElementData(thePlayer, "Exercicio") == true) then
		     outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já está fazendo um exercicio.", thePlayer, 255,255,255, true)
             else
			     if (getElementData(thePlayer, "academia:exercicio") >= 10) then
				     cancelMatricula(thePlayer) 
			         outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	     	         outputChatBox(" ", thePlayer, 255,255,255, true)
	     		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    		     outputChatBox(" ", thePlayer, 255,255,255, true)
	    	         outputChatBox(" ", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFVocê já atingiu os #FFA00010 treinos.", thePlayer, 255,255,255, true)
	    			 outputChatBox("#FFA000[ACADEMIA] #FFFFFFRenove seu contrato com a academia.", thePlayer, 255,255,255, true)
	    			 return
				 end
		         setElementData(Peso, "Peso:Ocupada", true)
		     	 setElementPosition(thePlayer, x, y - 1, z + 1.1)
				 triggerClientEvent(thePlayer, "openProgress", root)
				 setElementRotation(thePlayer, -0, 0, 357.219)
		         peso[thePlayer]  = createObject(3071, 0, 0, 0)
			     peso2[thePlayer] = createObject(3071, 0, 0, 0)
			     exports.bone_attach:attachElementToBone(peso[thePlayer],thePlayer,11, 0,0,0,0,-90,0) 
			     exports.bone_attach:attachElementToBone(peso2[thePlayer],thePlayer,12, 0,0,0,0,-90,0) 
				 setElementCollisionsEnabled(Peso, false)
				 setTimer(setElementRotation, 1000,1,thePlayer, -0, 0, 0)
				 setElementData(thePlayer, "academia:exercicio", getElementData(thePlayer, "academia:exercicio") + 1)
				 setTimer(setElementFrozen, 1100, 1,thePlayer, true)
		    	 setTimer(setPedAnimation, 1500, 1,thePlayer, "benchpress", "gym_bp_down", -1, true, false, false )
				 setTimer(function (thePlayer)
				  setElementFrozen(thePlayer, false)
				  setElementData(thePlayer, "Exercicio", false)
				  setPedAnimation(thePlayer, "benchpress", "gym_bp_getoff", -1, true, false, false )
				  if isElement(peso[thePlayer]) then
				     setTimer(destroyElement, 2000, 1,peso[thePlayer])
				  end
				  if isElement(peso2[thePlayer]) then
				     setTimer(destroyElement, 2000, 1,peso2[thePlayer])
				  end
				  setPedStat(thePlayer, 23, getPedStat ( thePlayer, 23 ) + 250)
				  setElementData(Peso, "Peso:Ocupada", false)
				  setElementCollisionsEnabled(Peso, true)
				  setTimer(setPedAnimation, 5000, 1,thePlayer)
				  triggerClientEvent(thePlayer, "openProgress", root)
				 end, 61900, 1, thePlayer)
		    	 setElementData(thePlayer, "Exercicio", true)
		    	 outputChatBox("#FFA000[ACADEMIA] #FFFFFFFazendo Exercicio de Peitoral. Treinos ("..getElementData(thePlayer, "academia:exercicio").."#FFA000/10#FFFFFF).", thePlayer, 255,255,255, true)
			 end
	     end
	 end
end
addEvent("Academia:Peso", true)
addEventHandler("Academia:Peso", getRootElement(), malharPeso)

local esteira = createColCuboid(1059.49585, -1803.72009, 12.70729, 3.6590576171875, 15.164184570313, 4.0471490859985)

addEventHandler("onColShapeHit", esteira,
function (hitElement)
triggerClientEvent(hitElement,"JoinQuitGtaV:notifications", hitElement,"academia", "Para usar a esteira pressione M e clique na esteira com o botão do mouse esquerdo!", 7 )
end)


local bicicleta = createColCuboid(1059.49780, -1807.30066, 12.71205, 8.630615234375, 3.069091796875, 4.1767534255981)

addEventHandler("onColShapeHit", bicicleta,
function (hitElement)
triggerClientEvent(hitElement,"JoinQuitGtaV:notifications", hitElement,"academia", "Para usar a bicicleta pressione M e clique na bicicleta com o botão do mouse esquerdo!", 7 )
end)


local malhar = createColCuboid(1075.02136, -1807.30298, 12.75367, 9.382080078125, 6.935546875, 4.000001335144)

addEventHandler("onColShapeHit", malhar,
function (hitElement)
triggerClientEvent(hitElement,"JoinQuitGtaV:notifications", hitElement,"academia", "Para malhar digite no chat /malhar!", 7 )
end)

addEventHandler("onColShapeLeave", malhar,
function (hitElement)
	 if isElement(peso[hitElement]) then
		 destroyElement(peso[hitElement])
	 end
	 if isElement(peso2[hitElement]) then
		 destroyElement(peso2[hitElement])
	 end
end)

local peitoral = createColCuboid(1072.21716, -1785.78577, 12.75367, 12.47021484375, 3.5732421875, 4.3000015258789)

addEventHandler("onColShapeHit", peitoral,
function (hitElement)
triggerClientEvent(hitElement,"JoinQuitGtaV:notifications", hitElement,"academia", "Para fazer exercicio de peito pressione M e clique no equipamento com o botão do mouse esquerdo!", 7 )
end)


function cancelMatricula (thePlayer)
	 setElementData(thePlayer, "academia:matricula", false)
	 setElementData(thePlayer, "academia:exercicio", 0)
end

addEventHandler ( 'onPlayerQuit', root, function ()
    local accQuit = getPlayerAccount ( source )
    saveAccountData ( accQuit )
end )

function saveAccountData ( account )
     if isGuestAccount ( account ) then
        return false
    end
	 if (getElementData(source, "academia:serie")) then
      setAccountData (account, "academia:series", tostring (getElementData(source, "academia:serie")))
     return true
	 end
end

addEventHandler ( 'onPlayerLogin', root, function ( _,acc )
    if isGuestAccount ( acc ) then
        return
    end
    local accountData = getAccountData (acc, "academia:series")
    if (accountData) then
        local playerseries = getAccountData (acc, "academia:series")
		setElementData(source, "academia:serie", playerseries)
    end
end )