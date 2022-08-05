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

Carro_Teste = {}

function Teste_Carro (source)     
	if getElementData(source, "DNL:Categoria(B)") == true then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê Ja Possui essa categoria.", source, 255,255,255,true) return end  
	if getPlayerMoney(source) < 1200 then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê não tenho dinheiro suficiente para adiquirir essa categoria.", source, 255,255,255,true) return end  
	if Carro_Teste[source] and isElement(Carro_Teste[source] ) then destroyElement ( Carro_Teste[source] ) Carro_Teste[source] = nil end
    Carro_Teste[source] = createVehicle(550, -2046.86108, -85.36681, 35.16406)
    setElementRotation(Carro_Teste[source], 0, 0, 0)
    setElementDimension(source, 0)
    setElementInterior(source, 0)
	takePlayerMoney(source, 1200)
	triggerClientEvent(source, "DNL:FecharCategorias", source) 
    setTimer( setCameraTarget, 1200, 1, source )
    setTimer ( fadeCamera, 50, 1, source,false, 1 )
    setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
    setTimer(setElementPosition, 1000, 1,source, -2046.86108, -85.36681, 35.16406)
	
  setTimer(function()
    setElementData(source, "DNL:TestePratico", true)
    warpPedIntoVehicle ( source, Carro_Teste[source] )
	setElementData(source, "Hab:Carro", "1")
	setElementVisibleTo ( Marker_1_Carro, source, true )
	setElementVisibleTo ( Blip_01_Carro, source, true )
	triggerClientEvent(source, "DNL:TempoC(Carro)", source) 
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffPasse em todos locais indicados no mapa.", source, 255,255,255,true)
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffApós Concluir o Teste Ganhará sua Carteira de Habilitação #00FF00(#FFFFFFB#00FF00)", source, 255,255,255,true)
  end, 3000, 1)
   
end
addEvent("DNL:Teste(Carro)", true)
addEventHandler("DNL:Teste(Carro)", root, Teste_Carro)

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 1 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_1_Carro = createMarker ( -2019.96802, -72.56067, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_1_Carro, root, false )

