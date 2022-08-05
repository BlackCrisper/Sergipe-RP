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

Caminhao_Teste = {}

function Teste_Caminhao (source) 
	if getElementData(source, "DNL:Categoria(C)") == true then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê Ja Possui essa categoria.", source, 255,255,255,true) return end  
	if getPlayerMoney(source) < 3500 then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê não tenho dinheiro suficiente para adiquirir essa categoria.", source, 255,255,255,true) return end      
	if Caminhao_Teste[source] and isElement(Caminhao_Teste[source] ) then destroyElement ( Caminhao_Teste[source] ) Caminhao_Teste[source] = nil end
    Caminhao_Teste[source] = createVehicle(573, -2046.86108, -85.36681, 35.16406)
    setElementRotation(Caminhao_Teste[source], 0, 0, 0)
    setElementDimension(source, 0)
    setElementInterior(source, 0)
	takePlayerMoney(source, 3500)
	triggerClientEvent(source, "DNL:FecharCategorias", source) 
    setTimer( setCameraTarget, 1200, 1, source )
    setTimer ( fadeCamera, 50, 1, source,false, 1 )
    setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
    setTimer(setElementPosition, 1000, 1,source, -2046.86108, -85.36681, 35.16406)

  setTimer(function()
    setElementData(source, "DNL:TestePratico", true)
    warpPedIntoVehicle ( source, Caminhao_Teste[source] )
	setElementData(source, "Hab:Caminhao", "1")
	setElementVisibleTo ( Marker_1, source, true )
	setElementVisibleTo ( Blip_01, source, true )
	triggerClientEvent(source, "DNL:TempoC(Caminhao)", source) 
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffPasse em todos locais indicados no mapa.", source, 255,255,255,true)
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffApós Concluir o Teste Ganhará sua Carteira de Habilitação #00FF00(#FFFFFFC#00FF00)", source, 255,255,255,true)  
  end, 3000, 1)
   
end
addEvent("DNL:Teste(Caminhao)", true)
addEventHandler("DNL:Teste(Caminhao)", root, Teste_Caminhao)

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 1 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_1 = createMarker ( -2019.96802, -72.56067, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_1, root, false )

Blip_01 = createBlipAttachedTo ( Marker_1, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_01, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker01 (source)
  if getElementData ( source, "Hab:Caminhao") == "1" then
   if isElementWithinMarker(source, Marker_1) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_1, source, false )
	   setElementVisibleTo ( Blip_01, source, false )
	   
	   setElementVisibleTo ( Marker_2, source, true )
	   setElementVisibleTo ( Blip_02, source, true )
	   setElementData(source, "Hab:Caminhao", "2")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(1/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_1, Marker01)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 2 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_2 = createMarker ( -2004.41870, -32.55494, 35.10410 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_2, root, false )

Blip_02 = createBlipAttachedTo ( Marker_2, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_02, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker02 (source)
  if getElementData ( source, "Hab:Caminhao") == "2" then
   if isElementWithinMarker(source, Marker_2) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_2, source, false )
	   setElementVisibleTo ( Blip_02, source, false )
	   
	   setElementVisibleTo ( Marker_3, source, true )
	   setElementVisibleTo ( Blip_03, source, true )
	   setElementData(source, "Hab:Caminhao", "3")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(2/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_2, Marker02)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 3 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_3 = createMarker ( -2004.18652, 32.36307, 32.82001 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_3, root, false )

Blip_03 = createBlipAttachedTo ( Marker_3, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_03, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker03 (source)
  if getElementData ( source, "Hab:Caminhao") == "3" then
   if isElementWithinMarker(source, Marker_3) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_3, source, false )
	   setElementVisibleTo ( Blip_03, source, false )
	   
	   setElementVisibleTo ( Marker_4, source, true )
	   setElementVisibleTo ( Blip_04, source, true )
	   setElementData(source, "Hab:Caminhao", "4")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(3/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_3, Marker03)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 4 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_4 = createMarker ( -2003.00684, 92.83712, 27.53906 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_4, root, false )

