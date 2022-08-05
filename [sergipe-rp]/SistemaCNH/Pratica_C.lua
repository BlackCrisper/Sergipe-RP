--[[

--]]

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/font.ttf", x*12)
local Font_2 = dxCreateFont("font/font1.ttf", x*11)
local Font_3 = dxCreateFont("font/fontNick.ttf", x*10)
local Font_4 = dxCreateFont("font/OpenSans-Bold.ttf", x*13)
local Font_5 = dxCreateFont("font/OpenSans-Bold.ttf", x*11)
local Font_6 = dxCreateFont("font/OpenSans-Bold.ttf", x*15)
local Font_7 = dxCreateFont("font/fontNick.ttf", x*13)

function getTimeLeft(timer)
  if isTimer(timer) then
    local ms = getTimerDetails(timer)
    local m = math.floor(ms/70000)
    local s = math.floor((ms-m*70000)/1000)
    if m < 10 then m = "0"..m end
    if s < 10 then s = "0"..s end
    return m..":"..s
 end
end

--[[
         ><><><><><><><><><><><><><><><
         ><       Abrir/Fechar       ><
         ><><><><><><><><><><><><><><><
--]]
function Abrir_Categorias ()
if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Categorias) then return end
addEventHandler("onClientRender", root, Dx_Categorias)
showCursor(true)
showChat(false)
end
addEvent("DNL:AbrirCategorias", true)
addEventHandler("DNL:AbrirCategorias", root, Abrir_Categorias)

function Fechar_Categorias ()
  if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Categorias) then  
     removeEventHandler("onClientRender", root, Dx_Categorias)
     showCursor(false)
     showChat(true)
  end
end
addEvent("DNL:FecharCategorias", true)
addEventHandler("DNL:FecharCategorias", root, Fechar_Categorias)


