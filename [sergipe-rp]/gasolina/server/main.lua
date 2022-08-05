local IDBlock = { 
    [467] = true , [597] = true , [405] = true , [490] = true , [598] = true , [596] = true , [445] = true , [479] = true , [416] = true , [481] = true , [509] = true , [510] = true , [476] = true , [416] = true , [405] = true ,
} 



factor = 0.03

function createVehicles(player)
	for i,v in ipairs(getElementsByType("vehicle")) do
		fuel = math.random(70,80)
		setElementData(v, "fuel", fuel)
	end
end

function processFuel(player)
	for i,v in ipairs(getElementsByType("vehicle")) do
		local ID =  getElementModel(v)
		if not IDBlock[ID] then
		local fuel = getElementData(v, "fuel") or math.random(90,100)
		if (getVehicleEngineState(v) and fuel > 0 ) then
			fuel = fuel - factor
		end
		if (fuel <= 0.99) then
			fuel = 0
			setVehicleEngineState(v, false)
			
		end
		setElementData(v, "fuel", fuel)
	end
end
end

createVehicles()
setTimer(processFuel, 1500, 0)