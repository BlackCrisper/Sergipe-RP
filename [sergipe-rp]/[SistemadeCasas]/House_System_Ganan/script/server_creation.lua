
function openHPanel(player)
	triggerClientEvent(player, "openHPanel", resourceRoot)
end
addCommandHandler("hpainel", openHPanel, true, false)



function isAdmin(player)
	return hasObjectPermissionTo(player, "function.fetchRemote", true)
end



function adminTeleport(x, y, z, int, dim)
	if not isAdmin(client) then return end
	setElementInterior(client, int, x, y, z)
	setElementDimension(client, dim)	
	setElementPosition(client, x, y, z)
end
addEvent("adminTeleport", true)
addEventHandler("adminTeleport", resourceRoot, adminTeleport)

function onCreateHouse(newHouseData)
	if not isAdmin(client) then return end
	
	local intData = getInteriorData(newHouseData.intID)
	if (not intData) then
		--outputChatBad("Erro interior!", client)
		exports.YM_DxMessages:addBox(client, "Erro de interior!", "error")
		return
	end
	local ID = getFreeID()
	local dim = getFreeDimension(intData[8])
	dbExec(db, "INSERT INTO house_data (ID, enterMrkX, enterMrkY, enterMrkZ, enterPointX, enterPointY, enterPointZ, \
		exitMrkX, exitMrkY, exitMrkZ, exitPointX, exitPointY, exitPointZ, int, dim, cost, owner, key, carLots, intID) \
		VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
		ID, newHouseData.enterMrkX, newHouseData.enterMrkY, newHouseData.enterMrkZ,
		intData[5], intData[6], intData[7], intData[2], intData[3], intData[4],
		newHouseData.exitPointX, newHouseData.exitPointY, newHouseData.exitPointZ,
		intData[8], dim, newHouseData.price, "", "", newHouseData.carLots, intData.ID
	)
	outputDebugString(string.format("[Casa][Criada] %s (acc %s) casa criada %i com interior % e o custo %i",
		getPlayerName(client), getAccountName(getPlayerAccount(client)), ID, intData.ID, newHouseData.price
	))
	
	newHouseData.int = intData[8]
	newHouseData.dim = dim
	newHouseData.cost = newHouseData.price
	newHouseData.owner = ""
	newHouseData.key = ""
	newHouseData.ID = ID
	newHouseData.enterPointX = intData[5]
	newHouseData.enterPointY = intData[6]
	newHouseData.enterPointZ = intData[7]
	newHouseData.exitMrkX = intData[2]
	newHouseData.exitMrkY = intData[3]
	newHouseData.exitMrkZ = intData[4]
	houseData[ID] = newHouseData
	triggerClientEvent("createHouse", resourceRoot, newHouseData)
	
	--outputChatOK("Você criou uma casa com sucesso", client)
	exports.YM_DxMessages:addBox(client, "Você criou uma casa com sucesso", "success")
	triggerClientEvent(client, "playConfirm", resourceRoot)
end
addEvent("createHouse", true)
addEventHandler("createHouse", resourceRoot, onCreateHouse)

function getFreeID()
	local newID = false
	local result = dbPoll(dbQuery(db, "SELECIONE ID DE house_data PEDIR POR ID ASC"), -1)
	for i, row in pairs (result) do
		if tonumber(row.ID) ~= i then
			newID = i
			break
		end
	end
	return newID or (#result + 1)
end

function getFreeDimension(interior)
	local usedDimensions = {}
	if isResourceRunning("house_apartments") then
		local result = exports.house_apartments:getUsedDimensions(interior)
		for _, row in ipairs(result) do
			usedDimensions[tonumber(row.dimension)] = true
		end
	end
	local result = dbPoll(dbQuery(db, "NÃO SELECIONE A PARTIR DE house_data ONDE int = ?", interior), -1)
	for _, row in ipairs(result) do
		usedDimensions[tonumber(row.dim)] = true
	end
	for i = 1, 65535 do
		if (not usedDimensions[i]) then
			return i
		end
	end
	outputDebugString("[Casa][Erro] Sem dimensões livres para o interior"..tostring(interior)..", 0 usava", 1)
	return 0
end
