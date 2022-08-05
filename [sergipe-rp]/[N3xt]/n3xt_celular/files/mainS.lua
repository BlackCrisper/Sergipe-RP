db = dbConnect("sqlite", "files/celular.db")
dbExec(db, "CREATE TABLE IF NOT EXISTS loja (celular TEXT, chip TEXT, conta TEXT)")
dbExec(db, "CREATE TABLE IF NOT EXISTS me (dados TEXT, conta TEXT)")
dbExec(db, "CREATE TABLE IF NOT EXISTS telefone (indice INT)")
dbExec(db, "CREATE TABLE IF NOT EXISTS whatsapp (tel1 TEXT, tel2 TEXT, msg TEXT)")

local c = {"twitter", "olx", "deepweb"}
for i, v in ipairs(c) do
    dbExec(db, "CREATE TABLE IF NOT EXISTS "..v.." (id INT, nome TEXT, msg TEXT, conta TEXT)")
    local c_result = dbPoll(dbQuery(db, "SELECT * FROM "..v), -1)
    if #c_result == 0 then
        for i = 1, 4 do
            dbExec(db, "INSERT INTO "..v.." (id, nome, msg, conta) VALUES (?, ?, ?, ?)", i, "", "", "")
        end
    end
end

local t_result = dbPoll(dbQuery(db, "SELECT indice FROM telefone"), -1)
if #t_result == 0 then
    dbExec(db, "INSERT INTO telefone (indice) VALUES (?)", 998000)
end

