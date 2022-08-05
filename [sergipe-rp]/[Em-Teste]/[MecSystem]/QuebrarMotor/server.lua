function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

--------------------------------------------------------------------

addEventHandler("onVehicleDamage", getRootElement(),function(loss)
	if getElementType ( source ) == "vehicle" then
		if not isVehicleDamageProof(source) then
			local HP = getElementHealth(source)-loss		
			if HP <= 350 then 
				HP = 350 
				setElementHealth(source,350)
				setVehicleEngineState(source,false)
				setVehicleDamageProof(source,true)
				if isVehicleBlown(source) then
					fixVehicle(source)	
					setElementHealth(source,350)
					setVehicleDamageProof(source,true)
				end 
			end
		end	
	end	
end)

--------------------------------------------------------------------

function DesligarAndLigar ( playerSource )
   if math.floor ( getElementHealth( source ) + 0.5 ) > 350 then 
    setVehicleDamageProof( source, false ) -- Não Quebrado
    else 
    setVehicleEngineState( source, false ) -- Quebrado
	triggerClientEvent ( "Mecanico>Quebrado", playerSource )
    end 
end 
addEventHandler ( "onVehicleEnter", root, DesligarAndLigar )

--------------------------------------------------------------------

function ComandoMecanico ( ThePlayer )
outputMessage("#ffffff[ Aviso #ffffff] - #FFFFFFOs Mecanicos Foram Avisados, Aguarde no Local", ThePlayer, 255, 255, 255, true )
end
addCommandHandler("mecanico", ComandoMecanico )

--------------------------------------------------------------------
