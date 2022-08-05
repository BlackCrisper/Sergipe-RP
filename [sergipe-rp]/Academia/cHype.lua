local screenW2,screenH2  = guiGetScreenSize()
local resW2, resH2       = 1280,720
local achx, achy         = (screenW2/resW2), (screenH2/resH2)


addEventHandler("onClientKey", root, 
	function (button, press)
		if (getElementData(localPlayer, "Exercicio")) then 
			if button == "F1" or button == "F2" or button == "F3" or button == "F4" or button == "F5" or button == "F6" or button == "F7" or button == "F9" or button == "F10" or button == "F11" then
				cancelEvent()
			end
		end
	end
)

function Select ( button, state, _, _, _, _, _, click)
     if button == "left" and state == "down" then
	     if ( click ) then
			 if ( getElementType ( click ) == "ped" ) then
			
	      	 local cx, cy, cz = getElementPosition ( click )
	     	 local px, py, pz = getElementPosition ( localPlayer )
	     	 local distance	= getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz )
          	     if ( distance <= 10 ) then
				     if (getElementData(click, "Hype>Academia") == true) then
			             triggerServerEvent ( "Hype>Mensalidade", root, localPlayer)
					end
	  	         end
	         end
         end
     end
end
addEventHandler ( "onClientClick", root, Select)


function clickMaquina ( button, state, _, _, _, _, _, click)
     if button == "left" and state == "down" then
	     if ( click ) then
	      	 local cx, cy, cz = getElementPosition ( click )
	     	 local px, py, pz = getElementPosition ( localPlayer )
	     	 local distance	= getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz )
          	     if ( distance <= 5 ) then
				     if (getElementModel(click) == 2627) then
			             triggerServerEvent ( "Academia:Esteira", root, localPlayer, click)
					 end
					 if (getElementModel(click) == 2630) then
			             triggerServerEvent ( "Academia:Bike", root, localPlayer, click)
					 end
					 if (getElementModel(click) == 2629) then
			             triggerServerEvent ( "Academia:Peso", root, localPlayer, click)
	  	         end
	         end
         end
     end
end
addEventHandler ( "onClientClick", root, clickMaquina)

downloading = false
local start = {}
function dxDrawLoading ()
    local now = getTickCount()
    seconds = second or 60000
	local color = color or tocolor(0,0,0,170)
	local color2 = color2 or tocolor(255,255,0,170)
	local size = size or 1.00
    local with = interpolateBetween(0,0,0,486,0,0, (now - start) / ((start + seconds) - start), "Linear")
    local text = interpolateBetween(0,0,0,100,0,0,(now - start) / ((start + seconds) - start),"Linear")
	dxDrawRectangle(achx*406, achy*569, achx*486, achy*24, tocolor(0, 0, 0, 100), false)
	dxDrawRectangle(achx*406, achy*569, achx*with, achy*24, tocolor(0, 255, 0, 255), false)
    dxDrawText ( "PROGRESSO DE EXERCICIO "..math.floor(text).."%", achx*406, achy*568, achx*892, achy*593, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
 end

function openProgressBar ()
    if (downloading == false) then
        addEventHandler("onClientRender", root, dxDrawLoading)
		downloading = true
		start = getTickCount()
        else
        removeEventHandler("onClientRender", root, dxDrawLoading)		
		downloading = false
		end
end
addEvent("openProgress", true)
addEventHandler("openProgress", root, openProgressBar)


addEventHandler("onClientPedDamage",  getRootElement(), function ()
	if (getElementData(source, "Hype>Academia")) then
		cancelEvent()
	end
end)

addEventHandler("onClientPlayerStealthKill", getRootElement(), function(targetPlayer) 
	if (getElementType(targetPlayer) == 'ped' and getElementData(targetPlayer, "Hype>Academia")) then  
		cancelEvent()
	end
end)