function onCelular(source)
        local acc = getPlayerAccount(source)
        if not isGuestAccount(acc) then
            local result = dbPoll(dbQuery(db, "SELECT * FROM loja WHERE celular=? AND conta=?", "Sim", getAccountName(acc)), -1)
            if (#result > 0) then
                local dados = getDadosMe(acc)
                if dados then
                    triggerClientEvent(source, "N3xT.onOpenCelular", resourceRoot, dados)
                end
            end
        end
end

function onResStart()
    for index, player in ipairs(getElementsByType("player")) do
        bindKey(player, config.bind, "down", onCelular)
    end
end
addEventHandler("onResourceStart", resourceRoot, onResStart)
    
function onPlayerJoin()
    bindKey(source, config.bind, "down", onCelular)
end
addEventHandler("onPlayerJoin", getRootElement(), onPlayerJoin)
    
function cleanAll()
    for index, player in ipairs(getElementsByType("player")) do
        unbindKey(player, config.bind, "down", onCelular)
    end
end
addEventHandler("onResourceStop", resourceRoot, cleanAll)

function getDadosMe(acc)
    if not isGuestAccount(acc) then
        local result = dbPoll(dbQuery(db, "SELECT dados FROM me WHERE conta=?", getAccountName(acc)), -1)
        if (#result > 0) then
            local dados = fromJSON(result[1]["dados"])
            return dados
        end
    end
    return false
end

function setDadosMe(dados)
    local acc = getPlayerAccount(source)
    if not isGuestAccount(acc) then
        local result = dbPoll(dbQuery(db, "SELECT dados FROM me WHERE conta=?", getAccountName(acc)), -1)
        if (#result > 0) then
            dbExec(db, "UPDATE me SET dados=? WHERE conta=?", toJSON(dados), getAccountName(acc))
        end
    end
end
addEvent("N3xT.setDadosMe", true)
addEventHandler("N3xT.setDadosMe", root, setDadosMe)

local animTimer = {}
local phone = {}

addEvent("N3xT.setAnimationPhone", true)
addEventHandler("N3xT.setAnimationPhone", root, function(value)
    if (value == 1) then
        setPedWeaponSlot(client, 0)
        phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
        setObjectScale(phone[client], 1.5)
	    exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
	    setPedAnimation(client, "ped","phone_in", 1000, false, false, false, true)
	    animTimer[client] = setTimer(function(player)
		    if isElement(player) then
			    setPedAnimationProgress(player, "phone_in", 0.8)
		    end
        end, 500, 0, client)
        
    elseif (value == 2) then
        removePhone(client)
        setPedAnimation(client, "ped", "phone_out", 50, false, false, false, false)
    end
end)

addEventHandler("onPlayerQuit", root, function()
	removePhone(source)
end)

addEventHandler("onPlayerWasted", root, function()
	removePhone(source)
end)

function removePhone(player)
	if (phone[player]) then
		destroyElement(phone[player])
		phone[player] = nil
	end
	if (animTimer[player]) then
		killTimer(animTimer[player])
		animTimer[player] = nil
	end
	setPedAnimation(player)
end

addEvent("N3xT.searchMusics", true)
addEventHandler("N3xT.searchMusics", root,
    function(str)
        str = removeAccents(str):gsub("%s", "%%20")
		fetchRemote("http://api.soundcloud.com/tracks.json?client_id="..config.keySound.."&q="..str.."&limit=5",
			function(resposta, erro, player)
				if (resposta ~= "ERROR") and (erro == 0) then
					data = {fromJSON (resposta)}
					triggerClientEvent(player, "N3xT.getMusics", resourceRoot, data)
				end
			end
		, "", false, client)
    end
)

addEvent("N3xT.setAccountPass", true)
addEventHandler("N3xT.setAccountPass", root,
    function(pass)
        local acc = getPlayerAccount(source)
        if not isGuestAccount(acc) then
            if not getElementData(source, "trocouSenhaRecente") then
                setAccountPassword(acc, pass)
                setElementData(source, "trocouSenhaRecente", true)
                setTimer(function(source)
                    if isElement(source) then
                        setElementData(source, "trocouSenhaRecente", nil)
                    end
                end, 60000 * 5, 1, source)
                message(source, "Sua senha foi alterada com sucesso.", "success")
            else
                message(source, "Você alterou sua senha recentemente!", "error")
            end
        end
    end
)

addEvent("N3xT.onAddContact", true)
addEventHandler("N3xT.onAddContact", root,
function(nome, tel)
    if getPlayerChip(source) then
        local result = dbPoll(dbQuery(db, "SELECT indice FROM telefone"), -1)
        if #result > 0 then
            if tonumber(tel) > 998000 and tonumber(tel) <= result[1]["indice"] then
                triggerClientEvent(source, "N3xT.onAddContact2", resourceRoot, nome, tel)
            else
                message(source, "Esse Número de Telefone não existe!", "error")
            end
        end
    else
        message(source, "Você não possuí um Chip!", "error")
    end
end
)

addEvent("N3xT.onMessageChat", true)
addEventHandler("N3xT.onMessageChat", root,
    function(chat, texto)
        if not getElementData(source, "tempoMensagem") then
            local acc = getPlayerAccount(source)
            if not isGuestAccount(acc) then
                local id = getElementData(source, "ID") or "N/A"
                local result = dbPoll(dbQuery(db, "SELECT * FROM "..chat), -1)
                for i = 1, 4 do
                    if (result[i].msg == "") then
                        dbExec(db, "UPDATE "..chat.." SET nome=?, msg=?, conta=? WHERE id=?", getPlayerName(source).." ("..id..")", texto, getAccountName(acc), i)
                        break
                    else
                        if (i == 4) then
                            local v = {}
                            for i = 2, 4 do
                                v[i] = {result[i].nome, result[i].msg, result[i].conta}
                                dbExec(db, "UPDATE "..chat.." SET nome=?, msg=?, conta=? WHERE id=?", v[i][1], v[i][2], v[i][3], i - 1)
                            end
                            dbExec(db, "UPDATE "..chat.." SET nome=?, msg=?, conta=? WHERE id=?", getPlayerName(source).." ("..id..")", texto, getAccountName(acc), 4)
                        end
                    end
                end
                setElementData(source, "tempoMensagem", true)
                setTimer(function(source)
                    if isElement(source) then
                        setElementData(source, "tempoMensagem", nil)
                    end
                end, 10000, 1, source)
                message(source, "Mensagem enviada com sucesso.", "success")
                updateChatMessage(source, chat, "root")
            end
        else
            message(source, "Você enviou uma Mensagem recentemente!", "error")
        end
    end
)

function updateChatMessage(source, chat, type)
    local result = dbPoll(dbQuery(db, "SELECT * FROM "..chat), -1)
    local t_chat = {}
    for _, v in ipairs(result) do
        if v["msg"] ~= "" then
            table.insert(t_chat, {v["nome"], v["msg"]})
            if type == "source" then
                triggerClientEvent(source, "N3xT.updateChatMessage2", resourceRoot, t_chat, chat)
                triggerClientEvent(source, "N3xT.setEditChatNil", resourceRoot, 1)
            elseif type == "root" then
                triggerClientEvent(root, "N3xT.updateChatMessage2", resourceRoot, t_chat, chat)
                triggerClientEvent(source, "N3xT.setEditChatNil", resourceRoot, 1)
            end
        end
    end
end
addEvent("N3xT.updateChatMessage", true)
addEventHandler("N3xT.updateChatMessage", root, updateChatMessage)

local blip = {}

addEvent("N3xT.onEnviarLoc", true)
addEventHandler("N3xT.onEnviarLoc", root,
    function(contact)
        if not getElementData(source, "enviouLocRecente") then
            local tp = getElementsByType("player")
            for i, player in ipairs(tp) do
                local acc_p = getPlayerAccount(player)
                if not isGuestAccount(acc_p) then
                    local dados_p = getDadosMe(acc_p)
                    if dados_p then
                        if contact == dados_p.telefone then
                            local id = getElementData(source, "ID") or "N/A"
                            blip[source] = createBlipAttachedTo(source, 41, _, _, _, _, _, _, _, player)
                            setElementData(source, "enviouLocRecente", true)
                            message(source, "Localização enviada com sucesso.", "success")
                            message(player, "Você recebeu a Localização de "..getPlayerName(source).." ("..id..")", "info")
                            setTimer(function(source)
                                if isElement(source) then
                                    if blip[source] and isElement(blip[source]) then
                                        destroyElement(blip[source])
                                    end
                                    setElementData(source, "enviouLocRecente", nil)
                                end
                            end, 60000 * 5, 1, source)
                            break
                        else
                            if i == #tp then
                                message(source, "Não foi possível encontrar o Proprietário do Contato!", "error")
                            end
                        end
                    else
                        if i == #tp then
                            message(source, "Não foi possível encontrar o Proprietário do Contato!", "error")
                        end
                    end
                else
                    if i == #tp then
                        message(source, "Não foi possível encontrar o Proprietário do Contato!", "error")
                    end
                end
            end
        else
            message(source, "Você enviou sua Localização recentemente!", "error")
        end
    end
)

addEvent("N3xT.onDiscarNumber", true)
addEventHandler("N3xT.onDiscarNumber", root,
    function(tel, stel)
        if getPlayerChip(source) then
            local result = dbPoll(dbQuery(db, "SELECT indice FROM telefone"), -1)
            if #result > 0 then
                if tonumber(tel) > 998000 and tonumber(tel) <= result[1]["indice"] then
                    local tp = getElementsByType("player")
                    for i, player in ipairs(tp) do
                        local acc_p = getPlayerAccount(player)
                        if not isGuestAccount(acc_p) then
                            local dados_p = getDadosMe(acc_p)
                            if dados_p then
                                if dados_p.telefone == tel then
                                    if not getElementData(player, "emChamada") then
                                        if not getElementData(player, "cancelReceiveCall") then
                                            setElementData(source, "ligouRecente", true)
                                            setElementData(source, "emChamada", {player, tel, false})
                                            setElementData(player, "emChamada", {source, stel, false})
                                            triggerClientEvent(source, "N3xT.SetLigacao", resourceRoot)
                                            triggerClientEvent(player, "N3xT.ReceberLigacao", resourceRoot, dados_p)
                                            break
                                        else
                                            message(source, "Essa Pessoa Desabilitou receber Chamadas!", "error")
                                            break
                                        end
                                    else
                                        message(source, "Essa Pessoa está em alguma Chamada no momento!", "error")
                                        break
                                    end
                                else
                                    if i == #tp then
                                        message(source, "O Proprietário do Número de Telefone não foi encontrado!", "error")
                                    end
                                end
                            else
                                if i == #tp then
                                    message(source, "O Proprietário do Número de Telefone não foi encontrado!", "error")
                                end
                            end
                        else
                            if i == #tp then
                                message(source, "O Proprietário do Número de Telefone não foi encontrado!", "error")
                            end
                        end
                    end
                else
                    message(source, "Esse Número de Telefone não existe!", "error")
                end
            end
        else
            message(source, "Você não possuí um Chip!", "error")
        end
    end
)

addEvent("N3xT.setCallEvent", true)
addEventHandler("N3xT.setCallEvent", root,
    function(event)
        triggerClientEvent(source, event, resourceRoot)
    end
)

addEvent("N3xT.onDiscarEmergency", true)
addEventHandler("N3xT.onDiscarEmergency", root,
    function(emer, motivo)
        local id = getElementData(source, "ID") or "N/A"
        for _, v in ipairs(getElementsByType("player")) do
            if v ~= source then
                if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(v)), aclGetGroup(config.acl_emergencia[emer])) then
                    message(v, getPlayerName(source).." ("..id..") #ffffffPrecisa de #ff0000"..emer.."#ffffff, para aceitar #00ff7f/aceitarchamado "..id.."#ffffff.", "info")
                    message(v, "Motivo: "..motivo, "info")
                end
            end
        end
        setElementData(source, "ChamadoAberto", emer)
        setElementData(source, "recentEmergency", true)
        setTimer(function(source)
            if isElement(source) then
                setElementData(source, "recentEmergency", nil)
            end
        end, 60000 * 5, 1, source)
        message(source, "O Chamado foi enviado com sucesso.", "success")
    end
)

local blip2 = {}

addCommandHandler("aceitarchamado",
    function(source, _, id)
        local id_v = tonumber(id)
		if id_v then
			local receiver = getPlayerID(id_v)
            if receiver and receiver ~= source then
                local mt = getElementData(receiver, "ChamadoAberto")
                if mt then
                    if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(config.acl_emergencia[mt])) then
                        if mt == "SAMU" or mt == "Polícia" or mt == "Mecânico" then
                            createBlipChamado(source, receiver)

                        elseif mt == "Staff" then
                            local x, y, z = getElementPosition(receiver)
                            setElementPosition(source, x - 1, y, z)
                        end
                        
                        setElementData(receiver, "ChamadoAberto", nil)
                        message(source, "O Chamado foi aceito com sucesso.", "success")
                        message(receiver, "Seu Chamado foi aceito com sucesso.", "success")
                    else
                        message(source, "Você não tem permissão para aceitar um Chamado!", "error")
                    end
                else
                    message(source, "Esse Chamado já foi atendido ou o Jogador não fez o Chamado!", "error")
                end
            else
                message(source, "Jogador de ID "..id.." não foi encontrado!", "error")
            end
        else
            message(source, "Preencha o ID!", "error")
        end
    end
)

