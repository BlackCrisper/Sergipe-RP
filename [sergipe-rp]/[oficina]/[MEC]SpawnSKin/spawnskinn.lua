zombiehunterpickup55555 = createPickup (2054.25, -1890.208, 18.352, 3, 1275, 1000 )
function zombiehunterskinpickup55555 ( thePlayer )
  setPedSkin ( thePlayer, 22 )
  setPlayerTeam ( thePlayer, teamzombie )
 setElementData ( thePlayer, "zombie", true  )  
end
addEventHandler ( "onPickupUse", zombiehunterpickup55555, zombiehunterskinpickup55555 )
addEventHandler ("onPickupUse", getRootElement(), 

function (playerWhoUses)
  if (source == zombiehunterpickup55555) then
    setPlayerNametagText (playerWhoUses, "" .. getPlayerName (playerWhoUses))
    setElementData (playerWhoUses, "job", "farm")
  end
end)