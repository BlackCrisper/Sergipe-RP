local moneymkLS2 = math.random(2500, 10000)


--------------------##DINHEIROS CARRINHO 2##---------------------
money1 = createObject ( 1933, 1126.9952392578, -1106.9849853516, 19.489200592041, 0, 0, 249.31274414063)
money2 = createObject ( 1933, 1126.8389892578, -1106.9184570313, 19.489200592041, 0, 0, 249.31274414063)
money3 = createObject ( 1933, 1127.1151123047, -1106.4992675781, 19.489200592041, 0, 0, 249.31719970703)	
money4 = createObject ( 1933, 1126.9771728516, -1106.4210205078, 19.489200592041, 0, 0, 249.31274414063)	
money5= createObject ( 1933, 1126.6768798828, -1106.8640136719, 19.489200592041, 0, 0, 249.31274414063)	
money6 = createObject ( 1933, 1126.7966308594, -1106.9083251953, 19.35120010376, 0, 0, 159.71374511719)	
money7 = createObject ( 1933, 1126.7242431641, -1107.0704345703, 19.35120010376, 0, 0, 159.71502685547)
money8 = createObject ( 1933, 1126.8629150391, -1106.7523193359, 19.35120010376, 0, 0, 159.71374511719)
money9 = createObject ( 1933, 1126.8275146484, -1106.3548583984, 19.489200592041, 0, 0, 249.31274414063)
money10 = createObject ( 1933, 1126.5927734375, -1106.4455566406, 19.567199707031, 0, 0, 249.24682617188)
money11 = createObject ( 1933,1126.9112548828, -1106.5899658203, 19.35120010376, 0, 0, 159.71374511719)
money12 = createObject ( 1933, 1126.9650878906, -1106.4338378906, 19.35120010376, 0, 0, 159.71374511719)
money13 = createObject ( 1933, 1127.0367431641, -1106.2775878906, 19.35120010376, 0, 0, 159.71374511719)
money14 = createObject ( 1933, 1126.4307861328, -1106.7641601563, 19.35120010376, 0, 0, 249.25183105469)
money15 = createObject ( 1933, 1126.6346435547, -1106.2717285156, 19.35120010376, 0, 0, 249.24682617188)
money16 = createObject ( 1933, 1126.4128417969, -1106.3254394531, 19.35120010376, 0, 0, 249.24682617188)		
	                      
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------


-------------------- < MARKERS BANCO > --------------------
banco2 = createMarker(1127.5102539063,-1106.9544677734,18.4, "cylinder", 1.0, 232, 23, 28, 50)

-------------------- < BANCO MARKER > --------------------


-------------------- < MENSAGEM MARKER ROUBAR BANCO > --------------------
function onHit(source)
		if (getElementType(source) == "player") then 
			triggerClientEvent(source, "mkrob1enable", getRootElement())
		end
	end
	addEventHandler("onMarkerHit", banco2, onHit)

	function onLeave(source)
		if (getElementType(source) == "player") then 
			triggerClientEvent(source, "mkrob1disable", getRootElement())
		end
	end
	addEventHandler("onMarkerLeave", banco2, onLeave)


-------------------- < MENSAGEM MARKER ROUBAR BANCO > --------------------
function bankrob2(source)
	
	if isElementWithinMarker(source, banco2) then
			
		
		setPedRotation(source, 69)	
		setElementPosition(source, 1127.5938720703,-1107.0061035156,19.297250747681)
		setElementFrozen( source, true )
		setMarkerSize(banco2, 0)
		
		----------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money1)
			givePlayerMoney(source, moneymkLS2)
		end,1000,1,source)
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money2)
			givePlayerMoney(source, moneymkLS2)
		end,2000,1,source)
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money3)
			givePlayerMoney(source, moneymkLS2)
		end,3000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money4)
			givePlayerMoney(source, moneymkLS2)
		end,4000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money5)
			givePlayerMoney(source, moneymkLS2)
		end,5000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money6)
			givePlayerMoney(source, moneymkLS2)
		end,6000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money7)
			givePlayerMoney(source, moneymkLS2)
		end,7000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money8)
			givePlayerMoney(source, moneymkLS2)
		end,8000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money9)
			givePlayerMoney(source, moneymkLS2)
		end,9000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money10)
			givePlayerMoney(source, moneymkLS2)
		end,10000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money11)
			givePlayerMoney(source, moneymkLS2)
		end,11000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money12)
			givePlayerMoney(source, moneymkLS2)
		end,12000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money13)
			givePlayerMoney(source, moneymkLS2)
		end,13000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money14)
			givePlayerMoney(source, moneymkLS2)
		end,14000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money15)
			givePlayerMoney(source, moneymkLS2)
		end,15000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(money16)
			givePlayerMoney(source, moneymkLS2)
		end,16000,1,source)
		
		setTimer (setElementData,24000,1,source,"mkrob2",false)
		
		setTimer(function(source)			
	  		                setElementFrozen( source, false )			
		                      end,16001,1,source)
		
		
	unbindKey ( source, "r", "down", bankrob2 )
		
		
		
		
		
	

end
end


function bindmkrob3 ( source, commandName )
  bindKey (source, "r", "down", bankrob2 )   -- bind the player's F1 down key
end
addEventHandler ("onMarkerHit",banco2,bindmkrob3)


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------