function Dx_Categorias ()
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*395, y*210, x*577, y*330, tocolor(210, 210, 210, 255), false)
        dxDrawRectangle(x*395, y*210, x*577, y*58, tocolor(193, 193, 193, 255), false)
		contornoRetangulo(x*395, y*210, x*577, y*330, tocolor(0, 0, 0, 72), x*1) -- Line enfeite
        dxDrawLine(x*395, y*268, x*971, y*268, tocolor(0, 0, 0, 72), x*1, false) -- Line Enfeite
        dxDrawText("Categorias", x*652, y*228, x*732, y*250, tocolor(139, 139, 139, 255), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("X", x*945, y*228, x*732, y*250, CorSair, x*1.00, Font_4, "left", "top", false, false, false, false, false)
		CorSair = tocolor(139, 139, 139, 255)
	 if isCursorOnElement(x*945, y*228, x*17, y*17) then
		CorSair = tocolor(255, 0, 0, 255)
	 end
		

	if getElementData(localPlayer, "Categoria") == "A" then		
        dxDrawRectangle(x*395, y*269, x*577, y*46, tocolor(0, 0, 0, 60), false)
	end
		
	if getElementData(localPlayer, "Categoria") == "B" then		
        dxDrawRectangle(x*395, y*315, x*577, y*46, tocolor(0, 0, 0, 60), false)
	end
		
	if getElementData(localPlayer, "Categoria") == "C" then		
        dxDrawRectangle(x*395, y*361, x*577, y*46, tocolor(0, 0, 0, 60), false)
	end
		
	if getElementData(localPlayer, "Categoria") == "D" then		
        dxDrawRectangle(x*395, y*407, x*577, y*46, tocolor(0, 0, 0, 60), false)
	end

        dxDrawImage(x*404, y*264, x*57, y*57, "Img/Moto.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
        dxDrawImage(x*404, y*310, x*57, y*57, "Img/Carro.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
        dxDrawImage(x*404, y*354, x*57, y*57, "Img/Caminhao.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
        dxDrawImage(x*402, y*400, x*57, y*57, "Img/Carreta.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
		
        dxDrawText("Categoria (A)", x*467, y*282, x*554, y*301, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Categoria (B)", x*467, y*328, x*554, y*347, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Categoria (C)", x*467, y*373, x*554, y*392, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Categoria (D)", x*467, y*420, x*554, y*439, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
        dxDrawText("R$800", x*891, y*282, x*952, y*301, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("R$2200", x*891, y*328, x*952, y*301, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("R$1200", x*891, y*373, x*952, y*301, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("R$3500", x*891, y*420, x*952, y*301, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
        dxDrawImage(x*570, y*477, x*228, y*48, "Img/botao2.png", 0, 0, 0, CorTeste, false)
        dxDrawText("Fazer Teste", x*648, y*491, x*724, y*510, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		CorTeste = tocolor(140, 140, 140, 195)
	 if isCursorOnElement(x*570, y*477, x*228, y*48) then
		CorTeste = tocolor(130, 130, 130, 255)
	 end
end

function Dx_Praticando ()
  local Veiculo = getPedOccupiedVehicle(localPlayer)    
  if ( getElementHealth( Veiculo ) >= 1000 ) then
    Life = 100
  else
    Life = math.floor(getElementHealth( Veiculo )/10)
  end	
        exports["Blur"]:dxDrawBluredRectangle(x*519, y*608, x*328, y*140, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*519, y*608, x*328, y*140, tocolor(0, 0, 0, 160), false) -- Fundo 
        dxDrawLine(x*519, y*610, x*847, y*610, tocolor(0, 255, 0, 255), x*4, false) -- Line Enfeite
        dxDrawText("Tempo", x*656, y*620, x*716, y*644, tocolor(255, 255, 255, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Life Veiculo", x*652, y*678, x*719, y*692, tocolor(255, 255, 255, 255), x*1.00, Font_3, "left", "top", false, false, false, false, false)
        dxDrawRectangle(x*573, y*696, x*220, y*42, tocolor(0, 0, 0, 160), false)
        dxDrawRectangle(x*573, y*696, x*220/100*Life, y*42, tocolor(0, 255, 0, 160), false)  
	
	if getElementData(localPlayer, "Categoria") == "A" then
        dxDrawText(""..getTimeLeft(Tempo_Moto[localPlayer]).."", x*665, y*645, x*704, y*668, tocolor(0, 255, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)      
		dxDrawText(""..Life.."", x*669, y*705, x*719, y*692, tocolor(255, 255, 255, 255), x*1.00, Font_7, "left", "top", false, false, false, false, false)	

	elseif getElementData(localPlayer, "Categoria") == "B" then
        dxDrawText(""..getTimeLeft(Tempo_Carro[localPlayer]).."", x*665, y*645, x*704, y*668, tocolor(0, 255, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)      
		dxDrawText(""..Life.."", x*669, y*705, x*719, y*692, tocolor(255, 255, 255, 255), x*1.00, Font_7, "left", "top", false, false, false, false, false)

	elseif getElementData(localPlayer, "Categoria") == "C" then
        dxDrawText(""..getTimeLeft(Tempo_Caminhao[localPlayer]).."", x*665, y*645, x*704, y*668, tocolor(0, 255, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)      
		dxDrawText(""..Life.."", x*669, y*705, x*719, y*692, tocolor(255, 255, 255, 255), x*1.00, Font_7, "left", "top", false, false, false, false, false)
	
	elseif getElementData(localPlayer, "Categoria") == "D" then
        dxDrawText(""..getTimeLeft(Tempo_Carreta[localPlayer]).."", x*665, y*645, x*704, y*668, tocolor(0, 255, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)      
		dxDrawText(""..Life.."", x*669, y*705, x*719, y*692, tocolor(255, 255, 255, 255), x*1.00, Font_7, "left", "top", false, false, false, false, false)
	end
	
end

Tempo_Moto = {}
Tempo_Carro = {}
Tempo_Caminhao = {}
Tempo_Carreta = {}

--[[
         ><><><><><><><><><><><><><><><
         ><        Tempo_Moto       ><
         ><><><><><><><><><><><><><><><
--]]
function Tempo_MotoC ()    
	setPedCanBeKnockedOffBike ( localPlayer, false )
	addEventHandler("onClientRender", root, Dx_Praticando)
    Tempo_Moto[localPlayer] = setTimer(function()
	    triggerServerEvent("DNL:Tempo(Moto)", localPlayer) 
	    removeEventHandler("onClientRender", root, Dx_Praticando)
	    setPedCanBeKnockedOffBike ( localPlayer, true )
    end, 124000, 1)  
end
addEvent("DNL:TempoC(Moto)", true)
addEventHandler("DNL:TempoC(Moto)", root, Tempo_MotoC)

function SucessidoMoto ()	
    if isTimer(Tempo_Moto[localPlayer]) then
		killTimer(Tempo_Moto[localPlayer])
	    removeEventHandler("onClientRender", root, Dx_Praticando)
	    setPedCanBeKnockedOffBike ( localPlayer, true )
	end
end
addEvent("DNL:KillTimer(Moto)", true)
addEventHandler("DNL:KillTimer(Moto)", root, SucessidoMoto)

--[[
         ><><><><><><><><><><><><><><><
         ><        Tempo_Carro       ><
         ><><><><><><><><><><><><><><><
--]]
function Tempo_CarroC ()    
	addEventHandler("onClientRender", root, Dx_Praticando)
    Tempo_Carro[localPlayer] = setTimer(function()
	    triggerServerEvent("DNL:Tempo(Carro)", localPlayer) 
	    removeEventHandler("onClientRender", root, Dx_Praticando)
    end, 120000, 1)  
end
addEvent("DNL:TempoC(Carro)", true)
addEventHandler("DNL:TempoC(Carro)", root, Tempo_CarroC)

function SucessidoCarro ()	
    if isTimer(Tempo_Carro[localPlayer]) then
		killTimer(Tempo_Carro[localPlayer])
	    removeEventHandler("onClientRender", root, Dx_Praticando)
	end
end
addEvent("DNL:KillTimer(Carro)", true)
addEventHandler("DNL:KillTimer(Carro)", root, SucessidoCarro)

--[[
         ><><><><><><><><><><><><><><><
         ><      Tempo_Caminhao      ><
         ><><><><><><><><><><><><><><><
--]]
function Tempo_CaminhaosC ()    
	addEventHandler("onClientRender", root, Dx_Praticando)
    Tempo_Caminhao[localPlayer] = setTimer(function()
	    triggerServerEvent("DNL:Tempo(Caminhao)", localPlayer) 
	    removeEventHandler("onClientRender", root, Dx_Praticando)
    end, 125000, 1)  
end
addEvent("DNL:TempoC(Caminhao)", true)
addEventHandler("DNL:TempoC(Caminhao)", root, Tempo_CaminhaosC)

function SucessidoCaminhao ()	
    if isTimer(Tempo_Caminhao[localPlayer]) then
		killTimer(Tempo_Caminhao[localPlayer])
	    removeEventHandler("onClientRender", root, Dx_Praticando)
	end
end
addEvent("DNL:KillTimer(Caminhao)", true)
addEventHandler("DNL:KillTimer(Caminhao)", root, SucessidoCaminhao)

--[[
         ><><><><><><><><><><><><><><><
         ><      Tempo_Carreta       ><
         ><><><><><><><><><><><><><><><
--]]
function Tempo_CarretaC ()    
	addEventHandler("onClientRender", root, Dx_Praticando)
    Tempo_Carreta[localPlayer] = setTimer(function()
	    triggerServerEvent("DNL:Tempo(Carreta)", localPlayer) 
	    removeEventHandler("onClientRender", root, Dx_Praticando)
    end, 185000, 1)  
end
addEvent("DNL:TempoC(Carreta)", true)
addEventHandler("DNL:TempoC(Carreta)", root, Tempo_CarretaC)

function SucessidoCarreta ()	
    if isTimer(Tempo_Carreta[localPlayer]) then
		killTimer(Tempo_Carreta[localPlayer])
	    removeEventHandler("onClientRender", root, Dx_Praticando)
	end
end
addEvent("DNL:KillTimer(Carreta)", true)
addEventHandler("DNL:KillTimer(Carreta)", root, SucessidoCarreta)

--[[
         ><><><><><><><><><><><><><><><
         ><          CLICK'S         ><
         ><><><><><><><><><><><><><><><
--]]
function SelecionarCategorias ( _,state )
   if state == "down" then
   
 --[[
         ><><><><><><><><><><><><><><><
         ><   Selecionar Categoria   ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Categorias) then  
     if isCursorOnElement(x*945, y*228, x*17, y*17) then
	    Fechar_Categorias ()
	 end
	 
     if isCursorOnElement(x*395, y*269, x*577, y*46) then
	    setElementData(localPlayer, "Categoria", "A")
		
     elseif isCursorOnElement(x*395, y*315, x*577, y*46) then
	    setElementData(localPlayer, "Categoria", "B")
		
     elseif isCursorOnElement(x*395, y*361, x*577, y*46) then
	    setElementData(localPlayer, "Categoria", "C")
		
     elseif isCursorOnElement(x*395, y*407, x*577, y*46) then
	    setElementData(localPlayer, "Categoria", "D")
		
     elseif isCursorOnElement(x*570, y*477, x*228, y*48) then -- Fazer Teste
	        playSoundFrontEnd ( 2 )
		if getElementData(localPlayer, "Categoria") == "A" then
	        triggerServerEvent("DNL:Teste(Moto)", root, localPlayer) 
		
		elseif getElementData(localPlayer, "Categoria") == "B" then
	        triggerServerEvent("DNL:Teste(Carro)", root, localPlayer) 
		
		elseif getElementData(localPlayer, "Categoria") == "C" then
	        triggerServerEvent("DNL:Teste(Caminhao)", root, localPlayer) 
		
		elseif getElementData(localPlayer, "Categoria") == "D" then
	        triggerServerEvent("DNL:Teste(Carreta)", root, localPlayer) 
		end
		
     end
	 
    end
  end
end
addEventHandler ( "onClientClick", root, SelecionarCategorias )

--[[
         ><><><><><><><><><><><><><><><
         ><          IGNORA          ><
         ><><><><><><><><><><><><><><><
--]]
function secondsToTimeDesc( seconds )
	if seconds then
		local results = {}
		local sec = ( seconds %60 )
		local min = math.floor ( ( seconds % 3600 ) /60 )
		local hou = math.floor ( ( seconds % 86400 ) /3600 )
		local day = math.floor ( seconds /86400 )
		
		if day > 0 then table.insert( results, day .. ( day == 1 and " day" or " days" ) ) end
		if hou > 0 then table.insert( results, hou .. ( hou == 1 and " hour" or " hours" ) ) end
		if min > 0 then table.insert( results, min .. ( min == 1 and " minute" or " minutes" ) ) end
		if sec > 0 then table.insert( results, sec .. ( sec == 1 and " second" or " seconds" ) ) end
		
		return string.reverse ( table.concat ( results, ", " ):reverse():gsub(" ,", " dna ", 1 ) )
	end
	return ""
end

addEventHandler ( "onClientPlayerDamage",root,
function ()
    if getElementData(source,"DNL:TestePratico") then
        cancelEvent()
    end
end)

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text, x - 1, y, w - 1, h, color, scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y, w + 1, h, color, scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - 1, w, h - 1, color, scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + 1, w, h + 1, color, scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end

function contornoRetangulo(absX, absY, sizeX, sizeY, color, ancho)
	dxDrawRectangle(absX, absY, sizeX, ancho, color)
	dxDrawRectangle(absX, absY + ancho, ancho, sizeY - ancho, color)
	dxDrawRectangle(absX + ancho, absY + sizeY - ancho, sizeX - ancho, ancho, color)
	dxDrawRectangle(absX + sizeX - ancho, absY + ancho, ancho, sizeY - ancho*2, color)
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

local x,y = guiGetScreenSize()
function isCursorOnElement(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end