function createBlipChamado(source, receiver)
    if blip2[source] and isElement(blip2[source]) then
        destroyElement(blip2[source])
    end
    blip2[source] = createBlipAttachedTo(receiver, 41, _, _, _, _, _, _, _, source)
    setTimer(function(source)
        if isElement(source) then
            if blip2[source] and isElement(blip2[source]) then
                destroyElement(blip2[source])
            end
        end
    end, 60000 * 5, 1, source)
end

addEvent("N3xT.onUpdateWhatsApp", true)
addEventHandler("N3xT.onUpdateWhatsApp", root,
    function()
        if getPlayerChip(source) then
            local acc = getPlayerAccount(source)
            if not isGuestAccount(acc) then
                local dados = getDadosMe(acc)
                if dados then
                    local result = dbPoll(dbQuery(db, "SELECT * FROM whatsapp WHERE tel1=? OR tel2=?", dados.telefone, dados.telefone), -1)
                    if #result > 0 then
                        local whatsapp = {}
                        for _, v in ipairs(result) do
                            if v["tel1"] ~= dados.telefone then
                                table.insert(whatsapp, {v["tel1"], fromJSON(v["msg"]), getAvatarByTelefone(v["tel1"])})
                            elseif v["tel2"] ~= dados.telefone then
                                table.insert(whatsapp, {v["tel2"], fromJSON(v["msg"]), getAvatarByTelefone(v["tel2"])})
                            end
                        end
                        triggerClientEvent(source, "N3xT.onUpdateWhatsApp2", resourceRoot, whatsapp)
                    end
                end
            end
        end
    end
)

