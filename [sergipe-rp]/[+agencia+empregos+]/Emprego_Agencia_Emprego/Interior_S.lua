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
         ><             Prefeitura             ><
         ><><><><><><><><><><><><><><><><><><><><
--]]
Entrar = createMarker(1481.056, -1771.025, 17.796, "cylinder", 1.2,16, 111, 231, 90)
Sair = createMarker(246.3935546875,107.3017578125,1004.10575, "arrow", 1.2,16, 111, 231, 90)
Painel_Open = createMarker(246.69653, 118.40524, 1003.21875 -1, "cylinder", 1.2,16, 111, 231, 90)

Blip = createBlipAttachedTo ( Entrar, 61 )
setBlipVisibleDistance(Blip, 150)
setElementInterior(Painel_Open, 10)
setElementInterior(Sair,10)

function entrar (thePlayer)
	setElementInterior(thePlayer, 10)
	setElementPosition(thePlayer, 246.583984375,109.3369140625,1003.21875)
	setElementDimension(thePlayer, 0)
end
addEventHandler("onMarkerHit", Entrar, entrar)

function sair (thePlayer)
	setElementInterior(thePlayer, 0)
	setElementPosition(thePlayer, 1480.824, -1768.421, 18.796)
	setElementDimension(thePlayer, 0)
end
addEventHandler("onMarkerHit", Sair, sair)

function OpenguiAG(thePlayer)
	local account = getPlayerAccount (thePlayer)
    if isGuestAccount (account) then outputChatBox ( "#106FE7✘ #ffffffAGENCIA #106FE7✘➺ #FFFFFFVocê não pode trabalhar deslogado, Crie uma Conta!", thePlayer, 255,255,255,true) return end
    if isElementWithinMarker(thePlayer, Painel_Open) then
		triggerClientEvent(thePlayer,"AG:Abrir",thePlayer)	 
  end
end
addEventHandler( "onMarkerHit", Painel_Open, OpenguiAG )