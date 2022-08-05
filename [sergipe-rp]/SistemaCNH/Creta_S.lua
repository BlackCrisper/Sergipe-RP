--[[

--]]

--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><               Detran               ><
         ><><><><><><><><><><><><><><><><><><><><
--]]

Entrar = createMarker(1081.4038085938,-1696.7943115234,13.546875 -1, "cylinder", 1.2, 100, 150, 250, 75)
Blip = createBlipAttachedTo ( Entrar, 36 )
setBlipVisibleDistance(Blip, 150)

Sair = createMarker(-2026.97485, -104.28124, 1035.17188 -1, "cylinder", 1.2, 100, 150, 250, 75)
setElementInterior(Sair, 3)

Abrir_Introducao = createMarker(-2033.13196, -117.45327, 1035.17188 -1, "cylinder", 1.2, 30, 100, 250, 75)
setElementInterior(Abrir_Introducao, 3)

Marker_Multas = createMarker(-2031.19666, -115.17245, 1035.17188 -1, "cylinder", 1.2, 0, 255, 0, 90)
setElementInterior(Marker_Multas, 3)

function Entrar_Detran (source)
setElementInterior(source, 3)
setElementPosition(source, -2029.55017, -105.98931, 1035.17188)
setElementDimension(source, 0)
end
addEventHandler("onMarkerHit", Entrar, Entrar_Detran)

function Sair_Detran (source)
setElementInterior(source, 0)
setElementPosition(source, 1081.390625,-1698.9879150391,13.546875)
setElementDimension(source, 0)
end
addEventHandler("onMarkerHit", Sair, Sair_Detran)

function Abrir_Prova(source)
	local account = getPlayerAccount (source)
    if isGuestAccount (account) then outputChatBox ( "#00BFFF[#FFFFFFINFO#00BFFF] #ffffffVocê não pode Fazer Prova Deslogado!", source, 255,255,255,true) return end
    if isElementWithinMarker(source, Abrir_Introducao) then
	if getElementData(source,"FC:Multas") == false or getElementData(source,"FC:Multas") == 0 then
		triggerClientEvent(source,"DNL:AbrirIntrodução",source)
    else
    	outputChatBox("#BDBDBD[#58ACFAI#BDBDBD] #D8D8D8Você Tem Multas a pagar! ", source, 255, 255, 255, true)
    end
	end
end
addEventHandler( "onMarkerHit", Abrir_Introducao, Abrir_Prova )

function PagarMultas(source)
	local account = getPlayerAccount (source)
    if isGuestAccount (account) then outputChatBox ( "#00BFFF[#FFFFFFINFO#00BFFF] #ffffffVocê não pode Pagar Multas Deslogado!", source, 255,255,255,true) return end
    if isElementWithinMarker(source, Marker_Multas) then
		triggerClientEvent(source,"DNL:Abrir_Multas",source)	 
  end
end
addEventHandler( "onMarkerHit", Marker_Multas, PagarMultas )

function Multar_jogador ( thePlayer, _, ID2, quantia2 )
	if ID2 then
	if quantia2 then
	    local ID = tonumber(ID2)
		local quantia = tonumber(quantia2)
        local player = getPlayerID(ID)
        local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
            local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
            if isObjectInACLGroup ("user."..accName, aclGetGroup ( "POLICIA") ) or isObjectInACLGroup ("user."..accName, aclGetGroup ( "AMC") ) then
                local nick_do_jogador           =   getPlayerName ( player )
				local nick_do_policial          =   getPlayerName ( thePlayer )
				local policiax, policiay, policiaz = getElementPosition ( thePlayer )
				local revistadox, revistadoy, revistadoz = getElementPosition ( player )
				local dist = getDistanceBetweenPoints3D ( policiax, policiay, policiaz, revistadox, revistadoy, revistadoz )
				if ( dist < 4 )  then
				local multas = getElementData(player,"FC:Multas")
				if multas == false then setElementData( player, "FC:Multas", quantia )
				else
				setElementData( player, "FC:Multas", multas +quantia )
				end
				outputChatBox("#BDBDBD[#58ACFAI#BDBDBD] #D8D8D8Você recebeu uma multa de "..tonumber(quantia).." Reais! ", player, 255, 255, 255, true) -- Chat Box
				end
		else
	end
	end
	end
	end
addCommandHandler("multar", Multar_jogador)

