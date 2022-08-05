addEventHandler("onClientRender", root,
function()
 if (getDistanceBetweenPoints3D(117.18000793457, -182.88529968262, 2.5006450414658, getElementPosition(getLocalPlayer()))) <= 35 then
  local coords = {getScreenFromWorldPosition(117.18000793457, -182.88529968262, 2.5006450414658)}
  if coords[1] and coords[2] then
   dxDrawText("/reparar", coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
  end
 end
end)

setTimer ( function ()

local theCol = getElementData(root, "BlockExportCol")
	
function isInColExport ()
	if isElement(theCol) and isElementWithinColShape(localPlayer,theCol) then
		return true else return false
	end
end

function ClientExplosionCFunction()
 if isInColExport ()  then
  cancelEvent ()
 end
end
addEventHandler("onClientExplosion", root, ClientExplosionCFunction)

end , 1000, 1 )