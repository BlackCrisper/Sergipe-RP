


function saveAccountData ( account )
    if isGuestAccount ( account ) then
        return false
    end
      local x,y,z = getElementPosition (source)
      setAccountData (account, "money1", tostring (getPlayerMoney (source)))
      setAccountData (account, "skin", tostring (getPedSkin (source)))
      setAccountData (account, "health", tostring (getElementHealth (source)))
      setAccountData (account, "armor", tostring (getPedArmor (source)))
      setAccountData (account, "x", x)
      setAccountData (account, "y", y)
      setAccountData (account, "z", z)
      setAccountData (account, "int", getElementInterior (source))
      setAccountData (account, "dim", getElementDimension (source))
      setAccountData (account, "wantedlevel", getPlayerWantedLevel (source))
      setAccountData (account, "weaponID0", getPedWeapon (source, 0))
      setAccountData (account, "weaponID1", getPedWeapon (source, 1))
      setAccountData (account, "weaponID2", getPedWeapon (source, 2))
      setAccountData (account, "weaponID3", getPedWeapon (source, 3))
      setAccountData (account, "weaponID4", getPedWeapon (source, 4))
      setAccountData (account, "weaponID5", getPedWeapon (source, 5))
      setAccountData (account, "weaponID6", getPedWeapon (source, 6))
      setAccountData (account, "weaponID7", getPedWeapon (source, 7))
      setAccountData (account, "weaponID8", getPedWeapon (source, 8))
      setAccountData (account, "weaponID9", getPedWeapon (source, 9))
      setAccountData (account, "weaponID10", getPedWeapon (source, 10))
      setAccountData (account, "weaponID11", getPedWeapon (source, 11))
      setAccountData (account, "weaponID12", getPedWeapon (source, 12))
      setAccountData (account, "weaponAmmo0", getPedTotalAmmo (source, 0))
      setAccountData (account, "weaponAmmo1", getPedTotalAmmo (source, 1))
      setAccountData (account, "weaponAmmo2", getPedTotalAmmo (source, 2))
      setAccountData (account, "weaponAmmo3", getPedTotalAmmo (source, 3))
      setAccountData (account, "weaponAmmo4", getPedTotalAmmo (source, 4))
      setAccountData (account, "weaponAmmo5", getPedTotalAmmo (source, 5))
      setAccountData (account, "weaponAmmo6", getPedTotalAmmo (source, 6))
      setAccountData (account, "weaponAmmo7", getPedTotalAmmo (source, 7))
      setAccountData (account, "weaponAmmo8", getPedTotalAmmo (source, 8))
      setAccountData (account, "weaponAmmo9", getPedTotalAmmo (source, 9))
      setAccountData (account, "weaponAmmo10", getPedTotalAmmo (source, 10))
      setAccountData (account, "weaponAmmo11", getPedTotalAmmo (source, 11))
      setAccountData (account, "weaponAmmo12", getPedTotalAmmo (source, 12))
    return true
end