Blip_04 = createBlipAttachedTo ( Marker_4, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_04, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker04 (source)
  if getElementData ( source, "Hab:Caminhao") == "4" then
   if isElementWithinMarker(source, Marker_4) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_4, source, false )
	   setElementVisibleTo ( Blip_04, source, false )
	   
	   setElementVisibleTo ( Marker_5, source, true )
	   setElementVisibleTo ( Blip_05, source, true )
	   setElementData(source, "Hab:Caminhao", "5")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(4/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_4, Marker04)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 5 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_5 = createMarker ( -2052.37988, 111.72768, 28.95521 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_5, root, false )

Blip_05 = createBlipAttachedTo ( Marker_5, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_05, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker05 (source)
  if getElementData ( source, "Hab:Caminhao") == "5" then
   if isElementWithinMarker(source, Marker_5) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_5, source, false )
	   setElementVisibleTo ( Blip_05, source, false )
	   
	   setElementVisibleTo ( Marker_6, source, true )
	   setElementVisibleTo ( Blip_06, source, true )
	   setElementData(source, "Hab:Caminhao", "6")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(5/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_5, Marker05)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 6 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_6 = createMarker ( -2108.88721, 113.29465, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_6, root, false )

Blip_06 = createBlipAttachedTo ( Marker_6, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_06, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker06 (source)
  if getElementData ( source, "Hab:Caminhao") == "6" then
   if isElementWithinMarker(source, Marker_6) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_6, source, false )
	   setElementVisibleTo ( Blip_06, source, false )
	   
	   setElementVisibleTo ( Marker_7, source, true )
	   setElementVisibleTo ( Blip_07, source, true )
	   setElementData(source, "Hab:Caminhao", "7")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(6/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_6, Marker06)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 7 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_7 = createMarker ( -2109.64160, 45.55825, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_7, root, false )

Blip_07 = createBlipAttachedTo ( Marker_7, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_07, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker07 (source)
  if getElementData ( source, "Hab:Caminhao") == "7" then
   if isElementWithinMarker(source, Marker_7) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_7, source, false )
	   setElementVisibleTo ( Blip_07, source, false )
	   
	   setElementVisibleTo ( Marker_8, source, true )
	   setElementVisibleTo ( Blip_08, source, true )
	   setElementData(source, "Hab:Caminhao", "8")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(7/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_7, Marker07)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 8 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_8 = createMarker ( -2054.55664, 27.64933, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_8, root, false )

Blip_08 = createBlipAttachedTo ( Marker_8, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_08, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker08 (source)
  if getElementData ( source, "Hab:Caminhao") == "8" then
   if isElementWithinMarker(source, Marker_8) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_8, source, false )
	   setElementVisibleTo ( Blip_08, source, false )
	   
	   setElementVisibleTo ( Marker_9, source, true )
	   setElementVisibleTo ( Blip_09, source, true )
	   setElementData(source, "Hab:Caminhao", "9")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(8/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_8, Marker08)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 9 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_9 = createMarker ( -2009.38538, -7.97851, 34.42598 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_9, root, false )

Blip_09 = createBlipAttachedTo ( Marker_9, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_09, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker09 (source)
  if getElementData ( source, "Hab:Caminhao") == "9" then
   if isElementWithinMarker(source, Marker_9) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_9, source, false )
	   setElementVisibleTo ( Blip_09, source, false )
	   
	   setElementVisibleTo ( Marker_10, source, true )
	   setElementVisibleTo ( Blip_10, source, true )
	   setElementData(source, "Hab:Caminhao", "10")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(9/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_9, Marker09)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 10 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_10 = createMarker ( -1966.86707, -67.24134, 25.96198 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_10, root, false )

