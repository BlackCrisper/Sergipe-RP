local screenW, screenH = guiGetScreenSize()

----- Resolução do criador
res1 = 1360
res2 = 768
-----

local dxfont1_fontNick = dxCreateFont("dxlib/OpenSansSemibold.ttf", 25)

local xa, ya = (screenW - res1) / 2, (screenH - res2) / 2
local ta, tb = (screenW-res1), (screenH-res2)
           			
addEvent("eventReturn", true)
addEventHandler("eventReturn", root, 
function(x1,y1,w1,h1,tempoc1, stato)
	if progress == false then
		x = x1
		y = y1
		w = w1
		h = h1
		state = stato
		tempoc = tempoc1
		timer = setTimer (finishTimer,tempoc1,1)
		addEventHandler ("onClientRender", root, dxCreateProgress)
		tick = getTickCount()
		progress = true
	end
end)

function finishTimer ()
	if isTimer(timer) then
		killTimer(timer) 
	end
	if progress == true then
		removeEventHandler("onClientRender", root, dxCreateProgress)
		progress = false
	end
end

function converterTempo(ms) 
    local min = math.floor ( ms/60000 ) 
    local sec = math.floor( (ms/1000)%60 ) 
    return min, sec 
end

progress = false
function dxCreateProgress()
	local sx = interpolateBetween(0, 0, 0, w, 0, 0, (getTickCount()-tick)/tempoc, "Linear")
	dxDrawRectangle(xa + x, ya + y, w, h + 0.8, tocolor(75, 75, 75, 255), false)
	dxDrawRectangle(xa + x + 5, ya + y + 2.55, w - 10, h - 5, tocolor(90, 90, 90, 255), false)
	dxDrawRectangle(xa + x + 5, ya + y + 2.55, sx - 10, h - 5, tocolor(0, 245, 127, 255), false)

	if state == "yesT" then
		local timerCor = interpolateBetween(tempoc, 0, 0, w, 0, 0, (getTickCount()-tick)/tempoc, "Linear")
		local minT, secT = converterTempo(timerCor)
		if minT < 10 then
			minT = "0"..minT
		end
		if secT < 10 then
			secT = "0"..secT
		end
		dxDrawText(secT, (x+ta), (y+tb + 1), (x+w), y+h, tocolor(255, 255, 255, 255), 1.00, dxfont1_fontNick, "center", "center", false, false, false, false, false)
	end
end
