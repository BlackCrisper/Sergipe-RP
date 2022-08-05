--[[

--]]	


local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/fontNick.ttf", x*12)

function AlertaCNHCAR()
    if getPedOccupiedVehicle(localPlayer) then
        exports["[FM]Blur"]:dxDrawBluredRectangle(x*427, y*690, x*513, y*41, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*427, y*690, x*513, y*41, tocolor(0, 0, 0, 147), false)
        dxDrawImage(x*435, y*682, x*56, y*56, "Img/CarteiraBlock.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Você Não possui CNH Da Categoria (B), Você pode ser preso!", x*494, y*700, x*844, y*721, tocolor(255, 255, 255, 255), x*1.00, Font_1, "left", "top", false, false, false, true, false)
    end
end

function AlertaCNH_Moto()
    if getPedOccupiedVehicle(localPlayer) then
        exports["Blur"]:dxDrawBluredRectangle(x*427, y*690, x*513, y*41, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*427, y*690, x*513, y*41, tocolor(0, 0, 0, 147), false)
        dxDrawImage(x*435, y*682, x*56, y*56, "Img/CarteiraBlock.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Você Não possui CNH Da Categoria (A), Você pode ser preso!", x*494, y*700, x*844, y*721, tocolor(255, 255, 255, 255), x*1.00, Font_1, "left", "top", false, false, false, true, false)
    end
end

function AlertaCNH_Caminhao()
    if getPedOccupiedVehicle(localPlayer) then
        exports["Blur"]:dxDrawBluredRectangle(x*427, y*690, x*513, y*41, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*427, y*690, x*513, y*41, tocolor(0, 0, 0, 147), false)
        dxDrawImage(x*435, y*682, x*56, y*56, "Img/CarteiraBlock.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Você Não possui CNH Da Categoria (C), Você pode ser preso!", x*494, y*700, x*844, y*721, tocolor(255, 255, 255, 255), x*1.00, Font_1, "left", "top", false, false, false, true, false)
    end
end
function AlertaCNH_Carreta()
    if getPedOccupiedVehicle(localPlayer) then
        exports["Blur"]:dxDrawBluredRectangle(x*427, y*690, x*513, y*41, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*427, y*690, x*513, y*41, tocolor(0, 0, 0, 147), false)
        dxDrawImage(x*435, y*682, x*56, y*56, "Img/CarteiraBlock.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Você Não possui CNH Da Categoria (D), Você pode ser preso!", x*494, y*700, x*844, y*721, tocolor(255, 255, 255, 255), x*1.00, Font_1, "left", "top", false, false, false, true, false)
    end
end

function AlertaCNH_Heli()
    if getPedOccupiedVehicle(localPlayer) then
        exports["Blur"]:dxDrawBluredRectangle(x*427, y*690, x*513, y*41, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*427, y*690, x*513, y*41, tocolor(0, 0, 0, 147), false)
        dxDrawImage(x*435, y*682, x*56, y*56, "Img/CarteiraBlock.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Você Não possui Licença da FAB Para Pilotar Helicopteros!", x*494, y*700, x*844, y*721, tocolor(255, 255, 255, 255), x*1.00, Font_1, "center", "top", false, false, false, true, false)
    end
end

function AlertaCNH_Aviao()
    if getPedOccupiedVehicle(localPlayer) then
        exports["Blur"]:dxDrawBluredRectangle(x*427, y*690, x*513, y*41, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*427, y*690, x*513, y*41, tocolor(0, 0, 0, 147), false)
        dxDrawImage(x*435, y*682, x*56, y*56, "Img/CarteiraBlock.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Você Não possui Licença da FAB Para Pilotar Aviões!", x*494, y*700, x*844, y*721, tocolor(255, 255, 255, 255), x*1.00, Font_1, "center", "top", false, false, false, true, false)
    end
end

function DxAlertaONCar ()
tick9 = getTickCount()
addEventHandler("onClientRender", root, AlertaCNHCAR)
end
addEvent("CNH:AlertaCar",true)
addEventHandler("CNH:AlertaCar",root, DxAlertaONCar)

function DxAlertaON_Moto ()
tick9 = getTickCount()
addEventHandler("onClientRender", root, AlertaCNH_Moto)
end
addEvent("CNH:AlertaMoto",true)
addEventHandler("CNH:AlertaMoto",root, DxAlertaON_Moto)

function DxAlertaON_Caminhao ()
tick9 = getTickCount()
addEventHandler("onClientRender", root, AlertaCNH_Caminhao)
end
addEvent("CNH:AlertaCAM",true)
addEventHandler("CNH:AlertaCAM",root, DxAlertaON_Caminhao)

function DxAlertaON_Carreta ()
tick9 = getTickCount()
addEventHandler("onClientRender", root, AlertaCNH_Carreta)
end
addEvent("CNH:AlertaCARRETA",true)
addEventHandler("CNH:AlertaCARRETA",root, DxAlertaON_Carreta)

function DxAlertaON_Heli ()
tick9 = getTickCount()
addEventHandler("onClientRender", root, AlertaCNH_Heli)
end
addEvent("CNH:AlertaHeli",true)
addEventHandler("CNH:AlertaHeli",root, DxAlertaON_Heli)

function DxAlertaON_Aviao ()
tick9 = getTickCount()
addEventHandler("onClientRender", root, AlertaCNH_Aviao)
end
addEvent("CNH:AlertaAviao",true)
addEventHandler("CNH:AlertaAviao",root, DxAlertaON_Aviao)


function DelDx ()
if isEventHandlerAdded("onClientRender", getRootElement(), AlertaCNHCAR) then  
removeEventHandler("onClientRender", root, AlertaCNHCAR)
 end
end
addEvent("CNH:AlertaCar_Off",true)
addEventHandler("CNH:AlertaCar_Off",root, DelDx)

function DelDx_Moto ()
if isEventHandlerAdded("onClientRender", getRootElement(), AlertaCNH_Moto) then  
removeEventHandler("onClientRender", root, AlertaCNH_Moto)
 end
end
addEvent("CNH:AlertaMoto_Off",true)
addEventHandler("CNH:AlertaMoto_Off",root, DelDx_Moto)

function DelDx_CAM ()
if isEventHandlerAdded("onClientRender", getRootElement(), AlertaCNH_Caminhao) then  
removeEventHandler("onClientRender", root, AlertaCNH_Caminhao)
 end
end
addEvent("CNH:AlertaCAM_Off",true)
addEventHandler("CNH:AlertaCAM_Off",root, DelDx_CAM)

function DelDx_CARRETA ()
if isEventHandlerAdded("onClientRender", getRootElement(), AlertaCNH_Carreta) then  
removeEventHandler("onClientRender", root, AlertaCNH_Carreta)
 end
end
addEvent("CNH:AlertaCARRETA_Off",true)
addEventHandler("CNH:AlertaCARRETA_Off",root, DelDx_CARRETA)

function DelDx_Heli ()
if isEventHandlerAdded("onClientRender", getRootElement(), AlertaCNH_Heli) then  
removeEventHandler("onClientRender", root, AlertaCNH_Heli)
 end
end
addEvent("CNH:AlertaHeli_Off",true)
addEventHandler("CNH:AlertaHeli_Off",root, DelDx_Heli)

function DelDx_Aviao ()
if isEventHandlerAdded("onClientRender", getRootElement(), AlertaCNH_Aviao) then  
removeEventHandler("onClientRender", root, AlertaCNH_Aviao)
 end
end
addEvent("CNH:AlertaAviao_Off",true)
addEventHandler("CNH:AlertaAviao_Off",root, DelDx_Aviao)





function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end