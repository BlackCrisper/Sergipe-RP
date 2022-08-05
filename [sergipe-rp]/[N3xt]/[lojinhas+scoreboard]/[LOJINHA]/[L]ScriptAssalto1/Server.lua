


--[[
███████╗███████╗███████╗██████╗     ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗██████╗
╚══███╔╝██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
  ███╔╝ █████╗  █████╗  ██║  ██║    ███████╗██║     ██████╔╝██║██████╔╝   ██║   █████╗  ██████╔╝
 ███╔╝  ██╔══╝  ██╔══╝  ██║  ██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ██╔══╝  ██╔══██╗
███████╗███████╗███████╗██████╔╝    ███████║╚██████╗██║  ██║██║██║        ██║   ███████╗██║  ██║
╚══════╝╚══════╝╚══════╝╚═════╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝╚═╝  ╚═╝
--]]



-----------------------/ MARKER'S \-----------------------

local Marker_Assalto1 = createMarker(1312.197, -878.562, 39.626 -1, "cylinder", 1.2, 255, 0, 255, 0)

local Blip_Loja = createBlipAttachedTo(Marker_Assalto1, 17)
local Blip_Assaltada = createBlipAttachedTo(Marker_Assalto1, 20)
setElementVisibleTo(Blip_Assaltada, root, false)

local next = exports.n3xt_inventario

----------------/ MENSAGEM - AVISO \----------------

function Mensagem_Aviso1(source)
	triggerClientEvent(source, "Zeed_Mensagem_Assalto1", getRootElement())
end
addEventHandler("onMarkerHit", Marker_Assalto1, Mensagem_Aviso1)

function Fechar_Mensagem1 (source)
	triggerClientEvent(source, "Zeed_Mensagem_Assalto1", getRootElement())
end
addEventHandler("onMarkerLeave", Marker_Assalto1, Fechar_Mensagem1)

-----------------------/ ASSALTO \-----------------------
local helmetscaixa1 = {}

function removehelmetcaixa1()
if isElement(helmetscaixa1[source]) then
destroyElement(helmetscaixa1[source])
helmetscaixa1[source] = nil
end
end
addEventHandler("onPlayerQuit", getRootElement(), removehelmetcaixa1)
addEventHandler("onPlayerWasted", getRootElement(), removehelmetcaixa1)

function Iniciar_Assalto1 (source)
	---local Dinheiro_Sujo = getElementData(source, "TS:Sujo") or 0
	local Valor_Ganho = math.random(800, 4000) -------------------------------------/ VALOR GANHO
	local Procurado = getPlayerWantedLevel(source)
	if isElementWithinMarker(source, Marker_Assalto1) then
		if getElementData(source, "Zeed_Assaltando1") then
                        triggerClientEvent(source, "N3xT.dxNotification", root, "A Loja Já esta Sendo Assaltada, Aguarde", "error")
			return
		end
		if isObjectInACLGroup("user. "..getAccountName(getPlayerAccount(source)), aclGetGroup (Grupo_Acl_Policial)) then
                        triggerClientEvent(source, "N3xT.dxNotification", root, "Você é um Policial, Proibido Assaltar.", "error")
			return
		end
		if getElementData(source, "Zeed_Loja_Assaltada1") then
                        triggerClientEvent(source, "N3xT.dxNotification", root, "Loja Assaltada Recentemente, Aguarde.", "error")
			return
		end
                triggerClientEvent(source, "N3xT.dxNotification", root, "Assaltando, Aguarde.", "info")
		setPedAnimation(source, "INT_SHOP", "shop_cashier", -1, true, false, true)
		setElementData(source, "Zeed_Assaltando1", true)
		triggerClientEvent(root, "Zeed_Ligar_Alarme1", root, source) ----------------------------------/ Disparar o Alarme / iniciar alarme
		local helmetcaixa1 = createObject(1922,0,0,0)
            helmetscaixa1[source] = helmetcaixa1
            --exports.bone_attach:attachElementToBone(helmetcaixa1,source,5,-0.1,-0.47,0.1,78,170,0)
		if Procurado < 6 then
		    setPlayerWantedLevel(source, Procurado + 1) -------------------------------------/ QUANTIDADE ESTRELA
		end
		toggleAllControls(source, false)
		triggerClientEvent(source, "Zeed_Mensagem_Tempo1", getRootElement())
		Loja_Assaltada (source)
		setTimer(function()
    		setPedAnimation(source, nil)
    		toggleAllControls(source, true)
    		setElementData(source, "Zeed_Assaltando1", false)
    		setElementData(source, "Zeed_Loja_Assaltada1", true)
    		--setElementData(source, "TS:Sujo", Dinheiro_Sujo + Valor_Ganho)
             next:giveItem(source, "Dinheiro Sujo", Valor_Ganho)
    		triggerClientEvent(source, "Zeed_Mensagem_Tempo1", getRootElement())
                triggerClientEvent(source, "N3xT.dxNotification", root, "Loja Assaltada com sucesso, Roubo de: $"..Valor_Ganho.." limpe o Dinheiro sujo.", "success")
    	end, Tempo_Assaltar_Loja*1000, 1)
	end
