local g_PlayerData = {}

function joinHandler(player)
	if not player then
		player = source
	end
	local r, g, b = math.random(144, 0, 254, 255), math.random(144, 0, 254, 255), math.random(144, 0, 254, 255)
	setPlayerNametagColor(player, r, g, b)
	g_PlayerData[player] = { vehicles = {}, settings={} }
	g_PlayerData[player].blip = createBlipAttachedTo(player, 0, 2, r, g, b)
	g_PlayerData[player].nick = getPlayerName(player):gsub("#%x%x%x%x%x%x", "")
	setElementData(g_PlayerData[player].blip, "blipName", g_PlayerData[player].nick)

end
addEventHandler('onPlayerJoin', root, joinHandler)

function quitHandler(player)
	if not player then
		player = source
	end
	if g_PlayerData[source].blip and isElement(g_PlayerData[source].blip) then
		destroyElement(g_PlayerData[source].blip)
	end
	g_PlayerData[source] = nil
end
addEventHandler('onPlayerQuit', root, quitHandler)


