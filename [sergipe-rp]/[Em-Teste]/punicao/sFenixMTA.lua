 --[[


 ################################################
 #                                              #                                                  
 #             SCRIPT DESENVOLVIDO POR:         #
 #             Facebook.com/FENIXMTA/           #
 #             Youtube.com/FENIXMTA             #
 #             Não retire os créditos !         #
 #                                              #
 ################################################




 --]]
 
function getPlayerID(id)
	v = false
	for i, player in ipairs (getElementsByType("player")) do
		if getElementData(player, "ID") == id then
			v = player
			break
		end
	end
	return v
end
 
Acl = "Admin" -- Grupo do Painel P , que terá acesso ao Dx

Cmd = "punir" -- Comando para abrir o Dx

function abrirDx (source,command)
 local acc = getAccountName(getPlayerAccount(source))
      if isObjectInACLGroup("user."..acc, aclGetGroup (Acl)) then
	  triggerClientEvent (source, "FM_OpenPainel", source)
   end
end
addCommandHandler(Cmd ,abrirDx) 

function banirJogador ( ID , T_Banir , Tempo_Selecionado , Motivo_Banir)

local FDP = getPlayerID(ID)

if Tempo_Selecionado == "Segundo(s)" then
     Multiplicador = 1
elseif Tempo_Selecionado == "Minuto(s)" then
     Multiplicador = 60
elseif Tempo_Selecionado == "Hora(s)" then
     Multiplicador = 3600
elseif Tempo_Selecionado == "Dia(s)" then
     Multiplicador = 86400
    end
  Tempo = T_Banir*Multiplicador
  banPlayer ( FDP, true, false, true, "" , ""..Motivo_Banir.."" , ""..Tempo.."" )

end
addEvent("FM_banirJogador" , true)
addEventHandler("FM_banirJogador" , getRootElement() , banirJogador) 

addEventHandler ( "onResourceStart", resourceRoot, function ( mod )
        if isObjectInACLGroup ( "resource." .. getResourceName ( mod ), aclGetGroup ( "Admin" ) ) then
            outputDebugString ( "Banco Itaú Ativado com Sucesso.", 3 )
		else
     		cancelEvent ( )
            outputChatBox ( "#FFA500[ATENÇÃO] #FFFFFF- Para Ativar este #FFA500Resource  #FFFFFF[...]  Adicione sua ACL no #FFA500Admin.", root, 255, 255, 255, true )  
    end
end
)
 

