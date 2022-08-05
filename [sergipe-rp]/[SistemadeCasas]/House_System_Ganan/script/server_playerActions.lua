
addEvent("enterHouse", true)
addEventHandler("enterHouse", resourceRoot, function(markerData)
	if getElementData(client, "isChased") then return end
	fadeCamera(client, false)
	toggleAllControls(client, false)
	setTimer(enterHouse2, 1200, 1, client, markerData)
	createInventoryOnHouseEnter(client, markerData.intID, markerData.dim, markerData.owner)
end)
function enterHouse2(player, data)
	if isElement(player) then
		if isPedInVehicle(player) then removePedFromVehicle(player) end
		setElementInterior(player, data.int, data.enterPointX, data.enterPointY, data.enterPointZ)
		setElementPosition(player, data.enterPointX, data.enterPointY, data.enterPointZ)
		setElementDimension(player, data.dim)
		toggleAllControls(player, true)
		fadeCamera(player, true)
	end
end

addEvent("exitHouse", true)
addEventHandler("exitHouse", resourceRoot, function(exitData)
	toggleAllControls(client, false)
	fadeCamera(client, false)
	setTimer(exitHouse2, 1200, 1, client, exitData)
	removeInventory(client)
end)
function exitHouse2(player, data)
	if isElement(player) then
		if isPedInVehicle(player) then removePedFromVehicle(player) end
		setElementPosition(player, data.exitPointX, data.exitPointY, data.exitPointZ)
		setElementInterior(player, 0)
		setElementDimension(player, 0)
		toggleAllControls(player, true)
		fadeCamera(player, true)
	end
end

function onBuyHouse(markerData, key)
	local hData = houseData[markerData.ID]
	if (not hData) then
		outputChatBad("Ocorreu um erro. Tente novamente.", client)
		return
	end
	if (getPlayerMoney(client) < hData.cost) then
		outputChatBad("Você não tem dinheiro suficientes!", client)
		return
	end
	local result = dbPoll(dbQuery(db, "SELECT owner FROM house_data WHERE ID = ?", hData.ID), -1)
	if (not result[1]) then
		outputDebugString ("[HOUSE][ERROR] "..getPlayerName(client).." erro ao comprar casa "..tostring(hData.ID))
		outputChatBad("Ocorreu um erro. Tente novamente.", client)
		return
	end
	if (result[1].owner ~= "") then
		outputChatBad("Esta casa já foi comprada!", client)
		return
	end
	local accName = getAccountName(getPlayerAccount(client))
	if (getHousesCount(accName) >= maxHousesCount) then
		outputChatBad("Desculpe, você não pode comprar mais "..maxHousesCount.." casas!", client)
		return
	end
	takePlayerMoney(client, hData.cost)
	updateHouse(hData.ID, "key", key)
	updateHouse(hData.ID, "owner", accName)
	dbExec(db, "UPDATE house_data SET owner = ?, key = ? WHERE ID = ?", accName, key, hData.ID)
	outputDebugString ("[HOUSE][BUY] "..getPlayerName(client).." (acc "..accName..", money "..getPlayerMoney(client)..") bought house "..hData.ID.." for "..hData.cost)
	outputChatOK("Parabéns, você comprou um imóvel!", client)
	--outputChatOK("Disponível para você "..getPlayerParkingLots(accName).." vagas de estacionamento!", client)
	exports.YM_DxMessages:addBox(client, "Sua chave: ''"..key.."''", "info")
	--outputChatOK("Sua nova chave: #FFFF00"..key, client)
	triggerClientEvent(client, "playConfirm", resourceRoot)
	triggerClientEvent(client, "refreshHouseBlips", resourceRoot)
	local carsystRes = getResourceFromName("car_system")
	if (carsystRes) and (getResourceState(carsystRes) == "running") then
		exports.car_system:updateVehicleInfo(client)
	end
end
addEvent("buyHouse", true)
addEventHandler("buyHouse", resourceRoot, onBuyHouse)

function onSellHouse(markerData)
	local hData = houseData[markerData.ID]
	local accName = getAccountName(getPlayerAccount(client))
	local result = dbPoll(dbQuery(db, "SELECT owner FROM house_data WHERE ID = ?", hData.ID), -1)
	if result[1].owner == "" then
		outputChatBad("Esta casa já foi vendida!", client)
		return
	end
	if result[1].owner ~= accName then
		outputChatBad("Esta não é a sua casa!", client)
		return
	end
	local price = math.ceil(hData.cost/2)
	givePlayerMoney(client, price)
	updateHouse(hData.ID, "key", "")
	updateHouse(hData.ID, "owner", "")
	dbExec(db, "UPDATE house_data SET owner = '', key = '' WHERE ID = ?", hData.ID)
	outputDebugString ("[HOUSE][SELL] "..getPlayerName(client).." (acc "..accName..", money "..getPlayerMoney(client)..") sold house "..hData.ID.." for "..price)
	outputChatOK("Você vendeu sua casa!", client)
	--outputChatOK("Você tem vagas de estacionamento "..getPlayerParkingLots (accName) .." disponíveis!", client)
	triggerClientEvent(client, "playConfirm", resourceRoot)
	triggerClientEvent(client, "refreshHouseBlips", resourceRoot)
	local carsystRes = getResourceFromName("car_system")
	if (carsystRes) and (getResourceState(carsystRes) == "running") then
		exports.car_system:updateVehicleInfo(client)
	end
end
addEvent("sellHouse", true)
addEventHandler("sellHouse", resourceRoot, onSellHouse)

function onChangeKey(markerData, oldKey, newKey)
	local hData = houseData[markerData.ID]
	local accName = getAccountName(getPlayerAccount(client))
	local result = dbPoll(dbQuery(db, "SELECT owner, key FROM house_data WHERE ID = ?", hData.ID), -1)
	if result[1].owner ~= accName then
		outputChatBad("Esta não é a sua casa!", client)
		return
	end
	-- if result[1].key ~= oldKey then
		-- outputChatBad("A chave antiga esta errada!", client)
		-- return
	-- end
	updateHouse(hData.ID, "key", newKey)
	dbExec(db, "UPDATE house_data SET key = ? WHERE ID = ?", newKey, hData.ID)
	outputDebugString ("[HOUSE][CHANGEKEY] "..getPlayerName(client).." (acc "..accName..", money "..getPlayerMoney(client)..") changed key for house "..hData.ID)
	exports.YM_DxMessages:addBox(client, "Sua nova chave: "..newKey.."", "info")
	--outputChatOK("Sua nova chave: #FFFF00"..newKey, client)
	triggerClientEvent(client, "playConfirm", resourceRoot)
end
addEvent("changeKey", true)
addEventHandler("changeKey", resourceRoot, onChangeKey)