function getAvatarByTelefone(tel)
    local result = dbPoll(dbQuery(db, "SELECT * FROM me"), -1)
    if #result > 0 then
        for _, v in ipairs(result) do
            local acc = getAccount(v["conta"])
            if acc then
                local dados = getDadosMe(acc)
                if dados.telefone == tel then
                    return dados.avatar
                end
            end
        end
    end
    return ""
end

addEvent("N3xT.onMessageWhatsApp", true)
addEventHandler("N3xT.onMessageWhatsApp", root,
    function(tel, msg)
    if not getElementData(source, "tempoMensagem2") then
        local acc = getPlayerAccount(source)
        if not isGuestAccount(acc) then
            local dados = getDadosMe(acc)
            if dados then
                local time = getRealTime()
                local hours = time.hour
                local minutes = time.minute
                if (hours < 10) then
                    hours = "0"..hours
                end
                if (minutes < 10) then
                    minutes = "0"..minutes
                end

                local _tel = getTel(dados.telefone, tel)
                if _tel then
                    local result = dbPoll(dbQuery(db, "SELECT msg FROM whatsapp WHERE tel1=? AND tel2=?", _tel[1], _tel[2]), -1)
                    local t_msg = fromJSON(result[1]["msg"])
                    if #t_msg == 5 then
                        table.remove(t_msg, 1)
                    end
                    table.insert(t_msg, {dados.telefone, msg, hours..":"..minutes, "noview"})
                    dbExec(db, "UPDATE whatsapp SET msg=? WHERE tel1=? AND tel2=?", toJSON(t_msg), _tel[1], _tel[2])
                else
                    local t_msg = {}
                    table.insert(t_msg, {dados.telefone, msg, hours..":"..minutes, "noview"})
                    dbExec(db, "INSERT INTO whatsapp (tel1, tel2, msg) VALUES (?, ?, ?)", dados.telefone, tel, toJSON(t_msg))
                end
                triggerEvent("N3xT.onUpdateWhatsApp", source)
                triggerClientEvent(source, "N3xT.setEditChatNil", resourceRoot, 2)
                setElementData(source, "tempoMensagem2", true)
                setTimer(function(source)
                    if isElement(source) then
                        setElementData(source, "tempoMensagem2", nil)
                    end
                end, 10000, 1, source)
                message(source, "Mensagem enviada com sucesso.", "success")

                local player = getPlayerByNumberTelefone(tel)
                if player then
                    triggerEvent("N3xT.onUpdateWhatsApp", player)
                    local acc_p = getPlayerAccount(player)
                    local dados_p = getDadosMe(acc_p)
                    if dados_p then
                        if not getElementData(player, "cancelMessageWhatsApp") then
                            triggerClientEvent(player, "N3xT.onNotifyWhatsApp", resourceRoot, dados.toque[3])
                            message(player, getNameContatoByNumber(dados_p, dados.telefone).." te enviou uma Mensagem no WhatsApp.", "info")
                        end
                    end
                end
            end
        end
    else
        message(source, "Você enviou uma Mensagem recentemente!", "error")
    end
end
)

