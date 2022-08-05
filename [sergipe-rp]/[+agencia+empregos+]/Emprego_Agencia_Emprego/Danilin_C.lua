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

------------- ############################################ -------------
------------- #     Edite aqui (Level, Habilitação)      # -------------
------------- ############################################ -------------
Trabalhos = {
    {"Lixeiro", 0, "Nenhuma"}, -- Emprego, Level, Habilitação
    {"Carregador", 3, "Nenhuma"}, -- Emprego, Level, Habilitação
    {"Pescaria", 20, "Nenhuma"}, -- Emprego, Level, Habilitação
    {"Mineirador", 25, "Nenhuma"}, -- Emprego, Level, Habilitação
    {"Pizzaboy", 5, "A"}, -- Emprego, Level, Habilitação
    {"Sedex", 10, "C"}, -- Emprego, Level, Habilitação
    {"Caminhoneiro", 15, "D"}, -- Emprego, Level, Habilitação
}
	                               --===================================--
                                   ------------- Abrir/Fechar ------------
                                   --===================================--
function Abrir_agencia ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Agencia) then return end
	showCursor(true)
	ListaTrabalhos:SetVisible(true)
	addEventHandler("onClientRender", root, Dx_Agencia)
end
addEvent("AG:Abrir", true)
addEventHandler("AG:Abrir", root, Abrir_agencia)

function CloseAgencia ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Agencia) then  
		showCursor(false)
		ListaTrabalhos:SetVisible(false)
		removeEventHandler("onClientRender", root, Dx_Agencia)
	end
end
	                               --=======================================--
                                   ------------- Interface Painel ------------
                                   --=======================================--
function Dx_Agencia ()
		exports["Blur"]:dxDrawBluredRectangle(x*488, y*138, x*391, y*491, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*488, y*138, x*391, y*491, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(x*489, y*138, x*391, y*38, tocolor(0, 0, 0, 212), false)
        dxDrawLine(x*488, y*176, x*880, y*176, tocolor(16, 111, 231, 255), x*2, false)
        dxDrawText("Agencia de Empregos", x*621, y*146, x*746, y*161, tocolor(255, 255, 255, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		
        dxDrawImage(x*500, y*494, x*366, y*37, "Img/botao.png", 0, 0, 0, CorEmprego, false)
        dxDrawText("Pegar Emprego", x*639, y*502, x*729, y*519, tocolor(0, 0, 0, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		CorEmprego = tocolor(16, 111, 231, 170)
	if isCursorOnElement(x*500, y*494, x*366, y*37) then
		CorEmprego = tocolor(16, 111, 231, 200)
	end
		
        dxDrawImage(x*500, y*538, x*366, y*37, "Img/botao.png", 0, 0, 0, CorDemissao, false)
        dxDrawText("Pedir Demissão", x*640, y*546, x*726, y*563, tocolor(0, 0, 0, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		CorDemissao = tocolor(16, 111, 231, 170)
	if isCursorOnElement(x*500, y*538, x*366, y*37) then
		CorDemissao = tocolor(16, 111, 231, 200)
	end
		
        dxDrawImage(x*500, y*582, x*366, y*37, "Img/botao.png", 0, 0, 0, CorSair, false)
        dxDrawText("Sair Agencia", x*650, y*590, x*719, y*609, tocolor(0, 0, 0, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		CorSair = tocolor(16, 111, 231, 170)
	if isCursorOnElement(x*500, y*582, x*366, y*37) then
		CorSair = tocolor(16, 111, 231, 200)
	end
end
	                               --================================--
                                   ------------- GridTable ------------
                                   --================================--

addEventHandler("onClientResourceStart", resourceRoot,
  function ()
    ListaTrabalhos = dxGridW:Create(494, 183, 379, 302)
    ListaTrabalhos:AddColumn("Emprego", 140)
    ListaTrabalhos:AddColumn("Level", 105)
    ListaTrabalhos:AddColumn("Habilitação", 120)
    ListaTrabalhos:SetVisible(false)
	
	for i,v in ipairs (Trabalhos) do
		ListaTrabalhos:AddItem(1, tostring(v[1]))
		ListaTrabalhos:AddItem(2, tostring(v[2]))
		ListaTrabalhos:AddItem(3, tostring(v[3]))
	end
end)

	                               --=============================--
                                   ------------- Clicks ------------
                                   --=============================--
function Pegar_Trabalho ( _,state )
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Agencia) then  
		if state == "down" then
			if isCursorOnElement(x*500, y*582, x*366, y*37) then -- Fechar Agencia
				CloseAgencia () 
			end
			if isCursorOnElement(x*500, y*494, x*366, y*37) then -- Pegar Emprego	
				if ListaTrabalhos:GetSelectedItem() > -1 then  
					local Trab = ListaTrabalhos:GetItemDetails(1, ListaTrabalhos:GetSelectedItem())
					local Level = ListaTrabalhos:GetItemDetails(2, ListaTrabalhos:GetSelectedItem())
					local Hab = ListaTrabalhos:GetItemDetails(3, ListaTrabalhos:GetSelectedItem())
					playSoundFrontEnd(12)
					triggerServerEvent("DNL:Pegar_Emprego", root, localPlayer, Trab, Level, Hab)
				else				   
					triggerEvent("addNotification", root, "#ffffffINFO: #ffffffSelecione o Emprego que Você Deseja Trabalhar", "info")
				end 
			elseif isCursorOnElement(x*500, y*538, x*366, y*37) then -- Demissão
					playSoundFrontEnd(12)
					triggerServerEvent("DNL:Pedir_Demissao", root, localPlayer)
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Pegar_Trabalho )

	                               --=============================--
                                   ------------- IGNORA ------------
                                   --=============================--
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