Blip_10 = createBlipAttachedTo ( Marker_10, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_10, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker10 (source)
  if getElementData ( source, "Hab:Caminhao") == "10" then
   if isElementWithinMarker(source, Marker_10) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_10, source, false )
	   setElementVisibleTo ( Blip_10, source, false )
	   
	   setElementVisibleTo ( Marker_11, source, true )
	   setElementVisibleTo ( Blip_11, source, true )
	   setElementData(source, "Hab:Caminhao", "11")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(10/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_10, Marker10)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 11 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_11 = createMarker ( -1904.05603, -93.77191, 22.01386 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_11, root, false )

Blip_11 = createBlipAttachedTo ( Marker_11, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_11, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker11 (source)
  if getElementData ( source, "Hab:Caminhao") == "11" then
   if isElementWithinMarker(source, Marker_11) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_11, source, false )
	   setElementVisibleTo ( Blip_11, source, false )
	   
	   setElementVisibleTo ( Marker_12, source, true )
	   setElementVisibleTo ( Blip_12, source, true )
	   setElementData(source, "Hab:Caminhao", "12")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(11/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_11, Marker11)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 12 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_12 = createMarker ( -1849.89355, -118.18799, 5.62681 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_12, root, false )

Blip_12 = createBlipAttachedTo ( Marker_12, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_12, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker12 (source)
  if getElementData ( source, "Hab:Caminhao") == "12" then
   if isElementWithinMarker(source, Marker_12) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_12, source, false )
	   setElementVisibleTo ( Blip_12, source, false )
	   
	   setElementVisibleTo ( Marker_13, source, true )
	   setElementVisibleTo ( Blip_13, source, true )
	   setElementData(source, "Hab:Caminhao", "13")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(12/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_12, Marker12)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 13 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_13 = createMarker ( -1849.89355, -118.18799, 5.62681 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_13, root, false )

Blip_13 = createBlipAttachedTo ( Marker_13, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_13, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker13 (source)
  if getElementData ( source, "Hab:Caminhao") == "13" then
   if isElementWithinMarker(source, Marker_13) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_13, source, false )
	   setElementVisibleTo ( Blip_13, source, false )
	   
	   setElementVisibleTo ( Marker_14, source, true )
	   setElementVisibleTo ( Blip_14, source, true )
	   setElementData(source, "Hab:Caminhao", "14")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(13/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_13, Marker13)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 14 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_14 = createMarker ( -1839.21008, -168.58179, 9.04895 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_14, root, false )

Blip_14 = createBlipAttachedTo ( Marker_14, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_14, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker14 (source)
  if getElementData ( source, "Hab:Caminhao") == "14" then
   if isElementWithinMarker(source, Marker_14) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_14, source, false )
	   setElementVisibleTo ( Blip_14, source, false )
	   
	   setElementVisibleTo ( Marker_15, source, true )
	   setElementVisibleTo ( Blip_15, source, true )
	   setElementData(source, "Hab:Caminhao", "15")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(14/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_14, Marker14)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 15 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_15 = createMarker ( -1839.41943, -222.56659, 18.22052 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_15, root, false )

Blip_15 = createBlipAttachedTo ( Marker_15, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_15, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker15 (source)
  if getElementData ( source, "Hab:Caminhao") == "15" then
   if isElementWithinMarker(source, Marker_15) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_15, source, false )
	   setElementVisibleTo ( Blip_15, source, false )
	   
	   setElementVisibleTo ( Marker_16, source, true )
	   setElementVisibleTo ( Blip_16, source, true )
	   setElementData(source, "Hab:Caminhao", "16")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(15/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_15, Marker15)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 16 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_16 = createMarker ( -1877.01306, -234.60013, 23.02688 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_16, root, false )

