


--[[
███████╗███████╗███████╗██████╗     ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗██████╗
╚══███╔╝██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
  ███╔╝ █████╗  █████╗  ██║  ██║    ███████╗██║     ██████╔╝██║██████╔╝   ██║   █████╗  ██████╔╝
 ███╔╝  ██╔══╝  ██╔══╝  ██║  ██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ██╔══╝  ██╔══██╗
███████╗███████╗███████╗██████╔╝    ███████║╚██████╗██║  ██║██║██║        ██║   ███████╗██║  ██║
╚══════╝╚══════╝╚══════╝╚═════╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝╚═╝  ╚═╝
--]]



local screenW, screenH = guiGetScreenSize()
local x, y =  (screenW/1366), (screenH/768)

local FONTE_01 = dxCreateFont("Files/FONTE.ttf", 12)
local FONTE_02 = dxCreateFont("Files/FONTE.ttf", 11)

local Zeed_Mensagem_Tela1 = false
local Zeed_Mensagem_Tempo1 = false

function Mensagem_Tempo1 ()
    local timer = interpolateBetween(1000, 0, 0, 0, 0, 0, (getTickCount()-tick)/1000/Tempo_Assaltar_Loja, "Linear")	
    local minutes, seconds = convertTime(timer*Tempo_Assaltar_Loja)
    dxDrawText("RESTAM "..minutes..":"..seconds.." PARA TERMINAR", (screenW * 0.4180) - 1, (screenH * 0.9323) - 1, (screenW * 0.5820) - 1, (screenH * 0.9648) - 1, tocolor(0, 0, 0, 255), 1.00, FONTE_02, "center", "center", false, false, false, true, false)
    dxDrawText("RESTAM "..minutes..":"..seconds.." PARA TERMINAR", (screenW * 0.4180) + 1, (screenH * 0.9323) - 1, (screenW * 0.5820) + 1, (screenH * 0.9648) - 1, tocolor(0, 0, 0, 255), 1.00, FONTE_02, "center", "center", false, false, false, true, false)
    dxDrawText("RESTAM "..minutes..":"..seconds.." PARA TERMINAR", (screenW * 0.4180) - 1, (screenH * 0.9323) + 1, (screenW * 0.5820) - 1, (screenH * 0.9648) + 1, tocolor(0, 0, 0, 255), 1.00, FONTE_02, "center", "center", false, false, false, true, false)
    dxDrawText("RESTAM "..minutes..":"..seconds.." PARA TERMINAR", (screenW * 0.4180) + 1, (screenH * 0.9323) + 1, (screenW * 0.5820) + 1, (screenH * 0.9648) + 1, tocolor(0, 0, 0, 255), 1.00, FONTE_02, "center", "center", false, false, false, true, false)
    dxDrawText("RESTAM #2f4f2f"..minutes.."#ffffff:#2f4f2f"..seconds.." #ffffffPARA TERMINAR", screenW * 0.4180, screenH * 0.9323, screenW * 0.5820, screenH * 0.9648, tocolor(255, 255, 255, 255), 1.00, FONTE_02, "center", "center", false, false, false, true, false)
end

function Mensagem_Tela_Assalto1 ()
	local Tecla = (Tecla_Assalto)
    dxDrawText("PRESSIONE ["..Tecla.."] PARA INICIAR O ROUBO", (screenW * 0.4180) - 1, (screenH * 0.9323) - 1, (screenW * 0.5820) - 1, (screenH * 1.0099) - 1, tocolor(0, 0, 0, 255), 1.00, FONTE_01, "center", "center", false, false, false, true, false)
    dxDrawText("PRESSIONE ["..Tecla.."] PARA INICIAR O ROUBO", (screenW * 0.4180) + 1, (screenH * 0.9323) - 1, (screenW * 0.5820) + 1, (screenH * 1.0099) - 1, tocolor(0, 0, 0, 255), 1.00, FONTE_01, "center", "center", false, false, false, true, false)
    dxDrawText("PRESSIONE ["..Tecla.."] PARA INICIAR O ROUBO", (screenW * 0.4180) - 1, (screenH * 0.9323) + 1, (screenW * 0.5820) - 1, (screenH * 1.0099) + 1, tocolor(0, 0, 0, 255), 1.00, FONTE_01, "center", "center", false, false, false, true, false)
    dxDrawText("PRESSIONE ["..Tecla.."] PARA INICIAR O ROUBO", (screenW * 0.4180) + 1, (screenH * 0.9323) + 1, (screenW * 0.5820) + 1, (screenH * 1.0099) + 1, tocolor(0, 0, 0, 255), 1.00, FONTE_01, "center", "center", false, false, false, true, false)
    dxDrawText("#ffffffPRESSIONE [#ff0000"..Tecla.."#ffffff] PARA INICIAR O ROUBO", screenW * 0.4180, screenH * 0.9323, screenW * 0.5820, screenH * 1.0099, tocolor(255, 255, 255, 255), 1.00, FONTE_01, "center", "center", false, false, false, true, false)
end

---------------------/ ABRIR MENSAGEM \---------------------

function Abrir_Mensagem1 ()
	if Zeed_Mensagem_Tela1 == false then
		addEventHandler( "onClientRender", root, Mensagem_Tela_Assalto1 )
		Zeed_Mensagem_Tela1 = true
	else
		removeEventHandler( "onClientRender", root, Mensagem_Tela_Assalto1 )
		Zeed_Mensagem_Tela1 = false
	end
end
addEvent("Zeed_Mensagem_Assalto1", true)
addEventHandler("Zeed_Mensagem_Assalto1", getRootElement(), Abrir_Mensagem1)

----------------/ MENSAGEM - TEMPO \----------------

function Abrir_Mensagem_Tempo1 ()
	if Zeed_Mensagem_Tempo1 == false then
		addEventHandler( "onClientRender", root, Mensagem_Tempo1 )
		Zeed_Mensagem_Tempo1 = true
		tick = getTickCount()
	else
		removeEventHandler( "onClientRender", root, Mensagem_Tempo1 )
		Zeed_Mensagem_Tempo1 = false
		tick = getTickCount()
	end
end
addEvent("Zeed_Mensagem_Tempo1", true)
addEventHandler("Zeed_Mensagem_Tempo1", getRootElement(), Abrir_Mensagem_Tempo1)

function Restart ()
	Zeed_Mensagem_Tempo1 = false
	Zeed_Mensagem_Tela1 = false
	removeEventHandler( "onClientRender", root, Mensagem_Tempo1 )
	removeEventHandler( "onClientRender", root, Mensagem_Tela_Assalto1 )
end
addEventHandler("onClientResourceStart", getRootElement(), Restart)

----------------/ TIME - LINE \----------------

function convertTime(ms)
    local min = math.floor( ms/60000 )
    local sec = math.floor( (ms/1000)%60 )
    return min, sec 
end