addEventHandler ( 'onPlayerLogin', root, function ( _,acc )
    if isGuestAccount ( acc ) then
        return
    end
    
    local accountData = getAccountData (acc, "money1")
    if (accountData) then
        local playerMoney = getAccountData (acc, "money1")
        local playerSkin = getAccountData (acc, "skin")
        local playerHealth = getAccountData (acc, "health")
        local playerArmor = getAccountData (acc, "armor")
        local playerX = getAccountData (acc, "x")
        local playerY = getAccountData (acc, "y")
        local playerZ = getAccountData (acc, "z")
        local playerInt = getAccountData (acc, "int")
        local playerDim = getAccountData (acc, "dim")
        local playerWanted = getAccountData (acc, "wantedlevel")
        local playerTeam = getAccountData (acc, "Team")
        local playerWeaponID0 = getAccountData (acc, "weaponID0")
        local playerWeaponID1 = getAccountData (acc, "weaponID1")
        local playerWeaponID2 = getAccountData (acc, "weaponID2")
        local playerWeaponID3 = getAccountData (acc, "weaponID3")
        local playerWeaponID4 = getAccountData (acc, "weaponID4")
        local playerWeaponID5 = getAccountData (acc, "weaponID5")
        local playerWeaponID6 = getAccountData (acc, "weaponID6")
        local playerWeaponID7 = getAccountData (acc, "weaponID7")
        local playerWeaponID8 = getAccountData (acc, "weaponID8")
        local playerWeaponID9 = getAccountData (acc, "weaponID9")
        local playerWeaponID10 = getAccountData (acc, "weaponID10")
        local playerWeaponID11 = getAccountData (acc, "weaponID11")
        local playerWeaponID12 = getAccountData (acc, "weaponID12")
        local playerWeaponAmmo0 = getAccountData (acc, "weaponAmmo0")
        local playerWeaponAmmo1 = getAccountData (acc, "weaponAmmo1")
        local playerWeaponAmmo2 = getAccountData (acc, "weaponAmmo2")
        local playerWeaponAmmo3 = getAccountData (acc, "weaponAmmo3")
        local playerWeaponAmmo4 = getAccountData (acc, "weaponAmmo4")
        local playerWeaponAmmo5 = getAccountData (acc, "weaponAmmo5")
        local playerWeaponAmmo6 = getAccountData (acc, "weaponAmmo6")
        local playerWeaponAmmo7 = getAccountData (acc, "weaponAmmo7")
        local playerWeaponAmmo8 = getAccountData (acc, "weaponAmmo8")
        local playerWeaponAmmo9 = getAccountData (acc, "weaponAmmo9")
        local playerWeaponAmmo10 = getAccountData (acc, "weaponAmmo10")
        local playerWeaponAmmo11 = getAccountData (acc, "weaponAmmo11")
        local playerWeaponAmmo12 = getAccountData (acc, "weaponAmmo12")
        spawnPlayer (source, playerX, playerY, playerZ +1, 0, playerSkin, playerInt, playerDim)
        setPlayerMoney (source, playerMoney)
        setTimer (setElementHealth, 50, 1, source, playerHealth)
        setTimer (setPedArmor, 50, 1, source, playerArmor)
        setTimer (setPlayerWantedLevel, 50, 1, source, playerWanted)
        giveWeapon(source, playerWeaponID0, playerWeaponAmmo0, true)
        giveWeapon(source, playerWeaponID1, playerWeaponAmmo1, false)
        giveWeapon(source, playerWeaponID2, playerWeaponAmmo2, false)
        giveWeapon(source, playerWeaponID3, playerWeaponAmmo3, false)
        giveWeapon(source, playerWeaponID4, playerWeaponAmmo4, false)
        giveWeapon(source, playerWeaponID5, playerWeaponAmmo5, false)
        giveWeapon(source, playerWeaponID6, playerWeaponAmmo6, false)
        giveWeapon(source, playerWeaponID7, playerWeaponAmmo7, false)
        giveWeapon(source, playerWeaponID8, playerWeaponAmmo8, false)
        giveWeapon(source, playerWeaponID9, playerWeaponAmmo9, false)
        giveWeapon(source, playerWeaponID10, playerWeaponAmmo10, false)
        giveWeapon(source, playerWeaponID11, playerWeaponAmmo11, false)
        giveWeapon(source, playerWeaponID12, playerWeaponAmmo12, false)
        setCameraTarget (source, source)
        fadeCamera(source, true, 2.0)
        outputChatBox ( '#000000[#00ffffSave System#000000]: #bebebeOs Seus Dados Foi Carregados Com Successo No Save Sistema !', source, 255, 255, 255, true )
    else
        local save = saveAccountData ( acc )
        if save then
            outputChatBox ( '#000000[#00ffffSave System#000000]: #bebebePrimeira vez que voce usa esta Conta!', source, 255, 255, 255, true )
            outputChatBox ( '#000000[#00ffffSave System#000000]: #bebebeSalvando Data ...', source, 255, 255, 255, true )
            setTimer ( function ( )
                outputChatBox ( '#000000[#00ffffSave System#000000]: #bebebeOs Seus Dados Foi Carregados Com Successo No Save Sistema !', source, 255, 255, 255, true )
            end, 3500, 1 )  
        else
            outputChatBox ( '#000000[#00ffffSave System#000000]: #bebebeFalha para salvar seus dados no Save Sistema !', source, 255, 255, 255, true )
            outputChatBox ( '#000000[#00ffffSave System#000000]: #bebebeEntre em contato com um Admin para verificar o Save Sistema !', source, 255, 255, 255, true )
        end
    end
end )



