--[[

		:::::::::: :::::::::      :::         :::      ::::::::  :::    ::: :::::::::            
		:+:        :+:    :+:   :+: :+:     :+: :+:   :+:    :+: :+:    :+:      :+:             
		+:+        +:+    +:+  +:+   +:+   +:+   +:+  +:+        +:+    +:+     +:+              
		:#::+::#   +#++:++#:  +#++:++#++: +#++:++#++: +#+        +#++:++#++    +#+               
		+#+        +#+    +#+ +#+     +#+ +#+     +#+ +#+        +#+    +#+   +#+                
		#+#        #+#    #+# #+#     #+# #+#     #+# #+#    #+# #+#    #+#  #+#                 
		###        ###    ### ###     ### ###     ###  ########  ###    ### ######### ########## 

                                    » CopyRight © 2020
                            » Script feito por » Fraachz_#9999

]]--

local components = {"area_name", "radio", "vehicle_name"}

local screenW,screenH = guiGetScreenSize()
local iStartTick = getTickCount()
local iFrames = 0 
local iFPS = 0 

function GetFPS()
     return iFPS
end
addEventHandler( "onClientRender", root,function()       
local ping = getPlayerPing(getLocalPlayer())
iFrames = iFrames + 1
if getTickCount() - iStartTick >= 1000 then
    iFPS = iFrames
    iFrames = 0
    iStartTick = getTickCount()
end

local time = getRealTime()
local hours = time.hour
local minutes = time.minute
local seconds = time.second
local dia = time.monthday
local mes = time.month
    if (hours >= 0 and hours < 10) then
        hours = "0"..time.hour
    end
    if (minutes >= 0 and minutes < 10) then
        minutes = "0"..time.minute
    end
    if (seconds >= 0 and seconds < 10) then
        seconds = "0"..time.second
    end
    --dxDrawText("FPS: "..GetFPS().." | Hora: "..hours..":"..minutes.." pm", screenW * 0.8640, screenH * 0.2526, screenW * 0.9890, screenH * 0.2799, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
end)

function formatNumber(number) 
    while true do      
        number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1,%2')    
        if k==0 then      
            break   
        end  
    end  
    return number
end

function FraachzHud()
local time = getRealTime()
local hours = time.hour
local minutes = time.minute
local seconds = time.second
local dia = time.monthday
local mes = time.month
    if (hours >= 0 and hours < 10) then
        hours = "0"..time.hour
    end
    if (minutes >= 0 and minutes < 10) then
        minutes = "0"..time.minute
    end
    if (seconds >= 0 and seconds < 10) then
        seconds = "0"..time.second
    end

    local formattedTime = string.format("%02d/%02d/2020", dia, mes + 1)

    local ID = getElementData(getLocalPlayer(), "ID") or "N/A"
    local Level = getElementData(localPlayer,"Level") or 0
    local EXP = (getElementData(localPlayer,"LSys:EXP") or 0)

    local vida_data = math.floor(getElementHealth(localPlayer))
    local colete_data = math.floor(getPedArmor(localPlayer))
    local fome_data = getElementData(localPlayer, FOME_DATA) or 100
    local sede_data = getElementData(localPlayer, SEDE_DATA) or 100

    local weapon = getPedWeapon(getLocalPlayer())
	local weaponClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
    local weaponSlot = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
    local money = formatNumber(getPlayerMoney(localPlayer))

    dxDrawImage(screenW * 0.8985, screenH * 0.0000, screenW * 0.0846, screenH * 0.1380, "files/IMGs/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.1445) - 1, (screenW * 0.8985) - 1, screenH * 0.1589, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.1445) - 1, (screenW * 0.8985) - 1, (screenH * 0.1445) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.1589, screenW * 0.9831, screenH * 0.1589, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.1589, screenW * 0.9831, (screenH * 0.1445) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.1445, screenW * 0.0846, screenH * 0.0143, tocolor(255, 255, 255, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.1445) - 1, (screenW * 0.8985) - 1, screenH * 0.1589, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.1445) - 1, (screenW * 0.8985) - 1, (screenH * 0.1445) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.1589, screenW * 0.9831, screenH * 0.1589, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.1589, screenW * 0.9831, (screenH * 0.1445) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.1445, screenW * 0.0846 * vida_data/100, screenH * 0.0143, tocolor(215, 0, 0, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.1654) - 1, (screenW * 0.8985) - 1, screenH * 0.1797, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.1654) - 1, (screenW * 0.8985) - 1, (screenH * 0.1654) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.1797, screenW * 0.9831, screenH * 0.1797, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.1797, screenW * 0.9831, (screenH * 0.1654) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.1654, screenW * 0.0846, screenH * 0.0143, tocolor(255, 255, 255, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.1654) - 1, (screenW * 0.8985) - 1, screenH * 0.1797, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.1654) - 1, (screenW * 0.8985) - 1, (screenH * 0.1654) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.1797, screenW * 0.9831, screenH * 0.1797, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.1797, screenW * 0.9831, (screenH * 0.1654) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.1654, screenW * 0.0846 * colete_data/100, screenH * 0.0143, tocolor(120, 120, 120, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.1862) - 1, (screenW * 0.8985) - 1, screenH * 0.2005, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.1862) - 1, (screenW * 0.8985) - 1, (screenH * 0.1862) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.2005, screenW * 0.9831, screenH * 0.2005, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.2005, screenW * 0.9831, (screenH * 0.1862) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.1862, screenW * 0.0846, screenH * 0.0143, tocolor(255, 255, 255, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.2070) - 1, (screenW * 0.8985) - 1, screenH * 0.2214, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.2070) - 1, (screenW * 0.8985) - 1, (screenH * 0.2070) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.2214, screenW * 0.9831, screenH * 0.2214, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.2214, screenW * 0.9831, (screenH * 0.2070) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.2070, screenW * 0.0846, screenH * 0.0143, tocolor(255, 255, 255, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.1862) - 1, (screenW * 0.8985) - 1, screenH * 0.2005, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.1862) - 1, (screenW * 0.8985) - 1, (screenH * 0.1862) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.2005, screenW * 0.9831, screenH * 0.2005, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.2005, screenW * 0.9831, (screenH * 0.1862) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.1862, screenW * 0.0846 * fome_data/100, screenH * 0.0143, tocolor(239, 104, 23, 255), false)
    dxDrawLine((screenW * 0.8985) - 1, (screenH * 0.2070) - 1, (screenW * 0.8985) - 1, screenH * 0.2214, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, (screenH * 0.2070) - 1, (screenW * 0.8985) - 1, (screenH * 0.2070) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine((screenW * 0.8985) - 1, screenH * 0.2214, screenW * 0.9831, screenH * 0.2214, tocolor(0, 0, 0, 255), 1, false)
    dxDrawLine(screenW * 0.9831, screenH * 0.2214, screenW * 0.9831, (screenH * 0.2070) - 1, tocolor(0, 0, 0, 255), 1, false)
    dxDrawRectangle(screenW * 0.8985, screenH * 0.2070, screenW * 0.0846 * sede_data/100, screenH * 0.0143, tocolor(4, 176, 226, 255), false)
    dxDrawText("ID: "..ID.." | Level: "..Level.." | EXP: "..EXP.."\nHorário: "..hours..":"..minutes.." PM", screenW * 0.8985, screenH * 0.2409, screenW * 0.9831, screenH * 0.2591, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText("R$ "..money, (screenW * 0.8949) - 1, (screenH * 0.2773) - 1, (screenW * 0.9794) - 1, (screenH * 0.3073) - 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("R$ "..money, (screenW * 0.8949) + 1, (screenH * 0.2773) - 1, (screenW * 0.9794) + 1, (screenH * 0.3073) - 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("R$ "..money, (screenW * 0.8949) - 1, (screenH * 0.2773) + 1, (screenW * 0.9794) - 1, (screenH * 0.3073) + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("R$ "..money, (screenW * 0.8949) + 1, (screenH * 0.2773) + 1, (screenW * 0.9794) + 1, (screenH * 0.3073) + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("R$ "..money, screenW * 0.8949, screenH * 0.2773, screenW * 0.9794, screenH * 0.3073, tocolor(40, 142, 62, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Vida", screenW * 0.8640, screenH * 0.1432, screenW * 0.8985, screenH * 0.1589, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Colete", screenW * 0.8640, screenH * 0.1641, screenW * 0.8985, screenH * 0.1797, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Fome", screenW * 0.8640, screenH * 0.1862, screenW * 0.8985, screenH * 0.2018, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Sede", screenW * 0.8640, screenH * 0.2057, screenW * 0.8985, screenH * 0.2214, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)

    dxDrawImage(screenW * 0.7779, screenH * 0.0130, screenW * 0.1059, screenH * 0.0729, "files/IMGs/"..weapon..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText(weaponClip.." / "..weaponSlot, screenW * 0.8191, screenH * 0.0859, screenW * 0.8838, screenH * 0.1094, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)

    if getPlayerWantedLevel(localPlayer) == 1 then
        dxDrawImage(screenW * 0.8846, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getPlayerWantedLevel(localPlayer) == 2 then
        dxDrawImage(screenW * 0.8846, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9022, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getPlayerWantedLevel(localPlayer) == 3 then
        dxDrawImage(screenW * 0.8846, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9022, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9199, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getPlayerWantedLevel(localPlayer) == 4 then
        dxDrawImage(screenW * 0.8846, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9022, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9199, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9375, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getPlayerWantedLevel(localPlayer) == 5 then
        dxDrawImage(screenW * 0.8846, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9022, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9199, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9375, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9551, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getPlayerWantedLevel(localPlayer) == 6 then
        dxDrawImage(screenW * 0.8846, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9022, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9199, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9375, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9551, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.9728, screenH * 0.3203, screenW * 0.0176, screenH * 0.0313, "files/IMGs/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
end

function setHud()
    addEventHandler("onClientRender", getRootElement(), FraachzHud)
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