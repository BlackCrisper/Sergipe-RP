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

Moto_Teste = {}

function Teste_Moto (source)  
	--if getElementData(source, "DNL:Categoria(A)") == true then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê Ja Possui essa categoria.", source, 255,255,255,true) return end  
	if getPlayerMoney(source) < 800 then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê não tenho dinheiro suficiente para adiquirir essa categoria.", source, 255,255,255,true) return end  
	if Moto_Teste[source] and isElement( Moto_Teste[source] ) then destroyElement ( Moto_Teste[source] ) Moto_Teste[source] = nil end
    Moto_Teste[source] = createVehicle(468, -2046.86108, -85.36681, 35.16406)
    setElementRotation(Moto_Teste[source], 0, 0, 0)
    setElementDimension(source, 0)
    setElementInterior(source, 0)
	takePlayerMoney(source, 800)
	triggerClientEvent(source, "DNL:FecharCategorias", source) 
    setTimer( setCameraTarget, 1200, 1, source )
    setTimer ( fadeCamera, 50, 1, source,false, 1 )
    setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
    setTimer(setElementPosition, 1000, 1,source, -2046.86108, -85.36681, 35.16406)
	
  setTimer(function()
    setElementData(source, "DNL:TestePratico", true)
    warpPedIntoVehicle ( source, Moto_Teste[source] )
	setElementData(source, "Hab:Moto", "1")
	setElementVisibleTo ( Marker_1_Moto, source, true )
	setElementVisibleTo ( Blip_01_Moto, source, true )
	triggerClientEvent(source, "DNL:TempoC(Moto)", source) 
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffPasse em todos locais indicados no mapa.", source, 255,255,255,true)
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffApós Concluir o Teste Ganhará sua Carteira de Habilitação #00FF00(#FFFFFFA#00FF00)", source, 255,255,255,true)   
  end, 3000, 1)
  
end
addEvent("DNL:Teste(Moto)", true)
addEventHandler("DNL:Teste(Moto)", root, Teste_Moto)

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 1 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_1_Moto = createMarker ( -2065.00342, -68.20168, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_1_Moto, root, false )

