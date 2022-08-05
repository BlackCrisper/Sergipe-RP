
local screenW, screenH = guiGetScreenSize()
currentMarkerData = {}
enabledButtons = {}

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		-- ================= JANELA DE JOGADORES =================
		GUI.window.main = guiCreateStaticImage((screenW - 1170), (screenH - 700), 380, 550, "images/bg.png", false)
    		
		GUI.staticimage.buy = guiCreateStaticImage(45, 250, 290, 40, "images/icon_buy.png", false, GUI.window.main)
	
		GUI.staticimage.sell = guiCreateStaticImage(45, 450, 290, 40, "images/icon_sale.png", false, GUI.window.main)
	
		GUI.staticimage.changeKey = guiCreateStaticImage(45, 350, 290, 40, "images/icon_key.png", false, GUI.window.main)

		GUI.staticimage.enter = guiCreateStaticImage(45, 300, 290, 40, "images/icon_enter.png", false, GUI.window.main)

		GUI.staticimage.newOwner = guiCreateStaticImage(45, 400, 290, 40, "images/icon_newowner.png", false, GUI.window.main)

		GUI.staticimage.edit = guiCreateStaticImage(45, 500, 290, 40, "images/icon_edit.png", false, GUI.window.main)

		GUI.label.nomer = guiCreateLabel(42, 90, 128, 15, "Sala: 0", false, GUI.window.main)
		guiLabelSetVerticalAlign(GUI.label.nomer, "center")
		guiSetFont(GUI.label.nomer, "default-bold-small")
		guiLabelSetColor(GUI.label.nomer, 0, 0, 0)
        local font0_medium = guiCreateFont("images/tahoma.ttf", 10)
        guiSetFont(GUI.label.nomer, font0_medium) 		

		GUI.label.price = guiCreateLabel(42, 147, 500,15, "Preço: 0", false, GUI.window.main)
		guiLabelSetVerticalAlign(GUI.label.price, "center")
		guiSetFont(GUI.label.price, "default-bold-small")
		guiLabelSetColor(GUI.label.price, 0, 0, 0)
        local font0_medium = guiCreateFont("images/tahoma.ttf", 10)
        guiSetFont(GUI.label.price, font0_medium)		

		GUI.label.owner = guiCreateLabel(42, 100, 250, 50, "Proprietário: n/a", false, GUI.window.main)
		guiLabelSetVerticalAlign(GUI.label.owner, "center")
		guiSetFont(GUI.label.owner, "default-bold-small")
		guiLabelSetColor(GUI.label.owner, 0, 0, 0)
        local font0_medium = guiCreateFont("images/tahoma.ttf", 10)
        guiSetFont(GUI.label.owner, font0_medium)		

		GUI.button.close = guiCreateStaticImage(335, 10, 30, 30, "images/close.png", false, GUI.window.main)
		
		-- ================= EDITOR DE GUIA EXTERNO CRIADO =================
		guiSetVisible(GUI.window.main, false)		
		addEventHandler("onClientMouseEnter", GUI.staticimage.buy,		onMouseEnter)
		addEventHandler("onClientMouseEnter", GUI.staticimage.sell,		onMouseEnter)
		addEventHandler("onClientMouseEnter", GUI.staticimage.changeKey,onMouseEnter)
		addEventHandler("onClientMouseEnter", GUI.staticimage.enter,	onMouseEnter)
		addEventHandler("onClientMouseEnter", GUI.staticimage.newOwner, onMouseEnter)
		addEventHandler("onClientMouseEnter", GUI.staticimage.edit,		onMouseEnter)	
		addEventHandler("onClientMouseLeave", GUI.staticimage.buy,		onMouseLeave)
		addEventHandler("onClientMouseLeave", GUI.staticimage.sell,		onMouseLeave)
		addEventHandler("onClientMouseLeave", GUI.staticimage.changeKey,onMouseLeave)
		addEventHandler("onClientMouseLeave", GUI.staticimage.enter,	onMouseLeave)
		addEventHandler("onClientMouseLeave", GUI.staticimage.newOwner,	onMouseLeave)
		addEventHandler("onClientMouseLeave", GUI.staticimage.edit,		onMouseLeave)	
	end
)

function onMouseEnter()
	if enabledButtons[source] then
		guiSetAlpha(source, 0.5)
	end
end

function onMouseLeave()
	if enabledButtons[source] then
		guiSetAlpha(source, 1.0)
	end
end

function openPlayerPanel(markerData, buttons)
	if guiGetVisible(GUI.window.creation) then return end
	guiSetVisible(GUI.window.main, true)
	currentMarkerData = markerData
	guiSetText(GUI.label.nomer, "Casa ID: "..markerData.ID)
	guiSetText(GUI.label.price, string.format("Preço: % s R$.          ", explodeNumber(markerData.cost), markerData.carLots))
	if markerData.owner ~= "" then
		guiSetText(GUI.label.owner, "Proprietário: "..markerData.owner.." - Interior: "..markerData.intID)
	else
		guiSetText(GUI.label.owner, "Proprietário: n/a")
	end
	for id, value in pairs(buttons) do
		if value then
			guiSetAlpha(GUI.staticimage[id], 1.0)
			enabledButtons[GUI.staticimage[id]] = true
		else
			guiSetAlpha(GUI.staticimage[id], 0.3)
			enabledButtons[GUI.staticimage[id]] = false
		end
	end
	showCursor(true)
	guiSetInputMode("no_binds_when_editing")
end
addEvent("openPlayerPanel", true)
addEventHandler("openPlayerPanel", resourceRoot, openPlayerPanel)



function closeAllWindows()
	if not guiGetVisible(GUI.window.creation) then
		guiSetVisible(GUI.window.main, false)
		guiSetVisible(GUI.window.setKey, false)
		guiSetVisible(GUI.window.sellHouse, false)
		guiSetVisible(GUI.window.changeKey, false)
		guiSetVisible(GUI.window.enterHouse, false)
		guiSetVisible(GUI.window.changeOwner, false)
		guiSetVisible(GUI.window.transHouse, false)
		guiSetInputMode("allow_binds")
		showCursor(false)
	end
end
addEvent("closeAllWindows", true)
addEventHandler("closeAllWindows", resourceRoot, closeAllWindows)