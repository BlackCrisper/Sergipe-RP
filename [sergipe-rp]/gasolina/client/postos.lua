local markersPostos = {
{city = "LS-2", x = 1944.5806884766, y = -1767.3419189453, z = 13.3828125 -1, style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1944.5806884766, y = -1771.3986816406, z = 13.390598297119 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1944.5806884766, y = -1774.7335205078, z = 13.390598297119 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1944.5806884766, y = -1778.5767822266, z = 13.390598297119 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1938.9678955078, y = -1778.8508300781, z = 13.390598297119 -1, style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1938.9678955078, y = -1774.4342041016, z = 13.3828125 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1938.9678955078, y = -1771.3348388672, z = 13.3828125 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1938.9678955078, y = -1767.2926025391, z = 13.3828125 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},

{city = "LS-2", x = -1609.232421875, y = -2718.6789550781, z = 48.5390625 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = -1674.0869140625, y = 417.73406982422, z = 7.1796875 -1,style = "cylinder", font = 1.0, r = 138, g = 43, b = 226, opaccity = 170},

{city = "LS-2", x = 1520.651, y = -2646.228, z = 13.547 -1,style = "cylinder", font = 5.0, r = 138, g = 43, b = 226, opaccity = 170},
{city = "LS-2", x = 1439.324, y = -2629.165, z = 13.547 -1,style = "cylinder", font = 4.0, r = 138, g = 43, b = 226, opaccity = 170},
}

local blipsGasStations = {
}

function createGasStations()
	for i,v in ipairs(markersPostos) do
		local m = createMarker(v.x, v.y, v.z, v.style, v.font, v.r, v.g, v.b, v.opaccity)
		addEventHandler("onClientMarkerHit", m, refuelCar)
	end
end

function createBlipsFromGasStations()
	for i,v in ipairs(blipsGasStations) do
		local b = createBlip(v.x, v.y, v.z, v.icon, v.size, v.r, v.g, v.b, v.a, v.ordering, v.visibleDistance)
		
	end
end

function refuelCar(player)
	if (player ~= localPlayer) then
		return false
	end

	local seat = getPedOccupiedVehicleSeat(localPlayer)
	if(seat ~= 0) then
		return
	else
		addEventHandler("onClientRender", root, drawImages)
	end
end

createGasStations()
createBlipsFromGasStations()

function bindFromRefulling()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	triggerServerEvent("onVehicleRefulling", localPlayer, vehicle)
end

function bindFromRefullingFull()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	triggerServerEvent("onVehicleRefullingFull", localPlayer, vehicle)
end

function getVehicleFuel(v)
	local fuel = getElementData(v, "fuel")	
	if (fuel) then
		return fuel
	end
	return 0
end

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text, x - 1, y - 1, w - 1, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y - 1, w + 1, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y + 1, w - 1, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y + 1, w + 1, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y, w - 1, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y, w + 1, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - 1, w, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + 1, w, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end

x,y = guiGetScreenSize()
MaxFuel = 100
price = "10,00"
tick = getTickCount()

addEventHandler("onClientMarkerLeave", root,
 function (player)
  if (player ~= localPlayer) then
   return false
  end
  removeEventHandler("onClientRender", root, drawImages)
 end
)



x, y = guiGetScreenSize()
local font = "default-bold"

function resX(value)
    return (value/800) * x
end

function resY(value)
    return (value/600) * y
end


