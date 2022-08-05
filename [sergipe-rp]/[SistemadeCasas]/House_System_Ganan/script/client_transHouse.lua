
local screenW, screenH = guiGetScreenSize()
local moneyToAccept, IDtoAccept, sellerToAccept
local flashTimer

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		-- ================= JANELA DE MUDANÇA DE PROPRIETÁRIO =================
		GUI.window.changeOwner = guiCreateWindow((screenW - 430) / 2, (screenH - 300) / 2, 430, 300, "Transferência de casa", false)
        guiWindowSetSizable(GUI.window.changeOwner, false)
        guiSetAlpha(GUI.window.changeOwner, 1.00)
        GUI.label[1] = guiCreateLabel(10, 25, 200, 105, "Selecione um jogador da lista.\nSe o player não estiver na lista, atualize a lista.\nO jogador a quem deseja vender a casa deve estar a uma curta distância da casa.", false, GUI.window.changeOwner)
        guiLabelSetHorizontalAlign(GUI.label[1], "center", true)
        GUI.gridlist.changeOwnerPlayerList = guiCreateGridList(10, 140, 200, 115, false, GUI.window.changeOwner)
        guiGridListAddColumn(GUI.gridlist.changeOwnerPlayerList, "Jogadores", 0.9)
        GUI.button.changeOwnerRefreshPlayers = guiCreateButton(10, 265, 130, 25, "Atualizar lista", false, GUI.window.changeOwner)
        GUI.label[2] = guiCreateLabel(220, 25, 200, 45, "Insira o valor pelo qual deseja vender sua casa.\nO imposto sobre transações é de 10%.", false, GUI.window.changeOwner)
        guiLabelSetHorizontalAlign(GUI.label[2], "center", true)
        GUI.label[3] = guiCreateLabel(220, 80, 200, 15, "Você terá:", false, GUI.window.changeOwner)
        GUI.edit.changeOwnerSellerMoney = guiCreateEdit(220, 100, 200, 25, "", false, GUI.window.changeOwner)
		guiEditSetMaxLength(GUI.edit.changeOwnerSellerMoney, 9)
        GUI.label[4] = guiCreateLabel(220, 135, 200, 15, "O comprador pagará:", false, GUI.window.changeOwner)
        GUI.edit.changeOwnerBuyerMoney = guiCreateEdit(220, 155, 200, 25, "", false, GUI.window.changeOwner)
        guiSetProperty(GUI.edit.changeOwnerBuyerMoney, "NormalTextColour", "FF7F7F7F")
        guiEditSetReadOnly(GUI.edit.changeOwnerBuyerMoney, true)
        GUI.label[1] = guiCreateLabel(220, 190, 200, 15, "Insira a chave:", false, GUI.window.changeOwner)
        GUI.edit.newKey = guiCreateEdit(220, 210, 200, 25, "", false, GUI.window.changeOwner)
		guiSetFont(GUI.edit.newKey, "default-bold-small")
        guiEditSetMaxLength(GUI.edit.newKey, 255)    
        GUI.button.changeOwnerOK = guiCreateButton(220, 260, 80, 30, "ОК", false, GUI.window.changeOwner)
        GUI.button.changeOwnerCancel = guiCreateButton(340, 260, 80, 30, "Cancelar", false, GUI.window.changeOwner) 
		
		-- ================= JANELA DE OFERTA DE COMPRA =================
        GUI.window.transHouse = guiCreateWindow((screenW-270)/2, (screenH-250)/2, 270, 250, "Comprando uma casa", false)
        guiWindowSetSizable(GUI.window.transHouse, false)
        GUI.label.transHouseSellerInfo = guiCreateLabel(10, 25, 250, 30, "PIDRE PLAYER convida você a comprar a casa dele.", false, GUI.window.transHouse)
        guiLabelSetHorizontalAlign(GUI.label.transHouseSellerInfo, "left", true)
        GUI.label.transHouseName = guiCreateLabel(10, 65, 250, 15, "Distrito: ", false, GUI.window.transHouse)
        GUI.label.transHouseBuyerPay = guiCreateLabel(10, 90, 250, 15, "Você vai pagar: ", false, GUI.window.transHouse)
        GUI.label.transHouseSellerMoney = guiCreateLabel(10, 115, 250, 15, "O vendedor receberá: ", false, GUI.window.transHouse)
        GUI.label.transHouseParkingLots = guiCreateLabel(10, 140, 250, 15, "", false, GUI.window.transHouse)
        GUI.label[1] = guiCreateLabel(10, 175, 250, 15, "Você confirma sua compra ?", false, GUI.window.transHouse)
        guiSetFont(GUI.label[1], "default-bold-small")
        guiLabelSetHorizontalAlign(GUI.label[1], "center", false)
        GUI.button.transHouseOK = guiCreateButton(10, 200, 120, 35, "eu confirmo", false, GUI.window.transHouse)
        guiSetFont(GUI.button.transHouseOK, "default-bold-small")
        guiSetProperty(GUI.button.transHouseOK, "NormalTextColour", "FF1EFF1E")
        GUI.button.transHouseCancel = guiCreateButton(140, 200, 120, 35, "eu recuso", false, GUI.window.transHouse)
        guiSetFont(GUI.button.transHouseCancel, "default-bold-small")
        guiSetProperty(GUI.button.transHouseCancel, "NormalTextColour", "FFFF1E1E")    

		-- ================= EDITOR DE GUIA EXTERNO CRIADO =================
		guiSetVisible(GUI.window.changeOwner, false)
		guiSetVisible(GUI.window.transHouse, false)
		addEventHandler("onClientGUIChanged", GUI.edit.changeOwnerSellerMoney, onEditBoxChanged)
	end
)

