local moneymkLS1 = math.random(2500, 10000)


--------------------##DINHEIROS CARRINHO 1##---------------------
 
						  
moneybankmk1 = createObject ( 1933, 1130.65625, -1107.8349609375, 19.579200744629, 0, 0, 267.92358398438)
moneybankmk2 = createObject ( 1933, 1130.494140625, -1107.8349609375, 19.579200744629, 0, 0, 267.92358398438)
moneybankmk3 = createObject ( 1933, 1130.326171875, -1107.8349609375, 19.579200744629, 0, 0, 267.92358398438)	
moneybankmk4 = createObject ( 1933, 1130.1640625, -1107.8349609375, 19.579200744629, 0, 0, 267.92358398438)	
moneybankmk5 = createObject ( 1933, 1130.0078125, -1107.8349609375, 19.579200744629, 0, 0, 267.92358398438)	
moneybankmk6 = createObject ( 1933, 1129.83984375, -1107.8349609375, 19.579200744629, 0, 0, 267.92358398438)	
moneybankmk7 = createObject ( 1933, 1130.4638671875, -1107.642578125, 19.35120010376, 0, 0, 359.92858886719)
moneybankmk8 = createObject ( 1933, 1129.9541015625, -1107.642578125, 19.35120010376, 0, 0, 359.92858886719)
moneybankmk9 = createObject ( 1933, 1130.4482421875, -1108.1689453125, 19.579200744629, 0, 0, 358.51684570313)
moneybankmk10 = createObject ( 1933, 1130.6474609375, -1107.978515625, 19.35120010376, 0, 0, 270)
moneybankmk11 = createObject ( 1933,1130.498046875, -1107.984375, 19.35120010376, 0, 0, 270)
moneybankmk12 = createObject ( 1933, 1130.330078125, -1107.984375, 19.35120010376, 0, 0, 270)
moneybankmk13 = createObject ( 1933, 1129.9384765625, -1108.1689453125, 19.579200744629, 0, 0, 358.51684570313)
moneybankmk14 = createObject ( 1933, 1130.16796875, -1107.984375, 19.35120010376, 0, 0, 270)
moneybankmk15 = createObject ( 1933, 1129.994140625, -1107.984375, 19.35120010376, 0, 0, 270)
moneybankmk16 = createObject ( 1933, 1129.826171875, -1107.984375, 19.35120010376, 0, 0, 270)	

-------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------------------------                                                     
	
	
	   

-------------------- < MARKERS BANCO > --------------------
banco1 = createMarker(1130.302734375,-1106.6702880859,18.4, "cylinder", 1.0, 232, 23, 28, 50)






-------------------- < BANCO MARKER > --------------------


-------------------- < MENSAGEM MARKER ROUBAR BANCO > --------------------
function onHit(source)
		if (getElementType(source) == "player") then 
			triggerClientEvent(source, "mkrob1enable", getRootElement())
		end
	end
	addEventHandler("onMarkerHit", banco1, onHit)

	function onLeave(source)
		if (getElementType(source) == "player") then 
			triggerClientEvent(source, "mkrob1disable", getRootElement())
		end
	end
	addEventHandler("onMarkerLeave", banco1, onLeave)


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
---------------------------------#######################################--------------------------------------------
---------------------------------#######################################--------------------------------------------
---------------------------------#######################################--------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

function sistema1(source)
	
	if isElementWithinMarker(source, banco1) then
		
	
	
		
		setPedRotation(source, 180)	
		setElementPosition(source, 1130.3167724609,-1107.0457763672,19.297250747681)
		setElementFrozen( source, true )
		setMarkerSize(banco1, 0)
		
		----------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk1)
			givePlayerMoney(source, moneymkLS1)
		end,1000,1,source)
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk2)
			givePlayerMoney(source, moneymkLS1)
		end,2000,1,source)
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk3)
			givePlayerMoney(source, moneymkLS1)
		end,3000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk4)
			givePlayerMoney(source, moneymkLS1)
		end,4000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk5)
			givePlayerMoney(source, moneymkLS1)
		end,5000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk6)
			givePlayerMoney(source, moneymkLS1)
		end,6000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk7)
			givePlayerMoney(source, moneymkLS1)
		end,7000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk8)
			givePlayerMoney(source, moneymkLS1)
		end,8000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk9)
			givePlayerMoney(source, moneymkLS1)
		end,9000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk10)
			givePlayerMoney(source, moneymkLS1)
		end,10000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk11)
			givePlayerMoney(source, moneymkLS1)
		end,11000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk12)
			givePlayerMoney(source, moneymkLS1)
		end,12000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk13)
			givePlayerMoney(source, moneymkLS1)
		end,13000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk14)
			givePlayerMoney(source, moneymkLS1)
		end,14000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk15)
			givePlayerMoney(source, moneymkLS1)
		end,15000,1,source)
		
		-------------------------------------
		setTimer(function(source)
			setPedAnimation( source, "shop", "rob_2idle", 800, true, false, false, false )
			destroyElement(moneybankmk16)
			givePlayerMoney(source, moneymkLS1)
		end,16000,1,source)
		
		unbindKey ( source, "r", "down", sistema1 )
		
		setTimer(function(source)			
	  		                setElementFrozen( source, false )			
		                      end,16001,1,source)
		
		
	
		
		
	
	
	
	

end
end





function bindmkrob2 ( source, commandName )
  bindKey (source, "r", "down", sistema1 )   -- bind the player's F1 down key
end
addEventHandler ("onMarkerHit",banco1,bindmkrob2)

                         
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

                                              	


------------------------------------##########################################-------------------------------------------------------
------------------------------------##########################################-------------------------------------------------------
------------------------------------##########################################-------------------------------------------------------








  