function drawImages(v)
	
	local pedInVehicle = getPedOccupiedVehicle(localPlayer)
	local fuel = getVehicleFuel(pedInVehicle)
 	
	dxDrawRectangle(x*0, y*0, x*1366, y*768, tocolor(0, 0, 0, 200), false)
	

	dxDrawText("#8A2BE2POSTO DE GASOLINA",x*0.35,y*0.2,x*0.35+resX(250),y*0.2+resY(30),tocolor(255,255,255,255),resY(1.4),font,"center","center",true,false,false,true)
	dxText("            Combustivel: #8A2BE2" .. math.floor(fuel)*1000/1000 .. "%",x*0.35+resX(20),y*0.2+resY(30),x*0.35+resX(260),y*0.2+resY(60),255,255,255,255,1,font,"left","center",true,false,false,true)
    if (MaxFuel - fuel) < 1 then
	dxText("            Abastecer: #8A2BE2"..(MaxFuel) - math.floor(fuel) .. " %",x*0.35+resX(20),y*0.2+resY(50),x*0.35+resX(260),y*0.2+resY(80),255,255,255,255,1,font,"left","center",true,false,false,true)
    else
	dxText("            Abastecer: #8A2BE2"..(MaxFuel) - math.floor(fuel)*1000/1000 .. "%",x*0.35+resX(20),y*0.2+resY(50),x*0.35+resX(260),y*0.2+resY(80),255,255,255,255,1,font,"left","center",true,false,false,true)
	end	
	dxText("            Preço por Litro: #8A2BE2R$4 = 1 Litro",x*0.35+resX(20),y*0.2+resY(70),x*0.35+resX(260),y*0.2+resY(100),255,255,255,255,1,font,"left","center",true,false,false,true)
	dxText("            Para abastecer por #8A2BE2litro #FFFFFFaperte: #8A2BE2L",x*0.35+resX(20),y*0.2+resY(90),x*0.35+resX(260),y*0.2+resY(120),255,255,255,255,1,font,"left","center",true,false,false,true)
	dxText("            Para encher o tanque aperte: #8A2BE2K",x*0.35+resX(20),y*0.2+resY(110),x*0.35+resX(260),y*0.2+resY(140),255,255,255,255,1,font,"left","center",true,false,false,true)
	dxText("            Seu Dinheiro: #8A2BE2R$"..convertNumber( getPlayerMoney(getLocalPlayer())).."",x*0.35+resX(20),y*0.2+resY(130),x*0.35+resX(260),y*0.2+resY(160),255,255,255,255,1,font,"left","center",true,false,false,true)
	if (getKeyState("L") and (getTickCount() - tick) > 600 and fuel <= 100) then
		bindFromRefulling()
		tick = getTickCount()
		playSound("sounds/song.mp3")
	end
	if (getKeyState("K") and (getTickCount() - tick) > 600 and fuel <= 100) then
		bindFromRefullingFull()
		tick = getTickCount()
		playSound("sounds/song.mp3")
	end
end
--addEventHandler("onClientRender",root,painelfreeroam)        


function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function dxDrawRecLine(x,y,w,h,color)
    dxDrawRectangle(x,y,w,1,color) -- h
	dxDrawRectangle(x,y+h-1,w,1,color) -- h
	dxDrawRectangle(x,y,1,h,color) -- v
	dxDrawRectangle(x+w-1,y,1,h,color) -- v
end

function dxText(text,x,y,w,h,red,green,blue,alpha,scale,font,a,b,c,d,e,f)
    dxDrawText(string.gsub(text,"(#%x%x%x%x%x%x)",""),x+1,y+1,w+1,h+1,tocolor(0,0,0,alpha),scale,font,a,b,c,d,e,f)
	dxDrawText(text,x,y,w,h,tocolor(red,green,blue,alpha),scale,font,a,b,c,d,e,f)
end
function dxDrawRectangleGradiente(x,y,w,h,r,g,b,a,direction)
    if not x or not y or not w or not h or not r or not g or not b or not a or not direction then
	    return outputDebugString("arguments not correspond")
	end
	if direction == "left" then
	    local space = (w/a)
		for i=1,a do
		    local now = space+(i*space)
		    dxDrawRectangle(x+w+space-now,y,space,h,tocolor(r,g,b,i))
		end
	elseif direction == "right" then
	    local space = (w/a)
		for i=1,a do
		    local now = space+(i*space)
		    dxDrawRectangle(x-(space*2)+now,y,space,h,tocolor(r,g,b,i))
		end
	elseif direction == "down" then
	    local space = (h/a)
		for i=1,a do
		    local now = space+(i*space)
		    dxDrawRectangle(x,y+now,w,space,tocolor(r,g,b,i))
		end
	elseif direction == "up" then
	    local space = (h/a)
		for i=1,a do
		    local now = space+(i*space)
		    dxDrawRectangle(x,y+h-now,w,space,tocolor(r,g,b,i))
		end
	else
	    return outputDebugString("direction invalid")
	end
end
