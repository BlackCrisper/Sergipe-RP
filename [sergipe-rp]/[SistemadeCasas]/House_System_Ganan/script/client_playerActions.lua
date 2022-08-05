
local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		-- ================= JANELA DE ESPECIFICAÇÕES DE SENHA AO COMPRAR =================
		GUI.window.setKey = guiCreateStaticImage((screenW - 350) / 2, (screenH - 150) / 2, 300, 159, "images/bg1.png", false)

		GUI.label[1] = guiCreateLabel(20, 25, 230, 30, "Você está prestes a comprar esta casa.\nInsira a chave futura:", false, GUI.window.setKey)
        local font1_medium = guiCreateFont("images/tahoma.ttf", 8)
        guiSetFont(GUI.label[1], font1_medium) 		
		guiLabelSetColor(GUI.label[1], 0, 0, 0)
		GUI.edit.setKey = guiCreateEdit(20, 65, 210, 25, "Chave", false, GUI.window.setKey)
		guiSetProperty(GUI.edit.setKey, "bgColor", 0x00000000)
		guiSetFont(GUI.edit.setKey, font1_medium)
		guiEditSetMaxLength(GUI.edit.setKey, 30)
		GUI.button.buyHouse = guiCreateStaticImage(20, 100, 110, 40, "images/accept.png", false, GUI.window.setKey)
		GUI.button.closeSetKey = guiCreateStaticImage(155, 100, 110, 40, "images/cancel.png", false, GUI.window.setKey)

		-- ================= JANELA DE SOLICITAÇÃO DE SENHA DE VENDA =================
		GUI.window.sellHouse = guiCreateWindow((screenW - 250) / 2, (screenH - 150) / 2, 250, 150, "Chave | Senha", false)
		guiWindowSetSizable(GUI.window.sellHouse, false)

		GUI.label[1] = guiCreateLabel(10, 25, 230, 30, "Se você vender essa casa, receberá apenas 50% do valor. ", false, GUI.window.sellHouse)
		guiLabelSetHorizontalAlign(GUI.label[1], "center", true)
		guiSetFont(GUI.label[1], "default-bold-small")
		guiLabelSetColor(GUI.label[1], 0, 153, 255)
		GUI.edit.keyToSell = guiCreateEdit(20, 65, 210, 25, "Chave", false, GUI.window.sellHouse)
		guiSetFont(GUI.edit.keyToSell, "default-bold-small")
		guiEditSetMaxLength(GUI.edit.keyToSell, 30)
		GUI.button.sellHouse = guiCreateButton(20, 100, 75, 30, "Aceitar", false, GUI.window.sellHouse)
		guiSetFont(GUI.button.sellHouse, "default-bold-small")
		GUI.button.closeSell = guiCreateButton(155, 100, 75, 30, "Cancelar", false, GUI.window.sellHouse)
		guiSetFont(GUI.button.closeSell, "default-bold-small")

		-- ================= JANELA DE ALTERAÇÃO DE SENHA =================
		GUI.window.changeKey = guiCreateWindow((screenW - 250) / 2, (screenH - 220) / 2, 250, 220, "Chave | Senha", false)
		guiWindowSetSizable(GUI.window.changeKey, false)

		GUI.label[1] = guiCreateLabel(10, 25, 230, 30, "Para alterar a chave, você precisa inserir uma nova chave ", false, GUI.window.changeKey)
		guiLabelSetHorizontalAlign(GUI.label[1], "center", true)
		guiSetFont(GUI.label[1], "default-bold-small")
		guiLabelSetColor(GUI.label[1], 0, 153, 255)
		-- GUI.edit.changeKeyOld = guiCreateEdit(20, 65, 210, 25, "Старый ключ", false, GUI.window.changeKey)
		-- guiSetFont(GUI.edit.changeKeyOld, "default-bold-small")
		-- guiEditSetMaxLength(GUI.edit.changeKeyOld, 30)
		GUI.edit.changeKeyNew1 = guiCreateEdit(20, 100, 210, 25, "Nova chave", false, GUI.window.changeKey)
		guiSetFont(GUI.edit.changeKeyNew1, "default-bold-small")
		guiEditSetMaxLength(GUI.edit.changeKeyNew1, 30)
		GUI.edit.changeKeyNew2 = guiCreateEdit(20, 135, 210, 25, "Chave de repetição", false, GUI.window.changeKey)
		guiSetFont(GUI.edit.changeKeyNew2, "default-bold-small")
		guiEditSetMaxLength(GUI.edit.changeKeyNew2, 30)
		GUI.button.OKchangeKey = guiCreateButton(20, 170, 75, 30, "Aceitar", false, GUI.window.changeKey)
		guiSetFont(GUI.button.OKchangeKey, "default-bold-small")
		GUI.button.closeChangeKey = guiCreateButton(155, 170, 75, 30, "Cancelar", false, GUI.window.changeKey)
		guiSetFont(GUI.button.closeChangeKey, "default-bold-small")

		-- ================= JANELA DE SOLICITAÇÃO DE SENHA NO LOGIN =================
		GUI.window.enterHouse = guiCreateWindow((screenW - 250) / 2, (screenH - 150) / 2, 250, 150, "Chave | Senha", false)
		guiWindowSetSizable(GUI.window.sellHouse, false)

		GUI.label[1] = guiCreateLabel(10, 25, 230, 30, "Insira a chave\nentrar na casa", false, GUI.window.enterHouse)
		guiLabelSetHorizontalAlign(GUI.label[1], "center", true)
		guiSetFont(GUI.label[1], "default-bold-small")
		guiLabelSetColor(GUI.label[1], 0, 153, 255)
		GUI.edit.keyToEnter = guiCreateEdit(20, 65, 210, 25, "Chave", false, GUI.window.enterHouse)
		guiSetFont(GUI.edit.keyToEnter, "default-bold-small")
		guiEditSetMaxLength(GUI.edit.keyToEnter, 30)
		GUI.button.enterHouse = guiCreateButton(20, 100, 75, 30, "Aceitar", false, GUI.window.enterHouse)
		guiSetFont(GUI.button.enterHouse, "default-bold-small")
		GUI.button.closeEnter = guiCreateButton(155, 100, 75, 30, "Cancelar", false, GUI.window.enterHouse)
		guiSetFont(GUI.button.closeEnter, "default-bold-small")
	
		-- ================= EDITOR DE GUIA EXTERNO CRIADO =================
		guiSetVisible(GUI.window.setKey, false)
		guiSetVisible(GUI.window.sellHouse, false)
		guiSetVisible(GUI.window.changeKey, false)
		guiSetVisible(GUI.window.enterHouse, false)	
	end
)

