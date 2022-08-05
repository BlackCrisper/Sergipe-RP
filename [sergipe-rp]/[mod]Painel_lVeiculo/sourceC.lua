local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)

local dxfont0_icons = dxCreateFont("icons.ttf", 18)
local dxfont1_icons = dxCreateFont("icons.ttf", 10)
color = {}
rote = 0
painelF5 = false
function painelF5Dx()

	color[1] = tocolor(255, 255, 255, 255)
	color[2] = tocolor(255, 255, 255, 255)
	color[3] = tocolor(255, 255, 255, 255)
	color[4] = tocolor(255, 255, 255, 255)
	color[5] = tocolor(255, 255, 255, 255)
	color[6] = tocolor(255, 255, 255, 255)
	color[7] = tocolor(255, 255, 255, 255)
	color[8] = tocolor(255, 255, 255, 255)
	color[9] = tocolor(255, 255, 255, 255)
	color[10] = tocolor(255, 255, 255, 255)
	color[11] = tocolor(255, 255, 255, 255)

	if cursorPosition(screenW * 0.3589, screenH * 0.3898, screenW * 0.0276, screenH * 0.0481) then color[1] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.3589, screenH * 0.5222, screenW * 0.0276, screenH * 0.0407) then color[2] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.5573, screenH * 0.5231, screenW * 0.0240, screenH * 0.0454) then color[3] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.5260, screenH * 0.5222, screenW * 0.0234, screenH * 0.0500) then color[4] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.4193, screenH * 0.4519, screenW * 0.0276, screenH * 0.0306) then color[5] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.4193, screenH * 0.4917, screenW * 0.0276, screenH * 0.0306) then color[6] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.4760, screenH * 0.4528, screenW * 0.0297, screenH * 0.0296) then color[7] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.4760, screenH * 0.4926, screenW * 0.0297, screenH * 0.0296) then color[8] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.4500, screenH * 0.4074, screenW * 0.0240, screenH * 0.0454) then color[9] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.4500, screenH * 0.5222, screenW * 0.0240, screenH * 0.0426) then color[10] = tocolor(255, 0, 0, 255) end
	if cursorPosition(screenW * 0.3589, screenH * 0.4528, screenW * 0.0276, screenH * 0.0481) then color[11] = tocolor(255, 0, 0, 255) end

	if isPedInVehicle( localPlayer ) then 

        dxDrawRectangle(screenW * 0.3536, screenH * 0.3750, screenW * 0.2328, screenH * 0.2185, tocolor(0, 0, 0, 138), false)
        dxDrawRectangle(screenW * 0.3557, screenH * 0.3806, screenW * 0.2292, screenH * 0.2065, tocolor(0, 0, 0, 138), false)
        dxDrawImage(screenW * 0.3589, screenH * 0.3898, screenW * 0.0276, screenH * 0.0481, "iconRepair.png", 0, 0, 0, color[1], false)
        dxDrawImage(screenW * 0.3589, screenH * 0.5222, screenW * 0.0276, screenH * 0.0407, "Freiodemao.png", 0, 0, 0, color[2], false)
        dxDrawImage(screenW * 0.5573, screenH * 0.5231, screenW * 0.0240, screenH * 0.0454, "up.png", 0, 0, 0, color[3], false)
        dxDrawImage(screenW * 0.5260, screenH * 0.5222, screenW * 0.0234, screenH * 0.0500, "down.png", 0, 0, 0, color[4], false)
        dxDrawImage(screenW * 0.4193, screenH * 0.4519, screenW * 0.0276, screenH * 0.0306, "left.png", 0, 0, 0, color[5], false)
        dxDrawImage(screenW * 0.4193, screenH * 0.4917, screenW * 0.0276, screenH * 0.0306, "left.png", 0, 0, 0, color[6], false)
        dxDrawImage(screenW * 0.4760, screenH * 0.4528, screenW * 0.0297, screenH * 0.0296, "right.png", 0, 0, 0, color[7], false)
        dxDrawImage(screenW * 0.4760, screenH * 0.4926, screenW * 0.0297, screenH * 0.0296, "right.png", 0, 0, 0, color[8], false)
        dxDrawImage(screenW * 0.4500, screenH * 0.4074, screenW * 0.0240, screenH * 0.0454, "up.png", 0, 0, 0, color[9], false)
        dxDrawImage(screenW * 0.4500, screenH * 0.5222, screenW * 0.0240, screenH * 0.0426, "down.png", 0, 0, 0, color[10], false)
        dxDrawText("Maresias - RP", screenW * 0.4141, screenH * 0.3528, screenW * 0.5281, screenH * 0.3657, tocolor(255, 255, 255, 255), 1.00, dxfont0_icons, "center", "center", false, false, false, false, false)
        dxDrawLine(screenW * 0.3557, screenH * 0.5843, screenW * 0.5844, screenH * 0.5843, tocolor(249, 0, 0, 255), 2, false)
        dxDrawLine(screenW * 0.3557, screenH * 0.3806, screenW * 0.5844, screenH * 0.3806, tocolor(249, 0, 0, 255), 2, false)
        dxDrawImage(screenW * 0.5193, screenH * 0.3843, screenW * 0.0651, screenH * 0.1120, "Logo.png", rote, 0, 0, tocolor(255, 255, 255, 255), false)
		        rote = rote +12/12
		local veh = getPedOccupiedVehicle( localPlayer ) 
		if veh then 
        dxDrawImage(screenW * 0.3589, screenH * 0.4528, screenW * 0.0276, screenH * 0.0481, "iconFlip.png", 0, 0, 0, color[11], false)
		end
		
	else
		dxDrawRectangle(x*483, y*364, x* 400, y*40, tocolor(3, 0, 0, 105))
		dxDrawRectangle(x*483, y*362, x* 400, y*2, tocolor(255,0,0,255))
		dxDrawText("Pegue um Veiculo Para Poder Utilizar o Painel", x*0, y*0, x*1366, y*768, tocolor(255,255,255,255), 1.00, dxfont1_icons, "center", "center", false, false, false, true, false)
		dxDrawImage(screenW * 0.4594, screenH * 0.3296, screenW * 0.0729, screenH * 0.1370, "Logo.png", rote, 0, 0, tocolor(255, 255, 255, 255), false)
		rote = rote +12/12
	end
