--[[



 ################################################
 #                                              #
 #              Script Editado Por              #
 #                    Netin                     #
 #                                              #
 #                                              #
 ################################################



--]]

--------------------------------------------------------------------------------------------

Comando_VIP = "ativar"
Grupo = "Console" -- Grupo no Painel P ( Manage ACL )

function getPlayerFromPartialName ( name )
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

function Dar_VIP_AirNewSCR ( source, cmd, player, VIP, Dinheiro )
    if getElementData ( source, "Console_AirNewSCR" ) == "Sim" then
	    if player and VIP then
            local Jogador = getPlayerFromPartialName ( player )
            if Jogador then
		        if not isGuestAccount ( getPlayerAccount ( Jogador ) ) then
			        local Conta = getAccountName ( getPlayerAccount ( Jogador ) )
					if VIP == "Bronze" then
					    if isObjectInACLGroup ("user."..Conta, aclGetGroup ( "Bronze" ) ) then
			                return outputChatBox ( "* Erro: Esse Jogador já é VIP Bronze", source, 255, 255, 255, true )
					    end
					elseif VIP == "Platina" then
					    if isObjectInACLGroup ("user."..Conta, aclGetGroup ( "Platina" ) ) then
			                return outputChatBox ( "* Erro: Esse Jogador já é VIP Platina", source, 255, 255, 255, true )
					    end
					elseif VIP == "Diamante" then
					    if isObjectInACLGroup ("user."..Conta, aclGetGroup ( "Diamante" ) ) then
			                return outputChatBox ( "* Erro: Esse Jogador já é VIP Diamante", source, 255, 255, 255, true )
					    end
					elseif VIP == "Rubi" then
					    if isObjectInACLGroup ("user."..Conta, aclGetGroup ( "Rubi" ) ) then
			                return outputChatBox ( "* Erro: Esse Jogador já é VIP Rubi", source, 255, 255, 255, true )
					    end
					end
					if VIP == "Bronze" or VIP == "Platina" or VIP == "Diamante" or VIP == "Rubi" then
					    --return outputChatBox ( "* Erro: Esse VIP não existe!", source, 255, 255, 255, true )
					--end
			        aclGroupAddObject ( aclGetGroup( VIP ), "user."..Conta )
					Musica_Selecionada = math.random ( 1, 3 )
					triggerClientEvent ( root, "AirNewSCR_Ativar_VIP", root, Musica_Selecionada, VIP )
					if Musica_Selecionada == 1 then
						--outputChatBox ( "Arquivos/Rae_Sremmurd_Black_Beatles_ft_Gucci_Mane.mp3", source )
						Musica_Tocando = "Sidoka"
						Bonus = 0
					elseif Musica_Selecionada == 2 then
						--outputChatBox ( "Arquivos/Post_Malone_Congratulations_ft_Quavo.mp3", source )
						Musica_Tocando = "Sidoka"
						Bonus = 50
					elseif Musica_Selecionada == 3 then
						--outputChatBox ( "XXXTENTACION_Look_At_Me.mp3", source )
						Musica_Tocando = "Sidoka"
						Bonus = 100
					end
					setElementData ( root, "Ultimo_Ativador", getPlayerName(Jogador) )
					setElementData ( root, "VIP_do_Ultimo_Ativador", VIP )
					outputChatBox ( " ", root )
					outputChatBox ( " ", root )
					outputChatBox ( "=======================================================", root, 255, 255, 255, true )
					outputChatBox ( "* O(A) Jogador(a) "..getPlayerName(Jogador).." #ffffffAtivou um Plano VIP "..VIP, root, 255, 255, 255, true )
					if Bonus == 0 then
						outputChatBox ( "* Seu Bonus de Ativação foi de "..Bonus.."%, Não foi dessa vez!", root, 255, 255, 255, true )
						outputChatBox ( "* O(A) Jogador(a) Recebeu 1kk pela Ativação do VIP", root, 255, 255, 255, true )
						if Dinheiro ~= false then
						    givePlayerMoney ( Jogador, 500000 ) -- dinheiro ganho
						    givePlayerMoney ( Jogador, 500000 )
						end
					elseif Bonus == 50 then
						outputChatBox ( "* Seu Bonus de Ativação foi de "..Bonus.."%, +50% de 1kk (1kk500k)", root, 255, 255, 255, true )
						outputChatBox ( "* O(A) Jogador(a) Recebeu 1kk pela Ativação do VIP (+500k Bonus)", root, 255, 255, 255, true )
						if Dinheiro ~= false then
						    givePlayerMoney ( Jogador, 1000000 )
						    givePlayerMoney ( Jogador, 1000000 )
						end
					elseif Bonus == 100 then
						outputChatBox ( "* Seu Bonus de Ativação foi de "..Bonus.."%, +100% de 1kk (2kk)", root, 255, 255, 255, true )
					    outputChatBox ( "* O(A) Jogador(a) Recebeu 1kk pela Ativação do VIP (+1kk Bonus)", root, 255, 255, 255, true )
						if Dinheiro ~= false then
						    givePlayerMoney ( Jogador, 2000000 )
						    givePlayerMoney ( Jogador, 2000000 )
						end
					end
					outputChatBox ( "* Musica Tocando: "..Musica_Tocando, root, 255, 255, 255, true )
					outputChatBox ( "=======================================================", root, 255, 255, 255, true )
					outputChatBox ( " ", root )
					outputChatBox ( " ", root )
					outputDebugString ( "[ Ativação ] - O(A) Admin "..getPlayerName(source).." Ativou um VIP para o(a) Jogador(a) "..getPlayerName(Jogador).."!" )
					outputDebugString ( "[ Ativação ] - Bonus do VIP Gerado: "..Bonus.."%" )
					setTimer ( function()
		                restartResource ( getThisResource ( ) ) -- Reinicia o Mod Automaticamente!
						outputDebugString ( "[ AirNewSCR ] - Resource 'Scripts_AtivarVIP' Reiniciado Automaticamente! " )
	                end, 15000, 1 )
			    end
			end
	        else
	            outputChatBox ( "* Erro: Jogador não encontrado!", source, 255, 255, 255, true )
            end
		end
	end
end
addCommandHandler ( Comando_VIP, Dar_VIP_AirNewSCR )

function Verificar_Emprego_Atual ( )
	for i, player in ipairs(getElementsByType("player")) do
		local acc = getPlayerAccount(player)
		if acc and not isGuestAccount(acc) then
			local accName = getAccountName (acc)
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo ) ) then
			    setElementData ( player, "Console_AirNewSCR", "Sim" )
			else
			    setElementData ( player, "Console_AirNewSCR", "Não" )
			end
		end
	end
end
setTimer ( Verificar_Emprego_Atual, 1500, 0 )

-- By AirNewSCR 