function Pagar_Multas ( quantia2 )
local quantia = tonumber(quantia2)
if type(quantia) == "number" then
local multas = getElementData(source,"FC:Multas")
if quantia <= multas then
if getPlayerMoney(source) < quantia then
outputChatBox("#BDBDBD[#58ACFAI#BDBDBD] #D8D8D8Você não possui dinheiro! ", source, 255, 255, 255, true)
else
if quantia == multas then
 setAccountData( getPlayerAccount ( source ),"Prazo_multa", false )
 setElementData(source, "FC:Aviso_Multa", false)
 end
setElementData( source, "FC:Multas", multas -quantia )
takePlayerMoney ( source, quantia )
end
else
end
else
outputChatBox("#BDBDBD[#58ACFAI#BDBDBD] #D8D8D8Esses Caracteres Representa um numero! ", source, 255, 255, 255, true)
end
end
addEvent ("DNL:Pagar_Multas", true)
addEventHandler ("DNL:Pagar_Multas", root, Pagar_Multas)

function onSetTime()
	for _, v in pairs(getElementsByType("player")) do
	local accName = getPlayerAccount ( v )
		if getElementData(v,"FC:Multas") == false or getElementData(v,"FC:Multas") == 0 then
		elseif getAccountData(accName,"Prazo_multa") == 60 and getElementData(v, "FC:Aviso_Multa") == false then
		  setElementData(v, "DNL:Categoria(A)", false) 
          setElementData(v, "DNL:Categoria(B)", false) 
          setElementData(v, "DNL:Categoria(C)", false) 
          setElementData(v, "DNL:Categoria(D)", false)
		  setElementData(v, "FC:Aviso_Multa", true)
		  outputChatBox("#BDBDBD[#58ACFAI#BDBDBD] #D8D8D8Você Perdeu Todas suas Habilitações por não Pagar as Multas! ", v, 255, 255, 255, true)
		else
		if getAccountData(accName, "Prazo_multa") == false and getElementData(v, "FC:Aviso_Multa") == false then
		    setAccountData(accName,"Prazo_multa", 1 )
		elseif getElementData(v, "FC:Aviso_Multa") == false then
			setAccountData(accName,"Prazo_multa", getAccountData(accName, "Prazo_multa") +1 )
			local tempo = 60 -(getAccountData(accName, "Prazo_multa"))
		end
		end
	end
end	
setTimer(onSetTime, 120000, 0)

-------- Pagar_Prova --------
function Pagar_Prova ()
 if getPlayerMoney(source) >= 1000 then 
	takePlayerMoney(source, 1000)
	triggerClientEvent(source, "DNL:AbrirProva(Teorica)", source) 
  else
	triggerClientEvent(source, "DNL:FecharProva(Teorica)", source) 
    outputChatBox ( "#00BFFF[#FFFFFFINFO#00BFFF] #ffffffSeu Dinheiro é Insuficiente!", source, 255,255,255,true)  
 end
end
addEvent("DNL:Pagar_Prova(Teorica)", true)
addEventHandler("DNL:Pagar_Prova(Teorica)", root, Pagar_Prova)

-------- Carregar_Dados --------
function Carregar_Dados ()
  local Account = getPlayerAccount(source)
  local HabilitacaoA = getAccountData (Account, "DNL:Categoria(A)")
  local HabilitacaoB = getAccountData (Account, "DNL:Categoria(B)")
  local HabilitacaoC = getAccountData (Account, "DNL:Categoria(C)")
  local HabilitacaoD = getAccountData (Account, "DNL:Categoria(D)")
  local HabilitacaoPH = getAccountData (Account, "DNL:Categoria(PH)")
  local HabilitacaoPA = getAccountData (Account, "DNL:Categoria(PA)")
  local porte = getAccountData (Account, "porte")
  local multa = getAccountData (Account, "FC:Multas")
  setElementData(source, "DNL:Categoria(A)", HabilitacaoA) 
  setElementData(source, "DNL:Categoria(B)", HabilitacaoB) 
  setElementData(source, "DNL:Categoria(C)", HabilitacaoC) 
  setElementData(source, "DNL:Categoria(D)", HabilitacaoD) 
  setElementData(source, "DNL:Categoria(PH)", HabilitacaoPH)
  setElementData(source, "DNL:Categoria(PA)", HabilitacaoPA)
  setElementData(source, "porte", porte)
  setElementData(source, "FC:Multas", multa)
end
addEventHandler("onPlayerLogin", root, Carregar_Dados)

function Carregar_Dados2 ()
  local multa = getElementData (Account, "FC:Multas")
  setAccountData(source, "FC:Multas", multa)
end
addEventHandler("onPlayerQuit", root, Carregar_Dados2)

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