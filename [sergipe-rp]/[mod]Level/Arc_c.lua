--[[



 ################################################
 #                                              #
 #          Script Criado por: Arc Scr          #
 #           proteção anti edit [OFF]           #
 #                                              #
 ################################################



--]]

local sx,sy = guiGetScreenSize() 
local px,py = 1366,768
local x,y =  (sx/px),(sy/py)

function drawLevel ()
	local levelProgress = (getElementData(localPlayer,"minutes") or 0)
	dxDrawRectangle(x*803, y*743, x*160/58*levelProgress, y*19, tocolor(0, 0, 0, 130), false)
	dxDrawRectangle(x*800, y*740, x*170, y*25, tocolor(0, 0, 0, 120), false)
	dxDrawText("LEVEL: "..(getElementData(localPlayer,"Level") or 0), x*854, y*746, x*10, y*10, tocolor(255, 255, 255, 255), x*0.9, "default", "left", "top", false, false, false, false, false)
end
addEventHandler("onClientRender",getRootElement(),drawLevel)