Blip_16 = createBlipAttachedTo ( Marker_16, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_16, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker16 (source)
  if getElementData ( source, "Hab:Caminhao") == "16" then
   if isElementWithinMarker(source, Marker_16) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_16, source, false )
	   setElementVisibleTo ( Blip_16, source, false )
	   
	   setElementVisibleTo ( Marker_17, source, true )
	   setElementVisibleTo ( Blip_17, source, true )
	   setElementData(source, "Hab:Caminhao", "17")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(16/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_16, Marker16)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 17 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_17 = createMarker ( -1993.77258, -232.20380, 35.60595 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_17, root, false )

Blip_17 = createBlipAttachedTo ( Marker_17, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_17, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker17 (source)
  if getElementData ( source, "Hab:Caminhao") == "17" then
   if isElementWithinMarker(source, Marker_17) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_17, source, false )
	   setElementVisibleTo ( Blip_17, source, false )
	   
	   setElementVisibleTo ( Marker_18, source, true )
	   setElementVisibleTo ( Blip_18, source, true )
	   setElementData(source, "Hab:Caminhao", "18")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(17/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_17, Marker17)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 18 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_18 = createMarker ( -2007.47119, -253.45306, 35.56981 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_18, root, false )

Blip_18 = createBlipAttachedTo ( Marker_18, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_18, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker18 (source)
  if getElementData ( source, "Hab:Caminhao") == "18" then
   if isElementWithinMarker(source, Marker_18) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_18, source, false )
	   setElementVisibleTo ( Blip_18, source, false )
	   
	   setElementVisibleTo ( Marker_19, source, true )
	   setElementVisibleTo ( Blip_19, source, true )
	   setElementData(source, "Hab:Caminhao", "19")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(18/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_18, Marker18)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 19 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_19 = createMarker ( -2135.27832, -289.62515, 35.41409 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_19, root, false )

Blip_19 = createBlipAttachedTo ( Marker_19, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_19, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker19 (source)
  if getElementData ( source, "Hab:Caminhao") == "19" then
   if isElementWithinMarker(source, Marker_19) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_19, source, false )
	   setElementVisibleTo ( Blip_19, source, false )
	   
	   setElementVisibleTo ( Marker_20, source, true )
	   setElementVisibleTo ( Blip_20, source, true )
	   setElementData(source, "Hab:Caminhao", "20")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(19/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_19, Marker19)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 20 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_20 = createMarker ( -2205.67480, -216.19141, 35.36720 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_20, root, false )

Blip_20 = createBlipAttachedTo ( Marker_20, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_20, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker20 (source)
  if getElementData ( source, "Hab:Caminhao") == "20" then
   if isElementWithinMarker(source, Marker_20) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_20, source, false )
	   setElementVisibleTo ( Blip_20, source, false )
	   
	   setElementVisibleTo ( Marker_21, source, true )
	   setElementVisibleTo ( Blip_21, source, true )
	   setElementData(source, "Hab:Caminhao", "21")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(20/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_20, Marker20)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 21 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_21 = createMarker ( -2164.57373, -157.13747, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_21, root, false )

Blip_21 = createBlipAttachedTo ( Marker_21, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_21, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker21 (source)
  if getElementData ( source, "Hab:Caminhao") == "21" then
   if isElementWithinMarker(source, Marker_21) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_21, source, false )
	   setElementVisibleTo ( Blip_21, source, false )
	   
	   setElementVisibleTo ( Marker_22, source, true )
	   setElementVisibleTo ( Blip_22, source, true )
	   setElementData(source, "Hab:Caminhao", "22")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(21/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_21, Marker21)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 22 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_22 = createMarker ( -2164.75879, -86.03666, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_22, root, false )

Blip_22 = createBlipAttachedTo ( Marker_22, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_22, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker22 (source)
  if getElementData ( source, "Hab:Caminhao") == "22" then
   if isElementWithinMarker(source, Marker_22) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_22, source, false )
	   setElementVisibleTo ( Blip_22, source, false )
	   
	   setElementVisibleTo ( Marker_23, source, true )
	   setElementVisibleTo ( Blip_23, source, true )
	   setElementData(source, "Hab:Caminhao", "23")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(22/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_22, Marker22)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 23 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_23 = createMarker ( -2101.89111, -72.37183, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_23, root, false )

