function loadHandling(v)	
		if getElementModel(v) == 525 then 
			setVehicleHandling(v, "mass", 2500)
			setVehicleHandling(v, "turnMass", 3000)
			setVehicleHandling(v, "dragCoeff", 1.8)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			setVehicleHandling(v, "percentSubmerged", 80)
			setVehicleHandling(v, "tractionMultiplier", 1.0)
			setVehicleHandling(v, "tractionLoss", 0.8)
			setVehicleHandling(v, "tractionBias", 0.480)
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "maxVelocity", 185)
			setVehicleHandling(v, "engineAcceleration", 35)
			setVehicleHandling(v, "engineInertia", 35)
			setVehicleHandling(v, "driveType", "awd")
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "brakeDeceleration", 80)
			setVehicleHandling(v, "ABS", false)
			setVehicleHandling(v, "steeringLock", 40)
			setVehicleHandling(v, "headLight", 0)
			setVehicleHandling(v, "tailLight", 1)
			setVehicleHandling(v, "animGroup", 0)
			setVehicleHandling(v, "suspensionUpperLimit", 0.0)
			setVehicleHandling(v, "suspensionLowerLimit", 0.0)
		end


end

function loadHandlings()
	for k, v in ipairs(getElementsByType("vehicle")) do
		loadHandling(v)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadHandlings)

function vehicleEnter()
	loadHandling(source)
end
addEventHandler("onVehicleEnter", getRootElement(), vehicleEnter)