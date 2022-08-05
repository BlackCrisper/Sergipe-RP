------------------
--- Autor do site russo Edward bill
---- Traduzido por #Meneses
---- Mj Mods
---- Para editar os textos das imagens é na pasta gui são imagens e na linha 233 as unicas coisas editaveis

markers_shop = {}
obj = {}

table_shops = {
	["Los Santos"] = {
		["nameShop"] = "Skins Los Santos",
		["marker shop"] = {1670.653, -1271.166, 14.022}, -- Cordenadas do marker
		["blip"] = 45, -- Id do blip
	},
}

skins = {          ------------------------- Aqui voce edita o id o nome e o valor de cada skin
	["Skins Los Santos"] = {
	{1, "Skin-1", 500},
		{2, "Skin-2", 500},
		{7, "Skin-3", 500},
		{9, "Skin-4", 500},
		{10, "Skin-5", 500},
           {17, "Skin-6", 500},
		{18, "Skin-7", 500},
		{19, "Skin-8", 500},
		{20, "Skin-9", 500},
		{21, "Skin-10", 500},
           {22, "Skin-11", 500},
		{24, "Skin-12", 500},
		{25, "Skin-13", 500},
		{12, "Skin-14", 500},
		{13, "Skin-15", 500},
           {14, "Skin-16", 500},
		{15, "Skin-17", 500},
		{16, "Skin-18", 500},
		{26, "Skin-19", 500},
		{27, "Skin-20", 500},
					
	},
}

for i,city in pairs(table_shops) do
	pos = city["marker shop"]
	marker = createMarker(pos[1],pos[2],pos[3],"cylinder", 1.5,150,200,100, 100, true)
	createBlipAttachedTo(marker, city["blip"])
	markers_shop[marker] = true
	setElementData(marker, "markID", i)
end

addEventHandler("onClientMarkerHit", resourceRoot, function(ply)
	if ply ~= localPlayer then return end
	veh = getPedOccupiedVehicle(ply)
	if veh then return end
	if markers_shop[source] then
		for i,city in pairs(table_shops) do
			if i == getElementData(source, "markID") then
				local dim = math.random(1,1000)
				showCursor(true)
				drawIn = nil
				price = nil
				skin = nil
				setElementFrozen(localPlayer, true)
				setElementData(ply, "skin", getElementModel(ply))
				addEventHandler("onClientRender", getRootElement(), drawGUI)
				showChat(false)
				setElementData(ply, "marker_id", i)
				nameCity = city["nameShop"]
			--	setElementDimension(localPlayer, dim )
				for k,v in pairs(obj) do
			--		setElementDimension( v, dim )
				end
			end
		end
	end
end)
function backPlayer()
	for i,city in pairs(table_shops) do
		if i ~= 1 then
			setElementInterior (localPlayer, 0)
			setElementDimension(localPlayer, 0)
			setElementFrozen(localPlayer, false)
			showChat(true)
			for k,v in pairs(obj) do
				destroyElement(v)
			end
		end
	end
end

local x,y = guiGetScreenSize()
local scx, scy = guiGetScreenSize()
local px, py = scx/700, scy/800
local iGridX, iGridY, iGridW, iGridH = 20, y / 2 - 160, 320, 300
local bClicked = false
local iCurrentCell = 0
local onMouse = false
local font = dxCreateFont("gui/font.otf", 11)
local font2 = dxCreateFont("gui/font.otf", 10)
local alpha1 = 0
local alpha2 = 0
local speed = 20

