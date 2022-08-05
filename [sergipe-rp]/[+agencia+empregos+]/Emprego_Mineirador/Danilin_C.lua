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

	                               --===================================--
                                   ------------- Abrir/Fechar ------------
                                   --===================================--
function Abrir_Meus_Itens ()
	if not isEventHandlerAdded("onClientRender", getRootElement(), Dx_Meus_Mineiros) then 
		Reload_Minerios ()
		showCursor(true)
		ListaMinerios:SetVisible(true)
		addEventHandler("onClientRender", root, Dx_Meus_Mineiros)	
	else
		showCursor(false)
		ListaMinerios:SetVisible(false)
		removeEventHandler("onClientRender", root, Dx_Meus_Mineiros)
	end
end
bindKey ( "i", "both", Abrir_Meus_Itens )

	-----------------------------------
	----------- DX JOALHERIA ----------
	-----------------------------------
function Abrir_Joalheria ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Joalheria) then return end
	showCursor(true)
	ListaJoalheiros:SetVisible(true)
	addEventHandler("onClientRender", root, Dx_Joalheria)
end
addEvent("DNL:Abrir_Joalheria", true)
addEventHandler("DNL:Abrir_Joalheria", root, Abrir_Joalheria)

function Close_Joalheria ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Joalheria) then  
		showCursor(false)
		ListaJoalheiros:SetVisible(false)
		removeEventHandler("onClientRender", root, Dx_Joalheria)
	end
end
	                               --===================================--
                                   ----------- INTERFACE PAINEL ----------
                                   --===================================--
