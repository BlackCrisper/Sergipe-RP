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

Carreta = {}
CargaCarretas = {}

function Teste_Carreta (source)     
	if getElementData(source, "DNL:Categoria(D)") == true then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê Ja Possui essa categoria.", source, 255,255,255,true) return end  
	if getPlayerMoney(source) < 2200 then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffVocê não tenho dinheiro suficiente para adiquirir essa categoria.", source, 255,255,255,true) return end  
	if Carreta[source] and isElement(Carreta[source] ) then destroyElement ( Carreta[source] ) Carreta[source] = nil end
    Carreta[source] = createVehicle( 403, -2046.86108, -85.36681, 35.16406)
    CargaCarretas[source] = createVehicle ( 584, -2047.22278, -92.81171, 35.17180)
    setElementRotation(Carreta[source], 0, 0, 0)
    setElementDimension(source, 0)
    setElementInterior(source, 0)
	takePlayerMoney(source, 2200)
	triggerClientEvent(source, "DNL:FecharCategorias", source) 
    setTimer( setCameraTarget, 1200, 1, source )
    setTimer ( fadeCamera, 50, 1, source,false, 1 )
    setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
    setTimer(setElementPosition, 1000, 1,source, -2046.86108, -85.36681, 35.16406)
	
  setTimer(function()
    setElementData(source, "DNL:TestePratico", true)
    warpPedIntoVehicle ( source, Carreta[source] )
    attachTrailerToVehicle ( Carreta[source], CargaCarretas[source] )
	fixVehicle(Carreta[source])
	setElementData(source, "Hab:Carreta", "1")
	setElementVisibleTo ( Marker_1_Carreta, source, true )
	setElementVisibleTo ( Blip_01_Carreta, source, true )
	triggerClientEvent(source, "DNL:TempoC(Carreta)", source) 
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffPasse em todos locais indicados no mapa.", source, 255,255,255,true)
    outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #ffffffApós Concluir o Teste Ganhará sua Carteira de Habilitação #00FF00(#FFFFFFD#00FF00)", source, 255,255,255,true)
  end, 3000, 1)
   
end
addEvent("DNL:Teste(Carreta)", true)
addEventHandler("DNL:Teste(Carreta)", root, Teste_Carreta)

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 1 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_1_Carreta = createMarker ( -2019.96802, -72.56067, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_1_Carreta, root, false )

