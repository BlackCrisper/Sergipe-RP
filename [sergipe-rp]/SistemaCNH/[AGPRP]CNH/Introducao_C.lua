--[[

--]]

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/font.ttf", y*12)
local Font_2 = dxCreateFont("font/font1.ttf", y*11)
local Font_3 = dxCreateFont("font/fontNick.ttf", y*11)
local Font_4 = dxCreateFont("font/OpenSans-Bold.ttf", y*13)
local Font_5 = dxCreateFont("font/OpenSans-Bold.ttf", y*11)
--[[
         ><><><><><><><><><><><><><><><
         ><       Abrir/Fechar       ><
         ><><><><><><><><><><><><><><><
--]]
function Abrir_Carteira ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Inicio_Perguntas) then return end
	addEventHandler("onClientRender", root, Inicio_Perguntas)
	showCursor(true)
	showChat(false)
end
addEvent("DNL:AbrirIntrodução", true)
addEventHandler("DNL:AbrirIntrodução", root, Abrir_Carteira)

function Close_Carteira ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Inicio_Perguntas) then  
		removeEventHandler("onClientRender", root, Inicio_Perguntas)
		showCursor(false)
		showChat(true)
	end
end

tick = getTickCount()
function Inicio_Perguntas()
local posX2, posY2, posZ2 = interpolateBetween(264, 0, 0, 304, 153, 206, ((getTickCount() - tick) / 1500), "OutQuad")
local Text, Text2, Botao = interpolateBetween(100, 300, 319, 273, 500, 361, ((getTickCount() - tick) / 2000), "OutBounce")
local Text3 = interpolateBetween(319, 0, 0, 372, 0, 0, ((getTickCount() - tick) / 2000), "OutBounce")
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*378, y*264, x*611, y*41, tocolor(0, 0, 0, posZ2), false)
        dxDrawRectangle(x*378, y*posX2, x*611, y*117, tocolor(0, 0, 0, posY2), false)
        dxDrawLine(x*378, y*304, x*989, y*305, tocolor(0, 255, 0, 255), x*2, false)
        dxDrawText("Introdução Detran", x*619, y*Text, x*750, y*293, tocolor(255, 255, 255, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
        dxDrawText("Você está preparado para Ler a Introdução?", x*Text2, y*319, x*871, y*336, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)

 
        dxDrawImage(x*465, y*Botao, x*190, y*45, "Img/botao.png", 0, 0, 0, AceitarPer, false)
        dxDrawText("SIM", x*547, y*Text3, x*871, y*336, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)		
		AceitarPer = tocolor(0, 255, 0, 150)
    if isCursorOnElement ( x*465, y*361, x*190, y*45 ) then
		AceitarPer = tocolor(0, 255, 0, 255)
	end
		
        dxDrawImage(x*711, y*Botao, x*190, y*45, "Img/botao.png", 0, 0, 0, RecusarPer, false)
        dxDrawText("NÃO", x*788, y*Text3, x*871, y*336, tocolor(255, 255, 255, 255), 1.00, Font_4, "left", "top", false, false, false, false, false)
		RecusarPer = tocolor(255, 0, 0, 150)
    if isCursorOnElement ( x*711, y*361, x*190, y*45 ) then
		RecusarPer = tocolor(255, 0, 0, 255)
	end
end
--addEventHandler("onClientRender", root, Inicio_Perguntas)

function Dx_Introducao ()
local posX2, posY2, posZ2 = interpolateBetween(0, 0, 0, 255, 261, 346, ((getTickCount() - tick) / 2000), "OutQuad")
		exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*330, y*245, x*697, y*224, tocolor(35, 35, 35, posX2), false) -- Fundo 
        dxDrawRectangle(x*330, y*245, x*697, y*4, tocolor(0, 255, 0, posX2), false) -- Line Enfeite
        dxDrawText("Introdução do Detran", x*346, y*posY2, x*501, y*281, tocolor(0, 255, 0, posX2), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Teoria e prática são elementos importantes da instrução de condução.\nEsta instrução abrangerá os conceitos básicos e assegurará que esteja preparado com \ninformações e conhecimentos suficientes para o seu teste.\n\nAs informações de suas lições de teoria combinadas com a experiência de sua lição prática são\nvitais para negociar as situações e dilemas que você enfrentará na estrada.\n\nÉ altamente recomendável que você preste atenção em todos os detalhe, a maioria dessas questões\npode existir no seu teste de teoria.", x*posZ2, y*288, x*1011, y*456, tocolor(255, 255, 255, posX2), 1.00, Font_2, "left", "top", false, false, false, false, false)

		local Nit, Nit2 = interpolateBetween(0, 0, 0, 255, 200, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        dxDrawImage(x*422, y*482, x*512, y*41, "Img/botao2.png", 0, 0, 0, tocolor(0, 255, 0, Nit2), false)
        dxDrawText("Próxima", x*655, y*491, x*706, y*511, tocolor(0, 0, 0, Nit), 1.00, Font_1, "left", "top", false, false, false, false, false)
end 
--addEventHandler("onClientRender", root, Dx_Introducao)

function Dx_Regra01()
local posX2, posY2, posZ2 = interpolateBetween(0, 0, 0, 255, 261, 295, ((getTickCount() - tick) / 2000), "OutQuad")
local posX1, posY1, posZ1 = interpolateBetween(0, 0, 0, 346, 0, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*330, y*245, x*697, y*224, tocolor(35, 35, 35, posX2), false)
        dxDrawRectangle(x*330, y*245, x*697, y*4, tocolor(0, 255, 0, posX2), false)
        dxDrawText("Acidentes, incidentes e preocupações abientrais", x*346, y*posY2, x*688, y*281, tocolor(0, 255, 0, posX2), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("DEVER DE CEDER", x*346, y*posZ2, x*449, y*313, tocolor(0, 255, 0, posX2), 1.00, Font_3, "left", "top", false, false, false, false, false)
        dxDrawText("Todos os condutores têm o dever de obedecer as regras da estrada, a fim de evitar danos\nprevisíveis aos outros. A incapacidade de ceder o direito de passagem quando exigido por lei\npode levar a responsabilidade por qualquer acidente resultante.\n\nquando você ouve uma sirene chegar, você deve ceder ao veiculo de emergência, simplesmente\npuxar para direita.\nVocê sempre deve parar quando um oficial de trânsito lhe disser.", x*posX1, y*319, x*1011, y*448, tocolor(255, 255, 255, posX2), 1.00, Font_2, "left", "top", false, false, false, false, false)

		local Nit, Nit2 = interpolateBetween(0, 0, 0, 255, 200, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        dxDrawImage(x*422, y*482, x*512, y*41, "Img/botao2.png", 0, 0, 0, tocolor(0, 255, 0, Nit2), false)
        dxDrawText("Próxima", x*655, y*491, x*706, y*511, tocolor(0, 0, 0, Nit), 1.00, Font_1, "left", "top", false, false, false, false, false)
end
--addEventHandler("onClientRender", root, Dx_Regra01)

function Dx_Regra02()
local posX2, posY2, posZ2 = interpolateBetween(0, 0, 0, 255, 261, 295, ((getTickCount() - tick) / 2000), "OutQuad")
local posX1, posY1, posZ1 = interpolateBetween(0, 0, 0, 346, 0, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*330, y*245, x*697, y*224, tocolor(35, 35, 35, posX2), false)
        dxDrawRectangle(x*330, y*245, x*697, y*4, tocolor(0, 255, 0, posX2), false)         
		dxDrawText("Acidentes, incidentes e preocupações abientrais", x*346, y*posY2, x*688, y*281, tocolor(0, 255, 0, posX2), 1.00, Font_4, "left", "top", false, false, false, false, false)
		dxDrawText("CONDUÇÃO PERIGOSA ", x*346, y*posZ2, x*481, y*313, tocolor(0, 255, 0, posX2), 1.00, Font_3, "left", "top", false, false, false, false, false)
        dxDrawText("Um carro que põe em risco ou é susceptivel de põr em perigo pessoas ou propriedades é \nconsiderado uma condução perigosa.\nNo entanto, a condução perigosa, pode levar a acidentes trágicos. É muito mais sensato dirigir\ndefensivamente e sempre estar atento ao risco potencial de falhas.", x*posX1, y*319, x*971, y*399, tocolor(255, 255, 255, posX2), 1.00, Font_2, "left", "top", false, false, false, false, false)

		local Nit, Nit2 = interpolateBetween(0, 0, 0, 255, 200, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        dxDrawImage(x*422, y*482, x*512, y*41, "Img/botao2.png", 0, 0, 0, tocolor(0, 255, 0, Nit2), false)
        dxDrawText("Próxima", x*655, y*491, x*706, y*511, tocolor(0, 0, 0, Nit), 1.00, Font_1, "left", "top", false, false, false, false, false)
end
--addEventHandler("onClientRender", root, Dx_Regra02)

function Dx_Regra03()
local posX2, posY2, posZ2 = interpolateBetween(0, 0, 0, 255, 261, 346, ((getTickCount() - tick) / 2000), "OutQuad")
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*330, y*245, x*697, y*224, tocolor(35, 35, 35, posX2), false)
        dxDrawRectangle(x*330, y*245, x*697, y*4, tocolor(0, 255, 0, posX2), false)
        dxDrawText("Área residencial", x*346, y*posY2, x*458, y*281, tocolor(0, 255, 0, posX2), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Manter uma velocidade adequada - Nunca mais rápido que o limite postado, mais lento se o\ntráfego for pesado.\n\nFique sempre na sua pista. Nunca dirija na área reservada para carros estacionados.\n\nMantenha uma distância segura seguindo - pelo menos 1 comprimento de carro por cada \n10 mph.\n\nO limite de velocidade em uma área residencial é de 50 km/h.", x*posZ2, y*288, x*958, y*459, tocolor(255, 255, 255, posX2), 1.00, Font_2, "left", "top", false, false, false, false, false)

		local Nit, Nit2 = interpolateBetween(0, 0, 0, 255, 200, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        dxDrawImage(x*422, y*482, x*512, y*41, "Img/botao2.png", 0, 0, 0, tocolor(0, 255, 0, Nit2), false)
        dxDrawText("Próxima", x*655, y*491, x*706, y*511, tocolor(0, 0, 0, Nit), 1.00, Font_1, "left", "top", false, false, false, false, false)
end
--addEventHandler("onClientRender", root, Dx_Regra03)

function Dx_Regra04()
local posX2, posY2, posZ2 = interpolateBetween(0, 0, 0, 255, 261, 346, ((getTickCount() - tick) / 2000), "OutQuad")
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*330, y*245, x*697, y*260, tocolor(35, 35, 35, posX2), false)
        dxDrawRectangle(x*330, y*245, x*697, y*4, tocolor(0, 255, 0, posX2), false)
        dxDrawText("Áreas Construída/Cidade", x*346, y*posY2, x*521, y*281, tocolor(0, 255, 0, posX2), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("O limite de 80 km/h geralmente se aplica a todos o tráfego em todas as estradas com iluminação\npública, a menos que seja especificada outra forma.\nConduzir a velocidades muito rápidas para a estrada e condução de pilotagem pode ser perigosa.\n\nVocê sempre deve reduzir sua velocidade quando:\n\n- Dividir a rua com um pedestre\n- Dirigindo a noite, é mais difícil de ver outros condutores\n- Condições de clima, tempo chuvoso\n\nLembre-se, veículos grandes e motocicletas precisam de uma boa distância para parar.\n", x*posZ2, y*289, x*991, y*491, tocolor(255, 255, 255, posX2), 1.00, Font_2, "left", "top", false, false, false, false, false)

		local Nit, Nit2 = interpolateBetween(0, 0, 0, 255, 200, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        dxDrawImage(x*422, y*520, x*512, y*41, "Img/botao2.png", 0, 0, 0, tocolor(0, 255, 0, Nit2), false)
        dxDrawText("Próxima", x*655, y*528, x*706, y*511, tocolor(0, 0, 0, Nit), 1.00, Font_1, "left", "top", false, false, false, false, false)
end
--addEventHandler("onClientRender", root, Dx_Regra04)

function Dx_Regra05 ()
local posX2, posY2, posZ2 = interpolateBetween(0, 0, 0, 255, 261, 346, ((getTickCount() - tick) / 2000), "OutQuad")
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*330, y*245, x*697, y*224, tocolor(35, 35, 35, posX2), false)
        dxDrawRectangle(x*330, y*245, x*697, y*4, tocolor(0, 255, 0, posX2), false)
        dxDrawText("Auto-estradas/Rodovia", x*346, y*posY2, x*508, y*281, tocolor(0, 255, 0, posX2), 1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("O tráfego nas auto-estradas geralmente viaja mas rápido do que em outras estradas, então você\ntem menos tempo para reagir.\nÉ especialmente importante usar seus sentidos mais cedo e olhar muito mais à frente do que\nvocê faria em outras estradas.\n\nVerifique o tráfego na auto-estrada e combine sua velocidade para se encaixar com segurança no\nfluxo de tráfego na pista da esquerda.\n\nO limite de velocidade em uma área de auto-estrada/rodovia é 120 km/h.", x*posZ2, y*289, x*991, y*456, tocolor(255, 255, 255, posX2), 1.00, Font_2, "left", "top", false, false, false, false, false)

		local Nit, Nit2 = interpolateBetween(0, 0, 0, 255, 200, 0, ((getTickCount() - tick) / 2000), "OutQuad")
        dxDrawImage(x*422, y*482, x*512, y*41, "Img/botao2.png", 0, 0, 0, tocolor(0, 255, 0, Nit2), false)
        dxDrawText("Próxima", x*655, y*491, x*706, y*511, tocolor(0, 0, 0, Nit), 1.00, Font_1, "left", "top", false, false, false, false, false)
end
--addEventHandler("onClientRender", root, Dx_Regra05)

--[[
         ><><><><><><><><><><><><><><><
         ><          CLICK'S         ><
         ><><><><><><><><><><><><><><><
--]]
function Comecar_Perguntas ( _,state )
	if state == "down" then   
		if isEventHandlerAdded("onClientRender", getRootElement(), Inicio_Perguntas) then  
			if isCursorOnElement(x*711, y*361, x*190, y*45) then
				Close_Carteira () 
			elseif isCursorOnElement(x*465, y*361, x*190, y*45) then
				showChat(false)
				removeEventHandler("onClientRender", root, Inicio_Perguntas)
				tick = getTickCount()  
				playSoundFrontEnd(2)
				addEventHandler("onClientRender", root, Dx_Introducao)
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Comecar_Perguntas )

--[[
         ><><><><><><><><><><><><><><><
         ><        Introdução        ><
         ><><><><><><><><><><><><><><><
--]]
function Iniciar_Introducao ( _,state )
	if state == "down" then   
		if isCursorOnElement(x*422, y*482, x*512, y*41) then -- Próxima
			if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Introducao) then  
				tick = getTickCount()  
				playSoundFrontEnd(2)
				removeEventHandler("onClientRender", root, Dx_Introducao)
				addEventHandler("onClientRender", root, Dx_Regra01)
				
			elseif isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra01) then  
				tick = getTickCount()  
				playSoundFrontEnd(2)
				removeEventHandler("onClientRender", root, Dx_Regra01)
				addEventHandler("onClientRender", root, Dx_Regra02)	
				
			elseif isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra02) then  
				tick = getTickCount()  
				playSoundFrontEnd(2)
				removeEventHandler("onClientRender", root, Dx_Regra02)
				addEventHandler("onClientRender", root, Dx_Regra03)	
				
			elseif isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra03) then  
				tick = getTickCount()  
				playSoundFrontEnd(2)
				removeEventHandler("onClientRender", root, Dx_Regra03)
				addEventHandler("onClientRender", root, Dx_Regra04)	
				
			elseif isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra05) then  
				tick = getTickCount()  
				playSoundFrontEnd(2)
				removeEventHandler("onClientRender", root, Dx_Regra05)
				addEventHandler("onClientRender", root, DxFazerProva)	
			end
		end
				
		if isCursorOnElement(x*422, y*520, x*512, y*41) then -- Próxima
			if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra04) then  
				tick = getTickCount()  
				playSoundFrontEnd(2)
				removeEventHandler("onClientRender", root, Dx_Regra04)
				addEventHandler("onClientRender", root, Dx_Regra05)	
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Iniciar_Introducao )

--[[
         ><><><><><><><><><><><><><><><
         ><          IGNORA          ><
         ><><><><><><><><><><><><><><><
--]]
addEventHandler("onClientKey", root, 
	function (button, press)
    if isEventHandlerAdded("onClientRender", getRootElement(), Inicio_Perguntas) 
	or isEventHandlerAdded("onClientRender", getRootElement(), Dx_Introducao)  
	or isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra01)  
	or isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra02)  
	or isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra03)  
	or isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra04)  
	or isEventHandlerAdded("onClientRender", getRootElement(), Dx_Regra05)  
	or isEventHandlerAdded("onClientRender", getRootElement(), DxFazerProva)  
	or isEventHandlerAdded("onClientRender", getRootElement(), Fim_Perguntas) then
			if button == "F1" or button == "F2" or button == "F3" or button == "F5" or button == "F6" or button == "F7" or button == "F9" or button == "F10" or button == "F11" or button == "F12" or button == "t" or button == "p" or button == "m" then
				cancelEvent()
			end
		end
	end
)

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