function Dx_Meus_Mineiros ()
		exports["Blur"]:dxDrawBluredRectangle(x*508, y*170, x*349, y*400, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*508, y*170, x*349, y*400, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(x*508, y*170, x*349, y*34, tocolor(0, 0, 0, 197), false)
        dxDrawLine(x*508, y*203, x*857, y*203, tocolor(16, 111, 231, 255), 2, false)
        dxDrawText("Meus #106FE7Minérios", x*640, y*175, x*713, y*191, tocolor(255, 255, 255, 255), 1.00, Font_1, "left", "top", false, false, false, true, false)
end
--addEventHandler("onClientRender", root, Dx_Meus_Mineiros)

function Dx_Joalheria ()
		exports["Blur"]:dxDrawBluredRectangle(x*508, y*170, x*349, y*356, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*508, y*170, x*349, y*356, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(x*508, y*170, x*349, y*34, tocolor(0, 0, 0, 197), false)
        dxDrawLine(x*508, y*203, x*857, y*203, tocolor(16, 111, 231, 255), x*2, false)
        dxDrawText("Joalheria", x*660, y*175, x*704, y*192, tocolor(255, 255, 255, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		
        dxDrawImage(x*524, y*470, x*153, y*43, "Img/botao.png", 0, 0, 0, Cor_Vender, false)
        dxDrawText("Vender", x*580, y*482, x*622, y*499, tocolor(255, 255, 255, 255), 1.00, Font_2, "left", "top", false, false, false, false, false)
		Cor_Vender = tocolor(16, 111, 231, 150)
	if isCursorOnElement(x*524, y*470, x*153, y*43) then
		Cor_Vender = tocolor(16, 111, 231, 200)
	end
		
        dxDrawImage(x*687, y*470, x*153, y*43, "Img/botao.png", 0, 0, 0, Cor_Fechar, false)
        dxDrawText("Fechar", x*743, y*482, x*782, y*499, tocolor(255, 255, 255, 255), 1.00, Font_2, "left", "top", false, false, false, false, false)
		Cor_Fechar = tocolor(16, 111, 231, 150)
	if isCursorOnElement(x*687, y*470, x*153, y*43) then
		Cor_Fechar = tocolor(16, 111, 231, 200)
	end
end
--addEventHandler("onClientRender", root, Dx_Joalheria)

addEventHandler("onClientResourceStart", resourceRoot,
  function ()
    ListaMinerios = dxGridW:Create(513, 209, 339, 356)
    ListaMinerios:AddColumn("Minérios", 140)
    ListaMinerios:AddColumn("", 50)
    ListaMinerios:AddColumn("Quantidade", 120)
    ListaMinerios:SetVisible(false)
	
    ListaJoalheiros = dxGridW:Create(518, 213, 329, 244)
    ListaJoalheiros:AddColumn("Minérios", 140)
    ListaJoalheiros:AddColumn("Quantidade", 55)
    ListaJoalheiros:AddColumn("Valor", 130)
    ListaJoalheiros:SetVisible(false)	
	Reload_Joalheria ()
end)

function Reload_Minerios ()
	local Min_Cobre = tonumber(getElementData(localPlayer, "min.Cobre")) or 0  
	local Min_Prata = tonumber(getElementData(localPlayer, "min.Prata")) or 0  
	local Min_Ouro = tonumber(getElementData(localPlayer, "min.Ouro")) or 0  
	local Min_Esmeralda = tonumber(getElementData(localPlayer, "min.Esmeralda")) or 0  
	local Min_Rubi = tonumber(getElementData(localPlayer, "min.Rubi")) or 0  
	local Min_Safira = tonumber(getElementData(localPlayer, "min.Safira")) or 0  
	local Min_Diamante = tonumber(getElementData(localPlayer, "min.Diamante")) or 0  
    ListaMinerios:Clear(true)
	if Min_Cobre >= 1 then
        ListaMinerios:AddItem(1,"Cobre")
	    ListaMinerios:AddItem(3, ""..Min_Cobre.."")
	end
	
	if Min_Prata >= 1 then
        ListaMinerios:AddItem(1,"Prata")
	    ListaMinerios:AddItem(3, ""..Min_Prata.."")
	end
	
	if Min_Ouro >= 1 then
        ListaMinerios:AddItem(1,"Ouro")
	    ListaMinerios:AddItem(3, ""..Min_Ouro.."")
	end
	
	if Min_Esmeralda >= 1 then
        ListaMinerios:AddItem(1,"Esmeralda")
	    ListaMinerios:AddItem(3, ""..Min_Esmeralda.."")
	end
	
	if Min_Rubi >= 1 then
        ListaMinerios:AddItem(1,"Rubi")
	    ListaMinerios:AddItem(3, ""..Min_Rubi.."")
	end
	
	if Min_Safira >= 1 then
        ListaMinerios:AddItem(1,"Safira")
	    ListaMinerios:AddItem(3, ""..Min_Safira.."")
	end
	
	if Min_Diamante >= 1 then
        ListaMinerios:AddItem(1,"Diamante")
	    ListaMinerios:AddItem(3, ""..Min_Diamante.."")
	end
end

function Reload_Joalheria ()	
	local Min_Cobre = tonumber(getElementData(localPlayer, "min.Cobre")) or 0  
	local Min_Prata = tonumber(getElementData(localPlayer, "min.Prata")) or 0  
	local Min_Ouro = tonumber(getElementData(localPlayer, "min.Ouro")) or 0  
	local Min_Esmeralda = tonumber(getElementData(localPlayer, "min.Esmeralda")) or 0  
	local Min_Rubi = tonumber(getElementData(localPlayer, "min.Rubi")) or 0  
	local Min_Safira = tonumber(getElementData(localPlayer, "min.Safira")) or 0  
	local Min_Diamante = tonumber(getElementData(localPlayer, "min.Diamante")) or 0  
    ListaJoalheiros:Clear(true)
	if Min_Cobre >= 0 then
        ListaJoalheiros:AddItem(1,"Cobre")
	    ListaJoalheiros:AddItem(2, ""..Min_Cobre.."")
	    ListaJoalheiros:AddItem(3, tostring(50))
	end
	
	if Min_Prata >= 0 then
        ListaJoalheiros:AddItem(1,"Prata")
	    ListaJoalheiros:AddItem(2, ""..Min_Prata.."")
	    ListaJoalheiros:AddItem(3, tostring(250))
	end
	
	if Min_Ouro >= 0 then
        ListaJoalheiros:AddItem(1,"Ouro")
	    ListaJoalheiros:AddItem(2, ""..Min_Ouro.."")
	    ListaJoalheiros:AddItem(3, tostring(15000))
	end
	
	if Min_Esmeralda >= 0 then
        ListaJoalheiros:AddItem(1,"Esmeralda")
	    ListaJoalheiros:AddItem(2, ""..Min_Esmeralda.."")
	    ListaJoalheiros:AddItem(3, tostring(23000))
	end
	
	if Min_Rubi >= 0 then
        ListaJoalheiros:AddItem(1,"Rubi")
	    ListaJoalheiros:AddItem(2, ""..Min_Rubi.."")
	    ListaJoalheiros:AddItem(3, tostring(35000))
	end
	
	if Min_Safira >= 0 then
        ListaJoalheiros:AddItem(1,"Safira")
	    ListaJoalheiros:AddItem(2, ""..Min_Safira.."")
	    ListaJoalheiros:AddItem(3, tostring(47000))
	end
	
	if Min_Diamante >= 0 then
        ListaJoalheiros:AddItem(1,"Diamante")
	    ListaJoalheiros:AddItem(2, ""..Min_Diamante.."")
	    ListaJoalheiros:AddItem(3, tostring(75000))
	end
end

	                               --=============================--
                                   ------------- Clicks ------------
                                   --=============================--
function Vender_Minerios ( _,state )
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Joalheria) then  
		if state == "down" then
			if isCursorOnElement(x*687, y*470, x*153, y*43) then -- Fechar Joalheria
				Close_Joalheria () 
			elseif isCursorOnElement(x*524, y*470, x*153, y*43) then -- Vender Minerios	
				if ListaJoalheiros:GetSelectedItem() then
					local Minerio = ListaJoalheiros:GetItemDetails(1, ListaJoalheiros:GetSelectedItem())
					local Quantidade = ListaJoalheiros:GetItemDetails(2, ListaJoalheiros:GetSelectedItem())
					local Valor = ListaJoalheiros:GetItemDetails(3, ListaJoalheiros:GetSelectedItem())
					playSoundFrontEnd(12)
					Reload_Joalheria ()
					triggerServerEvent("DNL:Vender_Minerio", root, localPlayer, Minerio, Quantidade, Valor)
				else
					triggerEvent("addNotification", root, "#ffffffINFO: #ffffffSelecione o Minério que Você Deseja Vender")
				end 
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Vender_Minerios )

	                               --=============================--
                                   ------------- IGNORA ------------
                                   --=============================--
--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-

Txd = engineLoadTXD ( "txd/bat.txd" )
engineImportTXD ( Txd, 333 )
Dff = engineLoadDFF ( "txd/bat.dff" )
engineReplaceModel ( Dff, 333 )

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-

addEventHandler("onClientKey", root, 
	function (button, press)
    if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Agencia) then  
			if button == "F1" or button == "F2" or button == "F3" or button == "F5" or button == "F6" or button == "F7" or button == "F9" or button == "F10" or button == "F11" or button == "F12" or button == "t" or button == "p" or button == "m" then
				cancelEvent()
			end
		end
	end
)

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