Blip_01_Carreta = createBlipAttachedTo ( Marker_1_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_01_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker01_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "1" then
   if isElementWithinMarker(source, Marker_1_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_1_Carreta, source, false )
	   setElementVisibleTo ( Blip_01_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_2_Carreta, source, true )
	   setElementVisibleTo ( Blip_02_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "2")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(1/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_1_Carreta, Marker01_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 2 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_2_Carreta = createMarker ( -1849.40576, -119.38085, 5.60410 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_2_Carreta, root, false )

Blip_02_Carreta = createBlipAttachedTo ( Marker_2_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_02_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker02_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "2" then
   if isElementWithinMarker(source, Marker_2_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_2_Carreta, source, false )
	   setElementVisibleTo ( Blip_02_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_3_Carreta, source, true )
	   setElementVisibleTo ( Blip_03_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "3")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(2/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_2_Carreta, Marker02_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 3 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_3_Carreta = createMarker ( -1838.97156, -221.07086, 18.22052 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_3_Carreta, root, false )

Blip_03_Carreta = createBlipAttachedTo ( Marker_3_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_03_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker03_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "3" then
   if isElementWithinMarker(source, Marker_3_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_3_Carreta, source, false )
	   setElementVisibleTo ( Blip_03_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_4_Carreta, source, true )
	   setElementVisibleTo ( Blip_04_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "4")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(3/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_3_Carreta, Marker03_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 4 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_4_Carreta = createMarker ( -1940.36047, -237.22037, 25.55556 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_4_Carreta, root, false )

Blip_04_Carreta = createBlipAttachedTo ( Marker_4_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_04_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker04_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "4" then
   if isElementWithinMarker(source, Marker_4_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_4_Carreta, source, false )
	   setElementVisibleTo ( Blip_04_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_5_Carreta, source, true )
	   setElementVisibleTo ( Blip_05_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "5")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(4/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_4_Carreta, Marker04_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 5 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_5_Carreta = createMarker ( -1993.91064, -232.09737, 35.62431 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_5_Carreta, root, false )

Blip_05_Carreta = createBlipAttachedTo ( Marker_5_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_05_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker05_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "5" then
   if isElementWithinMarker(source, Marker_5_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_5_Carreta, source, false )
	   setElementVisibleTo ( Blip_05_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_6_Carreta, source, true )
	   setElementVisibleTo ( Blip_06_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "6")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(5/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_5_Carreta, Marker05_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 6 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_6_Carreta = createMarker ( -2007.44336, -281.54922, 35.32031 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_6_Carreta, root, false )

Blip_06_Carreta = createBlipAttachedTo ( Marker_6_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_06_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker06_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "6" then
   if isElementWithinMarker(source, Marker_6_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_6_Carreta, source, false )
	   setElementVisibleTo ( Blip_06_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_7_Carreta, source, true )
	   setElementVisibleTo ( Blip_07_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "7")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(6/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_6_Carreta, Marker06_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 7 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_7_Carreta = createMarker ( -2192.48828, -289.94974, 35.34521 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_7_Carreta, root, false )

Blip_07_Carreta = createBlipAttachedTo ( Marker_7_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_07_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker07_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "7" then
   if isElementWithinMarker(source, Marker_7_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_7_Carreta, source, false )
	   setElementVisibleTo ( Blip_07_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_8_Carreta, source, true )
	   setElementVisibleTo ( Blip_08_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "8")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(7/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_7_Carreta, Marker07_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 8 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_8_Carreta = createMarker ( -2205.41309, -205.55974, 35.35001 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_8_Carreta, root, false )

Blip_08_Carreta = createBlipAttachedTo ( Marker_8_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_08_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker08_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "8" then
   if isElementWithinMarker(source, Marker_8_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_8_Carreta, source, false )
	   setElementVisibleTo ( Blip_08_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_9_Carreta, source, true )
	   setElementVisibleTo ( Blip_09_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "9")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(8/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_8_Carreta, Marker08_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 9 ---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_9_Carreta = createMarker ( -2260.67822, -279.35895, 45.10068 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_9_Carreta, root, false )

Blip_09_Carreta = createBlipAttachedTo ( Marker_9_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_09_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker09_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "9" then
   if isElementWithinMarker(source, Marker_9_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_9_Carreta, source, false )
	   setElementVisibleTo ( Blip_09_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_10_Carreta, source, true )
	   setElementVisibleTo ( Blip_10_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "10")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(9/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_9_Carreta, Marker09_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 10 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_10_Carreta = createMarker ( -1995.71973, -583.47913, 25.77326 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_10_Carreta, root, false )

Blip_10_Carreta = createBlipAttachedTo ( Marker_10_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_10_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker10_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "10" then
   if isElementWithinMarker(source, Marker_10_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_10_Carreta, source, false )
	   setElementVisibleTo ( Blip_10_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_11_Carreta, source, true )
	   setElementVisibleTo ( Blip_11_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "11")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(10/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_10_Carreta, Marker10_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 11 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_11_Carreta = createMarker ( -1923.93457, -520.10364, 24.59002 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_11_Carreta, root, false )

Blip_11_Carreta = createBlipAttachedTo ( Marker_11_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_11_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker11_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "11" then
   if isElementWithinMarker(source, Marker_11_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_11_Carreta, source, false )
	   setElementVisibleTo ( Blip_11_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_12_Carreta, source, true )
	   setElementVisibleTo ( Blip_12_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "12")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(11/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_11_Carreta, Marker11_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 12 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_12_Carreta = createMarker ( -1908.13135, -320.33624, 38.24219 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_12_Carreta, root, false )

Blip_12_Carreta = createBlipAttachedTo ( Marker_12_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_12_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker12_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "12" then
   if isElementWithinMarker(source, Marker_12_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_12_Carreta, source, false )
	   setElementVisibleTo ( Blip_12_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_13_Carreta, source, true )
	   setElementVisibleTo ( Blip_13_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "13")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(12/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_12_Carreta, Marker12_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 13 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_13_Carreta = createMarker ( -1901.68225, -19.13747, 38.24219 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_13_Carreta, root, false )

Blip_13_Carreta = createBlipAttachedTo ( Marker_13_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_13_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker13_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "13" then
   if isElementWithinMarker(source, Marker_13_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_13_Carreta, source, false )
	   setElementVisibleTo ( Blip_13_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_14_Carreta, source, true )
	   setElementVisibleTo ( Blip_14_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "14")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(13/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_13_Carreta, Marker13_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 14 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_14_Carreta = createMarker ( -1886.02588, 249.60352, 38.07614 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_14_Carreta, root, false )

Blip_14_Carreta = createBlipAttachedTo ( Marker_14_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_14_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker14_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "14" then
   if isElementWithinMarker(source, Marker_14_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_14_Carreta, source, false )
	   setElementVisibleTo ( Blip_14_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_15_Carreta, source, true )
	   setElementVisibleTo ( Blip_15_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "15")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(14/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_14_Carreta, Marker14_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 15 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_15_Carreta = createMarker ( -1834.28943, 389.70761, 17.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_15_Carreta, root, false )

Blip_15_Carreta = createBlipAttachedTo ( Marker_15_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_15_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker15_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "15" then
   if isElementWithinMarker(source, Marker_15_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_15_Carreta, source, false )
	   setElementVisibleTo ( Blip_15_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_16_Carreta, source, true )
	   setElementVisibleTo ( Blip_16_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "16")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(15/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_15_Carreta, Marker15_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 16 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_16_Carreta = createMarker ( -1845.63428, 411.26929, 17.01563 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_16_Carreta, root, false )

Blip_16_Carreta = createBlipAttachedTo ( Marker_16_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_16_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker16_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "16" then
   if isElementWithinMarker(source, Marker_16_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_16_Carreta, source, false )
	   setElementVisibleTo ( Blip_16_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_17_Carreta, source, true )
	   setElementVisibleTo ( Blip_17_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "17")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(16/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_16_Carreta, Marker16_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 17 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_17_Carreta = createMarker ( -1983.08435, 349.27060, 34.71581 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_17_Carreta, root, false )

Blip_17_Carreta = createBlipAttachedTo ( Marker_17_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_17_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker17_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "17" then
   if isElementWithinMarker(source, Marker_17_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_17_Carreta, source, false )
	   setElementVisibleTo ( Blip_17_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_18_Carreta, source, true )
	   setElementVisibleTo ( Blip_18_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "18")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(17/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_17_Carreta, Marker17_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 18 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_18_Carreta = createMarker ( -2007.73254, 335.23672, 35.00854 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_18_Carreta, root, false )

Blip_18_Carreta = createBlipAttachedTo ( Marker_18_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_18_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker18_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "18" then
   if isElementWithinMarker(source, Marker_18_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_18_Carreta, source, false )
	   setElementVisibleTo ( Blip_18_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_19_Carreta, source, true )
	   setElementVisibleTo ( Blip_19_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "19")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(18/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_18_Carreta, Marker18_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 19 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_19_Carreta = createMarker ( -2131.02124, 322.75360, 35.12479 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_19_Carreta, root, false )

Blip_19_Carreta = createBlipAttachedTo ( Marker_19_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_19_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker19_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "19" then
   if isElementWithinMarker(source, Marker_19_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_19_Carreta, source, false )
	   setElementVisibleTo ( Blip_19_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_20_Carreta, source, true )
	   setElementVisibleTo ( Blip_20_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "20")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(19/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_19_Carreta, Marker19_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 20 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_20_Carreta = createMarker ( -2148.93970, 221.65948, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_20_Carreta, root, false )

Blip_20_Carreta = createBlipAttachedTo ( Marker_20_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_20_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker20_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "20" then
   if isElementWithinMarker(source, Marker_20_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_20_Carreta, source, false )
	   setElementVisibleTo ( Blip_20_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_21_Carreta, source, true )
	   setElementVisibleTo ( Blip_21_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "21")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(20/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_20_Carreta, Marker20_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 21 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_21_Carreta = createMarker ( -2170.01563, -56.99166, 35.17188 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_21_Carreta, root, false )

Blip_21_Carreta = createBlipAttachedTo ( Marker_21_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_21_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker21_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "21" then
   if isElementWithinMarker(source, Marker_21_Carreta) then
    if Carreta[source] and isElement(Carreta[source]) then
     if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
	   setElementVisibleTo ( Marker_21_Carreta, source, false )
	   setElementVisibleTo ( Blip_21_Carreta, source, false )
	   
	   setElementVisibleTo ( Marker_22_Carreta, source, true )
	   setElementVisibleTo ( Blip_22_Carreta, source, true )
	   setElementData(source, "Hab:Carreta", "22")
	   outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(21/22)", source, 255,255,255,true)
   end
  end
 end
end
addEventHandler("onMarkerHit", Marker_21_Carreta, Marker21_Carreta)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Checkpoint 22 --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Marker_22_Carreta = createMarker ( -2046.86108, -85.36681, 35.16406 -1, "checkpoint", 5, 0, 255, 0, 95) -- Local Onde Finaliza O Emprego
setElementVisibleTo ( Marker_22_Carreta, root, false )

Blip_22_Carreta = createBlipAttachedTo ( Marker_22_Carreta, 0 ) -- Blip De Entrega, "0" - Vermelho Padrao
setElementVisibleTo ( Blip_22_Carreta, root, false ) -- Blip Visivel Apenas Para Jogadores Trabalhando

function Marker22_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "22" then
   if isElementWithinMarker(source, Marker_22_Carreta) then
    if isPedInVehicle(source) then
     if Carreta[source] and isElement(Carreta[source]) then
      if not ( getVehicleTowedByVehicle ( Carreta[source] ) == CargaCarretas[source] ) then outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFCarga Não Encontrada, Utilize a Carga Para Fazer O Percurso!", source, 255,255,255,true) return end  
     local HP_Veiculo = getElementHealth ( Carreta[source] )
     local HP_Carga = getElementHealth ( CargaCarretas[source] )
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFVocê Chegou há um Checkpoint #00ff00(22/22)", source, 255,255,255,true)
      if HP_Veiculo < 800 or HP_Carga < 800 then
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você danificou muito o veiculo e acabou fracassando.", source, 255,255,255,true)
      else
       local Account = getPlayerAccount(source)
       if isGuestAccount (Account) then outputChatBox ( "#ff0000✘ #ffffffERRO #ff0000✘➺ #FFFFFFVocê não está logado. Algo de errado aconteceu!", source, 255,255,255,true) return end
	     outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFParabéns, Você Conseguiu Sua Carteira de Habilitação #00ff00(#ffffffCarreta#00ff00)", source, 255,255,255,true)
	     playSoundFrontEnd ( source, 43 )
	     setElementData(source, "DNL:Categoria(D)", true)
	     setAccountData ( Account, "DNL:Categoria(D)", true)
	     triggerEvent("DNL:Renovar_Carreta", source) 
      end
	     destroyElement ( Carreta[source] )
	     destroyElement ( CargaCarretas[source] )
	     setElementDimension(source, 0)
	     setElementVisibleTo ( Marker_22_Carreta, source, false )
	     setElementVisibleTo ( Blip_22_Carreta, source, false )
	     setElementData(source, "Hab:Carreta", nil)
	     setElementData(source, "DNL:TestePratico", false)
	     Fim_Prova_Carreta (source)	
	     triggerClientEvent(source, "DNL:KillTimer(Carreta)", source) 
    end
   end
  end
 end
end
addCommandHandler("finalizar", Marker22_Carreta)

function BlockExiVehicle ( source ) 			
  local Teste = getElementData( source, "DNL:TestePratico" )
  if Carreta[source] and isElement( Carreta[source] ) then  	
    if Teste == true then
    cancelEvent()
    outputChatBox ( "#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffVocê não pode sair do veiculo enquanto faz o teste.", source, 255, 255, 255, true )
    end
  end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), BlockExiVehicle)

function QuitServer ( quitType )	
  if isElement( Carreta[source] ) then
     destroyElement ( Carreta[source] )
     destroyElement ( CargaCarretas[source] )
  end
end
addEventHandler ( "onPlayerQuit", getRootElement(), QuitServer )

function Mensagem_Marker22_Carreta (source)
  if getElementData ( source, "Hab:Carreta") == "22" then
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFDigite /finalizar e irá ganhar sua Habilitação", source, 255,255,255,true)
  end
end
addEventHandler("onMarkerHit", Marker_22_Carreta, Mensagem_Marker22_Carreta)


function TimerMoto ()
    VisibleBlips_Carreta (source)	
    Fim_Prova_Carreta (source)	
	setElementData(source, "Hab:Carreta", nil)
	setElementData(source, "DNL:TestePratico", false)
	destroyElement ( Carreta[source] )
	destroyElement ( CargaCarretas[source] )
	outputChatBox ( "#00ff00✘ #ffffffDetran #00ff00✘➺ #FFFFFFNão foi Desta Vez, Você não completou a prova no tempo Correto.", source, 255,255,255,true)
end
addEvent("DNL:Tempo(Carreta)", true)
addEventHandler("DNL:Tempo(Carreta)", root, TimerMoto)


function Fim_Prova_Carreta (source)
setTimer(setElementPosition, 1000, 1,source, 1081.5048828125,-1700.4609375,13.546875)
setTimer( setCameraTarget, 1200, 1, source )
setTimer ( fadeCamera, 50, 1, source,false, 1 )
setTimer ( fadeCamera, 3000, 1, source, true, 3 ) 
setTimer(setElementDimension, 3000, 1, source, 0)	
setTimer(setElementInterior, 3000, 1, source, 0)	
showChat(source, true)  
end

function VisibleBlips_Carreta (source)	
    setElementVisibleTo ( Marker_1_Carreta, source, false )
	setElementVisibleTo ( Blip_01_Carreta, source, false )
	
    setElementVisibleTo ( Marker_2_Carreta, source, false )
	setElementVisibleTo ( Blip_02_Carreta, source, false )
	
    setElementVisibleTo ( Marker_3_Carreta, source, false )
	setElementVisibleTo ( Blip_03_Carreta, source, false )
	
    setElementVisibleTo ( Marker_4_Carreta, source, false )
	setElementVisibleTo ( Blip_04_Carreta, source, false )
	
    setElementVisibleTo ( Marker_5_Carreta, source, false )
	setElementVisibleTo ( Blip_05_Carreta, source, false )
	
    setElementVisibleTo ( Marker_6_Carreta, source, false )
	setElementVisibleTo ( Blip_06_Carreta, source, false )
	
    setElementVisibleTo ( Marker_7_Carreta, source, false )
	setElementVisibleTo ( Blip_07_Carreta, source, false )
	
    setElementVisibleTo ( Marker_8_Carreta, source, false )
	setElementVisibleTo ( Blip_08_Carreta, source, false )
	
    setElementVisibleTo ( Marker_9_Carreta, source, false )
	setElementVisibleTo ( Blip_09_Carreta, source, false )
	
    setElementVisibleTo ( Marker_10_Carreta, source, false )
	setElementVisibleTo ( Blip_10_Carreta, source, false )
	
    setElementVisibleTo ( Marker_11_Carreta, source, false )
	setElementVisibleTo ( Blip_11_Carreta, source, false )
	
    setElementVisibleTo ( Marker_12_Carreta, source, false )
	setElementVisibleTo ( Blip_12_Carreta, source, false )
	
    setElementVisibleTo ( Marker_13_Carreta, source, false )
	setElementVisibleTo ( Blip_13_Carreta, source, false )
	
    setElementVisibleTo ( Marker_14_Carreta, source, false )
	setElementVisibleTo ( Blip_14_Carreta, source, false )
	
    setElementVisibleTo ( Marker_15_Carreta, source, false )
	setElementVisibleTo ( Blip_15_Carreta, source, false )
	
    setElementVisibleTo ( Marker_16_Carreta, source, false )
	setElementVisibleTo ( Blip_16_Carreta, source, false )
	
    setElementVisibleTo ( Marker_17_Carreta, source, false )
	setElementVisibleTo ( Blip_17_Carreta, source, false )
	
    setElementVisibleTo ( Marker_18_Carreta, source, false )
	setElementVisibleTo ( Blip_18_Carreta, source, false )
	
    setElementVisibleTo ( Marker_19_Carreta, source, false )
	setElementVisibleTo ( Blip_19_Carreta, source, false )
	
	setElementVisibleTo ( Marker_20_Carreta, source, false )
	setElementVisibleTo ( Blip_20_Carreta, source, false )
	
	setElementVisibleTo ( Marker_21_Carreta, source, false )
	setElementVisibleTo ( Blip_21_Carreta, source, false )
	
	setElementVisibleTo ( Marker_22_Carreta, source, false )
	setElementVisibleTo ( Blip_22_Carreta, source, false )
end