end

function open (_,state)
	if painelF5 == false then
		showCursor(true)
		addEventHandler("onClientRender", root, painelF5Dx)
		painelF5 = true
		playSoundFrontEnd(1)
		setElementData(localPlayer, "_gps", false)
		setElementData(localPlayer, "_hud", false)
		setElementData(localPlayer, "_level", false)
		showCursor(true)
	else
		playSoundFrontEnd(2)
		showCursor(false)
		removeEventHandler("onClientRender", root, painelF5Dx)
		painelF5 = false
		showCursor(false)
		setElementData(localPlayer, "_gps", true)
		setElementData(localPlayer, "_hud", true)
		setElementData(localPlayer, "_level", true)
	end
end
addEvent("painel_f5", true)
addEventHandler("painel_f5", root , open)

function click_F5(button, state)
	if painelF5 and button == "left" and state == "down" then
		if cursorPosition(screenW * 0.3589, screenH * 0.3898, screenW * 0.0276, screenH * 0.0481) then
			triggerServerEvent("F5_repair", getLocalPlayer())
			playSoundFrontEnd(46)
		elseif cursorPosition(screenW * 0.3589, screenH * 0.4528, screenW * 0.0276, screenH * 0.0481) then
			triggerServerEvent("F5_flip", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(		screenW * 0.5260, screenH * 0.5222, screenW * 0.0234, screenH * 0.0500) then
			triggerServerEvent("F5_descer", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.5573, screenH * 0.5231, screenW * 0.0240, screenH * 0.0454) then
			triggerServerEvent("F5_subir", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.4193, screenH * 0.4519, screenW * 0.0276, screenH * 0.0306) then
			triggerServerEvent("F5_esquerda1", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.4193, screenH * 0.4917, screenW * 0.0276, screenH * 0.0306) then
			triggerServerEvent("F5_esquerda2", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.4760, screenH * 0.4528, screenW * 0.0297, screenH * 0.0296) then
			triggerServerEvent("F5_direita1", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.4760, screenH * 0.4926, screenW * 0.0297, screenH * 0.02966) then
			triggerServerEvent("F5_direita2", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.4500, screenH * 0.4074, screenW * 0.0240, screenH * 0.0454) then
			triggerServerEvent("F5_cima", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.4500, screenH * 0.5222, screenW * 0.0240, screenH * 0.0426) then
			triggerServerEvent("F5_baixo", getLocalPlayer())
			playSoundFrontEnd(20)
		elseif cursorPosition(screenW * 0.3589, screenH * 0.5222, screenW * 0.0276, screenH * 0.0407) then
			triggerServerEvent("Freio_De_Mao", getLocalPlayer())
			playSoundFrontEnd(20)
		end
	end
end
addEventHandler("onClientClick", getRootElement(), click_F5)

function cursorPosition(x, y, width, height)
	if (not isCursorShowing()) then
		return false
	end
	local sx, sy = guiGetScreenSize()
	local cx, cy = getCursorPosition()
	local cx, cy = (cx*sx), (cy*sy)
	if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
		return true
	else
		return false
	end
end