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
--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><             Pi zzaria              ><
         ><><><><><><><><><><><><><><><><><><><><
--]]
Entrar = createMarker(2104.96216, -1806.47253, 13.55469 -1, "cylinder", 1.2, 16, 111, 231, 50)
Sair = createMarker(372.43909, -133.50357, 1001.49219 -1, "cylinder", 1.2, 16, 111, 231, 50)
Painel_Open = createMarker(375.85486, -118.82258, 1001.49951 -1, "cylinder", 1.2, 16, 111, 231, 50)

setElementInterior(Painel_Open, 5)
setElementDimension(Painel_Open, 5)
setElementInterior(Sair,5)
setElementDimension(Sair, 5)

function entrar (source)
	setElementInterior(source, 5)
	setElementDimension(source, 5)
	setElementPosition(source, 372.42233, -132.27959, 1001.49219)
end
addEventHandler("onMarkerHit", Entrar, entrar)

function sair (source)
	if getElementDimension(source) == 5 and getElementInterior(source) == 5 then
		setElementInterior(source, 0)
		setElementDimension(source, 0)
		setElementPosition(source, 2103.23218, -1806.45935, 13.55469)
	end
end
addEventHandler("onMarkerHit", Sair, sair)

function Abrir_Painel (source)
	local Emprego = getElementData ( source, "Emprego" )
    if isElementWithinMarker(source, Painel_Open) then
		if getElementDimension(source) == 5 and getElementInterior(source) == 5 then
			if Emprego == "Pizzaboy" then
				if getElementData ( source, "Entrega_Acionada" ) == false then
					triggerClientEvent(source, "DNL:Abrir_Pizzaria", source)	
				else
					triggerClientEvent(source, "addNotification", root, "#00ff00✘#ffffffINFO#00ff00✘➺ #ffffffVocê já está em uma viagem e não pode pegar outra")
				end
			else 
				triggerClientEvent(source, "addNotification", root, "#00ff00✘#ffffffINFO#00ff00✘➺ #ffffffApenas Motoboy's podem pegar pizzas")
			end
		end
	end
end
addEventHandler( "onMarkerHit", Painel_Open, Abrir_Painel )