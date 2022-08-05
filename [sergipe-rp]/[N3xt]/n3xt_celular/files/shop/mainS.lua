addEvent("N3xT.onBuyShopCelular", true)

for _, v in ipairs(config.lojas) do
    local loja = createMarker(v[1], v[2], v[3] - 1, "cylinder", 1.2, 0, 255, 127, 30)
    createBlipAttachedTo(loja, config.blip_lojas, _, _, _, _, _, _, 200)
    addEventHandler("onMarkerHit", loja,
        function(source)
            if isElement(source) and getElementType(source) == "player" then
                if not isPedInVehicle(source) then
                    triggerClientEvent(source, "N3xT.onShopCelular", resourceRoot)
                    message(source, "Preço Celular: R$"..config.precocelular..", Preço Chip: R$"..config.precochip..".", "info")
                end
            end
        end
    )
end

local dados = {
    fundo = {
        "wallpaper_04",
        "wallpaper_04"
    },
    
    toque = {
        "1",
        "chamada_01",
        "notify_01"
    },

    contatos = {},
    notas = {},

    telefone = "",
    avatar = ""
}

local contatos_e = {
    {"SAMU", "192"},
    {"Polícia", "190"},
    {"Mecânico", "185"},
    {"Staff", "000"}
}

addEventHandler("N3xT.onBuyShopCelular", root,  
    function(n)
        local acc = getPlayerAccount(source)
        if not isGuestAccount(acc) then
            if n == 1 then
                if getPlayerMoney(source) >= config.precocelular then
                    local result = dbPoll(dbQuery(db, "SELECT * FROM loja WHERE celular=? AND conta=?", "Sim", getAccountName(acc)), -1)
                    if (#result == 0) then
                        takePlayerMoney(source, config.precocelular)
                        dbExec(db, "INSERT INTO loja (celular, conta) VALUES (?, ?)", "Sim", getAccountName(acc))
                        dbExec(db, "INSERT INTO me (dados, conta) VALUES (?, ?)", toJSON(dados), getAccountName(acc))
                        message(source, "Você adquiriu um Celular.", "success")
                    else
                        message(source, "Você já possuí um Celular!", "error")
                    end
                else
                    message(source, "Você não tem dinheiro suficiente!", "error")
                end

            elseif n == 2 then
                if getPlayerMoney(source) >= config.precochip then
                    local result = dbPoll(dbQuery(db, "SELECT * FROM loja WHERE celular=? AND conta=?", "Sim", getAccountName(acc)), -1)
                    if (#result > 0) then
                        local result2 = dbPoll(dbQuery(db, "SELECT * FROM loja WHERE chip=? AND conta=?", "Sim", getAccountName(acc)), -1)
                        if (#result2 == 0) then
                            takePlayerMoney(source, config.precochip)
                            dbExec(db, "UPDATE loja SET chip=? WHERE conta=?", "Sim", getAccountName(acc))
                            message(source, "Você adquiriu um Chip.", "success")
                            generateNumberChip(acc)
                        else
                            message(source, "Você já possuí um Chip!", "error")
                        end
                    else
                        message(source, "Você não possuí um Celular!", "error")
                    end
                else
                    message(source, "Você não tem dinheiro suficiente!", "error")
                end
            end
        else
            message(source, "Você precisa estar logado!", "error")
        end
    end
)

function generateNumberChip(acc)
    local result = dbPoll(dbQuery(db, "SELECT indice FROM telefone"), -1)
    if #result > 0 then
        local dados = getDadosMe(acc)
        dados.telefone = tostring(result[1]["indice"] + 1)
        dbExec(db, "UPDATE telefone SET indice=?", result[1]["indice"] + 1)
        for _, v in ipairs(contatos_e) do
            table.insert(dados.contatos, {v[1], v[2]})
        end
        setDadosMe(dados)
    end
end

function getPlayerChip(source)
    local acc = getPlayerAccount(source)
    if not isGuestAccount(acc) then
        local result = dbPoll(dbQuery(db, "SELECT * FROM loja WHERE chip=? AND conta=?", "Sim", getAccountName(acc)), -1)
        if (#result ~= 0) then
            return true
        end
    end
    return false
end