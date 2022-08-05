-- Тут был юг
local screenW,screenH = guiGetScreenSize()
local px,py = 1680,1050
local x,y = (screenW/px), (screenH/py)

local sizeX,sizeY = 350*px,350*px
local posX,posY = screenW-sizeX,screenH-sizeY
local font = dxCreateFont("files/font.otf",100*px)
local font1 = dxCreateFont("files/font.otf",70)

function spidak()
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
	end
	
    local num = getElementData(veh,"mileage") or 0
	local mileage = ""..math.floor(num)
	repeat mileage = "0"..mileage until #mileage >= 3	
    local veh = getPedOccupiedVehicle(getLocalPlayer()) 
    if not veh or getVehicleOccupant ( veh ) ~= localPlayer then return true end
    local vehs = math.floor(getElementSpeed(getPedOccupiedVehicle(getLocalPlayer()), "kmh"))
    
    local cfuel = math.ceil((getElementData(veh,'fuel') or 15))
	local mfuel = (getElementData(veh,'maxFuel') or 100)
    
   
   if getVehicleOverrideLights( veh ) == 2 then 
   dxDrawImage(screenW - 100,screenH - 140, 40, 40,"files/light.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)	
    else
      dxDrawImage(screenW - 100,screenH - 140, 40, 40,"files/light.png",0.0,0.0,0.0,tocolor(54,54,54,255),false)

    end
    
    if getVehicleEngineState( veh ) then
        dxDrawImage(screenW - 60,screenH - 140, 59, 40,"files/engine.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)	
    else
        dxDrawImage(screenW - 60,screenH - 140, 59, 40,"files/engine.png",0.0,0.0,0.0,tocolor(54,54,54,255),false)
    end
    if isVehicleLocked(veh) then
			 dxDrawImage(screenW - 150,screenH - 140, 40, 40,"files/lock.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)	
		else
			dxDrawImage(screenW - 150,screenH - 140, 40, 40,"files/lock.png",0.0,0.0,0.0,tocolor(54,54,54,255),false)
		end
		
    if vehs <= 1 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 30,  screenH + 20, screenW - 130, screenH - 130, tocolor(54,54,54,255), 0.4, font,"center","center")
    end
    if vehs >= 1 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 30,  screenH + 20, screenW - 130, screenH - 130, tocolor(255,255,255,255), 0.4, font,"center","center")
    end
    if vehs >= 59 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 30,  screenH + 20, screenW - 130, screenH - 130, tocolor(204,102,0,255), 0.4, font,"center","center")
    end
    if vehs >= 80 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 30,  screenH + 20, screenW - 130, screenH - 130, tocolor(255,0,0,255), 0.4, font,"center","center")
    end
    
	
	if num <= 1 then
    dxDrawText(mileage.." km",screenW - 310,  screenH + 30, screenW - 130, screenH - 105, tocolor(255,255,255,255), 0.35, font1,"center","center")
    end
    
    
    if cfuel <= 5 then
        dxDrawImage(screenW - 195,screenH - 100, 45, 45,"files/benzin.png",0.0,0.0,0.0,tocolor(204,102,0,255),false)
    end
    if cfuel >= 10 then
        dxDrawImage(screenW - 195,screenH - 100, 45, 45,"files/benzin.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
    end
	dxDrawText(tostring ( getFormatFuel ( cfuel )),screenW - 315,  screenH + 10, screenW - 130, screenH - 160, tocolor(255,255,255,255), 0.35, font1,"center","center")
end
addEventHandler("onClientRender", root, spidak)


function getFormatFuel(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end

function getFormatSpeed(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
	
function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.49 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.49 * 100 * 1.609344)
        end
    else
        return false
    end
end

function getVehicleSpeed()
    if isPedInVehicle(getLocalPlayer()) then
	    local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
        local vx, vy, vz = getElementVelocity (theVehicle)
        return math.sqrt(vx^2 + vy^2 + vz^2) * 180
    end
    return 0
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end