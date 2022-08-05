--[[
              ---------------------------------------------------------------
	  	                                 ,,,,,,,,,,,,
                                 ,,,,,,,,,,,,,,,,,,
              ---------------------------------------------------------------
]]

local entrada = createMarker(982.955, -1976.155, 13.178, 'arrow', 1, 0, 255, 255, 255 ) -----Entrada


function entrar( hitElement, matchingDimension )
    if getElementType( hitElement ) == "player" and not isPedInVehicle(hitElement)    
       then
        setElementPosition(hitElement, 978.764, -2005.81, 26.733) -----Saida da entrada
        end
end
addEventHandler( "onMarkerHit", entrada , entrar ) 
--------------------------------------------------
local saida = createMarker(976.824, -2005.616, 26.733, 'arrow', 1, 0, 255, 255, 255 ) -----Saida

function sair( hitElement, matchingDimension )
    if getElementType( hitElement ) == "player" and not isPedInVehicle(hitElement)    
       then
        setElementPosition(hitElement, 982.832, -1978.439, 13.178) -----Saida Da Saida
        end
end
addEventHandler( "onMarkerHit", saida , sair )