Blip_01_Moto = createBlipAttachedTo ( Marker_1_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_01_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker01_Moto (source)
  if getElementData ( source, "Hab:Moto") == "1" then
   if isElementWithinMarker(source, Marker_1_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_1_Moto, source, false )
	   setElementVisibleTo ( Blip_01_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_2_Moto, source, true )
	   setElementVisibleTo ( Blip_02_Moto, source, true )
	   setElementData(source, "Hab:Moto", "2")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(1/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_1_Moto, Marker01_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 2 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_2_Moto = createMarker ( -2084.76660, -24.22812, 35.18561 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_2_Moto, root, false )

Blip_02_Moto = createBlipAttachedTo ( Marker_2_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_02_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker02_Moto (source)
  if getElementData ( source, "Hab:Moto") == "2" then
   if isElementWithinMarker(source, Marker_2_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_2_Moto, source, false )
	   setElementVisibleTo ( Blip_02_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_3_Moto, source, true )
	   setElementVisibleTo ( Blip_03_Moto, source, true )
	   setElementData(source, "Hab:Moto", "3")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(2/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_2_Moto, Marker02_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 3 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_3_Moto = createMarker ( -2094.27954, 33.62561, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_3_Moto, root, false )

Blip_03_Moto = createBlipAttachedTo ( Marker_3_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_03_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker03_Moto (source)
  if getElementData ( source, "Hab:Moto") == "3" then
   if isElementWithinMarker(source, Marker_3_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_3_Moto, source, false )
	   setElementVisibleTo ( Blip_03_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_4_Moto, source, true )
	   setElementVisibleTo ( Blip_04_Moto, source, true )
	   setElementData(source, "Hab:Moto", "4")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(3/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_3_Moto, Marker03_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 4 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_4_Moto = createMarker ( -2104.93555, 58.31976, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_4_Moto, root, false )

Blip_04_Moto = createBlipAttachedTo ( Marker_4_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_04_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker04_Moto (source)
  if getElementData ( source, "Hab:Moto") == "4" then
   if isElementWithinMarker(source, Marker_4_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_4_Moto, source, false )
	   setElementVisibleTo ( Blip_04_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_5_Moto, source, true )
	   setElementVisibleTo ( Blip_05_Moto, source, true )
	   setElementData(source, "Hab:Moto", "5")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(4/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_4_Moto, Marker04_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 5 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_5_Moto = createMarker ( -2059.06641, 107.33273, 29.46260 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_5_Moto, root, false )

Blip_05_Moto = createBlipAttachedTo ( Marker_5_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_05_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker05_Moto (source)
  if getElementData ( source, "Hab:Moto") == "5" then
   if isElementWithinMarker(source, Marker_5_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_5_Moto, source, false )
	   setElementVisibleTo ( Blip_05_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_6_Moto, source, true )
	   setElementVisibleTo ( Blip_06_Moto, source, true )
	   setElementData(source, "Hab:Moto", "6")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(5/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_5_Moto, Marker05_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 6 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_6_Moto = createMarker ( -2003.38940, 136.12502, 27.53906 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_6_Moto, root, false )

Blip_06_Moto = createBlipAttachedTo ( Marker_6_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_06_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker06_Moto (source)
  if getElementData ( source, "Hab:Moto") == "6" then
   if isElementWithinMarker(source, Marker_6_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_6_Moto, source, false )
	   setElementVisibleTo ( Blip_06_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_7_Moto, source, true )
	   setElementVisibleTo ( Blip_07_Moto, source, true )
	   setElementData(source, "Hab:Moto", "7")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(6/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_6_Moto, Marker06_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 7 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_7_Moto = createMarker ( -2000.18250, 309.13177, 34.97069 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_7_Moto, root, false )

Blip_07_Moto = createBlipAttachedTo ( Marker_7_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_07_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker07_Moto (source)
  if getElementData ( source, "Hab:Moto") == "7" then
   if isElementWithinMarker(source, Marker_7_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_7_Moto, source, false )
	   setElementVisibleTo ( Blip_07_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_8_Moto, source, true )
	   setElementVisibleTo ( Blip_08_Moto, source, true )
	   setElementData(source, "Hab:Moto", "8")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(7/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_7_Moto, Marker07_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 8 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_8_Moto = createMarker ( -2099.56836, 322.75726, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_8_Moto, root, false )

Blip_08_Moto = createBlipAttachedTo ( Marker_8_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_08_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker08_Moto (source)
  if getElementData ( source, "Hab:Moto") == "8" then
   if isElementWithinMarker(source, Marker_8_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_8_Moto, source, false )
	   setElementVisibleTo ( Blip_08_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_9_Moto, source, true )
	   setElementVisibleTo ( Blip_09_Moto, source, true )
	   setElementData(source, "Hab:Moto", "9")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(8/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_8_Moto, Marker08_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 9 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_9_Moto = createMarker ( -2144.11084, 389.30740, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_9_Moto, root, false )

Blip_09_Moto = createBlipAttachedTo ( Marker_9_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_09_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker09_Moto (source)
  if getElementData ( source, "Hab:Moto") == "9" then
   if isElementWithinMarker(source, Marker_9_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_9_Moto, source, false )
	   setElementVisibleTo ( Blip_09_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_10_Moto, source, true )
	   setElementVisibleTo ( Blip_10_Moto, source, true )
	   setElementData(source, "Hab:Moto", "10")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(9/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_9_Moto, Marker09_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 10 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_10_Moto = createMarker ( -2201.38208, 510.55429, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_10_Moto, root, false )

Blip_10_Moto = createBlipAttachedTo ( Marker_10_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_10_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker10_Moto (source)
  if getElementData ( source, "Hab:Moto") == "10" then
   if isElementWithinMarker(source, Marker_10_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_10_Moto, source, false )
	   setElementVisibleTo ( Blip_10_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_11_Moto, source, true )
	   setElementVisibleTo ( Blip_11_Moto, source, true )
	   setElementData(source, "Hab:Moto", "11")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(10/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_10_Moto, Marker10_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 11 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_11_Moto = createMarker ( -2229.09497, 463.38098, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_11_Moto, root, false )

Blip_11_Moto = createBlipAttachedTo ( Marker_11_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_11_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker11_Moto (source)
  if getElementData ( source, "Hab:Moto") == "11" then
   if isElementWithinMarker(source, Marker_11_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_11_Moto, source, false )
	   setElementVisibleTo ( Blip_11_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_12_Moto, source, true )
	   setElementVisibleTo ( Blip_12_Moto, source, true )
	   setElementData(source, "Hab:Moto", "12")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(11/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_11_Moto, Marker11_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 12 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_12_Moto = createMarker ( -2270.24927, 408.27817, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_12_Moto, root, false )

Blip_12_Moto = createBlipAttachedTo ( Marker_12_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_12_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker12_Moto (source)
  if getElementData ( source, "Hab:Moto") == "12" then
   if isElementWithinMarker(source, Marker_12_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_12_Moto, source, false )
	   setElementVisibleTo ( Blip_12_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_13_Moto, source, true )
	   setElementVisibleTo ( Blip_13_Moto, source, true )
	   setElementData(source, "Hab:Moto", "13")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(12/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_12_Moto, Marker12_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 13 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_13_Moto = createMarker ( -2305.13525, 420.59192, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_13_Moto, root, false )

Blip_13_Moto = createBlipAttachedTo ( Marker_13_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_13_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker13_Moto (source)
  if getElementData ( source, "Hab:Moto") == "13" then
   if isElementWithinMarker(source, Marker_13_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_13_Moto, source, false )
	   setElementVisibleTo ( Blip_13_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_14_Moto, source, true )
	   setElementVisibleTo ( Blip_14_Moto, source, true )
	   setElementData(source, "Hab:Moto", "14")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(13/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_13_Moto, Marker13_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 14 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_14_Moto = createMarker ( -2364.50000, 366.35599, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_14_Moto, root, false )

Blip_14_Moto = createBlipAttachedTo ( Marker_14_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_14_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker14_Moto (source)
  if getElementData ( source, "Hab:Moto") == "14" then
   if isElementWithinMarker(source, Marker_14_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_14_Moto, source, false )
	   setElementVisibleTo ( Blip_14_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_15_Moto, source, true )
	   setElementVisibleTo ( Blip_15_Moto, source, true )
	   setElementData(source, "Hab:Moto", "15")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(14/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_14_Moto, Marker14_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 15 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_15_Moto = createMarker ( -2417.68237, 262.61633, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_15_Moto, root, false )

Blip_15_Moto = createBlipAttachedTo ( Marker_15_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_15_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker15_Moto (source)
  if getElementData ( source, "Hab:Moto") == "15" then
   if isElementWithinMarker(source, Marker_15_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_15_Moto, source, false )
	   setElementVisibleTo ( Blip_15_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_16_Moto, source, true )
	   setElementVisibleTo ( Blip_16_Moto, source, true )
	   setElementData(source, "Hab:Moto", "16")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(15/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_15_Moto, Marker15_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 16 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_16_Moto = createMarker ( -2423.70605, 55.76804, 35.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_16_Moto, root, false )

Blip_16_Moto = createBlipAttachedTo ( Marker_16_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_16_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker16_Moto (source)
  if getElementData ( source, "Hab:Moto") == "16" then
   if isElementWithinMarker(source, Marker_16_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_16_Moto, source, false )
	   setElementVisibleTo ( Blip_16_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_17_Moto, source, true )
	   setElementVisibleTo ( Blip_17_Moto, source, true )
	   setElementData(source, "Hab:Moto", "17")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(16/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_16_Moto, Marker16_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 17 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_17_Moto = createMarker ( -2424.10986, -53.86639, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_17_Moto, root, false )

Blip_17_Moto = createBlipAttachedTo ( Marker_17_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_17_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker17_Moto (source)
  if getElementData ( source, "Hab:Moto") == "17" then
   if isElementWithinMarker(source, Marker_17_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_17_Moto, source, false )
	   setElementVisibleTo ( Blip_17_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_18_Moto, source, true )
	   setElementVisibleTo ( Blip_18_Moto, source, true )
	   setElementData(source, "Hab:Moto", "18")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(17/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_17_Moto, Marker17_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 18 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_18_Moto = createMarker ( -2424.10986, -53.86639, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_18_Moto, root, false )

Blip_18_Moto = createBlipAttachedTo ( Marker_18_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_18_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker18_Moto (source)
  if getElementData ( source, "Hab:Moto") == "18" then
   if isElementWithinMarker(source, Marker_18_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_18_Moto, source, false )
	   setElementVisibleTo ( Blip_18_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_19_Moto, source, true )
	   setElementVisibleTo ( Blip_19_Moto, source, true )
	   setElementData(source, "Hab:Moto", "19")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(18/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_18_Moto, Marker18_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 19 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_19_Moto = createMarker ( -2384.42285, -72.55869, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_19_Moto, root, false )

Blip_19_Moto = createBlipAttachedTo ( Marker_19_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_19_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker19_Moto (source)
  if getElementData ( source, "Hab:Moto") == "19" then
   if isElementWithinMarker(source, Marker_19_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_19_Moto, source, false )
	   setElementVisibleTo ( Blip_19_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_20_Moto, source, true )
	   setElementVisibleTo ( Blip_20_Moto, source, true )
	   setElementData(source, "Hab:Moto", "20")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(19/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_19_Moto, Marker19_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 20 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_20_Moto = createMarker ( -2314.59033, -72.77144, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_20_Moto, root, false )

Blip_20_Moto = createBlipAttachedTo ( Marker_20_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_20_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker20_Moto (source)
  if getElementData ( source, "Hab:Moto") == "20" then
   if isElementWithinMarker(source, Marker_20_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_20_Moto, source, false )
	   setElementVisibleTo ( Blip_20_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_21_Moto, source, true )
	   setElementVisibleTo ( Blip_21_Moto, source, true )
	   setElementData(source, "Hab:Moto", "21")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(20/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_20_Moto, Marker20_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 21 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_21_Moto = createMarker ( -2268.69336, -72.84888, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_21_Moto, root, false )

Blip_21_Moto = createBlipAttachedTo ( Marker_21_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_21_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker21_Moto (source)
  if getElementData ( source, "Hab:Moto") == "21" then
   if isElementWithinMarker(source, Marker_21_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_21_Moto, source, false )
	   setElementVisibleTo ( Blip_21_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_22_Moto, source, true )
	   setElementVisibleTo ( Blip_22_Moto, source, true )
	   setElementData(source, "Hab:Moto", "22")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(21/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_21_Moto, Marker21_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 22 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_22_Moto = createMarker ( -2259.94751, -173.33803, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_22_Moto, root, false )

Blip_22_Moto = createBlipAttachedTo ( Marker_22_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_22_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker22_Moto (source)
  if getElementData ( source, "Hab:Moto") == "22" then
   if isElementWithinMarker(source, Marker_22_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_22_Moto, source, false )
	   setElementVisibleTo ( Blip_22_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_23_Moto, source, true )
	   setElementVisibleTo ( Blip_23_Moto, source, true )
	   setElementData(source, "Hab:Moto", "23")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(22/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_22_Moto, Marker22_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 23 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_23_Moto = createMarker ( -2187.00146, -190.39882, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_23_Moto, root, false )

Blip_23_Moto = createBlipAttachedTo ( Marker_23_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_23_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker23_Moto (source)
  if getElementData ( source, "Hab:Moto") == "23" then
   if isElementWithinMarker(source, Marker_23_Moto) then
    if Moto_Teste[source] and isElement(Moto_Teste[source]) then
	   setElementVisibleTo ( Marker_23_Moto, source, false )
	   setElementVisibleTo ( Blip_23_Moto, source, false )
	   
	   setElementVisibleTo ( Marker_24_Moto, source, true )
	   setElementVisibleTo ( Blip_24_Moto, source, true )
	   setElementData(source, "Hab:Moto", "24")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(23/24)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_23_Moto, Marker23_Moto)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 24 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_24_Moto = createMarker ( -2046.86108, -85.36681, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_24_Moto, root, false )

Blip_24_Moto = createBlipAttachedTo ( Marker_24_Moto, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_24_Moto, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker24_Moto (source)
	if getElementData ( source, "Hab:Moto") == "24" then
		if isElementWithinMarker(source, Marker_24_Moto) then
			if isPedInVehicle(source) then
				if Moto_Teste[source] and isElement(Moto_Teste[source]) then
					local HP_Veiculo = getElementHealth ( Moto_Teste[source] )
					outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(24/24)", source, 255,255,255,true)
					if HP_Veiculo < 800 then
						outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você danificou muito o veiculo e acabou fracassando.", source, 255,255,255,true)
					else
						local Account = getPlayerAccount(source)
						if isGuestAccount (Account) then outputChatBox ( "#ff0000✘ #ffffffERRO #ff0000✘➺ #FFFFFFVocê não está logado. Algo de errado aconteceu!", source, 255,255,255,true) return end
						outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFParabéns, Você Conseguiu Sua Carteira de Habilitação #00ff00(#ffffffMoto#00ff00)", source, 255,255,255,true)
						playSoundFrontEnd ( source, 43 )
						setElementData(source, "DNL:Categoria(A)", true)
						setAccountData ( Account, "DNL:Categoria(A)", true)
						triggerEvent("DNL:Renovar_Moto", source) 
						end
						destroyElement ( Moto_Teste[source] )
						Fim_Prova_Moto (source)	
						setElementDimension(source, 0)
						setElementVisibleTo ( Marker_24_Moto, source, false )
						setElementVisibleTo ( Blip_24_Moto, source, false )
						setElementData(source, "Hab:Moto", nil)
						setElementData(source, "DNL:TestePratico", false)
						triggerClientEvent(source, "DNL:KillTimer(Moto)", source) 
				end
			end
		end
	end
end
addCommandHandler("finalizar", Marker24_Moto)

function BlockExiVehicle ( source ) 			
  local Teste = getElementData( source, "DNL:TestePratico" )
  if Moto_Teste[source] and isElement( Moto_Teste[source] ) then  	
    if Teste == true then
    cancelEvent()
    outputChatBox ( "#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffVocê não pode sair do veiculo enquanto faz o teste.", source, 255, 255, 255, true )
    end
  end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), BlockExiVehicle)

function QuitServer ( quitType )	
  if isElement( Moto_Teste[source] ) then
     destroyElement ( Moto_Teste[source] )
  end
end
addEventHandler ( "onPlayerQuit", getRootElement(), QuitServer )

function Mensagem_Marker24_Moto (source)
  if getElementData ( source, "Hab:Moto") == "24" then
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFDigite /finalizar e irá ganhar sua Habilitação", source, 255,255,255,true)
  end
end
addEventHandler("onMarkerHit", Marker_24_Moto, Mensagem_Marker24_Moto)


function TimerMoto ()
    Fim_Prova_Moto (source)	
    VisibleBlips (source)	
	setElementData(source, "Hab:Moto", nil)
	setElementData(source, "DNL:TestePratico", false)
	destroyElement ( Moto_Teste[source] )
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você não completou a prova no tempo Correto.", source, 255,255,255,true)
end
addEvent("DNL:Tempo(Moto)", true)
addEventHandler("DNL:Tempo(Moto)", root, TimerMoto)

function Fim_Prova_Moto (source)
setTimer(setElementPosition, 1000, 1,source, 1081.5048828125,-1700.4609375,13.546875)
setTimer( setCameraTarget, 1200, 1, source )
setTimer ( fadeCamera, 50, 1, source,false, 1 )
setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
setTimer(setElementDimension, 3000, 1, source, 0)	
setTimer(setElementInterior, 3000, 1, source, 0)	
showChat(source, true)  
end

function VisibleBlips (source)	
    setElementVisibleTo ( Marker_1_Moto, source, false )
	setElementVisibleTo ( Blip_01_Moto, source, false )
	
	setElementVisibleTo ( Marker_2_Moto, source, false )
	setElementVisibleTo ( Blip_02_Moto, source, false )
	
	setElementVisibleTo ( Marker_3_Moto, source, false )
	setElementVisibleTo ( Blip_03_Moto, source, false )
	
	setElementVisibleTo ( Marker_4_Moto, source, false )
	setElementVisibleTo ( Blip_04_Moto, source, false )
	
	setElementVisibleTo ( Marker_5_Moto, source, false )
	setElementVisibleTo ( Blip_05_Moto, source, false )
	
	setElementVisibleTo ( Marker_6_Moto, source, false )
	setElementVisibleTo ( Blip_06_Moto, source, false )
	
	setElementVisibleTo ( Marker_7_Moto, source, false )
	setElementVisibleTo ( Blip_07_Moto, source, false )
	
	setElementVisibleTo ( Marker_8_Moto, source, false )
	setElementVisibleTo ( Blip_08_Moto, source, false )
	
	setElementVisibleTo ( Marker_9_Moto, source, false )
	setElementVisibleTo ( Blip_09_Moto, source, false )
	
	setElementVisibleTo ( Marker_10_Moto, source, false )
	setElementVisibleTo ( Blip_10_Moto, source, false )
	
	setElementVisibleTo ( Marker_11_Moto, source, false )
	setElementVisibleTo ( Blip_11_Moto, source, false )
	
	setElementVisibleTo ( Marker_12_Moto, source, false )
	setElementVisibleTo ( Blip_12_Moto, source, false )
	
	setElementVisibleTo ( Marker_13_Moto, source, false )
	setElementVisibleTo ( Blip_13_Moto, source, false )
	
	setElementVisibleTo ( Marker_14_Moto, source, false )
	setElementVisibleTo ( Blip_14_Moto, source, false )
	
	setElementVisibleTo ( Marker_15_Moto, source, false )
	setElementVisibleTo ( Blip_15_Moto, source, false )
	
	setElementVisibleTo ( Marker_16_Moto, source, false )
	setElementVisibleTo ( Blip_16_Moto, source, false )
	
	setElementVisibleTo ( Marker_17_Moto, source, false )
	setElementVisibleTo ( Blip_17_Moto, source, false )
	
	setElementVisibleTo ( Marker_18_Moto, source, false )
	setElementVisibleTo ( Blip_18_Moto, source, false )
	
	setElementVisibleTo ( Marker_19_Moto, source, false )
	setElementVisibleTo ( Blip_19_Moto, source, false )
	
	setElementVisibleTo ( Marker_20_Moto, source, false )
	setElementVisibleTo ( Blip_20_Moto, source, false )
	
	setElementVisibleTo ( Marker_21_Moto, source, false )
	setElementVisibleTo ( Blip_21_Moto, source, false )
	
	setElementVisibleTo ( Marker_22_Moto, source, false )
	setElementVisibleTo ( Blip_22_Moto, source, false )
	
	setElementVisibleTo ( Marker_23_Moto, source, false )
	setElementVisibleTo ( Blip_23_Moto, source, false )
	
	setElementVisibleTo ( Marker_24_Moto, source, false )
	setElementVisibleTo ( Blip_24_Moto, source, false )
end
