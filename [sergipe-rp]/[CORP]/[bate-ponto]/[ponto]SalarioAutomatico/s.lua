--[[
===================================

 Meu discord Para suport: 
          Zakk_#6792

===================================
--]]



---======================== Pagamento do Salario =============================
Dinheiroganho = 5000


---======================== Players Minimos On para receber o Salario ========
PlayersM = 1  --- Lembrando Que o script Original so da o Pagamento com mas de 10 on


---======================== ACL Para poder dar /trabalhar ==================
Grupo = "pm"   --- Deixe a ACL entre Aspas

--============================================================================





--XX======================================================================-- Corp 1
-------------- Marker Para entra em Serviço
pegarT = createMarker(1569.177, -1645.281, 16.59, "cylinder", 1.1,255,255,255,50)
createPickup(1569.177, -1645.281, 17.59, 3, 1247, 1)
------------------------------------------
	
function salariop(player)
if isElementWithinMarker(player, pegarT) then
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( Grupo )) then
if getElementData(player, "TrabalhoPolicial") then 
setElementData(player, "TrabalhoPolicial", false)
exports.Scripts_Dxmessages:outputDx(player,"Você saiu de Serviço","info", player, 255, 255, 255, true)

else
setElementData(player, "TrabalhoPolicial", true)
exports.Scripts_Dxmessages:outputDx(player,"Você entrou em Serviço, Bom trabalho","info", player, 255, 255, 255, true)

end
else
exports.Scripts_Dxmessages:outputDx(player,"Você não tem permissão","error", player, 255, 255, 255, true)
end
end
end
addCommandHandler("trabalhar", salariop)


function salario (thePlayer)
    for i,player in ipairs(getElementsByType("player")) do
        if ( player ) then
                    if getElementData(player, "TrabalhoPolicial") then
					local players = getPlayerCount()
					if players >= PlayersM then
                             
                            givePlayerMoney(player,Dinheiroganho)
                       
							exports.Scripts_Dxmessages:outputDx (player, "Você Recebeu Seu Salário pagamento #00ff00R$ "..Dinheiroganho.." #ffffff!", "success" )
							
							else
							exports.Scripts_Dxmessages:outputDx(player,"Você não recebeu seu salario por não ter mais de 10 civis na cidade","error", true)
							end
                    end
                end
        end
    end
setTimer(salario,3600000,0)
--------------------------------------------
addEventHandler("onMarkerHit", pegarT,
function(player)
    if getElementType(player) == "player" then
	outputChatBox(" ", player, 255,255,255, true)
	outputChatBox("#ffff00Digite /trabalhar para Entrar e Sair	de Serviço.", player, 255,255,255, true)
	outputChatBox(" ", player, 255,255,255, true) 
    end
end)
---==============================================================================================================================================================XX
