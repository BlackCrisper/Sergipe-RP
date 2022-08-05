 --[[


 ################################################
 #                                              #
 #             SCRIPT DESENVOLVIDO POR:         #
 #             Facebook.com/FENIXMTA/           #
 #             Youtube.com/FENIXMTA             #
 #             Não retire os créditos !         #
 #                                              #
 ################################################




 --]]

local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

local dxfont0_fonte = dxCreateFont("Files/fonte.ttf", 10)
local dxfont1_fonte = dxCreateFont("Files/fonte.ttf", 12)

FM_gridList = dxGrid:Create(screenW * 0.4034, screenH * 0.4844, screenW * 0.1757, screenH * 0.1237)
colum = FM_gridList:AddColumn("Tempo", 230)
FM_gridList:SetVisible(false)

local components = { "Segundo(s)", "Minuto(s)", "Hora(s)", "Dia(s)" }
for _, component in ipairs( components ) do
	 FM_gridList:AddItem ( colum ,component)
end

local ID = createElement("FM_dxEditBox") 
local Motivo = createElement("FM_dxEditBox")
local Tempo = createElement("FM_dxEditBox")

function dxPainel ()

        dxDrawRectangle(screenW * 0.3477, screenH * 0.2708, screenW * 0.2870, screenH * 0.4310, tocolor(0, 0, 0, 160), false)
        dxDrawRectangle(screenW * 0.3477, screenH * 0.2708, screenW * 0.2870, screenH * 0.0391, tocolor(0, 0, 0, 160), false)
        dxDrawRectangle(screenW * 0.3477, screenH * 0.3099, screenW * 0.1127, screenH * 0.0000, tocolor(255, 0, 0, 255), false)
        dxDrawRectangle(screenW * 0.3477, screenH * 0.3099, screenW * 0.2870, screenH * 0.0039, tocolor(255, 0, 0, 255), false)
        dxDrawText("Painel de Punições", 475, 208, 867, 238, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "center", "center", false, false, false, false, false)
		dxDrawEditBox("ID Jogador", screenW * 0.4034, screenH * 0.3320, screenW * 0.1757, screenH * 0.0378, false, 100, ID)
		dxDrawEditBox("Motivo do Ban", screenW * 0.4034, screenH * 0.3828, screenW * 0.1757, screenH * 0.0378, false, 200, Motivo)
		dxDrawEditBox("Tempo do Ban", screenW * 0.4034, screenH * 0.4336, screenW * 0.1757, screenH * 0.0378, false, 200, Tempo)
        dxDrawImage(screenW * 0.4341, screenH * 0.6276, screenW * 0.1142, screenH * 0.0612, "Files/button.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
        dxDrawText("Banir", screenW * 0.4341, screenH * 0.6250, screenW * 0.5483, screenH * 0.6888, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
		
end		

function abrirDx ()
  if not isEventHandlerAdded("onClientRender", getRootElement(), dxPainel) then
     addEventHandler("onClientRender", root , dxPainel)
     showCursor(true)
	 FM_gridList:SetVisible(true)
	 else
	 removeEventHandler ("onClientRender" , root, dxPainel)
	 showCursor(false)
	 FM_gridList:SetVisible(false)
    end
end
addEvent ("FM_OpenPainel", true)
addEventHandler ("FM_OpenPainel", getRootElement(), abrirDx )

function Banir (_,state)
 if isEventHandlerAdded("onClientRender", root, dxPainel) then  
  if state == "down" then
  if cursorPosition (screenW * 0.4341, screenH * 0.6276, screenW * 0.1142, screenH * 0.0612) then  
  local ID_Jogador = getElementData(ID, "FM_Texto")  
  local Motivo_Banir = getElementData(Motivo, "FM_Texto") 
  local Tempo_Banir = getElementData(Tempo, "FM_Texto") 
  local gridItem = FM_gridList:GetSelectedItem()
  local Tempo_Selecionado = FM_gridList:GetItemDetails( colum, gridItem, 1) or nil
  local ID =  tonumber ( ID_Jogador ) or nil
  local T_Banir =  tonumber ( Tempo_Banir ) or nil
  if ID == tonumber("0") or ID == nil then
  return outputChatBox("ID")
  end
  if Motivo_Banir == "" or Motivo_Banir == nil then
  return outputChatBox("Motivo")
  end
  if T_Banir == tonumber("0") or T_Banir == nil then
  return outputChatBox("TEMPO")
  end
  if Tempo_Selecionado == nil then
  return outputChatBox("Escolha tempo")
  end
  triggerServerEvent ( "FM_banirJogador", getLocalPlayer(), ID , T_Banir, Tempo_Selecionado, Motivo_Banir )
      end
    end
  end
end
addEventHandler ( "onClientClick", root, Banir )

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
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

function cursorPosition(x, y, w, h)
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