function getTel(tel1, tel2)
    local result = dbPoll(dbQuery(db, "SELECT * FROM whatsapp"), -1)
    if #result > 0 then
        for _, v in ipairs(result) do
            if v["tel1"] == tel1 and v["tel2"] == tel2 then
                local tel_1, tel_2 = v["tel1"], v["tel2"]
                return {tel_1, tel_2}
            elseif v["tel1"] == tel2 and v["tel2"] == tel1 then
                local tel_1, tel_2 = v["tel1"], v["tel2"]
                return {tel_1, tel_2}
            end
        end
    end
    return false
end

function getPlayerByNumberTelefone(tel)
    for _, player in ipairs(getElementsByType("player")) do
        local acc = getPlayerAccount(player)
        if not isGuestAccount(acc) then
            local dados = getDadosMe(acc)
            if dados and dados.telefone == tel then
                return player
            end
        end
    end
    return false
end

function getNameContatoByNumber(dados, nome)
    for _, v in ipairs(dados.contatos) do
        if nome == v[2] then
            return v[1]
        end
    end
    return nome
end

addEvent("N3xT.onViewWhatsApp", true)
addEventHandler("N3xT.onViewWhatsApp", root,
    function(tel1, tel2, index)
        local acc = getPlayerAccount(source)
        if not isGuestAccount(acc) then
            local _tel = getTel(tel1, tel2)
            if _tel then
                local result = dbPoll(dbQuery(db, "SELECT msg FROM whatsapp WHERE tel1=? AND tel2=?", _tel[1], _tel[2]), -1)
                if #result > 0 then
                    local t_msg = fromJSON(result[1]["msg"])
                    t_msg[index][4] = "view"
                    dbExec(db, "UPDATE whatsapp SET msg=? WHERE tel1=? AND tel2=?", toJSON(t_msg), _tel[1], _tel[2])
                    triggerEvent("N3xT.onUpdateWhatsApp", source)

                    local player = getPlayerByNumberTelefone(tel2)
                    if player then
                        triggerEvent("N3xT.onUpdateWhatsApp", player)
                    end
                end
            end
        end
    end
)