addEventHandler("onClientGUIClick", resourceRoot, function()
	-- ================= Abrindo caixas de diálogo =================
	if ((source==GUI.label.buy or source==GUI.staticimage.buy) and enabledButtons[GUI.staticimage.buy])
			or (source == GUI.button.buy) then
		guiSetVisible(GUI.window.main, false)
		guiSetVisible(GUI.window.setKey, true)
		guiSetText(GUI.edit.setKey, "Chave")
		playSound("sounds/click_question.wav")

	elseif ((source==GUI.label.sell or source==GUI.staticimage.sell) and enabledButtons[GUI.staticimage.sell])
			or (source == GUI.button.sell) then
		guiSetVisible(GUI.window.main, false)
		guiSetVisible(GUI.window.sellHouse, true)
		guiSetText(GUI.edit.keyToSell, "Chave")
		playSound("sounds/click_question.wav")

	elseif ((source==GUI.label.changeKey or source==GUI.staticimage.changeKey) and enabledButtons[GUI.staticimage.changeKey])
			or (source == GUI.button.changeKey) then
		guiSetVisible(GUI.window.main, false)
		guiSetVisible(GUI.window.changeKey, true)
		-- guiSetText(GUI.edit.changeKeyOld, "Chave antiga")
		guiSetText(GUI.edit.changeKeyNew1, "Nova chave")
		guiSetText(GUI.edit.changeKeyNew2, "Chave de repetição")
		playSound("sounds/click_question.wav")

	elseif ((source==GUI.label.enter or source==GUI.staticimage.enter) and enabledButtons[GUI.staticimage.enter])
			or (source == GUI.button.enter) then
		if (currentMarkerData.owner == "") or (currentMarkerData.owner == myAccount) then
			if not getElementData(localPlayer, "isChased") then
				guiSetVisible(GUI.window.main, false)
				showCursor(false)
				triggerServerEvent("enterHouse", resourceRoot, currentMarkerData)
			else
				--outputChatBad("É impossível entrar na casa. Uma perseguição está em andamento.")
				exports.YM_DxMessages:addBox( "É impossível entrar na casa. Uma perseguição está em andamento.", "error")	
			end
		else
			guiSetVisible(GUI.window.main, false)
			guiSetVisible(GUI.window.enterHouse, true)
			guiSetText(GUI.edit.keyToEnter, "Chave")
			playSound("sounds/click_question.wav")
		end
	
	--================= Primeiros cliques nos campos de entrada =================
	elseif (source == GUI.edit.setKey) or (source == GUI.edit.keyToSell) or (source == GUI.edit.keyToEnter) then
		if (guiGetText(GUI.edit.setKey) == "Chave") then guiSetText(GUI.edit.setKey, "") end
		if (guiGetText(GUI.edit.keyToSell) == "Chave") then guiSetText(GUI.edit.keyToSell, "") end
		if (guiGetText(GUI.edit.keyToEnter) == "Chave") then guiSetText(GUI.edit.keyToEnter, "") end

	-- elseif (source == GUI.edit.changeKeyOld) then
		-- if (guiGetText(GUI.edit.changeKeyOld) == "Старый ключ") then guiSetText(GUI.edit.changeKeyOld, "") end

	elseif (source == GUI.edit.changeKeyNew1) then
		if (guiGetText(GUI.edit.changeKeyNew1) == "Nova chave") then guiSetText(GUI.edit.changeKeyNew1, "") end

	elseif (source == GUI.edit.changeKeyNew2) then
		if (guiGetText(GUI.edit.changeKeyNew2) == "Chave de repetição") then guiSetText(GUI.edit.changeKeyNew2, "") end

	elseif (source == GUI.edit.changeOwnerKey) then
		if (guiGetText(GUI.edit.changeOwnerKey) == "Chave") then guiSetText(GUI.edit.changeOwnerKey, "") end

	--================= Consentimento em caixas de diálogo =================
	elseif (source == GUI.button.buyHouse) then
		local text = guiGetText(GUI.edit.setKey)
		if (text ~= "") and (text ~= "Chave") then
			guiSetVisible(GUI.window.setKey, false)
			showCursor(false)
			triggerServerEvent("buyHouse", resourceRoot, currentMarkerData, text)
		else
			--outputChatBad("Insira a chave!")
			exports.YM_DxMessages:addBox( "Insira a chave!", "info")	
		end

	elseif (source == GUI.button.sellHouse) then
		local text = guiGetText(GUI.edit.keyToSell)
		if (text ~= "") and (text ~= "Chave") then
			if (text == currentMarkerData.key) then
				guiSetVisible(GUI.window.sellHouse, false)
				showCursor(false)
				triggerServerEvent("sellHouse", resourceRoot, currentMarkerData)
			else
				--outputChatBad("Chave inválida!")
				exports.YM_DxMessages:addBox( "Chave inválida", "warning")
				guiSetVisible(GUI.window.main, true)
				guiSetVisible(GUI.window.sellHouse, false)
			end
		else
			--outputChatBad("Insira a chave!")
			exports.YM_DxMessages:addBox( "Insira a chave!", "info")
		end

	elseif (source == GUI.button.OKchangeKey) then
		-- local oldKey = guiGetText(GUI.edit.changeKeyOld)
		local newKey1 = guiGetText(GUI.edit.changeKeyNew1)
		local newKey2 = guiGetText(GUI.edit.changeKeyNew2)
		-- if (oldKey == "") or (oldKey == "Старый ключ") then
			-- outputChatBad("Digite sua chave antiga!")
			-- return
		-- end
		if (newKey1 == "") or (newKey1 == "Nova chave") then
			--outputChatBad("Insira uma nova chave!")
			exports.YM_DxMessages:addBox( "Insira uma nova chave!", "info")
			return
		end
		if (newKey2 == "") or (newKey2 == "Chave de repetição") then
			--outputChatBad("Insira novamente a nova chave!")
			exports.YM_DxMessages:addBox( "Insira novamente a nova chave!", "info")
			return
		end
		if newKey1 ~= newKey2 then
			--outputChatBad("As novas chaves não combinam!")
			exports.YM_DxMessages:addBox( "As chaves não combinam (VERIFIQUE)", "error")
			return
		end
		-- if (oldKey == currentMarkerData.key) then
			guiSetVisible(GUI.window.changeKey, false)
			showCursor(false)
			triggerServerEvent("changeKey", resourceRoot, currentMarkerData, oldKey, newKey1)
		-- else
			-- outputChatBad("Старый ключ неверен!")
			-- guiSetVisible(GUI.window.main, true)
			-- guiSetVisible(GUI.window.changeKey, false)
		-- end

	elseif (source == GUI.button.enterHouse) then
		local key = guiGetText(GUI.edit.keyToEnter)
		if (key == currentMarkerData.key) then
			if not getElementData(localPlayer, "isChased") then
				guiSetVisible(GUI.window.enterHouse, false)
				showCursor(false)
				triggerServerEvent("enterHouse", resourceRoot, currentMarkerData)
			else
				---outputChatBad("É impossível entrar na casa. Uma perseguição está em andamento.")
				exports.YM_DxMessages:addBox( "É impossível entrar na casa. Uma perseguição está em andamento.", "error")
			end
		else
			--outputChatBad("Chave inválida!")
			exports.YM_DxMessages:addBox( "Chave inválida!", "error")
			guiSetVisible(GUI.window.main, true)
			guiSetVisible(GUI.window.enterHouse, false)
		end
	
	--================= Fechando janelas =================
	elseif (source == GUI.button.closeSetKey) then
		guiSetVisible(GUI.window.main, true)
		guiSetVisible(GUI.window.setKey, false)

	elseif (source == GUI.button.closeSell) then
		guiSetVisible(GUI.window.main, true)
		guiSetVisible(GUI.window.sellHouse, false)

	elseif (source == GUI.button.closeChangeKey) then
		guiSetVisible(GUI.window.main, true)
		guiSetVisible(GUI.window.changeKey, false)

	elseif (source == GUI.button.closeEnter) then
		guiSetVisible(GUI.window.main, true)
		guiSetVisible(GUI.window.enterHouse, false)

	elseif (source == GUI.button.close) then
		guiSetVisible(GUI.window.main, false)
		showCursor(false)

	end
end)