end

--[[function commandRemovehelmetcaixa1(player)
if isElement(helmetscaixa1[player]) then
destroyElement(helmetscaixa1[player])
helmetscaixa1[player] = nil
end
end
addCommandHandler("dropbag", commandRemovehelmetcaixa1)]]
-----------------------/ BIND - TECLA \-----------------------

function restart()
    for i, v in ipairs(getElementsByType("player")) do
        bindKey ( v, Tecla_Assalto, "down", Iniciar_Assalto1 )
    end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), restart)

function join()
    bindKey ( source, Tecla_Assalto, "down", Iniciar_Assalto1 )
end
addEventHandler("onPlayerJoin", getRootElement(), join)

-----------------------/ LOJA ASSALTAR - AVISAR POLICIAL \-----------------------

function Loja_Assaltada (source)
	setElementVisibleTo(Blip_Loja, root, false)
	setElementVisibleTo(Blip_Assaltada, root, true)
        triggerClientEvent(root, "N3xT.dxNotification", root, "[ATENÇÃO] o jogador '"..getPlayerName(source).."' esta saqueando a Lojinha de VINEWOOD, em Los Santos.", "info")
        setTimer(function()
        setElementVisibleTo(Blip_Loja, root, true)
        setElementVisibleTo(Blip_Assaltada, root, false)
        setElementData(source, "Zeed_Loja_Assaltada1", false)
    end, Tempo_Recuperar_Loja*60000, 1)
end

----------------/ SALVAR - DADOS \----------------

function Finalizar_Assalto (conta)
	if not (isGuestAccount (conta)) then
		if (conta) then	
			local source = getAccountPlayer(conta)	
			setPedAnimation(source, nil)
			toggleAllControls(source, true)
			setElementData(source, "Zeed_Loja_Assaltada1", false)
			setElementData(source, "Zeed_Assaltando1", false)
		end
	end	
end

----------------/ SALVAR - DADOS \----------------

function Restart_Resource (source)
	if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				Finalizar_Assalto(acc)
			end
		end
	end
end
addEventHandler("onResourceStart", getRootElement(), Restart_Resource)

----------------/ SALVAR - DADOS \----------------

addEventHandler("onPlayerLogin", root,
  function( _, acc )
	setTimer(Finalizar_Assalto, 50, 1, acc)
  end
)

----------------/ SALVAR - DADOS \----------------

function Desligar_Resource ( res )
    if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				Finalizar_Assalto(acc)
			end
		end
	end
end 
addEventHandler("onResourceStop", getRootElement(), Desligar_Resource )

function Verificar_Dinheiro (source, cmd, id)
    if(id) then
        local playerID = tonumber(id)
        if(playerID) then
            local Conta = getAccountName(getPlayerAccount(source))
            if isObjectInACLGroup("user."..Conta, aclGetGroup("Policial")) then
                local Jogador = getPlayerID(playerID)
                local Dinheiro = getElementData(Jogador, "TS:Sujo") or 0
                outputChatBox("O jogador possui "..Dinheiro.."$ de dinheiro sujo!", source, 255, 255, 255, true)
            end
        end
    end
end
addCommandHandler("verificarsujo", Verificar_Dinheiro)

function Remover_Dinheiro (source, cmd, id)
    if(id) then
        local playerID = tonumber(id)
        if(playerID) then
            local Conta = getAccountName(getPlayerAccount(source))
            if isObjectInACLGroup("user."..Conta, aclGetGroup("Policial")) then
                local Jogador = getPlayerID(playerID)
                local Dinheiro = getElementData(Jogador, "TS:Sujo") or 0
                setElementData(Jogador, "TS:Sujo", 0)
                outputChatBox("Você removeu dinheiro sujo do jogador!", source, 255, 255, 255, true)
            end
        end
    end
end
addCommandHandler("removersujo", Remover_Dinheiro)


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