function drawGUI()
	visible = true
	iCellHeight = 30
	iVisibleRows = 10
	dxDrawImage ( 10, y/2-200, 341, 395, 'gui/gui.png')
	dxDrawImage ( 20, y/2+150, 146, 33, 'gui/buy.png')
	if price and getPlayerMoney() > price then
		if isCursorOverRectangle(15, y/2+150, 146, 33) then
			alpha1 = alpha1 + speed
			if alpha1 >= 255 then alpha1 = 255 end
			if getKeyState("mouse1") then
				if bClicked == false then
					bClicked = true
					triggerServerEvent("bySkin", localPlayer, price, skin)
					backPlayer()
					showCursor(false)
					removeEventHandler("onClientRender", getRootElement(), drawGUI)
				end
			else
				bClicked = false
			end
		else
			alpha1 = alpha1 - speed
			if alpha1 <= 0 then alpha1 = 0 end
		end
	end
	dxDrawImage ( 20, y/2+150, 146, 33, 'gui/buy_2.png',0,0,0,tocolor(255,255,255,alpha1))

	dxDrawImage ( 310, y/2-200+15, 20, 20, 'gui/close.png')
	if isCursorOverRectangle(310, y/2-200+15, 20, 20) then
		alpha2 = alpha2 + speed
		if alpha2 >= 255 then alpha2 = 255 end
		if getKeyState("mouse1") then
			if bClicked == false then
				bClicked = true
				backPlayer()
				showCursor(false)
				setElementModel(localPlayer, tonumber(getElementData(localPlayer, "skin")))
				removeEventHandler("onClientRender", getRootElement(), drawGUI)
			end
		else
			bClicked = false
		end
	else
		alpha2 = alpha2 - speed
		if alpha2 <= 0 then alpha2 = 0 end
	end
	dxDrawImage ( 310, y/2-200+15, 20, 20, 'gui/close_2.png',0,0,0,tocolor(255,255,255,alpha2))

	if nameCity then
		if skins[nameCity] then
			iRows = #skins[nameCity]
			iVisibleRows = 10
			for i = iCurrentCell, iVisibleRows+iCurrentCell-1 do
				visibleI = i  - iCurrentCell
				if drawIn then
					if i == drawIn then
						if skin and price then
							dxDrawRectangle(iGridX, iGridY+iCellHeight*visibleI, iGridW, iCellHeight, tocolor(255,23,27,255))
							dxDrawText("Loja: "..skinText.."\nSkin: "..price.." $$.", 180, y/2+150, 180, y/2+150, tocolor(180,180,180,255), 1, font2, "left", "top")
						end
					end
				end
			if iRows <= iVisibleRows then
				scrollThen = 1
				with = 0
				notScroll = true
			else
				scrollThen = iRows
				with = 215/scrollThen*iVisibleRows
			end
			dxDrawRectangle(iGridX+iGridW, iGridY+iGridH/scrollThen*iCurrentCell, 10, with, tocolor(40,40,40,255), true)
			if isCursorOverRectangle(iGridX, iGridY+iCellHeight*visibleI, iGridW , iCellHeight) then
				for s, data in pairs(skins[nameCity]) do
					if i == s - 1 then
						dxDrawRectangle(iGridX, iGridY+iCellHeight*visibleI, iGridW, iCellHeight, tocolor(255,20,20,255))
					end
				end
				textColor = tocolor(0,0,0,255)
				if getKeyState("mouse1") then
					if bClicked == false then
						for s, data in pairs(skins[nameCity]) do
							if i == s - 1 then
								drawIn = i
								setElementModel(localPlayer, data[1])
								price = data[3]
								skin = data[1]
								skinText = data[2]
								bClicked = true
							end
						end
					end
				else
					bClicked = false
				end
			end
			for s, data in pairs(skins[nameCity]) do
				if i == s - 1 then
					dxDrawText(data[2], iGridX + 20, iGridY+iCellHeight*visibleI+2, iGridX+iGridW + 1, iGridY+iCellHeight*(visibleI+1), tocolor(180,180,180,255), 1, font, "left", "center")
					dxDrawText(data[3].." $$.", iGridX + 170, iGridY+iCellHeight*visibleI+2, iGridX+iGridW + 1, iGridY+iCellHeight*(visibleI+1), tocolor(180,180,180,255), 1, font, "left", "center")
				end
			end
		end
		end
	end
end
--addEventHandler("onClientRender", getRootElement(), drawGUI)

function isCursorOverRectangle(x,y,w,h)
	if isCursorShowing() then
		local mx,my = getCursorPosition()
		cursorx,cursory = mx*scx,my*scy
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		end
	end
	return false
end

bindKey("mouse_wheel_up", "down", function()
	if visible ~= true then return end
	if iRows < iVisibleRows then return end
	if isCursorOverRectangle(41, y / 2 - 249, 454, 500) then
		iCurrentCell = iCurrentCell - 1
		if iCurrentCell < 0 then iCurrentCell = 0 end
	end
end)
bindKey("mouse_wheel_down", "down", function()
	if visible ~= true then return end
	if iRows < iVisibleRows then return end
	if isCursorOverRectangle(41, y / 2 - 249, 454, 500) then
		iCurrentCell = iCurrentCell + 1
		if iCurrentCell > iRows-iVisibleRows then iCurrentCell = iRows-iVisibleRows end
	end
end)