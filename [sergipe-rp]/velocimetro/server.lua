function triggerVehicleSystem(sys)
	local veh = getPedOccupiedVehicle(source)
	if veh and getVehicleController(veh) == source then
		if sys == "engine" then
			if not getElementData(veh,"fuel") then setVehicleEngineState(veh, not getVehicleEngineState(veh))  return end
			if getElementData(veh,"fuel") > 0 then
				setVehicleEngineState(veh, not getVehicleEngineState(veh))
			else
				outputChatBox("Нет бензина!",source,200,0,0)
			end
		elseif sys == "lights" then
			if getVehicleOverrideLights( veh ) ~= 2 then
				setVehicleOverrideLights( veh, 2 )
			else
				setVehicleOverrideLights( veh, 1 )
			end
		elseif sys == "lock" then
			setVehicleLocked(veh,not isVehicleLocked(veh))
		end
	end
end
addEvent("triggerVehicleSystem",true)
addEventHandler("triggerVehicleSystem",root,triggerVehicleSystem)