function refreshTransHouseList()
	guiGridListClear(GUI.gridlist.changeOwnerPlayerList)
	local x, y, z = currentMarkerData.enterMrkX, currentMarkerData.enterMrkY, currentMarkerData.enterMrkZ
	for _, player in ipairs(getElementsByType("player", root, true)) do
		local pX, pY, pZ = getElementPosition(player)
		if (getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ) < 10) and (player ~= localPlayer) then
			local row = guiGridListAddRow(GUI.gridlist.changeOwnerPlayerList)
			guiGridListSetItemText(GUI.gridlist.changeOwnerPlayerList, row, 1, string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', ''), false, false)
			guiGridListSetItemData(GUI.gridlist.changeOwnerPlayerList, row, 1, player)
		end
	end
end

function onEditBoxChanged()
	if (source == GUI.edit.changeOwnerSellerMoney) then
		local money = tonumber(guiGetText(GUI.edit.changeOwnerSellerMoney))
		if money then
			guiSetText(GUI.edit.changeOwnerBuyerMoney, math.floor(money*1.1))
		else
			guiSetText(GUI.edit.changeOwnerBuyerMoney, "")
		end
	end
end

addEventHandler("onClientGUIClick", resourceRoot, function()
	if ((source==GUI.label.newOwner or source==GUI.staticimage.newOwner) and enabledButtons[GUI.staticimage.newOwner]) or (source == GUI.button.newOwner) then
		refreshTransHouseList()
		guiSetVisible(GUI.window.main, false)
		guiSetVisible(GUI.window.changeOwner, true)
		guiBringToFront(GUI.window.changeOwner)
		guiSetText(GUI.edit.newKey, "Chave")
		guiSetText(GUI.edit.changeOwnerSellerMoney, math.ceil(currentMarkerData.cost*0.5))
		playSound("sounds/click_question.wav")
		
	elseif (source == GUI.edit.newKey) then
		if (guiGetText(GUI.edit.newKey) == "Chave") then guiSetText(GUI.edit.newKey, "") end

	elseif (source == GUI.button.changeOwnerRefreshPlayers) then
		refreshTransHouseList()

	elseif (source == GUI.button.changeOwnerOK) then
		local key = guiGetText(GUI.edit.newKey)
		local money = tonumber(guiGetText(GUI.edit.changeOwnerSellerMoney))
		local selected = guiGridListGetSelectedItem(GUI.gridlist.changeOwnerPlayerList)
		local newOwnerPlayer = guiGridListGetItemData(GUI.gridlist.changeOwnerPlayerList, selected, 1)
		if (key == "Chave") or (key == "") then
			outputChatBad("Chave não especificada!")
			return
		end
		if not newOwnerPlayer then
			outputChatBad("Nenhum jogador selecionado!")
			return
		end
		local x, y, z = currentMarkerData.enterMrkX, currentMarkerData.enterMrkY, currentMarkerData.enterMrkZ
		local pX, pY, pZ = getElementPosition(localPlayer)
		if (getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ) > 10) then
			outputChatBad("Você está muito longe de casa!")
			return
		end
		pX, pY, pZ = getElementPosition(newOwnerPlayer)
		if (getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ) > 10) then
			outputChatBad("O jogador selecionado está muito longe!")
			return
		end
		if (not money) then
			outputBadMessage("Por favor, insira o valor correto!")
			return
		end
		if (money < 0) then
			outputBadMessage("Você não pode inserir um valor negativo!")
			return
		end
		if (key == currentMarkerData.key) then
			closeAllWindows()
			triggerServerEvent("transHouse", resourceRoot, currentMarkerData.ID, newOwnerPlayer, money)
		else
			outputChatBad("Chave inválida!")
		end
		
	elseif (source == GUI.button.changeOwnerCancel) then
		guiSetVisible(GUI.window.main, true)
		guiSetVisible(GUI.window.changeOwner, false)
		
	elseif (source == GUI.button.transHouseOK) then
		closeAllWindows()
		triggerServerEvent("acceptHouseOffer", resourceRoot, IDtoAccept, sellerToAccept, moneyToAccept)
		IDtoAccept, sellerToAccept, moneyToAccept = nil, nil, nil
		if isTimer(flashTimer) then killTimer(flashTimer) end
		
	elseif (source == GUI.button.transHouseCancel) then
		closeAllWindows()
		triggerServerEvent("declineHouseOffer", resourceRoot, IDtoAccept, sellerToAccept, moneyToAccept)
		IDtoAccept, sellerToAccept, moneyToAccept = nil, nil, nil
		if isTimer(flashTimer) then killTimer(flashTimer) end
		
	end
