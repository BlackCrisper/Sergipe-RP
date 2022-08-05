

function cursorButton()
	showCursor(not isCursorShowing())
end
bindKey("m", "down", cursorButton)


function checkHunger()
	if getElementData ( localPlayer, "TS:VIPLegacy") == true then return end
	local hunger = tonumber(getElementData(localPlayer, "hunger")) or 100
	if hunger and hunger > 0 then
		setElementData(localPlayer, "hunger", hunger - 1)
	end
	if hunger <= 20 then
		outputChatBox("Você precisa se alimentar o mais rápido possível.", 255, 0, 0)
		playSoundFrontEnd(40)
	end
	if hunger == 0 then	
			setElementHealth(localPlayer, 0)
			setElementData(source, "hunger", 100)
		end
	end
setTimer(checkHunger, 36000*4, 0) -- configure o tempo

function checkSede()
	if getElementData ( localPlayer, "TS:VIPLegacy") == true then return end
	local sede = tonumber(getElementData(localPlayer, "sede")) or 100
	if sede and sede > 0 then
		setElementData(localPlayer, "sede", sede - 1)
	end
	if sede <= 20 then
		outputChatBox("Você precisa beber algo o mais rápido possível.", 255, 0, 0)
		playSoundFrontEnd(40)
	end
	if sede == 0 then	
			setElementHealth(localPlayer, 0)
			setElementData(source, "sede", 100)
		end
	end
setTimer(checkSede, 36000*4, 0) -- configure o tempo