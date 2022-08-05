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
local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/font.ttf", y*11)
local Font_2 = dxCreateFont("font/font1.ttf", y*11)
local Font_3 = dxCreateFont("font/fontNick.ttf", y*10)
local Font_4 = dxCreateFont("font/OpenSans-Bold.ttf", y*11)

--[[
         ><><><><><><><><><><><><><><><
         ><       Abrir/Fechar       ><
         ><><><><><><><><><><><><><><><
--]]
function Abrir_Correios ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Correio) then return end
		showChat(false)
		showCursor(true)
		addEventHandler("onClientRender", root, Dx_Correio)
end
addEvent("DNL:Abrir_Correios", true)
addEventHandler("DNL:Abrir_Correios", root, Abrir_Correios)

function Fechar_Correios ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Correio) then  
		showChat(true)
		showCursor(false)
		removeEventHandler("onClientRender", root, Dx_Correio)
	end
end
addEvent("DNL:Fechar_Correios", true)
addEventHandler("DNL:Fechar_Correios", root, Fechar_Correios)

--[[
         ><><><><><><><><><><><><><><><><><
         ><       INTERFACE PAINEL       ><
         ><><><><><><><><><><><><><><><><><
--]]
function Dx_Correio ()
	local Cargas = tonumber(getElementData(localPlayer, "DNL:Cargas")) or 0
        dxDrawRectangle(x*469, y*254, x*426, y*242, tocolor(0, 0, 0, 209), false)
        dxDrawRectangle(x*469, y*254, x*426, y*35, tocolor(0, 0, 0, 200), false)
        dxDrawLine(x*469, y*288, x*895, y*288, tocolor(16, 111, 231, 255), x*2, false)
        dxDrawText("Correios", x*658, y*260, x*708, y*279, tocolor(255, 255, 255, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		
        dxDrawRectangle(x*478, y*297, x*408, y*121, tocolor(0, 0, 0, 188), false)
	
	if isCursorOnElement(x*478, y*297, x*408, y*40) then
        dxDrawRectangle(x*478, y*297, x*408, y*40, tocolor(16, 111, 231, 150), false)
		
	elseif isCursorOnElement(x*478, y*337, x*408, y*40) then
        dxDrawRectangle(x*478, y*337, x*408, y*40, tocolor(16, 111, 231, 150), false)
		
	elseif isCursorOnElement(x*478, y*377, x*408, y*40) then
        dxDrawRectangle(x*478, y*377, x*408, y*40, tocolor(16, 111, 231, 150), false)
		
	elseif isCursorOnElement(x*598, y*435, x*169, y*45) then
		CorFechar = tocolor(16, 111, 231, 220)
	end
	
        dxDrawText("Caixa #106fe7(#ffffff"..Cargas.."/25#106fe7)", x*494, y*307, x*527, y*325, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, true, false)
        dxDrawText("Van", x*494, y*347, x*527, y*365, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Uniforme", x*494, y*387, x*527, y*405, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
		
        dxDrawImage(x*598, y*435, x*169, y*45, "Img/botao.png", 0, 0, 0, CorFechar, false)
		CorFechar = tocolor(16, 111, 231, 170)
        dxDrawText("Fechar", x*660, y*447, x*705, y*465, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
end

--[[
         ><><><><><><><><><><><><><><><
         ><       Pegar Itens        ><
         ><><><><><><><><><><><><><><><
--]]
function Pegar_Itens ( _,state )
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Correio) then  
		if state == "down" then
			if isCursorOnElement(x*598, y*435, x*169, y*45) then
				Fechar_Correios ()
			end
			if isCursorOnElement(x*478, y*297, x*408, y*40) then -- Pizza
				triggerServerEvent("DNL:Pegar_Cargas", root, localPlayer)
				
			elseif isCursorOnElement(x*478, y*337, x*408, y*40) then -- Moto
				triggerServerEvent("DNL:Pegar_Carro", root, localPlayer)
				
			elseif isCursorOnElement(x*478, y*377, x*408, y*40) then -- Uniforme
				triggerServerEvent("DNL:Pegar_Uniforme(Sedex)", root, localPlayer)
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Pegar_Itens )

                                   --=============================--
                                   ------------- IGNORA ------------
                                   --=============================--	
--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-
						  
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
	return false
end

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-

local x,y = guiGetScreenSize()
function isCursorOnElement(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-