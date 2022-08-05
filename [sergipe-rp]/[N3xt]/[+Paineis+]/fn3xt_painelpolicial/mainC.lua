addEvent("N3xT.onPainelPolicial", true)
addEvent("N3xT.refreshGridItemPM", true)
addEvent("N3xT.setWindowPM", true)

local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768)

local tecla = "F3" -- Tecla para fechar o painel.

local edit = {
	guiCreateEdit(x*516, y*309, x*314, y*29, "Motivo", false),
	guiCreateEdit(x*516, y*381, x*314, y*29, "Valor", false),
	guiCreateGridList(x*548, y*229, x*253, y*214, false),
	guiCreateGridList(x*672, y*335, x*130, y*120, false), 
}

guiGridListAddColumn(edit[3], "Item", 0.5)
guiGridListAddColumn(edit[3], "Quantidade", 0.4)
guiGridListAddColumn(edit[4], "Armas na Mão", 0.8)

for i = 1, #edit do
	guiSetVisible(edit[i], false)
end

local visible
local pm = function()
    dxDrawRectangle(x*502, y*161, x*343, y*370, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(x*502, y*161, x*5, y*370, tocolor(125, 38, 205, 255), false)
    dxDrawRectangle(x*840, y*161, x*5, y*370, tocolor(125, 38, 205, 255), false)
    dxDrawImage(x*650, y*167, x*57, y*52, "policial.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Pressione "..tecla.." para fechar", x*600, y*538, x*696, y*502, tocolor(255, 255, 255, 150), x*1.2, "arial", "left", "top", false, false, false, false, false)

    if (window == 1) then
    	dxDrawRectangle(x*517, y*224, x*308, y*41, (isMouseInPosition(x*517, y*224, x*308, y*41) and tocolor(0, 0, 0, 200) or tocolor(0, 0, 0, 50)), false)
    	dxDrawRectangle(x*517, y*275, x*308, y*41, (isMouseInPosition(x*517, y*275, x*308, y*41) and tocolor(0, 0, 0, 200) or tocolor(0, 0, 0, 50)), false)
    	dxDrawRectangle(x*517, y*326, x*308, y*41, (isMouseInPosition(x*517, y*326, x*308, y*41) and tocolor(0, 0, 0, 200) or tocolor(0, 0, 0, 50)), false)
    	dxDrawRectangle(x*517, y*377, x*308, y*41, (isMouseInPosition(x*517, y*377, x*308, y*41) and tocolor(0, 0, 0, 200) or tocolor(0, 0, 0, 50)), false)
    	dxDrawRectangle(x*517, y*428, x*308, y*41, (isMouseInPosition(x*517, y*428, x*308, y*41) and tocolor(0, 0, 0, 200) or tocolor(0, 0, 0, 50)), false)
    	dxDrawRectangle(x*517, y*479, x*308, y*41, (isMouseInPosition(x*517, y*479, x*308, y*41) and tocolor(0, 0, 0, 200) or tocolor(0, 0, 0, 50)), false)

    	dxDrawRectangle(x*517, y*479, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*517, y*428, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*517, y*377, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*517, y*326, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*517, y*275, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*517, y*224, x*5, y*41, tocolor(125, 38, 205, 255), false)

    	dxDrawRectangle(x*820, y*224, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*820, y*275, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*820, y*326, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*820, y*377, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*820, y*428, x*5, y*41, tocolor(125, 38, 205, 255), false)
    	dxDrawRectangle(x*820, y*479, x*5, y*41, tocolor(125, 38, 205, 255), false)

		local receiver = getElementData(localPlayer, "ReceiverPM")
		if (receiver) then
    		dxDrawText("Revistar", x*653, y*234, x*687, y*245, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    	
    		if getElementData(receiver, "Agarrado") then
    			dxDrawText("Desagarrar", x*653, y*284, x*687, y*295, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    		else
    			dxDrawText("Agarrar", x*653, y*284, x*687, y*295, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    		end

    		if getElementData(receiver, "Algemado") then
    			dxDrawText("Desalgemar", x*649, y*335, x*687, y*347, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    		else
    			dxDrawText("Algemar", x*649, y*335, x*687, y*347, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    		end

    		dxDrawText("Remover/Ver Itens", x*615, y*386, x*668, y*398, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    	
    		if getElementData(receiver, "NaViatura") then
    			dxDrawText("Retirar da Viatura", x*618, y*437, x*659, y*449, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    		else
				dxDrawText("Colocar na Viatura", x*618, y*437, x*659, y*449, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    		end

    		dxDrawText("Multar", x*658, y*488, x*696, y*502, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    	end

    elseif (window == 2) then
		local receiver = getElementData(localPlayer, "ReceiverPM")
		if (receiver) then
			local nome  = getPlayerName(receiver)
			local id    = getElementData(receiver, "ID") or "N/A"
			local idade = getElementData(receiver, "AirNew_RG_DataDeNascimento") or "N/A"
			local rg    = getElementData(receiver, "AirNew_PossuiRG") or "Nao"
			local cnh_a = getElementData(receiver, "PravaA") 
			local cnh_b = getElementData(receiver, "PravaB") 
			local cnh_c = getElementData(receiver, "PravaC") 
			local cnh_d = getElementData(receiver, "PravaD")

			if (cnh_a) and (cnh_a == true) then
				cnh_a = "#00ff00Sim"
			else
				cnh_a = "#ff0000Não"
			end

			if (cnh_b) and (cnh_b == true) then
				cnh_b = "#00ff00Sim"
			else
				cnh_b = "#ff0000Não"
			end

			if (cnh_c) and (cnh_c == true) then
				cnh_c = "#00ff00Sim"
			else
				cnh_c = "#ff0000Não"
			end

			if (cnh_d) and (cnh_d == true) then
				cnh_d = "#00ff00Sim"
			else
				cnh_d = "#ff0000Não"
			end

		

			dxDrawText("                     Dados Pessoais\n\nID: #00ff7f"..id.."#ffffff\n\nNome: "..nome.." #ffffff\n\nIdade: #00ff7f"..idade.."#ffffff\n\nRG: #00ff7f"..rg.."#ffffff\n\nCNH (A): "..cnh_a.."#ffffff\nCNH (B): "..cnh_b.."#ffffff\nCNH (C): "..cnh_c.."#ffffff\nCNH (D): "..cnh_d, x*530, y*230, x*729, y*258, tocolor(255, 255, 255, 200), x*1.2, "default", "left", "top", false, false, false, true, false)
			dxDrawRectangle(x*694, y*466, x*86, y*29, (isMouseInPosition(x*694, y*466, x*86, y*29) and tocolor(125, 38, 205, 200) or tocolor(0, 0, 0, 150)), false)
        	dxDrawText("Retirar", x*716, y*469, x*751, y*480, tocolor(255, 255, 255, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
		end

    elseif (window == 3) then
		local receiver = getElementData(localPlayer, "ReceiverPM")
		if (receiver) then
        	dxDrawRectangle(x*636, y*472, x*89, y*29, (isMouseInPosition(x*636, y*472, x*89, y*29) and tocolor(125, 38, 205, 200) or tocolor(0, 0, 0, 150)), false)
        	dxDrawText("Pegar", x*662, y*475, x*697, y*487, tocolor(255, 255, 255, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
		end

    elseif (window == 4) then
		local receiver = getElementData(localPlayer, "ReceiverPM")
		if (receiver) then
        	dxDrawText("Preencha o motivo da Multa.", x*579, y*283, x*639, y*299, tocolor(255, 255, 255, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
        	dxDrawText("Preencha o valor da Multa.", x*590, y*358, x*650, y*374, tocolor(255, 255, 255, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
        	dxDrawRectangle(x*620, y*460, x*116, y*34, (isMouseInPosition(x*620, y*460, x*116, y*34) and tocolor(125, 38, 205, 200) or tocolor(0, 0, 0, 150)), false)
        	dxDrawText("Multar", x*658, y*466, x*718, y*482, tocolor(255, 255, 255, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
		end
    end
end

addEventHandler("onClientClick", root,
	function(button, state, _, _, _, _, _, click)
		if (button == "left") and (state == "down") then
			if isElement(click) and (getElementType(click) == "player") then
				if not isPedInVehicle(localPlayer) then
					local x, y, z    = getElementPosition(localPlayer)
					local px, py, pz = getElementPosition(click)
					if (getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= 3) then
						if not isPedInVehicle(click) and (click ~= localPlayer) then
							triggerServerEvent("N3xT.onClickPolicial", localPlayer, click)
						end
					end
				end
			end
		end
	end
)

addEventHandler("N3xT.onPainelPolicial", root,
	function(click)
		if (visible ~= true) then
			addEventHandler("onClientRender", root, pm)
			showCursor(true)
			playSoundFrontEnd(20)
			setElementData(localPlayer, "ReceiverPM", click)
			visible = true
			window  = 1
		end
	end
)

bindKey(tecla, "down",
	function()
		if (visible == true) then
			removeEventHandler("onClientRender", root, pm)
			showCursor(false)
			setElementData(localPlayer, "ReceiverPM", nil)
			playSoundFrontEnd(8)
			visible = false
			for i = 1, #edit do
				guiSetVisible(edit[i], false)
			end
		end
	end
)

addEventHandler("onClientClick", root,
	function(button, state)
		if (button == "left") and (state == "down") then
			if (visible == true) then
				if (window == 1) then
					if isMouseInPosition(x*517, y*326, x*308, y*41) then -- Algemar.
						setTimer(function()
						triggerServerEvent("N3xT.onAlgemar", localPlayer)
						playSoundFrontEnd(1)
						end, 10, 1)
					elseif isMouseInPosition(x*517, y*428, x*308, y*41) then -- Colocar na viatura.
						setTimer(function()
						triggerServerEvent("N3xT.onViatura", localPlayer)
						playSoundFrontEnd(1)
						end, 10, 1)
					elseif isMouseInPosition(x*517, y*275, x*308, y*41) then -- Agarrar.
						setTimer(function()
						triggerServerEvent("N3xT.onAgarrar", localPlayer)
						playSoundFrontEnd(1)
						end, 10, 1) 
					elseif isMouseInPosition(x*517, y*224, x*308, y*41) then -- Revistar.
						setTimer(function()
						window = 2
						updateArmas()
						guiSetVisible(edit[4], true)
						playSoundFrontEnd(1)
						end, 10, 1)
					elseif isMouseInPosition(x*517, y*377, x*308, y*41) then -- Remover itens.
						setTimer(function()
						window = 3
						triggerServerEvent("N3xT.ItensPM", localPlayer, 1)
						guiSetVisible(edit[3], true)
						playSoundFrontEnd(1)
						end, 10, 1) 
					elseif isMouseInPosition(x*517, y*479, x*308, y*41) then -- Multar.
						setTimer(function()
						window = 4
						guiSetVisible(edit[1], true)
						guiSetVisible(edit[2], true)
						playSoundFrontEnd(1)
						end, 10, 1)
					end
				end
			end
		end
	end
)

function updateArmas()
	local receiver = getElementData(localPlayer, "ReceiverPM")
	if (receiver) then
		guiGridListClear(edit[4])
		for _, v in ipairs(getPedWeapons(receiver)) do
			guiGridListAddRow(edit[4], getWeaponNameFromID(v))
		end
	end
end

addEventHandler("onClientClick", root,
	function(button, state)
		if (button == "left") and (state == "down") then
			if (visible == true) then
				if (window == 2) then
					if isMouseInPosition(x*694, y*466, x*86, y*29) then
						if (guiGridListGetSelectedItem(edit[4]) ~= -1) then
							local arma = guiGridListGetItemText(edit[4], guiGridListGetSelectedItem(edit[4]), 1)
							triggerServerEvent("N3xT.takeWeaponPM", localPlayer, arma)
						else
							triggerEvent("N3xT.dxNotification", root, "Selecione uma arma!", "error")
						end
					end

				elseif (window == 3) then
					if isMouseInPosition(x*636, y*472, x*89, y*29) then
						if (guiGridListGetSelectedItem(edit[3]) ~= -1) then
							local item    = guiGridListGetItemText(edit[3], guiGridListGetSelectedItem(edit[3]), 1)
							local quantia = guiGridListGetItemText(edit[3], guiGridListGetSelectedItem(edit[3]), 2)
							triggerServerEvent("N3xT.ItensPM", localPlayer, 2, item, quantia)
						else
							triggerEvent("N3xT.dxNotification", root, "Selecione um item!", "error")
						end
					end

				elseif (window == 4) then
					if isMouseInPosition(x*620, y*460, x*116, y*34) then
						local motivo = guiGetText(edit[1])
						local valor  = guiGetText(edit[2])
						if (motivo ~= "Motivo") and (motivo ~= "") then
							if tonumber(valor) and (tonumber(valor) >= 1) then
								triggerServerEvent("N3xT.onMultar", localPlayer, motivo, valor)
							else
								triggerEvent("N3xT.dxNotification", root, "Coloque um valor válido!", "error")
							end
						else
							triggerEvent("N3xT.dxNotification", root, "Coloque um motivo válido!", "error")
						end
					end
				end
			end
		end
	end
)

addEventHandler("N3xT.refreshGridItemPM", root,
	function(itable)
		if (type(itable) == "table") then
			guiGridListClear(edit[3])
			for _, v in ipairs(itable) do
				guiGridListAddRow(edit[3], v[1], v[2])
			end
		end
	end
)

addEventHandler("N3xT.setWindowPM", root,
	function(value)
		window = value
		for i = 1, #edit do
			guiSetVisible(edit[i], false)
		end
	end
)

addEventHandler("onClientRender", root,
	function()
		local receiver = getElementData(localPlayer, "ReceiverPM")
		if (receiver) then
			if (visible == true) then
				local x, y, z    = getElementPosition(localPlayer)
				local px, py, pz = getElementPosition(receiver)
				if (getDistanceBetweenPoints3D(x, y, z, px, py, pz) > 3) then
					removeEventHandler("onClientRender", root, pm)
					showCursor(false)
					setElementData(localPlayer, "ReceiverPM", nil)
					playSoundFrontEnd(8)
					visible = false
					for i = 1, #edit do
						guiSetVisible(edit[i], false)
					end
				end
			end
		end
	end
)

addEventHandler("onClientRender", root,
    function()
        for k, v in ipairs(getElementsByType("player")) do
            if getElementData(v, "Algemado") then
                local k, anim = getPedAnimation(v)
                if (anim ~= "gift_give") then
                    setPedAnimation(v, "kissing", "gift_give", 500, true, false, false, true)
                end
                setPedAnimationProgress(v, 'gift_give', 0.10)
            end
        end
    end
)

addEventHandler("onClientKey", root,
    function(button)
        if (button) then
            if (getElementData(localPlayer, "Algemado") == true) or (getElementData(localPlayer, "NaViatura") == true) then
                cancelEvent()
            end
        end
    end
)

function getPedWeapons(ped)
	local playerWeapons = {}
	if ped and isElement(ped) and getElementType(ped) == "ped" or getElementType(ped) == "player" then
		for i=2,9 do
			local wep = getPedWeapon(ped,i)
			if wep and wep ~= 0 then
				table.insert(playerWeapons,wep)
			end
		end
	else
		return false
	end
	return playerWeapons
end

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end