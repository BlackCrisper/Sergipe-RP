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
         ><                Shop                ><
         ><><><><><><><><><><><><><><><><><><><><
--]]
Entrar = createMarker(1170.74634, -1489.74402, 22.75526 -1, "cylinder", 1.2, 16, 111, 231, 90)
Sair = createMarker(227.03181, -8.22177, 1002.21094 -1, "cylinder", 1.2, 16, 111, 231, 90)
Painel_Open = createMarker(206.38268, -8.05514, 1001.21094 -1, "cylinder", 1.2, 16, 111, 231, 90)

Blip = createBlipAttachedTo ( Entrar, 26 )
setBlipVisibleDistance(Blip, 150)
setElementInterior(Painel_Open, 5)
setElementInterior(Sair,5)

function entrar (thePlayer)
	setElementInterior(thePlayer, 5)
	setElementPosition(thePlayer, 225.10381, -8.26535, 1002.21094)
	setElementDimension(thePlayer, 0)
end
addEventHandler("onMarkerHit", Entrar, entrar)

function sair (thePlayer)
	setElementInterior(thePlayer, 0)
	setElementPosition(thePlayer, 1167.95679, -1489.63367, 22.75731)
	setElementDimension(thePlayer, 0)
end
addEventHandler("onMarkerHit", Sair, sair)

function Open_Joalheria(thePlayer)
	if isElementWithinMarker(thePlayer, Painel_Open) then
		if getElementInterior(source) == 5 then
			triggerClientEvent(thePlayer,"DNL:Abrir_Joalheria",thePlayer)	 
		end
	end
end
addEventHandler( "onMarkerHit", Painel_Open, Open_Joalheria )