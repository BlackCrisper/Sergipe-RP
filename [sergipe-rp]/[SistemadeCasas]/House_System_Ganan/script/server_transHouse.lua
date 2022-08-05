
function transHouse(id, newOwner, sellerMoney)
	if (not sellerMoney) or (sellerMoney < 0) then return end
	sellerMoney = math.min(sellerMoney, 1000*1000*1000)
	local hData = houseData[id]
	local accName = getAccountName(getPlayerAccount(client))
	local inf = getAccountData(getPlayerAccount(client), "INF")
	if (inf) and (inf > 10000) then
		--outputChatBad("Você tem multas não pagas!", client)
		exports.YM_DxMessages:addBox(client, "Você tem multas não pagas!", "warning")
		return
	end
	local result = dbPoll(dbQuery(db, "SELECIONE o proprietário FROM house_data WHERE ID = ?", hData.ID), -1)
	if (result[1].owner ~= accName) then
		--outputChatBad("Esta não é a sua casa!", client)
		exports.YM_DxMessages:addBox(client, "Esta não é a sua casa!", "error")
		return
	end
	if not isElement(newOwner) then
		--outputChatBad("Este jogador está desconectado!", client)
		exports.YM_DxMessages:addBox(client, "Este jogador está desconectado!", "info")
		return
	end
	local newOwnerAcc = getPlayerAccount(newOwner)
	if isGuestAccount(newOwnerAcc) then
		--outputChatBad("Incapaz de transferir a casa, o jogador ainda não entrou em sua conta.", client)
		exports.YM_DxMessages:addBox(client, "Impossivel de transferir a casa, o jogador ainda não entrou em sua conta.", "info")
		return
	end
	local newOwnerAccName = getAccountName(newOwnerAcc)
	local buyerHouses = getHousesCount(newOwnerAccName)
	if (buyerHouses >= maxHousesCount) then
        exports.YM_DxMessages:addBox(client, "É impossível transferir a casa, o jogador possui muitos imóveis!", "info")
		exports.YM_DxMessages:addBox(newOwner, ""..getPlayerName(client).." Gostaria de ti vender uma casa, mas você já tem muitos imóveis!", "info")
		--outputChatBad("É impossível transferir a casa, o jogador possui muitos imóveis!", client)
		--outputChatBad(getPlayerName(client).." #FF3324queria te vender uma casa, mas você já tem muitos imóveis!", newOwner)
		return
	end
	triggerClientEvent(newOwner, "transHouseOffer", resourceRoot, hData, client, sellerMoney)
	outputDebugString("[HOUSE][TRANSHOUSE_OFFER] "..getPlayerName(client).." (acc "..accName.." money "..getPlayerMoney(client)..") criou oferta para vender casa (id "..hData.ID..") para "..sellerMoney.." para "..getPlayerName(newOwner).." (acc "..getAccountName(getPlayerAccount(newOwner)).." money "..getPlayerMoney(newOwner)..")")
	exports.YM_DxMessages:addBox(newOwner, ""..getPlayerName(client).." Ofereceu-lhe para comprar a casa dele!", "info")
    exports.YM_DxMessages:addBox(client, ""..getPlayerName(newOwner).." Recebeu sua oferta.", "info")
	--outputChatOK(getPlayerName(client).." #32FF32ofereceu-lhe para comprar a casa dele!", newOwner)
	--outputChatOK(getPlayerName(newOwner).." #32FF32recebeu sua oferta.", client)
end
addEvent("transHouse", true)
addEventHandler("transHouse", resourceRoot, transHouse)