end)


function transHouseOffer(hData, seller, sellerMoney)
	closeAllWindows()
	IDtoAccept, sellerToAccept, moneyToAccept = hData.ID, seller, sellerMoney
	currentMarkerData = hData
	guiSetText(GUI.label.transHouseSellerInfo, string.gsub(getPlayerName(seller), '#%x%x%x%x%x%x', '').." convida você a comprar sua casa.")
	guiSetText(GUI.label.transHouseName, "Distrito: "..getZoneName(hData.enterMrkX, hData.enterMrkY, hData.enterMrkZ))
	guiSetText(GUI.label.transHouseBuyerPay, "Você vai pagar: "..explodeNumber(math.floor(sellerMoney*1.1)).." R$.")
	guiSetText(GUI.label.transHouseSellerMoney, "O vendedor receberá: "..explodeNumber(sellerMoney).." R$.")
	guiSetText(GUI.label.transHouseParkingLots, "n/a"..hData.carLots)
	guiSetVisible(GUI.window.transHouse, true)
	highlightMoney(math.floor(sellerMoney*1.1), hData.cost)
	
	showCursor(true)
	guiSetInputMode("no_binds_when_editing")
end
addEvent("transHouseOffer", true)
addEventHandler("transHouseOffer", resourceRoot, transHouseOffer)

function highlightMoney(money, realCost)
	if (money <= realCost * 2) then
		guiLabelSetColor(GUI.label.transHouseBuyerPay, 		30, 255, 30)   
		guiLabelSetColor(GUI.label.transHouseSellerMoney, 	30, 255, 30)
	elseif (money <= realCost * 5) then
		guiLabelSetColor(GUI.label.transHouseBuyerPay, 		255, 175, 30)   
		guiLabelSetColor(GUI.label.transHouseSellerMoney, 	255, 175, 30)
		flashTimer = setTimer(flashPrice, 750, 0)
	else
		guiLabelSetColor(GUI.label.transHouseBuyerPay, 		255, 30, 30)   
		guiLabelSetColor(GUI.label.transHouseSellerMoney, 	255, 30, 30)
		flashTimer = setTimer(flashPrice, 250, 0)
	end  
end

function flashPrice()
	local state = not guiGetVisible(GUI.label.transHouseBuyerPay)
	guiSetVisible(GUI.label.transHouseBuyerPay, state)
	guiSetVisible(GUI.label.transHouseSellerMoney, state)
end











