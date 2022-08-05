--[[



 ################################################
 #                                              #
 #              Script Criado Por               #
 #           FACEBOOK.COM/AIRNEWSCR             #
 #                                              #
 #                                              #
 ################################################



--]]

Veiculo_VIPs = {}

Grupo_01 = "Bronze"
VIP_Alpha_ID_Veiculo_01 = 502
VIP_Alpha_Pack_de_Armas_01 = { 1, 22, 22, 25 }
VIP_Alpha_Personagem_01 = 46

Grupo_02 = "Platina"
VIP_Epsylon_ID_Veiculo_01 = 503
VIP_Epsylon_ID_Veiculo_02 = 522
VIP_Epsylon_Pack_de_Armas_01 = { 29, 32, 1, 22 }
VIP_Epsylon_Personagem_01 = 46
VIP_Epsylon_Personagem_02 = 59
VIP_Epsylon_Vida = 100

Grupo_03 = "Diamante"
VIP_Sigma_ID_Veiculo_01 = 494
VIP_Sigma_ID_Veiculo_02 = 522
VIP_Sigma_Pack_de_Armas_01 = { 30, 24, 4, 34 }
VIP_Sigma_Pack_de_Armas_02 = { 29, 32, 1, 22, 31 }
VIP_Sigma_Personagem_01 = 55
VIP_Sigma_Personagem_02 = 46
VIP_Sigma_Personagem_03 = 59
VIP_Sigma_Vida = 100
VIP_Sigma_Colete = 50

Grupo_04 = "Rubi"
VIP_Omega_ID_Veiculo_01 = 451
VIP_Omega_ID_Veiculo_02 = 522
VIP_Omega_Pack_de_Armas_01 = { 31, 24, 4, 34, 26, 34 }
VIP_Omega_Pack_de_Armas_02 = { 29, 32, 1, 22, 30, 16, 46 }
VIP_Omega_Personagem_01 = 55
VIP_Omega_Personagem_02 = 112
VIP_Omega_Personagem_03 = 59
VIP_Omega_Vida = 100
VIP_Omega_Colete = 100

