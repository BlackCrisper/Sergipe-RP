local drawDistance = 7
g_StreamedInPlayers = {}

function onClientRender()
  local cx, cy, cz, lx, ly, lz = getCameraMatrix()
  for k, player in pairs(g_StreamedInPlayers) do
    if isElement(player) and isElementStreamedIn(player) then
      do
        local vx, vy, vz = getPedBonePosition(player, 4)
        local dist = getDistanceBetweenPoints3D(cx, cy, cz, vx, vy, vz)
        if dist < drawDistance and isLineOfSightClear(cx, cy, cz, vx, vy, vz, true, false, false) then
          local x, y = getScreenFromWorldPosition(vx, vy, vz + 0.3)
          if x and y then
            local ID = getElementData(player, "ID") or "N/A"
            local w = dxGetTextWidth(ID, 0.1, "default-bold")
            local h = dxGetFontHeight(1, "default-bold")
            dxDrawText(""..ID.."", x - 1 - w / 1, y - 1 - h - 12, w, h, CorTag, 1.20, "default-bold", "left", "top", false, false, false, false, false)		
            CorTag = tocolor(255, 255, 255)
			
			if getElementData(player, "Cor", true) then
 			CorTag = tocolor(0, 255, 0)
			end

          end
        end
      end
    else
      table.remove(g_StreamedInPlayers, k)
    end
  end
end
addEventHandler("onClientRender", root, onClientRender)


function CorTagid ()
   if getElementData(localPlayer, "Cor", true) then
      setElementData(localPlayer, "Cor", false)
	else
      setElementData(localPlayer, "Cor", true)
   end
end
bindKey ( "z", "both", CorTagid )

function onClientElementStreamIn()
  if getElementType(source) == "player" and source ~= getLocalPlayer() then
    setPlayerNametagShowing(source, false)
    table.insert(g_StreamedInPlayers, source)
  end
end
addEventHandler("onClientElementStreamIn", root, onClientElementStreamIn)

function onClientResourceStart(startedResource)
  visibleTick = getTickCount()
  counter = 0
  local players = getElementsByType("player")
  for k, v in pairs(players) do
    if isElementStreamedIn(v) and v ~= getLocalPlayer() then
      setPlayerNametagShowing(v, false)
      table.insert(g_StreamedInPlayers, v)
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)
