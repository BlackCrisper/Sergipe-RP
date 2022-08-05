

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local font = dxCreateFont("fonts/font.ttf", 10)
local MaxFuel = 100

function getVehicleFuel(v)
	local fuel = getElementData(v, "fuel")	
	if (fuel) then
		return fuel
	end
	return 0
end
function onPlayerRequestHUD()
	local asd = getPedOccupiedVehicle(localPlayer)
	local seat = getPedOccupiedVehicleSeat(localPlayer)

	if (seat ~= 0) then
		return
	end

	if not	(asd) then
		return
	else
		local fuel = getVehicleFuel(asd)
	end
end
addEventHandler("onClientRender", root, onPlayerRequestHUD)

function dxDrawRecLine(x,y,w,h,color)
    dxDrawRectangle(x,y,w,1,color) -- h
	dxDrawRectangle(x,y+h-1,w,1,color) -- h
	dxDrawRectangle(x,y,1,h,color) -- v
	dxDrawRectangle(x+w-1,y,1,h,color) -- v
end