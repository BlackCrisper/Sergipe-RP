--[[

--]]	
                                   --==================================--
                                    ---------- Vencimento Moto ----------
                                   --==================================--					   
function Renovar_Moto (source)
	local time = getRealTime()
	local Time_Moto = time.timestamp
	local Account = getPlayerAccount (source)
	if (Account) then
		local Tempo_Account = tonumber(getAccountData (Account, "DNL:Renovar_Moto")) or 0
		setAccountData(Account, "DNL:Renovar_Moto", Time_Moto + (7*86400))
		setElementData(source, "DNL:Renovar_Moto", Tempo_Account)
		setTimer ( Loadind, 100, 1, Account )
	end
end
addEvent ("DNL:Renovar_Moto", true)
addEventHandler ("DNL:Renovar_Moto", root, Renovar_Moto)

                                   --==================================--
                                    ---------- Vencimento Carro ----------
                                   --==================================--
function Renovar_Carro (source)
	local time = getRealTime()
	local Time_Carro = time.timestamp
	local Account = getPlayerAccount (source)
	if (Account) then
		local Tempo_Account = tonumber(getAccountData (Account, "DNL:Renovar_Carro")) or 0
		setAccountData(Account, "DNL:Renovar_Carro", Time_Carro + (7*86400))
		setElementData(source, "DNL:Renovar_Carro", Tempo_Account)
		setTimer ( Loadind, 100, 1, Account )
	end
end
addEvent ("DNL:Renovar_Carro", true)
addEventHandler ("DNL:Renovar_Carro", root, Renovar_Carro)

                                   --======================================--
                                    ---------- Vencimento Caminhao ----------
                                   --======================================--
function Renovar_Caminhao (source)
	local time = getRealTime()
	local Time_Caminhao = time.timestamp
	local Account = getPlayerAccount (source)
	if (Account) then
		local Tempo_Account = tonumber(getAccountData (Account, "DNL:Renovar_Caminhao")) or 0
		setAccountData(Account, "DNL:Renovar_Caminhao", Time_Caminhao + (7*86400))
		setElementData(source, "DNL:Renovar_Caminhao", Tempo_Account)
		setTimer ( Loadind, 100, 1, Account )
	end
end
addEvent ("DNL:Renovar_Caminhao", true)
addEventHandler ("DNL:Renovar_Caminhao", root, Renovar_Caminhao)

                                   --=====================================--
                                    ---------- Vencimento Carreta ----------
                                   --=====================================--
function Renovar_Carreta (source)
	local time = getRealTime()
	local Time_Carreta = time.timestamp
	local Account = getPlayerAccount (source)
	if (Account) then
		local Tempo_Account = tonumber(getAccountData (Account, "DNL:Renovar_Carreta")) or 0
		setAccountData(Account, "DNL:Renovar_Carreta", Time_Carreta + (7*86400))
		setElementData(source, "DNL:Renovar_Carreta", Tempo_Account)
		setTimer ( Loadind, 100, 1, Account )
	end
end
addEvent ("DNL:Renovar_Carreta", true)
addEventHandler ("DNL:Renovar_Carreta", root, Renovar_Carreta)
						
                                   --===================================--
                                   ---------- Verificando Tempo ----------
                                   --===================================--
setTimer (function()
    local time = getRealTime()
	local Time = time.timestamp
	for index, player in pairs (getElementsByType("player")) do
	   local Tempo_Moto = getAccountData (getPlayerAccount(player), "DNL:Renovar_Moto")
	   local Tempo_Carro = getAccountData (getPlayerAccount(player), "DNL:Renovar_Carro")
	   local Tempo_Caminhao = getAccountData (getPlayerAccount(player), "DNL:Renovar_Caminhao")
	   local Tempo_Carreta = getAccountData (getPlayerAccount(player), "DNL:Renovar_Carreta")
		if Tempo_Moto then
			if (tonumber(Time) > tonumber(Tempo_Moto)) then
				outputChatBox ("#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffSua Habilitação de Moto Expirou", source, 255, 255, 255, true)
				setAccountData(getPlayerAccount(player), "DNL:Renovar_Moto", false)
				setElementData(player, "DNL:Renovar_Moto", false)
				setElementData(player, "DNL:Categoria(A)", false)
			end
		end
		
		if Tempo_Carro then
			if (tonumber(Time) > tonumber(Tempo_Carro)) then
				outputChatBox ("#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffSua Habilitação de Carro Expirou", source, 255, 255, 255, true)
				setAccountData(getPlayerAccount(player), "DNL:Renovar_Carro", false)
				setElementData(player, "DNL:Renovar_Carro", false)
				setElementData(player, "DNL:Categoria(B)", false)
			end
		end
		
		if Tempo_Caminhao then
			if (tonumber(Time) > tonumber(Tempo_Caminhao)) then
				outputChatBox ("#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffSua Habilitação de Caminhão Expirou", source, 255, 255, 255, true)
				setAccountData(getPlayerAccount(player), "DNL:Renovar_Caminhao", false)
				setElementData(player, "DNL:Renovar_Caminhao", false)
				setElementData(player, "DNL:Categoria(C)", false)
			end
		end
		
		if Tempo_Carreta then
			if (tonumber(Time) > tonumber(Tempo_Carreta)) then
				outputChatBox ("#00ff00✘ #ffffffINFO #00ff00✘➺ #ffffffSua Habilitação de Carreta Expirou", source, 255, 255, 255, true)
				setAccountData(getPlayerAccount(player), "DNL:Renovar_Carreta", false)
				setElementData(player, "DNL:Renovar_Carreta", false)
				setElementData(player, "DNL:Categoria(D)", false)
			end
		end
	end
end, 1000, 0)
 
                                   --==========================--
                                   ---------- Carregar ----------
                                   --==========================--								   
function Loadind ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
            local Renovar_Moto = getAccountData(conta, "DNL:Renovar_Moto") or false
            local Renovar_Carro = getAccountData(conta, "DNL:Renovar_Carro") or false
            local Renovar_Caminhao = getAccountData(conta, "DNL:Renovar_Caminhao") or false
            local Renovar_Carreta = getAccountData(conta, "DNL:Renovar_Carreta") or false
            setElementData(source, "DNL:Renovar_Moto", Renovar_Moto)
            setElementData(source, "DNL:Renovar_Carro", Renovar_Carro)
            setElementData(source, "DNL:Renovar_Caminhao", Renovar_Caminhao)
            setElementData(source, "DNL:Renovar_Carreta", Renovar_Carreta)
		end
	end	
end

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Loadind, 60, 1, acc )
  end
)

function Start_FSS ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
			 setTimer ( Loadind, 60, 1, acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), Start_FSS )