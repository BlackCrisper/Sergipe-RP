﻿zombiehunterpickup55555 = createPickup (2959.934, -764.376, 11.038, 0, 0, 90 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("pmse")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 265) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é do PMSE para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
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

--------------------------------------------------------------------------------------- 
 
zombiehunterpickup55555 = createPickup (2944.35, -764.276, 11.038, 3, 1275, 1000 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("coe")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 267) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é do COE para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
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

--------------------------------------------------------------------------------------- 
 
zombiehunterpickup55555 = createPickup (2929.299, -764.189, 11.038 , 3, 1275, 1000 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("caatinga")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 281) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é da CAATINGA para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
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

--------------------------------------------------------------------------------------- 
 
zombiehunterpickup55555 = createPickup (2914.035, -763.918, 11.038, 3, 1275, 1000 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("gati")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 266) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é do GATI para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
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

--------------------------------------------------------------------------------------- 
 
zombiehunterpickup55555 = createPickup (2917.848, -765.117, 16.038, 3, 1275, 1000 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("choque")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 285) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é do CHOQUE para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
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

--------------------------------------------------------------------------------------- 
 
zombiehunterpickup55555 = createPickup (2930.924, -765.612, 16.038, 3, 1275, 1000 ) ----- AQUI VC COLOCA AS CORDENADAS DO LUGAR ONDE VAI FICAR O SPAWN DE SKIN
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) 
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("prf")) then -- AQUI E ONDE FICA A ACL, NECESSARIO ESTAR NELA PRA FUNCIONAR. PODE MUDAR PRA QUALQUER COISA "CV,PCC,PM, etc..."
		setElementModel (thePlayer, 280) -- AQUI VC COLOCA O ID DA SKIN QUE VC QUER DAR A UM PLAYER
	else --Se não estiver na ACL "DETRAN", faz o seguinte:
		outputChatBox ("Você não é da PRF para pegar essa SKIN.", thePlayer, 255, 0, 0, true) --Manda isso em azul, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
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