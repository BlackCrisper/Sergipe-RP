bindKey("2","down",function()
	triggerServerEvent( "triggerVehicleSystem", localPlayer, "engine" )
end)

bindKey("l","down",function()
	triggerServerEvent( "triggerVehicleSystem", localPlayer, "lights" )
end)

bindKey("3","down",function()
	triggerServerEvent( "triggerVehicleSystem", localPlayer, "lock" )
end)