function acceptHouseOffer(ID, seller, money)
	if not isElement(seller) then
		--outputChatBad("O vendedor se desconectou do servidor. O negócio é impossível.", client)
			exports.YM_DxMessages:addBox(client, "O vendedor se desconectou do servidor. A negociação é impossível.", "info")
		return
	end
	local sellerAccName = getAccountName(getPlayerAccount(seller))
	local buyerAccName = getAccountName(getPlayerAccount(client))
	local inf = getAccountData(getPlayerAccount(client), "INF")
	if (inf) and (inf > 10000) then
		exports.YM_DxMessages:addBox(client, "Você tem multas não pagas!", "info")
        exports.YM_DxMessages:addBox(seller, "O comprador tem multas não pagas!", "info")
		--outputChatBad("Você tem multas não pagas!", client)
		--outputChatBad("O comprador tem multas não pagas!", seller)
		return
	end
	local result = dbPoll(dbQuery(db, "SELECT owner FROM house_data WHERE ID = ?", ID), -1)
	if (result[1].owner ~= sellerAccName) then
		
		exports.YM_DxMessages:addBox(client, "A casa não pertence ao dono anterior. O negócio é impossível.", "info")
        exports.YM_DxMessages:addBox(seller, "Não tente vender a casa duas vezes.", "info")
		
		--outputChatBad("A casa não pertence ao dono anterior. O negócio é impossível.", client)
		--outputChatBad("Não tente vender a casa duas vezes.", seller)
		return
	end
	local buyerMoney = math.floor(money*1.1)
	if (getPlayerMoney(client) < buyerMoney) then
        

        exports.YM_DxMessages:addBox(client, "Você não tem dinheiro suficiente para comprar.", "info")
		exports.YM_DxMessages:addBox(seller, "O comprador não tem dinheiro suficiente para comprar.", "info")
		
		--outputChatBad("Você não tem dinheiro suficiente para comprar.", client)
		--outputChatBad("O comprador não tem dinheiro suficiente para comprar.", seller)
		return
	end
	if (getPlayerMoney(seller) + money > 99999999) then
        
        exports.YM_DxMessages:addBox(client, "O vendedor não poderá realizar todo o dinheiro após a transação.", "info")
		exports.YM_DxMessages:addBox(seller, "Você não poderá realizar todo o dinheiro após a transação.", "info")
		

		--outputChatBad("O vendedor não poderá realizar todo o dinheiro após a transação. ", client)
		--outputChatBad("Você não poderá realizar todo o dinheiro após a transação.", seller)
		return
	end
	local buyerHouses = getHousesCount(buyerAccName)
	if (buyerHouses >= maxHousesCount) then
        exports.YM_DxMessages:addBox(seller, "É impossível transferir a casa, o jogador possui muitos imóveis!.", "info")
		exports.YM_DxMessages:addBox(client, ""..getPlayerName(seller).." Gostaria de ti vender uma casa, mas você já tem muitos imóveis!", "info")
		

		--outputChatBad("É impossível transferir a casa, o jogador possui muitos imóveis!", seller)
		--outputChatBad(getPlayerName(seller).." #FF3324queria te vender uma casa, mas você já tem muitos imóveis!", client)
		return
	end
	local moneyToTake = buyerMoney
	local moneyToGive = money
	local moneyToFee = moneyToTake - moneyToGive
	takePlayerMoney(client, moneyToTake)
	givePlayerMoney(seller, moneyToGive)
	dbExec(db, "UPDATE house_data SET owner = ? WHERE id = ?", buyerAccName, ID)
	outputDebugString("[Casa][Tranferencia] "..getPlayerName(client).." (acc "..buyerAccName.." money "..getPlayerMoney(client)..") casa comprada (id "..ID..") a partir de "..getPlayerName(seller).." (acc "..sellerAccName.." money "..getPlayerMoney(seller)..") para: taken: "..moneyToTake..", dado: "..moneyToGive..", taxa: "..moneyToFee)
	updateHouse(ID, "owner", buyerAccName)
    exports.YM_DxMessages:addBox(client, "Você comprou com sucesso uma casa para "..moneyToTake.." $. Chave: "..houseData[ID].key.."", "info")
    exports.YM_DxMessages:addBox(seller, "Você vendeu com sucesso sua casa por "..moneyToGive.."R$.", "success")
	
	--outputChatOK("Você comprou com sucesso uma casa para "..moneyToTake.." $. Chave: #FFFF00"..houseData[ID].key, client)
	--outputChatOK("Você vendeu com sucesso sua casa por "..moneyToGive.." $.", seller)
	


	local carsystRes = getResourceFromName("car_system")
	if (carsystRes) and (getResourceState(carsystRes) == "running") then
		exports.car_system:updateVehicleInfo(client)
		exports.car_system:updateVehicleInfo(seller)
	end
end
addEvent("acceptHouseOffer", true)
addEventHandler("acceptHouseOffer", resourceRoot, acceptHouseOffer)

function declineHouseOffer(ID, seller, money)
	exports.YM_DxMessages:addBox(client, "Você se recusou a comprar uma casa.", "info")
	--outputChatOK("Você se recusou a comprar uma casa.", client)
	if isElement(seller) then
		
		exports.YM_DxMessages:addBox(seller, ""..getPlayerName(client).." Recusou a sua oferta", "info")
		
		--outputChatBad(getPlayerName(client).." #FF3232recusou sua oferta.", seller)
		outputDebugString("[Casa][TRANSHOUSE_DECLINE] "..getPlayerName(client).." (acc "..getAccountName(getPlayerAccount(client)).." money "..getPlayerMoney(client)..") rejeitou a compra de casa (id "..ID..") para "..money.." a partir de "..getPlayerName(seller).." (acc "..getAccountName(getPlayerAccount(seller)).." money "..getPlayerMoney(seller)..")")
	else
		outputDebugString("[Casa][TRANSHOUSE_DECLINE] "..getPlayerName(client).." (acc "..getAccountName(getPlayerAccount(client)).." money "..getPlayerMoney(client)..") rejeitou a compra de casa (id "..ID..") para "..money.." Jogador não encontrado")
	end
end
addEvent("declineHouseOffer", true)
addEventHandler("declineHouseOffer", resourceRoot, declineHouseOffer)

