addEvent("N3xT.onUpdateStatusWhatsApp", true)
addEventHandler("N3xT.onUpdateStatusWhatsApp", root,
    function()
        local acc = getPlayerAccount(source)
        if not isGuestAccount(acc) then
            local dados = getDadosMe(acc)
            if dados then
                local result = dbPoll(dbQuery(db, "SELECT * FROM whatsapp WHERE tel1=? OR tel2=?", dados.telefone, dados.telefone), -1)
                if #result > 0 then
                    local t_status = {}
                    for _, v in ipairs(result) do
                        if v["tel1"] ~= dados.telefone then
                            player_s = getPlayerByNumberTelefone(v["tel1"])
                        else
                            player_s = getPlayerByNumberTelefone(v["tel2"])
                        end
                        if player_s then
                            local status = getElementData(player_s, "statusWhatsApp")
                            if status and type(status) == "table" then
                                table.insert(t_status, status)
                            end
                        end
                    end
                    triggerClientEvent(source, "N3xT.onUpdateStatusWhatsApp2", resourceRoot, t_status)
                end
            end
        end
    end
)

addEvent("N3xT.onStatusWhatsApp", true)
addEventHandler("N3xT.onStatusWhatsApp", root,
    function(msg)
        if not getElementData(source, "statusRecente") then
            local acc = getPlayerAccount(source)
            if not isGuestAccount(acc) then
                local dados = getDadosMe(acc)
                if dados then
                    local time = getRealTime()
                    local hours = time.hour
                    local minutes = time.minute
                    if (hours < 10) then
                        hours = "0"..hours
                    end
                    if (minutes < 10) then
                        minutes = "0"..minutes
                    end
                    local status = getElementData(source, "statusWhatsApp")
                    if status and type(status) == "table" then
                        table.insert(status, {dados.telefone, msg, hours..":"..minutes})
                        setElementData(source, "statusWhatsApp", status)
                    else
                        local table_s = {}
                        table.insert(table_s, {dados.telefone, msg, hours..":"..minutes})
                        setElementData(source, "statusWhatsApp", table_s)
                    end
                    triggerClientEvent(source, "N3xT.setEditChatNil", resourceRoot, 3)
                    setElementData(source, "statusRecente", true)
                    setTimer(function(source)
                        if isElement(source) then
                            setElementData(source, "statusRecente", nil)
                        end
                    end, 60000 * 5, 1, source)
                    message(source, "Status enviado com sucesso.", "success")
                end
            end
        else
            message(source, "Você enviou um Status recentemente!", "error")
        end
    end
)

addEvent("N3xT.onEnviarDinheiro", true)
addEventHandler("N3xT.onEnviarDinheiro", root,
    function(d1, d2)
        if not getElementData(source, "enviouDinheiro") then
		    local receiver = getPlayerID(d1)
            if receiver then
                if receiver ~= source then
                    if getPlayerMoney(source) >= d2 then
                        local x, y, z = getElementPosition(source)
                        local xr, yr, zr = getElementPosition(receiver)
                        if getDistanceBetweenPoints3D(x, y, z, xr, yr, zr) <= 3 then
                            local id = getElementData(source, "ID") or "N/A"
                            takePlayerMoney(source, d2)
                            givePlayerMoney(receiver, d2)
                            message(source, "Você enviou R$"..d2.." para ID: "..d1..".", "success")
                            message(receiver, "Você recebeu R$"..d2.." de ID: "..id..".", "info")
                            setElementData(source, "enviouDinheiro", true)
                            setTimer(function(source)
                                if isElement(source) then
                                    setElementData(source, "enviouDinheiro", nil)
                                end
                            end, 60000 * 3, 1, source)
                        else
                            message(source, "Chegue mais perto dessa Pessoa!", "error")
                        end
                    else
                        message(source, "Você não possuí esse Valor!", "error")
                    end
                else
                    message(source, "Você não pode Enviar para Você mesmo!", "error")
                end
            else
                message(source, "Jogador não encontrado!", "error")
            end
        else
            message(source, "Você enviou Dinheiro recentemente!", "error")
        end
    end
)