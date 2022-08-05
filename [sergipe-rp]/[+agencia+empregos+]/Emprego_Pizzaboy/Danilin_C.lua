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
function Abrir_Pizzaria ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Pizzaria) then return end
		showChat(false)
		showCursor(true)
		addEventHandler("onClientRender", root, Dx_Pizzaria)
end
addEvent("DNL:Abrir_Pizzaria", true)
addEventHandler("DNL:Abrir_Pizzaria", root, Abrir_Pizzaria)

function Fechar_Pizzaria ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Pizzaria) then  
		showChat(true)
		showCursor(false)
		removeEventHandler("onClientRender", root, Dx_Pizzaria)
	end
end
addEvent("DNL:Fechar_Pizzaria", true)
addEventHandler("DNL:Fechar_Pizzaria", root, Fechar_Pizzaria)

--[[
         ><><><><><><><><><><><><><><><><><
         ><       INTERFACE PAINEL       ><
         ><><><><><><><><><><><><><><><><><
--]]
function Dx_Pizzaria ()
	local Pizza = tonumber(getElementData(localPlayer, "DNL:Pizza")) or 0
        dxDrawRectangle(x*469, y*254, x*426, y*242, tocolor(0, 0, 0, 209), false)
        dxDrawRectangle(x*469, y*254, x*426, y*35, tocolor(0, 0, 0, 200), false)
        dxDrawLine(x*469, y*288, x*895, y*288, tocolor(16, 111, 231), x*2, false)
        dxDrawText("Pizzaria", x*658, y*260, x*708, y*279, tocolor(255, 255, 255, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		
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
	
        dxDrawText("Pizza #106FE7(#ffffff"..Pizza.."/25#106FE7)", x*494, y*307, x*527, y*325, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, true, false)
        dxDrawText("Moto", x*494, y*347, x*527, y*365, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Uniforme", x*494, y*387, x*527, y*405, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
		
        dxDrawImage(x*598, y*435, x*169, y*45, "Img/botao.png", 0, 0, 0, CorFechar, false)
		CorFechar = tocolor(0, 255, 0, 170)
        dxDrawText("Fechar", x*660, y*447, x*705, y*465, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
end
--addEventHandler("onClientRender", root, Dx_Pizzaria)

--[[
         ><><><><><><><><><><><><><><><
         ><       Pegar Itens        ><
         ><><><><><><><><><><><><><><><
--]]
function Pegar_Itens ( _,state )
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Pizzaria) then  
		if state == "down" then
			if isCursorOnElement(x*598, y*435, x*169, y*45) then
				Fechar_Pizzaria ()
			end
			if isCursorOnElement(x*478, y*297, x*408, y*40) then -- Pizza
				triggerServerEvent("DNL:Pegar_Pizza", root, localPlayer)
				
			elseif isCursorOnElement(x*478, y*337, x*408, y*40) then -- Moto
				triggerServerEvent("DNL:Pegar_Moto", root, localPlayer)
				
			elseif isCursorOnElement(x*478, y*377, x*408, y*40) then -- Uniforme
				triggerServerEvent("DNL:Pegar_Uniforme", root, localPlayer)
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