Blip_01_Carro = createBlipAttachedTo ( Marker_1_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_01_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker01_Carro (source)
  if getElementData ( source, "Hab:Carro") == "1" then
   if isElementWithinMarker(source, Marker_1_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_1_Carro, source, false )
	   setElementVisibleTo ( Blip_01_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_2_Carro, source, true )
	   setElementVisibleTo ( Blip_02_Carro, source, true )
	   setElementData(source, "Hab:Carro", "2")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(1/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_1_Carro, Marker01_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 2 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_2_Carro = createMarker ( -2004.41870, -32.55494, 35.10410 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_2_Carro, root, false )

Blip_02_Carro = createBlipAttachedTo ( Marker_2_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_02_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker02_Carro (source)
  if getElementData ( source, "Hab:Carro") == "2" then
   if isElementWithinMarker(source, Marker_2_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_2_Carro, source, false )
	   setElementVisibleTo ( Blip_02_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_3_Carro, source, true )
	   setElementVisibleTo ( Blip_03_Carro, source, true )
	   setElementData(source, "Hab:Carro", "3")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(2/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_2_Carro, Marker02_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 3 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_3_Carro = createMarker ( -2004.18652, 32.36307, 32.82001 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_3_Carro, root, false )

Blip_03_Carro = createBlipAttachedTo ( Marker_3_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_03_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker03_Carro (source)
  if getElementData ( source, "Hab:Carro") == "3" then
   if isElementWithinMarker(source, Marker_3_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_3_Carro, source, false )
	   setElementVisibleTo ( Blip_03_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_4_Carro, source, true )
	   setElementVisibleTo ( Blip_04_Carro, source, true )
	   setElementData(source, "Hab:Carro", "4")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(3/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_3_Carro, Marker03_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 4 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_4_Carro = createMarker ( -2003.00684, 92.83712, 27.53906 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_4_Carro, root, false )

Blip_04_Carro = createBlipAttachedTo ( Marker_4_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_04_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker04_Carro (source)
  if getElementData ( source, "Hab:Carro") == "4" then
   if isElementWithinMarker(source, Marker_4_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_4_Carro, source, false )
	   setElementVisibleTo ( Blip_04_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_5_Carro, source, true )
	   setElementVisibleTo ( Blip_05_Carro, source, true )
	   setElementData(source, "Hab:Carro", "5")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(4/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_4_Carro, Marker04_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 5 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_5_Carro = createMarker ( -2052.37988, 111.72768, 28.95521 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_5_Carro, root, false )

Blip_05_Carro = createBlipAttachedTo ( Marker_5_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_05_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker05_Carro (source)
  if getElementData ( source, "Hab:Carro") == "5" then
   if isElementWithinMarker(source, Marker_5_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_5_Carro, source, false )
	   setElementVisibleTo ( Blip_05_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_6_Carro, source, true )
	   setElementVisibleTo ( Blip_06_Carro, source, true )
	   setElementData(source, "Hab:Carro", "6")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(5/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_5_Carro, Marker05_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 6 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_6_Carro = createMarker ( -2108.88721, 113.29465, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_6_Carro, root, false )

Blip_06_Carro = createBlipAttachedTo ( Marker_6_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_06_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker06_Carro (source)
  if getElementData ( source, "Hab:Carro") == "6" then
   if isElementWithinMarker(source, Marker_6_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_6_Carro, source, false )
	   setElementVisibleTo ( Blip_06_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_7_Carro, source, true )
	   setElementVisibleTo ( Blip_07_Carro, source, true )
	   setElementData(source, "Hab:Carro", "7")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(6/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_6_Carro, Marker06_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 7 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_7_Carro = createMarker ( -2109.64160, 45.55825, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_7_Carro, root, false )

Blip_07_Carro = createBlipAttachedTo ( Marker_7_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_07_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker07_Carro (source)
  if getElementData ( source, "Hab:Carro") == "7" then
   if isElementWithinMarker(source, Marker_7_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_7_Carro, source, false )
	   setElementVisibleTo ( Blip_07_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_8_Carro, source, true )
	   setElementVisibleTo ( Blip_08_Carro, source, true )
	   setElementData(source, "Hab:Carro", "8")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(7/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_7_Carro, Marker07_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 8 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_8_Carro = createMarker ( -2054.55664, 27.64933, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_8_Carro, root, false )

Blip_08_Carro = createBlipAttachedTo ( Marker_8_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_08_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker08_Carro (source)
  if getElementData ( source, "Hab:Carro") == "8" then
   if isElementWithinMarker(source, Marker_8_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_8_Carro, source, false )
	   setElementVisibleTo ( Blip_08_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_9_Carro, source, true )
	   setElementVisibleTo ( Blip_09_Carro, source, true )
	   setElementData(source, "Hab:Carro", "9")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(8/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_8_Carro, Marker08_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 9 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_9_Carro = createMarker ( -2009.38538, -7.97851, 34.42598 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_9_Carro, root, false )

Blip_09_Carro = createBlipAttachedTo ( Marker_9_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_09_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker09_Carro (source)
  if getElementData ( source, "Hab:Carro") == "9" then
   if isElementWithinMarker(source, Marker_9_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_9_Carro, source, false )
	   setElementVisibleTo ( Blip_09_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_10_Carro, source, true )
	   setElementVisibleTo ( Blip_10_Carro, source, true )
	   setElementData(source, "Hab:Carro", "10")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(9/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_9_Carro, Marker09_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 10 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_10_Carro = createMarker ( -1966.86707, -67.24134, 25.96198 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_10_Carro, root, false )

Blip_10_Carro = createBlipAttachedTo ( Marker_10_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_10_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker10_Carro (source)
  if getElementData ( source, "Hab:Carro") == "10" then
   if isElementWithinMarker(source, Marker_10_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_10_Carro, source, false )
	   setElementVisibleTo ( Blip_10_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_11_Carro, source, true )
	   setElementVisibleTo ( Blip_11_Carro, source, true )
	   setElementData(source, "Hab:Carro", "11")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(10/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_10_Carro, Marker10_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 11 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_11_Carro = createMarker ( -1904.05603, -93.77191, 22.01386 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_11_Carro, root, false )

Blip_11_Carro = createBlipAttachedTo ( Marker_11_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_11_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker11_Carro (source)
  if getElementData ( source, "Hab:Carro") == "11" then
   if isElementWithinMarker(source, Marker_11_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_11_Carro, source, false )
	   setElementVisibleTo ( Blip_11_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_12_Carro, source, true )
	   setElementVisibleTo ( Blip_12_Carro, source, true )
	   setElementData(source, "Hab:Carro", "12")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(11/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_11_Carro, Marker11_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 12 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_12_Carro = createMarker ( -1849.89355, -118.18799, 5.62681 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_12_Carro, root, false )

Blip_12_Carro = createBlipAttachedTo ( Marker_12_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_12_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker12_Carro (source)
  if getElementData ( source, "Hab:Carro") == "12" then
   if isElementWithinMarker(source, Marker_12_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_12_Carro, source, false )
	   setElementVisibleTo ( Blip_12_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_13_Carro, source, true )
	   setElementVisibleTo ( Blip_13_Carro, source, true )
	   setElementData(source, "Hab:Carro", "13")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(12/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_12_Carro, Marker12_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 13 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_13_Carro = createMarker ( -1849.89355, -118.18799, 5.62681 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_13_Carro, root, false )

Blip_13_Carro = createBlipAttachedTo ( Marker_13_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_13_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker13_Carro (source)
  if getElementData ( source, "Hab:Carro") == "13" then
   if isElementWithinMarker(source, Marker_13_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_13_Carro, source, false )
	   setElementVisibleTo ( Blip_13_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_14_Carro, source, true )
	   setElementVisibleTo ( Blip_14_Carro, source, true )
	   setElementData(source, "Hab:Carro", "14")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(13/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_13_Carro, Marker13_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 14 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_14_Carro = createMarker ( -1839.21008, -168.58179, 9.04895 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_14_Carro, root, false )

Blip_14_Carro = createBlipAttachedTo ( Marker_14_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_14_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker14_Carro (source)
  if getElementData ( source, "Hab:Carro") == "14" then
   if isElementWithinMarker(source, Marker_14_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_14_Carro, source, false )
	   setElementVisibleTo ( Blip_14_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_15_Carro, source, true )
	   setElementVisibleTo ( Blip_15_Carro, source, true )
	   setElementData(source, "Hab:Carro", "15")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(14/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_14_Carro, Marker14_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 15 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_15_Carro = createMarker ( -1839.41943, -222.56659, 18.22052 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_15_Carro, root, false )

Blip_15_Carro = createBlipAttachedTo ( Marker_15_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_15_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker15_Carro (source)
  if getElementData ( source, "Hab:Carro") == "15" then
   if isElementWithinMarker(source, Marker_15_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_15_Carro, source, false )
	   setElementVisibleTo ( Blip_15_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_16_Carro, source, true )
	   setElementVisibleTo ( Blip_16_Carro, source, true )
	   setElementData(source, "Hab:Carro", "16")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(15/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_15_Carro, Marker15_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 16 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_16_Carro = createMarker ( -1877.01306, -234.60013, 23.02688 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_16_Carro, root, false )

Blip_16_Carro = createBlipAttachedTo ( Marker_16_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_16_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker16_Carro (source)
  if getElementData ( source, "Hab:Carro") == "16" then
   if isElementWithinMarker(source, Marker_16_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_16_Carro, source, false )
	   setElementVisibleTo ( Blip_16_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_17_Carro, source, true )
	   setElementVisibleTo ( Blip_17_Carro, source, true )
	   setElementData(source, "Hab:Carro", "17")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(16/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_16_Carro, Marker16_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 17 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_17_Carro = createMarker ( -1993.77258, -232.20380, 35.60595 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_17_Carro, root, false )

Blip_17_Carro = createBlipAttachedTo ( Marker_17_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_17_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker17_Carro (source)
  if getElementData ( source, "Hab:Carro") == "17" then
   if isElementWithinMarker(source, Marker_17_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_17_Carro, source, false )
	   setElementVisibleTo ( Blip_17_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_18_Carro, source, true )
	   setElementVisibleTo ( Blip_18_Carro, source, true )
	   setElementData(source, "Hab:Carro", "18")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(17/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_17_Carro, Marker17_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 18 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_18_Carro = createMarker ( -2007.47119, -253.45306, 35.56981 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_18_Carro, root, false )

Blip_18_Carro = createBlipAttachedTo ( Marker_18_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_18_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker18_Carro (source)
  if getElementData ( source, "Hab:Carro") == "18" then
   if isElementWithinMarker(source, Marker_18_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_18_Carro, source, false )
	   setElementVisibleTo ( Blip_18_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_19_Carro, source, true )
	   setElementVisibleTo ( Blip_19_Carro, source, true )
	   setElementData(source, "Hab:Carro", "19")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(18/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_18_Carro, Marker18_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 19 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_19_Carro = createMarker ( -2135.27832, -289.62515, 35.41409 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_19_Carro, root, false )

Blip_19_Carro = createBlipAttachedTo ( Marker_19_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_19_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker19_Carro (source)
  if getElementData ( source, "Hab:Carro") == "19" then
   if isElementWithinMarker(source, Marker_19_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_19_Carro, source, false )
	   setElementVisibleTo ( Blip_19_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_20_Carro, source, true )
	   setElementVisibleTo ( Blip_20_Carro, source, true )
	   setElementData(source, "Hab:Carro", "20")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(19/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_19_Carro, Marker19_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 20 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_20_Carro = createMarker ( -2205.67480, -216.19141, 35.36720 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_20_Carro, root, false )

Blip_20_Carro = createBlipAttachedTo ( Marker_20_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_20_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker20_Carro (source)
  if getElementData ( source, "Hab:Carro") == "20" then
   if isElementWithinMarker(source, Marker_20_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_20_Carro, source, false )
	   setElementVisibleTo ( Blip_20_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_21_Carro, source, true )
	   setElementVisibleTo ( Blip_21_Carro, source, true )
	   setElementData(source, "Hab:Carro", "21")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(20/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_20_Carro, Marker20_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 21 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_21_Carro = createMarker ( -2164.57373, -157.13747, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_21_Carro, root, false )

Blip_21_Carro = createBlipAttachedTo ( Marker_21_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_21_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker21_Carro (source)
  if getElementData ( source, "Hab:Carro") == "21" then
   if isElementWithinMarker(source, Marker_21_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_21_Carro, source, false )
	   setElementVisibleTo ( Blip_21_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_22_Carro, source, true )
	   setElementVisibleTo ( Blip_22_Carro, source, true )
	   setElementData(source, "Hab:Carro", "22")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(21/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_21_Carro, Marker21_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 22 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_22_Carro = createMarker ( -2164.75879, -86.03666, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_22_Carro, root, false )

Blip_22_Carro = createBlipAttachedTo ( Marker_22_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_22_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker22_Carro (source)
  if getElementData ( source, "Hab:Carro") == "22" then
   if isElementWithinMarker(source, Marker_22_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_22_Carro, source, false )
	   setElementVisibleTo ( Blip_22_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_23_Carro, source, true )
	   setElementVisibleTo ( Blip_23_Carro, source, true )
	   setElementData(source, "Hab:Carro", "23")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(22/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_22_Carro, Marker22_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 23 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_23_Carro = createMarker ( -2101.89111, -72.37183, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_23_Carro, root, false )

Blip_23_Carro = createBlipAttachedTo ( Marker_23_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_23_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker23_Carro (source)
  if getElementData ( source, "Hab:Carro") == "23" then
   if isElementWithinMarker(source, Marker_23_Carro) then
    if Carro_Teste[source] and isElement(Carro_Teste[source]) then
	   setElementVisibleTo ( Marker_23_Carro, source, false )
	   setElementVisibleTo ( Blip_23_Carro, source, false )
	   
	   setElementVisibleTo ( Marker_24_Carro, source, true )
	   setElementVisibleTo ( Blip_24_Carro, source, true )
	   setElementData(source, "Hab:Carro", "24")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(23/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_23_Carro, Marker23_Carro)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 24 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_24_Carro = createMarker ( -2046.86108, -85.36681, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_24_Carro, root, false )

Blip_24_Carro = createBlipAttachedTo ( Marker_24_Carro, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_24_Carro, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker24_Carro (source)
  if getElementData ( source, "Hab:Carro") == "24" then
   if isElementWithinMarker(source, Marker_24_Carro) then
    if isPedInVehicle(source) then
     if Carro_Teste[source] and isElement(Carro_Teste[source]) then
     local HP_Veiculo = getElementHealth ( Carro_Teste[source] )
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(24/24)", source, 255,255,255,true)
      if HP_Veiculo < 800 then
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você danificou muito o veiculo e acabou fracassando.", source, 255,255,255,true)
      else
       local Account = getPlayerAccount(source)
       if isGuestAccount (Account) then outputChatBox ( "#ff0000✘ #ffffffERRO #ff0000✘➺ #FFFFFFVocê não está logado. Algo de errado aconteceu!", source, 255,255,255,true) return end
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFParabéns, Você Conseguiu Sua Carteira de Habilitação #00ff00(#ffffffCarro#00ff00)", source, 255,255,255,true)
	     playSoundFrontEnd ( source, 43 )
	     setElementData(source, "DNL:Categoria(B)", true)
	     setAccountData ( Account, "DNL:Categoria(B)", true)
	     triggerEvent("DNL:Renovar_Carro", source) 
      end
	     destroyElement ( Carro_Teste[source] )
	     setElementDimension(source, 0)
	     setElementVisibleTo ( Marker_24_Carro, source, false )
	     setElementVisibleTo ( Blip_24_Carro, source, false )
	     setElementData(source, "Hab:Carro", nil)
	     setElementData(source, "DNL:TestePratico", false)
	     Fim_Prova_Carros (source)	
	     triggerClientEvent(source, "DNL:KillTimer(Carro)", source) 
    end
   end
  end
 end
end
addCommandHandler("finalizar", Marker24_Carro)

function BlockExiVehicle ( source ) 			
  local Teste = getElementData( source, "DNL:TestePratico" )
  if Carro_Teste[source] and isElement( Carro_Teste[source] ) then  	
    if Teste == true then
    cancelEvent()
    outputChatBox ( "#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffVocê não pode sair do veiculo enquanto faz o teste.", source, 255, 255, 255, true )
    end
  end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), BlockExiVehicle)

function QuitServer ( quitType )	
  if isElement( Carro_Teste[source] ) then
     destroyElement ( Carro_Teste[source] )
  end
end
addEventHandler ( "onPlayerQuit", getRootElement(), QuitServer )

function Mensagem_Marker24_Carro (source)
  if getElementData ( source, "Hab:Carro") == "24" then
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFDigite /finalizar e irá ganhar sua Habilitação", source, 255,255,255,true)
  end
end
addEventHandler("onMarkerHit", Marker_24_Carro, Mensagem_Marker24_Carro)

function TimerMoto ()
    Fim_Prova_Carros (source)	
    VisibleBlips_Carros (source)	
	setElementData(source, "Hab:Carro", nil)
	setElementData(source, "DNL:TestePratico", false)
	destroyElement ( Carro_Teste[source] )
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você não completou a prova no tempo Correto.", source, 255,255,255,true)
end
addEvent("DNL:Tempo(Carro)", true)
addEventHandler("DNL:Tempo(Carro)", root, TimerMoto)


function Fim_Prova_Carros (source)
setTimer(setElementPosition, 1000, 1,source, 1081.5048828125,-1700.4609375,13.546875)
setTimer( setCameraTarget, 1200, 1, source )
setTimer ( fadeCamera, 50, 1, source,false, 1 )
setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
setTimer(setElementDimension, 3000, 1, source, 0)	
setTimer(setElementInterior, 3000, 1, source, 0)	
showChat(source, true)  
end

function VisibleBlips_Carros (source)	
    setElementVisibleTo ( Marker_1_Carro, source, false )
	setElementVisibleTo ( Blip_01_Carro, source, false )
	
	setElementVisibleTo ( Marker_2_Carro, source, false )
	setElementVisibleTo ( Blip_02_Carro, source, false )
	
	setElementVisibleTo ( Marker_3_Carro, source, false )
	setElementVisibleTo ( Blip_03_Carro, source, false )
	
	setElementVisibleTo ( Marker_4_Carro, source, false )
	setElementVisibleTo ( Blip_04_Carro, source, false )
	
	setElementVisibleTo ( Marker_5_Carro, source, false )
	setElementVisibleTo ( Blip_05_Carro, source, false )
	
	setElementVisibleTo ( Marker_6_Carro, source, false )
	setElementVisibleTo ( Blip_06_Carro, source, false )
	
	setElementVisibleTo ( Marker_7_Carro, source, false )
	setElementVisibleTo ( Blip_07_Carro, source, false )
	
	setElementVisibleTo ( Marker_8_Carro, source, false )
	setElementVisibleTo ( Blip_08_Carro, source, false )
	
	setElementVisibleTo ( Marker_9_Carro, source, false )
	setElementVisibleTo ( Blip_09_Carro, source, false )
	
	setElementVisibleTo ( Marker_10_Carro, source, false )
	setElementVisibleTo ( Blip_10_Carro, source, false )
	
	setElementVisibleTo ( Marker_11_Carro, source, false )
	setElementVisibleTo ( Blip_11_Carro, source, false )
	
	setElementVisibleTo ( Marker_12_Carro, source, false )
	setElementVisibleTo ( Blip_12_Carro, source, false )
	
	setElementVisibleTo ( Marker_13_Carro, source, false )
	setElementVisibleTo ( Blip_13_Carro, source, false )
	
	setElementVisibleTo ( Marker_14_Carro, source, false )
	setElementVisibleTo ( Blip_14_Carro, source, false )
	
	setElementVisibleTo ( Marker_15_Carro, source, false )
	setElementVisibleTo ( Blip_15_Carro, source, false )
	
	setElementVisibleTo ( Marker_16_Carro, source, false )
	setElementVisibleTo ( Blip_16_Carro, source, false )
	
	setElementVisibleTo ( Marker_17_Carro, source, false )
	setElementVisibleTo ( Blip_17_Carro, source, false )
	
	setElementVisibleTo ( Marker_18_Carro, source, false )
	setElementVisibleTo ( Blip_18_Carro, source, false )
	
	setElementVisibleTo ( Marker_19_Carro, source, false )
	setElementVisibleTo ( Blip_19_Carro, source, false )
	
	setElementVisibleTo ( Marker_20_Carro, source, false )
	setElementVisibleTo ( Blip_20_Carro, source, false )
	
	setElementVisibleTo ( Marker_21_Carro, source, false )
	setElementVisibleTo ( Blip_21_Carro, source, false )
	
	setElementVisibleTo ( Marker_22_Carro, source, false )
	setElementVisibleTo ( Blip_22_Carro, source, false )
	
	setElementVisibleTo ( Marker_23_Carro, source, false )
	setElementVisibleTo ( Blip_23_Carro, source, false )
	
	setElementVisibleTo ( Marker_24_Carro, source, false )
	setElementVisibleTo ( Blip_24_Carro, source, false )
end