function Receber_Client_AirNewSCR ( Tipo, VIP, ID )
    if Tipo == "Veiculo(s)" then
		local Jogador_X, Jogador_Y, Jogador_Z = getElementPosition ( source )
	    local Rotacao_X, Rotacao_Y, Rotacao_Z = getElementRotation ( source )
		if isElement ( Veiculo_VIPs[source] ) then
		    destroyElement ( Veiculo_VIPs[source] )
		end
		if VIP == "Alpha" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Alpha_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Epsylon" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Epsylon_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Epsylon" and ID == 2 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Epsylon_ID_Veiculo_02, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Sigma" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Sigma_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Sigma" and ID == 2 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Sigma_ID_Veiculo_02, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Omega" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Omega_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Omega" and ID == 2 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Omega_ID_Veiculo_02, Jogador_X, Jogador_Y, Jogador_Z )
		end
		setElementRotation ( Veiculo_VIPs[source], Rotacao_X, Rotacao_Y, Rotacao_Z )
		warpPedIntoVehicle ( source, Veiculo_VIPs[source] )
		exports.Scripts_Dxmessages:outputDx ( source, "Veiculo VIP "..VIP.." Criado com Sucesso!", "success" )
	elseif Tipo == "Arma(s)" then
		if VIP == "Alpha" and ID == 1 then
		    if getElementData ( source, "Alpha_Arma(s)" ) == "Bloqueado" then
			    exports.Scripts_Dxmessages:outputDx ( source, "Você está bloqueado de usar está opção Temporariamente! [1 Minuto]", "warning" )
			else
		        setElementData ( source, "Alpha_Arma(s)", "Bloqueado" ) -- 1 Minuto
		        for _, Armas in ipairs ( VIP_Alpha_Pack_de_Armas_01 ) do
			        giveWeapon ( source, Armas, 999 )
			    end
				exports.Scripts_Dxmessages:outputDx ( source, "Você Recebeu o Pack de Arma(s) do VIP "..VIP.." com Sucesso!", "success" )
				setTimer ( setElementData, 60000, 1, source, "Alpha_Arma(s)", "Desbloqueado" )
			end
		elseif VIP == "Epsylon" and ID == 1 then
		    if getElementData ( source, "Epsylon_Arma(s)" ) == "Bloqueado" then
                exports.Scripts_Dxmessages:outputDx ( source, "Você está bloqueado de usar está opção Temporariamente! [10 Segundo(s)]", "warning" )
			else
		        setElementData ( source, "Epsylon_Arma(s)", "Bloqueado" ) -- 10 Segundos
		        for _, Armas in ipairs ( VIP_Epsylon_Pack_de_Armas_01 ) do
			        giveWeapon ( source, Armas, 999 )
			    end
				exports.Scripts_Dxmessages:outputDx ( source, "Você Recebeu o Pack de Arma(s) do VIP "..VIP.." com Sucesso!", "success" )
				setTimer ( setElementData, 10000, 1, source, "Epsylon_Arma(s)", "Desbloqueado" )
			end
		elseif VIP == "Sigma" and ID == 1 then
		    for _, Armas in ipairs ( VIP_Sigma_Pack_de_Armas_01 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		elseif VIP == "Sigma" and ID == 2 then
		    for _, Armas in ipairs ( VIP_Sigma_Pack_de_Armas_02 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		elseif VIP == "Omega" and ID == 1 then
		    for _, Armas in ipairs ( VIP_Omega_Pack_de_Armas_01 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		elseif VIP == "Omega" and ID == 2 then
		    for _, Armas in ipairs ( VIP_Omega_Pack_de_Armas_02 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		end
		if getElementData ( source, "Alpha_Arma(s)" ) == "Bloqueado" or getElementData ( source, "Epsylon_Arma(s)" ) == "Bloqueado" then return end
		exports.Scripts_Dxmessages:outputDx ( source, "Você Recebeu o Pack de Arma(s) do VIP "..VIP.." com Sucesso!", "success" )
	elseif Tipo == "Skin(s)" then
		if VIP == "Alpha" and ID == 1 then
		    setElementModel ( source, VIP_Alpha_Personagem_01 )
		elseif VIP == "Epsylon" and ID == 1 then
		    setElementModel ( source, VIP_Epsylon_Personagem_01 )
		elseif VIP == "Epsylon" and ID == 2 then
		    setElementModel ( source, VIP_Epsylon_Personagem_02 )
		elseif VIP == "Sigma" and ID == 1 then
		    setElementModel ( source, VIP_Sigma_Personagem_01 )
		elseif VIP == "Sigma" and ID == 2 then
		    setElementModel ( source, VIP_Sigma_Personagem_02 )
		elseif VIP == "Sigma" and ID == 3 then
		    setElementModel ( source, VIP_Sigma_Personagem_03 )
		elseif VIP == "Omega" and ID == 1 then
		    setElementModel ( source, VIP_Omega_Personagem_01 )
		elseif VIP == "Omega" and ID == 2 then
		    setElementModel ( source, VIP_Omega_Personagem_02 )
		elseif VIP == "Omega" and ID == 3 then
		    setElementModel ( source, VIP_Omega_Personagem_03 )
		end
		exports.Scripts_Dxmessages:outputDx ( source, "Personagem VIP "..VIP.." ID "..ID.." Setado com Sucesso!", "success" )
	elseif Tipo == "Vida" then
		if VIP == "Epsylon" and ID == 1 then
		    if getElementData ( source, "Epsylon_Vida" ) == "Bloqueado" then
		        exports.Scripts_Dxmessages:outputDx ( source, "Você está bloqueado de usar está opção Temporariamente! [2 Minuto(s)]", "warning" )
			else
				if getElementHealth ( source ) < VIP_Epsylon_Vida then
					setElementData ( source, "Epsylon_Vida", "Bloqueado" ) -- 2 Minuto(s)
					setElementHealth ( source, VIP_Epsylon_Vida )
					exports.Scripts_Dxmessages:outputDx ( source, "Sua Vida foi Alterada para "..VIP_Epsylon_Vida.."% com Sucesso!", "success" )
					setTimer ( setElementData, 120000, 1, source, "Epsylon_Vida", "Desbloqueado" )
				else
				    exports.Scripts_Dxmessages:outputDx ( source, "Você já está com mais de "..VIP_Epsylon_Vida.."% de Vida!", "error" )
				end
			end		
		elseif VIP == "Sigma" and ID == 1 then
		    if getElementData ( source, "Sigma_Vida" ) == "Bloqueado" then
			    exports.Scripts_Dxmessages:outputDx ( source, "Você está bloqueado de usar está opção Temporariamente! [2 Minuto(s)]", "warning" )
			else
			    if getElementHealth ( source ) < VIP_Sigma_Vida then
		            setElementData ( source, "Sigma_Vida", "Bloqueado" ) -- 2 Minuto(s)
			        setElementHealth ( source, VIP_Sigma_Vida )
					exports.Scripts_Dxmessages:outputDx ( source, "Sua Vida foi Alterada para "..VIP_Sigma_Vida.."% com Sucesso!", "success" )
					setTimer ( setElementData, 120000, 1, source, "Sigma_Vida", "Desbloqueado" )
				else
				    exports.Scripts_Dxmessages:outputDx ( source, "Você já está com "..VIP_Sigma_Vida.."% de Vida!", "error" )
				end
			end
	    elseif VIP == "Omega" and ID == 1 then
			if getElementHealth ( source ) < VIP_Omega_Vida then
			    setElementHealth ( source, VIP_Omega_Vida )
				exports.Scripts_Dxmessages:outputDx ( source, "Sua Vida foi Alterada para "..VIP_Omega_Vida.."% com Sucesso!", "success" )
			else
				exports.Scripts_Dxmessages:outputDx ( source, "Você já está com "..VIP_Omega_Vida.."% de Vida!", "error" )
			end
		end
	elseif Tipo == "Colete" then
	    if VIP == "Sigma" and ID == 1 then
		    if getPedArmor ( source ) < VIP_Sigma_Colete then
		        setPedArmor ( source, VIP_Sigma_Colete )
				exports.Scripts_Dxmessages:outputDx ( source, "Seu Colete foi Alterado para "..VIP_Sigma_Colete.."% com Sucesso!", "success" )
			else
			    exports.Scripts_Dxmessages:outputDx ( source, "Você já está com mais de "..VIP_Sigma_Colete.."% de Colete!", "error" )
			end
	    elseif VIP == "Omega" and ID == 1 then
            if getPedArmor ( source ) < VIP_Omega_Colete then
		        setPedArmor ( source, VIP_Omega_Colete )
				exports.Scripts_Dxmessages:outputDx ( source, "Seu Colete foi Alterado para "..VIP_Omega_Colete.."% com Sucesso!", "success" )
			else
			    exports.Scripts_Dxmessages:outputDx ( source, "Você já está com "..VIP_Omega_Colete.."% de Colete!", "error" )
			end
	    end
	elseif Tipo == "Blindagem" then
	    if VIP == "Omega" and ID == 1 then
	        if isPedInVehicle ( source ) then
		        if isVehicleDamageProof ( getPedOccupiedVehicle ( source ) ) == false then
		    	    setVehicleDamageProof ( getPedOccupiedVehicle ( source ), true )
		    	    exports.Scripts_Dxmessages:outputDx ( source, "Você Aplicou Blindagem no Seu Veiculo Atual com Sucesso!", "success")
				else
				    exports.Scripts_Dxmessages:outputDx ( source, "O Veiculo que você está atualmente já está Blindado!", "error")
		        end
	        else
	            exports.Scripts_Dxmessages:outputDx ( source, "Entre em um Veiculo para utilizar esta função!", "error")
	        end
	    end
	elseif Tipo == "Mensagem" then
	    if VIP == "Sigma" or VIP == "Omega" then
		    if ID then
			    exports.Scripts_Dxmessages:outputDx ( source, ID, "info")
			end
		end		
	end
end
addEvent ( "AirNewSCR_EnviarServidor", true )
addEventHandler ( "AirNewSCR_EnviarServidor", getRootElement ( ), Receber_Client_AirNewSCR )
		
function Sair_do_Servidor_AirNewSCR ( quitType )
	if isElement ( Veiculo_VIPs[source] ) then
	    destroyElement ( Veiculo_VIPs[source] )
	end
end
addEventHandler ( "onPlayerQuit", getRootElement ( ), Sair_do_Servidor_AirNewSCR )

function Morrer_no_Servidor_AirNewSCR ( )
	if isElement ( Veiculo_VIPs[source] ) then
	    destroyElement ( Veiculo_VIPs[source] )
	end
end
addEventHandler( "onPlayerWasted", getRootElement( ), Morrer_no_Servidor_AirNewSCR )
		
function Verificar_VIP_AirNewSCR ( )
	for i, player in ipairs ( getElementsByType ( "player" ) ) do
		local acc = getPlayerAccount ( player )
		if acc and not isGuestAccount ( acc ) then
			local accName = getAccountName (acc)
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_01 ) ) then
			    setElementData ( player, "VIP_01", "Sim" )
			else
			    setElementData ( player, "VIP_01", "Não" )
			end
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_02 ) ) then
			    setElementData ( player, "VIP_02", "Sim" )
			else
			    setElementData ( player, "VIP_02", "Não" )
			end
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_03 ) ) then
			    setElementData ( player, "VIP_03", "Sim" )
			else
			    setElementData ( player, "VIP_03", "Não" )
			end
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_04 ) ) then
			    setElementData ( player, "VIP_04", "Sim" )
			else
			    setElementData ( player, "VIP_04", "Não" )
			end
		end
	end
end
setTimer ( Verificar_VIP_AirNewSCR, 1500, 0 )