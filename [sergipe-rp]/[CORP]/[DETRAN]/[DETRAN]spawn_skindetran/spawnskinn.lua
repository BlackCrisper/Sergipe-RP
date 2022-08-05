zombiehunterpickup55555 = createPickup (1887.123, -1638.492, 21.077, 0, 0, 90 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("DETRAN")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 17) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é do DETRAN para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
	end --Finaliza o If e o Else.
end
addEventHandler ( "onPickupUse", zombiehunterpickup55555, zombiehunterskinpickup55555 )
addEventHandler ("onPickupUse", getRootElement(), 

function (playerWhoUses)
  if (source == zombiehunterpickup55555) then
    setPlayerNametagText (playerWhoUses, "" .. getPlayerName (playerWhoUses))
    setElementData (playerWhoUses, "job", "farm")
  end
end)


zombiehunterpickup55555 = createPickup (-52.128318786621,-270.9352722168,6.633186340332, 3, 1275, 1000 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("DETRAN")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 0) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é do DETRAN para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
	end --Finaliza o If e o Else.
end
addEventHandler ( "onPickupUse", zombiehunterpickup55555, zombiehunterskinpickup55555 )
addEventHandler ("onPickupUse", getRootElement(), 

function (playerWhoUses)
  if (source == zombiehunterpickup55555) then
    setPlayerNametagText (playerWhoUses, "" .. getPlayerName (playerWhoUses))
    setElementData (playerWhoUses, "job", "farm")
  end
end)