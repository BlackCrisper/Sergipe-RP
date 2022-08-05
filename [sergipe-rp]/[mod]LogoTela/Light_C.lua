--[[

    ::::::::  :::::::::   ::::::::::      :::     :::    ::: 
    :+:    :+: :+:    :+: :+:    :+:   :+: :+:   :+:   :+:  
    +:+        +:+    +:+ +:+    +:+  +:+   +:+  +:+  +:+   
    +#+        +#++:++#:  +#+    +:+ +#++:++#++: +#++:++    
    +#+        +#+    +#+ +#+    +#+ +#+     +#+ +#+  +#+   
    #+#    #+# #+#    #+# #+#    #+# #+#     #+# #+#   #+#  
    ########  ###    ###  ##########  ###     ### ###    ### 

      ❖ Scritp Por Croak ❖

      » Script Para Tutorial
      » Script Livre E Descompilado
      » https://www.youtube.com/channel/UCT8F2daj8p_9OKwR46R2qQA 

      ❖ Discord: C R 0 4 K#6666 

]]

local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,720
local x, y = (screenW/resW), (screenH/resH)
local components = { "area_name", "radio", "vehicle_name" }

function CroakHud ( ... )
    if (not isPlayerMapVisible()) then

        local Dinheiro = getPlayerMoney(localPlayer)
        local Banco = getElementData(localPlayer, "Bank:Caixa") or "0"
        local muniarma = getPedAmmoInClip (localPlayer)
        local munitotal = getPedTotalAmmo (localPlayer)
        local vida = math.floor(getElementHealth(getLocalPlayer()))
        local colete = math.floor(getPedArmor(getLocalPlayer()))
        local fome = getElementData(getLocalPlayer(), "fome") or 100
        local sede = getElementData(getLocalPlayer(), "sede") or 100

        dxDrawImage(screenW * 0.4451, screenH * 0.0000, screenW * 0.1014, screenH * 0.1656, "files/Icons/Logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)



    end
end



function setHud()
    addEventHandler("onClientRender", getRootElement(), CroakHud)
    setPlayerHudComponentVisible("armour", false)
    setPlayerHudComponentVisible("wanted", false)
    setPlayerHudComponentVisible("weapon", false)
    setPlayerHudComponentVisible("money", false)
    setPlayerHudComponentVisible("health", false)
    setPlayerHudComponentVisible("clock", false)
    setPlayerHudComponentVisible("breath", false)
    setPlayerHudComponentVisible("ammo", false)

    for _, component in ipairs( components ) do
        setPlayerHudComponentVisible( component, false )
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), setHud)

function removeHud()
    setPlayerHudComponentVisible("armour", true)
    setPlayerHudComponentVisible("wanted", true)
    setPlayerHudComponentVisible("weapon", true)
    setPlayerHudComponentVisible("money", true)
    setPlayerHudComponentVisible("health", true)
    setPlayerHudComponentVisible("clock", true)
    setPlayerHudComponentVisible("breath", true)
    setPlayerHudComponentVisible("ammo", true)
end
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), removeHud)