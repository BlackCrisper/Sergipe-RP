local addingFuel = {}

addEvent("onVehicleRefulling", true)

function vehicleRefulling(v)
	if (getPlayerMoney(source) < 10) then
		outputChatBox("#8A2BE2[RJ:RP] #ffffffVocê não tem dinheiro, preço: #8A2BE2R$#FFFFFF10", source, 255, 255, 255, true)
	else
		setElementData(v, "fuel", getElementData(v, "fuel") + 1)
		takePlayerMoney(source, 10)
	end
end
addEventHandler("onVehicleRefulling", root, vehicleRefulling)


addEvent("onVehicleRefullingFull", true)

function vehicleRefullingf(v)
		 gabas = 100 - getElementData(v, "fuel")
if (getPlayerMoney(source) < tonumber(gabas*10)) then
		outputChatBox("#8A2BE2[RJ:RP] #ffffffVocê não tem dinheiro suficiente #8A2BE2R$"..convertNumber (gabas*5).."", source, 255, 255, 255, true)
	else
		setElementData(v, "fuel", getElementData(v, "fuel")+gabas+1)
		takePlayerMoney(source, tonumber(gabas*10))
	end
end
addEventHandler("onVehicleRefullingFull", root, vehicleRefullingf)


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