addEventHandler ( 'onPlayerLogout', root, function (accPlr)
    givePlayerMoney (source,1)
    setTimer (takePlayerMoney,10000,1,source,1)
    saveAccountData ( accPlr )
    outputChatBox ( '[Save System] : #909090você #FF0000Deu /logout e saiu #909090da sua conta !', source, 255, 255, 255, true )    
end )

addEventHandler ( 'onPlayerQuit', root, function ()
    local accQuit = getPlayerAccount ( source )
    saveAccountData ( accQuit )
end )

function setTeam(_,acc3)
    local team = getAccountData (acc3, "team")
        if team and getTeamFromName(team) then
              setPlayerTeam(source, getTeamFromName(team))
              -- outputChatBox ("Team set")
    end
end
addEventHandler("onPlayerLogin",getRootElement(),setTeam)
 
function saveTeam()
    local team = getPlayerTeam(source)
    local account = getPlayerAccount(source)
       if (team) and not isGuestAccount(account) then
          setAccountData(account, "team", getTeamName(team))
    end
end
addEventHandler("onPlayerQuit",getRootElement(),saveTeam)
addEventHandler ( 'onPlayerLogout', root,saveTeam)

function saveWeaponStats(player)
    if (not player or not isElement(player)) then return end
    local account = getPlayerAccount(player)
    if (account and not isGuestAccount(account)) then
        local stats = ""
        for stat=69, 81 do
            local value = getPedStat(player, stat)
            stats = stats ..",".. stat ..";".. value
        end
        setAccountData(account, "weaponStats", stats)
        for stat=21, 24 do
            local value = getPedStat(player, stat)
            stats = stats ..",".. stat ..";".. value
        end
        setAccountData(account, "playerStats", stats)
    end
end
addEventHandler("onPlayerQuit",root,function () saveWeaponStats(source) end)
 
function loadWeaponStats(player)
    if (not player or not isElement(player)) then return end
    local account = getPlayerAccount(player)
    if (account and not isGuestAccount(account)) then
        local statsData = getAccountData(account,"weaponStats")
        local stats = split(statsData, ",")
        for k, v in ipairs(stats) do
            local stat = split(v, ";")
            setPedStat(player, tonumber(stat[1]), tonumber(stat[2]))
        end
        local statsData = getAccountData(account,"playerStats")
        local stats = split(statsData, ",")
        for k, v in ipairs(stats) do
            local stat = split(v, ";")
            setPedStat(player, tonumber(stat[1]), tonumber(stat[2]))
        end
    end
end
addEventHandler("onPlayerLogin",root,function () loadWeaponStats(source) end)

--[[
original script by Justus (GA_Justus)
--]]

function saveClothes()
    local account = getPlayerAccount(source)
    if ( not isGuestAccount(account) ) and ( getElementModel(source) == 0 ) then
        local texture = {}
        local model = {}
        for i=0, 17, 1 do
            local clothesTexture, clothesModel = getPedClothes(source, i)
            if ( clothesTexture ~= false ) then
                table.insert(texture, clothesTexture)
                table.insert(model, clothesModel)
            else
                table.insert(texture, " ")
                table.insert(model, " ")
            end 
        end
        local allTextures = table.concat(texture, ",")
        local allModels = table.concat(model, ",")
        outputDebugString("Clothessaver: Saved clothes")
        setAccountData(account, "Clothessaver:Texture", allTextures)
        setAccountData(account, "Clothessaver:Model", allModels)
        texture = {}
        model = {}
    end
end
addEventHandler("onPlayerQuit", getRootElement(), saveClothes)
addEventHandler ( 'onPlayerLogout', root,saveClothes)

function setClothes()
    local account = getPlayerAccount(source)
    if ( not isGuestAccount(account) ) then
        local textureString = getAccountData(account, "Clothessaver:Texture")
        local modelString = getAccountData(account, "Clothessaver:Model")
        local textures = split(textureString, 44)
        local models = split(modelString, 44)
        for i=0, 17, 1 do
        if ( textures[i+1] ~= " " or textures[i+1] ~= nil ) then
                addPedClothes(source, textures[i+1], models[i+1], i)
            end
        end
        outputChatBox("Clothes were added by clothessaver", source, 0, 255, 0)
        textures = {}
        models = {}
    end
end
addEventHandler("onPlayerLogin", getRootElement(), setClothes)