Blip_23 = createBlipAttachedTo ( Marker_23, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_23, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker23 (source)
  if getElementData ( source, "Hab:Caminhao") == "23" then
   if isElementWithinMarker(source, Marker_23) then
    if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
	   setElementVisibleTo ( Marker_23, source, false )
	   setElementVisibleTo ( Blip_23, source, false )
	   
	   setElementVisibleTo ( Marker_24_Caminhao, source, true )
	   setElementVisibleTo ( Blip_24_Caminhao, source, true )
	   setElementData(source, "Hab:Caminhao", "24")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(23/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_23, Marker23)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 24 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_24_Caminhao = createMarker ( -2046.86108, -85.36681, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_24_Caminhao, root, false )

Blip_24_Caminhao = createBlipAttachedTo ( Marker_24_Caminhao, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_24_Caminhao, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker24_Caminhao (source)
  if getElementData ( source, "Hab:Caminhao") == "24" then
   if isElementWithinMarker(source, Marker_24_Caminhao) then
    if isPedInVehicle(source) then
     if Caminhao_Teste[source] and isElement(Caminhao_Teste[source]) then
     local HP_Veiculo = getElementHealth ( Caminhao_Teste[source] )
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(24/24)", source, 255,255,255,true)
      if HP_Veiculo < 800 then
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você danificou muito o veiculo e acabou fracassando.", source, 255,255,255,true)
      else
       local Account = getPlayerAccount(source)
       if isGuestAccount (Account) then outputChatBox ( "#ff0000✘ #ffffffERRO #ff0000✘➺ #FFFFFFVocê não está logado. Algo de errado aconteceu!", source, 255,255,255,true) return end
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFParabéns, Você Conseguiu Sua Carteira de Habilitação #00ff00(#ffffffCaminhão#00ff00)", source, 255,255,255,true)
	     playSoundFrontEnd ( source, 43 )
	     setElementData(source, "DNL:Categoria(C)", true)
	     setAccountData ( Account, "DNL:Categoria(C)", true)
	     triggerEvent("DNL:Renovar_Caminhao", source) 
      end
	     Fim_Prova_Caminhao (source)	
	     destroyElement ( Caminhao_Teste[source] )
	     setElementDimension(source, 0)
	     setElementVisibleTo ( Marker_24_Caminhao, source, false )
	     setElementVisibleTo ( Blip_24_Caminhao, source, false )
	     setElementData(source, "Hab:Caminhao", nil)
	     setElementData(source, "DNL:TestePratico", false)
	     triggerClientEvent(source, "DNL:KillTimer(Caminhao)", source) 
    end
   end
  end
 end
end
addCommandHandler("finalizar", Marker24_Caminhao)

function BlockExiVehicle ( source ) 			
  local Teste = getElementData( source, "DNL:TestePratico" )
  if Caminhao_Teste[source] and isElement( Caminhao_Teste[source] ) then  	
    if Teste == true then
    cancelEvent()
    outputChatBox ( "#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffVocê não pode sair do veiculo enquanto faz o teste.", source, 255, 255, 255, true )
    end
  end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), BlockExiVehicle)

function QuitServer ( quitType )	
  if isElement( Caminhao_Teste[source] ) then
     destroyElement ( Caminhao_Teste[source] )
  end
end
addEventHandler ( "onPlayerQuit", getRootElement(), QuitServer )

function Mensagem_Marker24_Caminhao (source)
  if getElementData ( source, "Hab:Caminhao") == "24" then
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFDigite /finalizar e irá ganhar sua Habilitação", source, 255,255,255,true)
  end
end
addEventHandler("onMarkerHit", Marker_24_Caminhao, Mensagem_Marker24_Caminhao)


