
local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,720
local x, y = (screenW/resW), (screenH/resH)


local font2 = dxCreateFont('files/fonts/font2.ttf', 10, false);
local font = dxCreateFont("files/fonts/font2.ttf", 9)
local font3 = dxCreateFont("files/fonts/OpenSans-Bold.ttf", 30)

function CroakDes()
    if (not isPlayerMapVisible()) then
        local money = convertNumber(getPlayerMoney(getLocalPlayer()))
        local bank = convertNumber(getElementData(localPlayer, "TS:Bancobb") or "0")
        local job = getElementData(getLocalPlayer(), "Emprego") or "Desempregado"
        local ID = getElementData(getLocalPlayer(), "ID") or "N/A"
        local moneysujo = getElementData(getLocalPlayer(), "Dinheiro Sujo") or 0	
        local level = getElementData(getLocalPlayer(), "Level") or 0
        local fome = getElementData(getLocalPlayer(), "hunger") or 100
        local sede = getElementData(getLocalPlayer(), "sede") or 100
        local nameplz = getPlayerName(getLocalPlayer())
        local colete = math.floor(getPedArmor(getLocalPlayer()))
        local nameplz = getPlayerName(getLocalPlayer())
        local jogadores = #getElementsByType("player")
        local time = getRealTime()
        local hours = time.hour
        local minutes = time.minute
        local seconds = time.second        
        if (hours >= 0 and hours < 10) then
            hours = "0"..time.hour
        end
        if (minutes >= 0 and minutes < 10) then
            minutes = "0"..time.minute
        end
        if (seconds >= 0 and seconds < 10) then
            seconds = "0"..time.second
        end
        local meses = {"01", "02", "03", "04", "05", "06",  "07", "08", "09", "10", "11", "12"}
        local dias = {"Domingo", "Segunda Feira", "Terça Feira", "Quarta Feira", "Quinta Feira", "Sexita Feira", "Sabado"}
        local dia = ("%02d"):format(time.monthday)
        local ano = ("%02d"):format(time.year + 1900)
        local diaa = dias[time.weekday + 1]
        local mes = meses[time.month + 1]
        local bank = convertNumber(getElementData(localPlayer, "TS:Bancobb") or "0")
    
        dxDrawRectangle(screenW * 0.7430, screenH * 0.2500, screenW * 0.2492, screenH * 0.5431, tocolor(0, 0, 0, 129), false)
        dxDrawRectangle(screenW * 0.7477, screenH * 0.2569, screenW * 0.2398, screenH * 0.5278, tocolor(0, 0, 0, 129), false)
        dxDrawRectangle(screenW * 0.7484, screenH * 0.2569, screenW * 0.2391, screenH * 0.0528, tocolor(0, 0, 0, 188), false)
        dxDrawText("INFORMAÇÕES", (screenW * 0.7922) - 1, (screenH * 0.2639) - 1, (screenW * 1.0320) - 1, (screenH * 0.3181) - 1, tocolor(0, 0, 0, 0), 2.00, "arial", "left", "top", false, false, false, false, false)
        dxDrawText("INFORMAÇÕES", (screenW * 0.7922) + 1, (screenH * 0.2639) - 1, (screenW * 1.0320) + 1, (screenH * 0.3181) - 1, tocolor(0, 0, 0, 0), 2.00, "arial", "left", "top", false, false, false, false, false)
        dxDrawText("INFORMAÇÕES", (screenW * 0.7922) - 1, (screenH * 0.2639) + 1, (screenW * 1.0320) - 1, (screenH * 0.3181) + 1, tocolor(0, 0, 0, 0), 2.00, "arial", "left", "top", false, false, false, false, false)
        dxDrawText("INFORMAÇÕES", (screenW * 0.7922) + 1, (screenH * 0.2639) + 1, (screenW * 1.0320) + 1, (screenH * 0.3181) + 1, tocolor(0, 0, 0, 0), 2.00, "arial", "left", "top", false, false, false, false, false)
        dxDrawText("INFORMAÇÕES", screenW * 0.7922, screenH * 0.2639, screenW * 1.0320, screenH * 0.3181, tocolor(0, 0, 255, 255), 2.00, "arial", "left", "top", false, false, false, false, false)
        dxDrawImage(screenW * 0.8281, screenH * 0.3181, screenW * 0.0773, screenH * 0.1208, ":[Lest]DeshBord/user2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine(screenW * 0.7625, screenH * 0.4514, screenW * 0.9711, screenH * 0.4514, tocolor(0, 0, 255, 255), 2, false)
        dxDrawText("Dinheiro Na Mão: "..money.."", screenW * 0.7578, screenH * 0.4681, screenW * 0.8586, screenH * 0.4931, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Dinheiro No Banco: "..bank.."", screenW * 0.7578, screenH * 0.5069, screenW * 0.8586, screenH * 0.5319, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Dinheiro Sujo: "..moneysujo.."", screenW * 0.7578, screenH * 0.5458, screenW * 0.8586, screenH * 0.5708, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Passaporte: "..ID.."", screenW * 0.7578, screenH * 0.5847, screenW * 0.8586, screenH * 0.6097, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Seu Level: "..level.."", screenW * 0.7578, screenH * 0.6236, screenW * 0.8586, screenH * 0.6486, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Seu Emprego: "..job.."", screenW * 0.7578, screenH * 0.6625, screenW * 0.8586, screenH * 0.6875, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Sua Fome: "..fome.."%", screenW * 0.7578, screenH * 0.7069, screenW * 0.8586, screenH * 0.7319, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Sua Sede: "..sede.."%", screenW * 0.7578, screenH * 0.7458, screenW * 0.8586, screenH * 0.7708, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

    end
end

local isDXVisible = false
bindKey ("TAB", "both", function()
    if isDXVisible then
        removeEventHandler( "onClientRender", root, CroakDes )
        showChat(true)
    else
        addEventHandler( "onClientRender", root, CroakDes )
        showChat(false)
        
    end
    isDXVisible = not isDXVisible
end)
function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end


local screenWidth,screenHeight = guiGetScreenSize()
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        myScreenSource = dxCreateScreenSource ( screenWidth, screenHeight )         
    end
)