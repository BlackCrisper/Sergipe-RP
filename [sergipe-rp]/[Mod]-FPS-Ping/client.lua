local x,y = guiGetScreenSize()
local iFPS 				= 0
local iFrames 			= 0
local iStartTick 		= getTickCount()
    
function GetFPS()
	return iFPS
end
    
addEventHandler( "onClientRender", root,function()
		iFrames = iFrames + 1
	if getTickCount() - iStartTick >= 1000 then
		iFPS 		= iFrames
		iFrames 	= 0
		iStartTick 	= getTickCount()
	end
	dxDrawText("FPS: "..GetFPS().." | Brasil Sergipe RolePlay | ",0.60*x,0.982*y,0.935*x,0.15*y,tocolor(255,255,255,130),1.0,"default","right","top",false,false,true)
end)