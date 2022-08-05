
local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		-- ================= JANELA DE EDIÇÃO DA CASA =================
		GUI.window.parameters = guiCreateWindow((screenW - 250) / 2, (screenH - 145) / 2, 250, 145, "Parâmetros", false)
		guiWindowSetSizable(GUI.window.parameters, false)

		GUI.label[1] = guiCreateLabel(10, 25, 230, 30, "Envie informações sobre a casa para /hpainel?", false, GUI.window.parameters)
		guiLabelSetHorizontalAlign(GUI.label[1], "center", true)
		guiSetFont(GUI.label[1], "default-bold-small")
		guiLabelSetColor(GUI.label[1], 0, 153, 255)
		GUI.button.moveData = guiCreateButton(87, 65, 76, 30, "Transferir", false, GUI.window.parameters)
		guiSetFont(GUI.button.moveData, "default-bold-small")
        GUI.button.sendToBighpanel = guiCreateButton(165, 60, 75, 35, "Passe para /bighpanel", false, GUI.window.parameters)    
		GUI.button.deleteHouse = guiCreateButton(10, 105, 75, 30, "Excluir casa", false, GUI.window.parameters)
		guiSetFont(GUI.button.deleteHouse, "default-bold-small")
		GUI.button.closeParameters = guiCreateButton(165, 105, 75, 30, "Cancelar", false, GUI.window.parameters)
		guiSetFont(GUI.button.closeParameters, "default-bold-small")
		
		-- ================= EDITOR DE GUIA EXTERNO CRIADO =================
		guiSetVisible(GUI.window.parameters, false)
	end
)


addEventHandler("onClientGUIClick", resourceRoot, function()
	if ((source==GUI.label.edit or source==GUI.staticimage.edit) and enabledButtons[GUI.staticimage.edit])
			or (source == GUI.button.edit) then
		guiSetVisible(GUI.window.main, false)
		guiSetVisible(GUI.window.parameters, true)
		playSound("sounds/click_question.wav")

	elseif (source == GUI.button.moveData) then
		guiSetText(GUI.edit.enterPointX, math.round(currentMarkerData.enterPointX, 6))
		guiSetText(GUI.edit.enterPointY, math.round(currentMarkerData.enterPointY, 6))
		guiSetText(GUI.edit.enterPointZ, math.round(currentMarkerData.enterPointZ, 6))
		guiSetText(GUI.edit.interior, currentMarkerData.int)
		guiSetText(GUI.edit.price, currentMarkerData.cost)
		setCreationInteriorID(currentMarkerData.intID)
		triggerServerEvent("getHouseData", resourceRoot, currentMarkerData)

	elseif (source == GUI.button.deleteHouse) then
		guiSetVisible(GUI.window.parameters, false)
		showCursor(false)
		triggerServerEvent("deleteHouse", resourceRoot, currentMarkerData.ID)
		
	elseif (source == GUI.button.closeParameters) then
		guiSetVisible(GUI.window.main, true)
		guiSetVisible(GUI.window.parameters, false)
		
	elseif (source == GUI.button.sendToBighpanel) then
		triggerServerEvent("sendToBighpanel", resourceRoot, currentMarkerData)
		guiSetVisible(GUI.window.parameters, false)
		showCursor(false)
	end
end)

function catchHouseData(data)
	guiSetText(GUI.edit.enterMrkX, math.round(data.enterMrkX, 6))
	guiSetText(GUI.edit.enterMrkY, math.round(data.enterMrkY, 6))
	guiSetText(GUI.edit.enterMrkZ, math.round(data.enterMrkZ, 6))
	guiSetText(GUI.edit.exitMrkX, math.round(data.exitMrkX, 6))
	guiSetText(GUI.edit.exitMrkY, math.round(data.exitMrkY, 6))
	guiSetText(GUI.edit.exitMrkZ, math.round(data.exitMrkZ, 6))
	guiSetText(GUI.edit.exitPointX, math.round(data.exitPointX, 6))
	guiSetText(GUI.edit.exitPointY, math.round(data.exitPointY, 6))
	guiSetText(GUI.edit.exitPointZ, math.round(data.exitPointZ, 6))
	--outputChatOK("Os dados foram transferidos!")
	exports.YM_DxMessages:addBox( "Os dados foram transferidos!", "info")	
end
addEvent("catchHouseData", true)
addEventHandler("catchHouseData", resourceRoot, catchHouseData)