function Fim_Prova_Caminhao (source)
setTimer(setElementPosition, 1000, 1,source, 1081.5048828125,-1700.4609375,13.546875)
setTimer( setCameraTarget, 1200, 1, source )
setTimer ( fadeCamera, 50, 1, source,false, 1 )
setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
setTimer(setElementDimension, 3000, 1, source, 0)	
setTimer(setElementInterior, 3000, 1, source, 0)	
showChat(source, true)  
end

function TimerMoto ()
    Fim_Prova_Caminhao (source)	
    VisibleBlips_Caminhao (source)	
	setElementData(source, "Hab:Caminhao", nil)
	setElementData(source, "DNL:TestePratico", false)
	destroyElement ( Caminhao_Teste[source] )
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você não completou a prova no tempo Correto.", source, 255,255,255,true)
end
addEvent("DNL:Tempo(Caminhao)", true)
addEventHandler("DNL:Tempo(Caminhao)", root, TimerMoto)

function VisibleBlips_Caminhao (source)	
    setElementVisibleTo ( Marker_1, source, false )
	setElementVisibleTo ( Blip_01, source, false )
	
    setElementVisibleTo ( Marker_2, source, false )
	setElementVisibleTo ( Blip_02, source, false )
	
    setElementVisibleTo ( Marker_3, source, false )
	setElementVisibleTo ( Blip_03, source, false )
	
    setElementVisibleTo ( Marker_4, source, false )
	setElementVisibleTo ( Blip_04, source, false )
	
    setElementVisibleTo ( Marker_5, source, false )
	setElementVisibleTo ( Blip_05, source, false )
	
    setElementVisibleTo ( Marker_6, source, false )
	setElementVisibleTo ( Blip_06, source, false )
	
    setElementVisibleTo ( Marker_7, source, false )
	setElementVisibleTo ( Blip_07, source, false )
	
    setElementVisibleTo ( Marker_8, source, false )
	setElementVisibleTo ( Blip_08, source, false )
	
    setElementVisibleTo ( Marker_9, source, false )
	setElementVisibleTo ( Blip_09, source, false )
	
    setElementVisibleTo ( Marker_10, source, false )
	setElementVisibleTo ( Blip_10, source, false )
	
    setElementVisibleTo ( Marker_11, source, false )
	setElementVisibleTo ( Blip_11, source, false )
	
    setElementVisibleTo ( Marker_12, source, false )
	setElementVisibleTo ( Blip_12, source, false )
	
    setElementVisibleTo ( Marker_13, source, false )
	setElementVisibleTo ( Blip_13, source, false )
	
    setElementVisibleTo ( Marker_14, source, false )
	setElementVisibleTo ( Blip_14, source, false )
	
    setElementVisibleTo ( Marker_15, source, false )
	setElementVisibleTo ( Blip_15, source, false )
	
    setElementVisibleTo ( Marker_16, source, false )
	setElementVisibleTo ( Blip_16, source, false )
	
    setElementVisibleTo ( Marker_17, source, false )
	setElementVisibleTo ( Blip_17, source, false )
	
    setElementVisibleTo ( Marker_18, source, false )
	setElementVisibleTo ( Blip_18, source, false )
	
    setElementVisibleTo ( Marker_19, source, false )
	setElementVisibleTo ( Blip_19, source, false )
	
	setElementVisibleTo ( Marker_20, source, false )
	setElementVisibleTo ( Blip_20, source, false )
	
	setElementVisibleTo ( Marker_21, source, false )
	setElementVisibleTo ( Blip_21, source, false )
	
	setElementVisibleTo ( Marker_22, source, false )
	setElementVisibleTo ( Blip_22, source, false )
	
	setElementVisibleTo ( Marker_23, source, false )
	setElementVisibleTo ( Blip_23, source, false )
	
	setElementVisibleTo ( Marker_24_Caminhao, source, false )
	setElementVisibleTo ( Blip_24_Caminhao, source, false )
end
