--[[

--]]

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/font.ttf", x*10)
local Font_2 = dxCreateFont("font/font1.ttf", x*11)
local Font_3 = dxCreateFont("font/fontNick.ttf", x*10)
local Font_4 = dxCreateFont("font/OpenSans-Bold.ttf", x*23)
local Font_5 = dxCreateFont("font/OpenSans-Bold.ttf", x*11)
local Font_6 = dxCreateFont("font/font.ttf", x*12)
local Font_7 = dxCreateFont("font/OpenSans-Bold.ttf", x*15)
local Font_8 = dxCreateFont("font/OpenSans-Bold.ttf", x*18)
local Font_9 = dxCreateFont("font/font.ttf", x*14)


--[[
         ><><><><><><><><><><><><><><><
         ><       Abrir/Fechar       ><
         ><><><><><><><><><><><><><><><
--]]
function Abrir_ProvaTeorica ()
if isEventHandlerAdded("onClientRender", getRootElement(), Questao_01) then return end
   showCursor(true)
   showChat(false)
   playSoundFrontEnd ( 1 )
   RemoverDatas ()
   removeEventHandler("onClientRender", root, DxFazerProva)
   addEventHandler("onClientRender", root, Questao_01)
end
addEvent("DNL:AbrirProva(Teorica)", true)
addEventHandler("DNL:AbrirProva(Teorica)", root, Abrir_ProvaTeorica)

function Fechar_ProvaTeorica ()
  if isEventHandlerAdded("onClientRender", getRootElement(), DxFazerProva) then  
     removeEventHandler("onClientRender", root, DxFazerProva)
     showCursor(false)
     showChat(true)
  end
end
addEvent("DNL:FecharProva(Teorica)", true)
addEventHandler("DNL:FecharProva(Teorica)", root, Fechar_ProvaTeorica)

function DxFazerProva()
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
		
        dxDrawImage(x*648, y*200, x*80, y*65, "Img/Detran.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Bem Vindo ao Detran", x*614, y*266, x*753, y*275, tocolor(0, 0, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Exigimos que todos os nossos cidadãos passem por um teste de teoria antes de obter uma licença de motorista.", x*370, y*294, x*989, y*310, tocolor(0, 0, 0, 254), x*1.00, Font_1, "left", "top", false, false, false, false, false)
        dxDrawText(" Tenha calma, e responda com bom senso, não tome nenhum suposição de sorte.", x*457, y*310, x*907, y*326, tocolor(0, 0, 0, 254), x*1.00, Font_1, "left", "top", false, false, false, false, false)

        dxDrawText("Teste de Teoria", x*288, y*348, x*384, y*363, tocolor(0, 0, 0, 254), x*1.00, Font_2, "left", "top", false, false, false, false, false)
        dxDrawText("- O teste escrito custa R$1000, não há reembolso se você falhar.\n- Não se preocupe, o Detran permitirá empréstimos, fique atento para não cair em dividas maiores!\n- Se você falhar no teste uma vez, você não pode retomá-lo imediatamente, volte outro dia e tente novamente.", x*288, y*368, x*910, y*411, tocolor(0, 0, 0, 255), x*1.00, Font_1, "left", "top", false, false, false, true, false)

        dxDrawText("Teste de Direção", x*288, y*433, x*389, y*448, tocolor(0, 0, 0, 254), x*1.00, Font_2, "left", "top", false, false, false, false, false)
        dxDrawText("- O teste de direção custa R$ 1200, como antes, este pagamento não é reembolsado se você falhar no teste.\n- O objetivo principal do teste de direção é a atenção aos detalhes, preste atenção ao seu arredor e não se choque!", x*288, y*454, x*910, y*497, tocolor(0, 0, 0, 254), x*1.00, Font_1, "left", "top", false, false, false, false, false)

        dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Iniciar Testes", x*649, y*536, x*737, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
		
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
    end
--addEventHandler("onClientRender", root, DxFazerProva)


function Questao_01 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 1", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)
        dxDrawText("Se você está dirigindo a 80 km/h, e você entra em uma área residencial, isso sigifica que?", x*269, y*271, x*864, y*290, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

	if getElementData(localPlayer, "Questão_01") == "A" then
        dxDrawText("A) (x)", x*269, y*313, x*307, y*331, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*313, x*307, y*331, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_01") == "B" then
        dxDrawText("B) (x)", x*269, y*345, x*307, y*363, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*345, x*307, y*363, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
	
	if getElementData(localPlayer, "Questão_01") == "C" then
        dxDrawText("C) (x)", x*269, y*377, x*307, y*395, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*377, x*307, y*395, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
	
	if getElementData(localPlayer, "Questão_01") == "D" then
        dxDrawText("D) (x)", x*269, y*408, x*307, y*426, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("D) (  )", x*269, y*408, x*307, y*426, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
        dxDrawText("Você deverá aumentar a velocidade", x*311, y*314, x*547, y*331, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Você pode acelerar enquanto não há nenhum carro á frente", x*311, y*346, x*709, y*363, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Você deve reduzir a velocidade", x*311, y*378, x*515, y*395, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Você pode manter a velocidade ", x*311, y*409, x*518, y*426, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

        dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
			
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_01)


function Questao_02 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 2", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)
        dxDrawText("Você está dirigindo em uma pista livre em que limite de velocidade é de 110 km/h. A maioria estão a 120km/h, portanto\nvocê deve dirigir não mais que a: \n", x*269, y*271, x*1067, y*305, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

	if getElementData(localPlayer, "Questão_02") == "A" then
        dxDrawText("A) (x)", x*269, y*331, x*307, y*349, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*331, x*307, y*349, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
	
	if getElementData(localPlayer, "Questão_02") == "B" then
        dxDrawText("B) (x)", x*269, y*360, x*307, y*378, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*360, x*307, y*378, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
	
	if getElementData(localPlayer, "Questão_02") == "C" then
        dxDrawText("C) (x)", x*269, y*388, x*307, y*406, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*388, x*307, y*406, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
	
	if getElementData(localPlayer, "Questão_02") == "D" then
        dxDrawText("D) (x)", x*269, y*417, x*307, y*435, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("D) (  )", x*269, y*417, x*307, y*435, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
        dxDrawText("80 km/h", x*311, y*332, x*365, y*349, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("120 km/h", x*311, y*361, x*374, y*378, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("50 km/h", x*311, y*389, x*366, y*406, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("110 km/h ", x*311, y*418, x*366, y*435, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)        
		
		dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
		
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_02)


function Questao_03 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 3", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)    
		dxDrawText("Qual a porcentagem de álcool no sangue para seja declarado embriagado? ", x*269, y*271, x*766, y*291, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

	if getElementData(localPlayer, "Questão_03") == "A" then
        dxDrawText("A) (x)", x*269, y*312, x*307, y*329, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*312, x*307, y*329, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
	
	if getElementData(localPlayer, "Questão_03") == "B" then
        dxDrawText("B) (x)", x*269, y*340, x*307, y*357, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*340, x*307, y*357, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_03") == "C" then
        dxDrawText("C) (x)", x*269, y*367, x*307, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*367, x*307, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_03") == "D" then
        dxDrawText("D) (x)", x*269, y*394, x*307,y* 412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)   
	else     
        dxDrawText("D) (  )", x*269, y*394, x*307,y* 412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)   
	end     
		
		dxDrawText("0.05%", x*311, y*313, x*365, y*330, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("0.18%", x*311, y*341, x*374, y*358, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("0.08%", x*311, y*368, x*366, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("0.06%", x*311, y*395, x*366, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		
		dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
			
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_03)


function Questao_04 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 4", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)  
        dxDrawText("Direito de passagem deve ser cedido aos veículos de emergência?", x*269, y*272, x*704, y*291, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

	if getElementData(localPlayer, "Questão_04") == "A" then
        dxDrawText("A) (x)", x*269, y*311, x*307, y*329, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*311, x*307, y*329, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_04") == "B" then
        dxDrawText("B) (x)", x*269, y*339, x*307, y*357, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*339, x*307, y*357, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_04") == "C" then
        dxDrawText("C) (x)", x*269, y*367, x*307, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*367, x*307, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_04") == "D" then
        dxDrawText("D) (x)", x*269, y*394, x*307, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("D) (  )", x*269, y*394, x*307, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
        dxDrawText("Sempre ", x*311, y*312, x*361, y*330, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Piscando vermelho, azul ou luzes brancas ", x*311, y*340, x*585, y*358, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Usando a sirene ou piscando vermelho, azul ou luzes brancas ", x*311, y*368, x*717, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Usando a sirene", x*311, y*395, x*415, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

		dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
			
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_04)


function Questao_05 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 5", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)  
        dxDrawText("A menos que informado, a velocidade máxima na área de residencial é de ___Km/h.", x*269, y*272, x*825, y*291, tocolor(0, 0, 0, 254), x*1.00,Font_6, "left", "top", false, false, false, false, false)

	if getElementData(localPlayer, "Questão_05") == "A" then
        dxDrawText("A) (x)", x*269, y*311, x*307, y*329, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*311, x*307, y*329, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_05") == "B" then
        dxDrawText("B) (x)", x*269, y*339, x*307, y*357, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*339, x*307, y*357, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_05") == "C" then
        dxDrawText("C) (x)", x*269, y*367, x*307, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*367, x*307, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_05") == "D" then
        dxDrawText("D) (x)", x*269, y*396, x*307, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("D) (  )", x*269, y*396, x*307, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
        dxDrawText("50", x*311, y*311, x*326, y*330, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("55", x*311, y*339, x*327, y*358, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("65", x*311, y*367, x*327, y*385, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("70", x*311, y*396, x*326, y*412, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

		dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
			
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_05)


function Questao_06 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 6", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false) 
        dxDrawText("Complete a Frase.", x*269, y*272, x*387, y*291, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Quando você está sendo ultrapassado por um veículo, é importante não ____________?", x*269, y*294, x*841, y*313, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
		
	if getElementData(localPlayer, "Questão_06") == "A" then
        dxDrawText("A) (x)", x*269, y*328, x*307, y*345, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*328, x*307, y*345, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_06") == "B" then
        dxDrawText("B) (x)", x*269, y*355, x*307, y*372, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*355, x*307, y*372, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_06") == "C" then
        dxDrawText("C) (x)", x*269, y*382, x*307, y*399, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*382, x*307, y*399, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_06") == "D" then
        dxDrawText("D) (x)", x*269, y*409, x*307, y*426, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("D) (  )", x*269, y*409, x*307, y*426, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
        dxDrawText("Diminuir a velocidade", x*311, y*328, x*452, y*345, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Checar os retrovisores", x*311, y*355, x*457, y*372, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Olhar para o outro motorista", x*311, y*382, x*500, y*399, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Aumentar a velocidade", x*311, y*409, x*461, y*426, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

		dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
			
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_06)


function Questao_07 ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
        dxDrawText("Prova", x*660,  y*204, x*709,  y*226, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false)	
        dxDrawText("Questão: 7", x*269, y*237, x*364, y*262, tocolor(0, 0, 0, 254), x*1.00, Font_7, "left", "top", false, false, false, false, false) 
        dxDrawText("Antes de qualquer mudança de faixa, você deve?", x*269, y*272, x*387, y*291, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)

	if getElementData(localPlayer, "Questão_07") == "A" then
        dxDrawText("A) (x)", x*269, y*311, x*307, y*328, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("A) (  )", x*269, y*311, x*307, y*328, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_07") == "B" then
        dxDrawText("B) (x)", x*269, y*338, x*307, y*355, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("B) (  )", x*269, y*338, x*307, y*355, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_07") == "C" then
        dxDrawText("C) (x)", x*269, y*365, x*307, y*382, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("C) (  )", x*269, y*365, x*307, y*382, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
	if getElementData(localPlayer, "Questão_07") == "D" then
        dxDrawText("D) (x)", x*269, y*392, x*307, y*409, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	else
        dxDrawText("D) (  )", x*269, y*392, x*307, y*409, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
	end
		
        dxDrawText("Checar os retrovisores", x*311, y*311, x*452, y*328, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Checar os pontos cegos", x*311, y*338, x*467, y*355, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Dar seta", x*311, y*365, x*366, y*382, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("Todas Questões Acima", x*311, y*392, x*461, y*409, tocolor(0, 0, 0, 254), x*1.00, Font_6, "left", "top", false, false, false, false, false)
		
		dxDrawImage(x*488, y*525, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTestes, false)
        dxDrawText("Próxima Questão", x*635, y*536, x*747, y*555, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)		
		CorTestes = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then
		CorTestes = tocolor(0, 180, 0, 255)
	 end
			
		dxDrawBorderedText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Progresso", x*658, y*615, x*727, y*629, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Questao_07)


function Aprovado ()
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
  local Acertos = tonumber(getElementData(localPlayer, "DNL:Acertos")) or 0	 
  local Erros = tonumber(getElementData(localPlayer, "DNL:Erros")) or 0	
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
		
		dxDrawBorderedText("APROVADO", x*621, y*211, x*747, y*238, tocolor(0, 0, 0, 150), x*1.00, Font_8, "left", "top", false, false, false, false, false)
        dxDrawText("APROVADO", x*621, y*211, x*747, y*238, tocolor(0, 255, 0, 255), x*1.00, Font_8, "left", "top", false, false, false, false, false)

		dxDrawBorderedText("Bom trabalho, você fez muito bem durante o teste!", x*403, y*251, x*969, y*281, tocolor(0, 0, 0, 150), x*1.00, Font_8, "left", "top", false, false, false, false, false)
        dxDrawText("Bom trabalho, você fez muito bem durante o teste!", x*403, y*251, x*969, y*281, tocolor(0, 255, 0, 255), x*1.00, Font_8, "left", "top", false, false, false, false, false)
 
		dxDrawBorderedText("CLIQUE NO BOTÃO ABAIXO PARA IR PRO PROXIMO TESTE", x*423, y*293, x*948, y*317, tocolor(0, 0, 0, 150), x*1.00, Font_7, "left", "top", false, false, false, false, false)
        dxDrawText("CLIQUE NO BOTÃO ABAIXO PARA IR PRO PROXIMO TESTE", x*423, y*293, x*948, y*317, tocolor(255, 255, 255, 255), x*1.00, Font_7, "left", "top", false, false, false, false, false)
			
        dxDrawImage(x*488, y*372, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorTeste, false)
        dxDrawText("Teste de direção", x*638, y*383, x*746, y*403, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)
		CorTeste = tocolor(0, 255, 0, 255)
	 if isCursorOnElement(x*488, y*372, x*406, y*44) then
		CorTeste = tocolor(0, 180, 0, 255)
	 end
		
        dxDrawImage(x*488, y*432, x*406, y*44, "Img/botao2.png", 0, 0, 0,CorDesistir, false)
        dxDrawText("Desistir", x*667, y*443, x*714, y*462, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)
		CorDesistir = tocolor(255, 0, 0, 255)
	 if isCursorOnElement(x*488, y*432, x*406, y*44) then
		CorDesistir = tocolor(180, 0, 0, 255)
	 end

		dxDrawBorderedText("Acertos: "..Acertos.."", x*269, y*600, x*382, y*574, tocolor(0, 0, 0, 150), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("#00ff00Acertos: "..Acertos.."", x*269, y*600, x*382, y*574, tocolor(255, 255, 255, 255), x*1.00, Font_6, "left", "top", false, false, false, true, false)
		
		dxDrawBorderedText("Erros: "..Erros.."", x*269, y*630, x*382, y*600, tocolor(0, 0, 0, 150), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("#ff0000Erros: "..Erros.."", x*269, y*630, x*382, y*600, tocolor(255, 255, 255, 255), x*1.00, Font_6, "left", "top", false, false, false, true, false)
		
		dxDrawBorderedText("Sucesso", x*663, y*614, x*721, y*631, tocolor(0, 0, 0, 150), x*1.00, Font_5, "left", "top", false, false, false, false, false)
        dxDrawText("Sucesso", x*663, y*614, x*721, y*631, tocolor(0, 255, 0, 255), x*1.00, Font_5, "left", "top", false, false, false, false, false)
		
		contornoRetangulo(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 80), x*1)
        dxDrawRectangle(x*504, y*640, x*375, y*12, tocolor(0, 0, 0, 54), false) -- Barra de Progresso
        dxDrawRectangle(x*504, y*640, x*375/8*Timer, y*12, tocolor(0, 200, 0, 255), false) -- Barra de Progress
end
--addEventHandler("onClientRender", root, Aprovado)

function Reprovado ()
  local Acertos = tonumber(getElementData(localPlayer, "DNL:Acertos")) or 0	 
  local Erros = tonumber(getElementData(localPlayer, "DNL:Erros")) or 0	
        exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screenW,screenH, tocolor(255, 255, 255, 230))
        dxDrawRectangle(x*240, y*105, x*886, y*567, tocolor(209, 209, 209, 255), false) -- Fundo
        dxDrawRectangle(x*240, y*105, x*886, y*89, tocolor(0, 0, 0, 42), false) -- Cabecario Fundo
		contornoRetangulo(x*240, y*105, x*886, y*567, tocolor(0, 0, 0, 42), x*1) -- Line enfeite
        dxDrawLine(x*240, y*194, x*1125, y*194, tocolor(0, 0, 0, 99), x*1, false) -- Line Enfeite
        dxDrawText("Detran", x*641, y*128, x*731, y*166, tocolor(0, 0, 0, 99), x*1.00, Font_4, "left", "top", false, false, false, false, false)
		
		dxDrawBorderedText("REPROVADO", x*614, y*213, x*753, y*240, tocolor(0, 0, 0, 150), x*1.00, Font_8, "left", "top", false, false, false, false, false)
        dxDrawText("REPROVADO", x*614, y*213, x*753, y*240, tocolor(255, 0, 0, 255), x*1.00, Font_8, "left", "top", false, false, false, false, false)
		
		dxDrawBorderedText("Desculpe você não passo no teste teórico.", x*455, y*251, x*918, y*281, tocolor(0, 0, 0, 150), x*1.00, Font_8, "left", "top", false, false, false, false, false)	
        dxDrawText("Desculpe você não passo no teste teórico.", x*455, y*251, x*918, y*281, tocolor(255, 0, 0, 255), x*1.00, Font_8, "left", "top", false, false, false, false, false)

		dxDrawBorderedText("CLIQUE NO BOTÃO ABAIXO PARA IR PRO PROXIMO TESTE", x*426, y*293, x*951, y*317, tocolor(0, 0, 0, 150), x*1.00, Font_7, "left", "top", false, false, false, false, false)
        dxDrawText("CLIQUE NO BOTÃO ABAIXO PARA IR PRO PROXIMO TESTE", x*426, y*293, x*951, y*317, tocolor(255, 255, 255, 255), x*1.00, Font_7, "left", "top", false, false, false, false, false)
        dxDrawImage(x*448, y*230, x*450, y*450, "Img/Logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		
		dxDrawBorderedText("Acertos: "..Acertos.."", x*269, y*600, x*382, y*574, tocolor(0, 0, 0, 150), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("#00ff00Acertos: "..Acertos.."", x*269, y*600, x*382, y*574, tocolor(255, 255, 255, 255), x*1.00, Font_6, "left", "top", false, false, false, true, false)
		
		dxDrawBorderedText("Erros: "..Erros.."", x*269, y*630, x*382, y*600, tocolor(0, 0, 0, 150), x*1.00, Font_6, "left", "top", false, false, false, false, false)
        dxDrawText("#ff0000Erros: "..Erros.."", x*269, y*630, x*382, y*600, tocolor(255, 255, 255, 255), x*1.00, Font_6, "left", "top", false, false, false, true, false)
		
        dxDrawImage(x*488, y*605, x*406, y*44, "Img/botao2.png", 0, 0, 0, CorSair, false)
        dxDrawText("Sair", x*681, y*616, x*706, y*635, tocolor(0, 0, 0, 255), x*1.00, Font_6, "left", "top", false, false, false, false, false)
		CorSair = tocolor(255, 0, 0, 255)
	 if isCursorOnElement(x*488, y*605, x*406, y*44) then
		CorSair = tocolor(180, 0, 0, 255)
	 end
end


--[[
         ><><><><><><><><><><><><><><><
         ><          CLICK'S         ><
         ><><><><><><><><><><><><><><><
--]]
function Comecar_Prova ( _,state )
   if state == "down" then	
--[[
         ><><><><><><><><><><><><><><><
         ><        Fazer Prova       ><
         ><><><><><><><><><><><><><><><
--]]	   
  local Acertos = tonumber(getElementData(localPlayer, "DNL:Acertos")) or 0	 
  local Timer = tonumber(getElementData(localPlayer, "DNL:Timer")) or 0	 
  local Erros = tonumber(getElementData(localPlayer, "DNL:Erros")) or 0	
    if isEventHandlerAdded("onClientRender", getRootElement(), DxFazerProva) then  	 
	 if isCursorOnElement(x*488, y*525, x*406, y*44) then -- Fazer Prova
      setTimer(function()	
		 triggerServerEvent("DNL:Pagar_Prova(Teorica)", localPlayer) 
      end, 60, 1)		 
	 end     
    end
	
--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 01     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_01) then  	 
	 if isCursorOnElement(x*269, y*313, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_01", "A")
		
	 elseif isCursorOnElement(x*269, y*345, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_01", "B")
		
	 elseif isCursorOnElement(x*269, y*377, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_01", "C")
		
	 elseif isCursorOnElement(x*269, y*408, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_01", "D")
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_01") == "A" then
	     removeEventHandler("onClientRender", root, Questao_01)
	     addEventHandler("onClientRender", root, Questao_02)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_01") == "B" then
	     removeEventHandler("onClientRender", root, Questao_01)
	     addEventHandler("onClientRender", root, Questao_02)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_01") == "C" then
	     removeEventHandler("onClientRender", root, Questao_01)
	     addEventHandler("onClientRender", root, Questao_02)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )

 	  elseif getElementData(localPlayer, "Questão_01") == "D" then
	     removeEventHandler("onClientRender", root, Questao_01)
	     addEventHandler("onClientRender", root, Questao_02)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
	  end     
	 end     
    end
	
--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 02     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_02) then  	 
	 if isCursorOnElement(x*269, y*331, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_02", "A")
		
	 elseif isCursorOnElement(x*269, y*360, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_02", "B")
		
	 elseif isCursorOnElement(x*269, y*388, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_02", "C")
		
	 elseif isCursorOnElement(x*269, y*417, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_02", "D")
		
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_02") == "A" then
	     removeEventHandler("onClientRender", root, Questao_02)
	     addEventHandler("onClientRender", root, Questao_03)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_02") == "B" then
	     removeEventHandler("onClientRender", root, Questao_02)
	     addEventHandler("onClientRender", root, Questao_03)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_02") == "C" then
	     removeEventHandler("onClientRender", root, Questao_02)
	     addEventHandler("onClientRender", root, Questao_03)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )

 	  elseif getElementData(localPlayer, "Questão_02") == "D" then
	     removeEventHandler("onClientRender", root, Questao_02)
	     addEventHandler("onClientRender", root, Questao_03)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
	  end     
	 end     
    end
	
--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 03     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_03) then  	 
	 if isCursorOnElement(x*269, y*312, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_03", "A")
		
	 elseif isCursorOnElement(x*269, y*340, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_03", "B")
		
	 elseif isCursorOnElement(x*269, y*367, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_03", "C")
		
	 elseif isCursorOnElement(x*269, y*394, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_03", "D")
		
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_03") == "A" then
	     removeEventHandler("onClientRender", root, Questao_03)
	     addEventHandler("onClientRender", root, Questao_04)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_03") == "B" then
	     removeEventHandler("onClientRender", root, Questao_03)
	     addEventHandler("onClientRender", root, Questao_04)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_03") == "C" then
	     removeEventHandler("onClientRender", root, Questao_03)
	     addEventHandler("onClientRender", root, Questao_04)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )

 	  elseif getElementData(localPlayer, "Questão_03") == "D" then
	     removeEventHandler("onClientRender", root, Questao_03)
	     addEventHandler("onClientRender", root, Questao_04)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
	  end     
	 end     
    end

--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 04     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_04) then  	 
	 if isCursorOnElement(x*269, y*311, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_04", "A")
		
	 elseif isCursorOnElement(x*269, y*339, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_04", "B")
		
	 elseif isCursorOnElement(x*269, y*367, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_04", "C")
		
	 elseif isCursorOnElement(x*269, y*394, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_04", "D")
		
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_04") == "A" then
	     removeEventHandler("onClientRender", root, Questao_04)
	     addEventHandler("onClientRender", root, Questao_05)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_04") == "B" then
	     removeEventHandler("onClientRender", root, Questao_04)
	     addEventHandler("onClientRender", root, Questao_05)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_04") == "C" then
	     removeEventHandler("onClientRender", root, Questao_04)
	     addEventHandler("onClientRender", root, Questao_05)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )

 	  elseif getElementData(localPlayer, "Questão_04") == "D" then
	     removeEventHandler("onClientRender", root, Questao_04)
	     addEventHandler("onClientRender", root, Questao_05)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
	  end     
	 end     
    end
	
--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 05     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_05) then  	 
	 if isCursorOnElement(x*269, y*311, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_05", "A")
		
	 elseif isCursorOnElement(x*269, y*339, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_05", "B")
		
	 elseif isCursorOnElement(x*269, y*367, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_05", "C")
		
	 elseif isCursorOnElement(x*269, y*394, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_05", "D")
		
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_05") == "A" then
	     removeEventHandler("onClientRender", root, Questao_05)
	     addEventHandler("onClientRender", root, Questao_06)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_05") == "B" then
	     removeEventHandler("onClientRender", root, Questao_05)
	     addEventHandler("onClientRender", root, Questao_06)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_05") == "C" then
	     removeEventHandler("onClientRender", root, Questao_05)
	     addEventHandler("onClientRender", root, Questao_06)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )

 	  elseif getElementData(localPlayer, "Questão_05") == "D" then
	     removeEventHandler("onClientRender", root, Questao_05)
	     addEventHandler("onClientRender", root, Questao_06)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
	  end     
	 end     
    end
		
--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 06     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_06) then  	 
	 if isCursorOnElement(x*269, y*328, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_06", "A")
		
	 elseif isCursorOnElement(x*269, y*355, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_06", "B")
		
	 elseif isCursorOnElement(x*269, y*382, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_06", "C")
		
	 elseif isCursorOnElement(x*269, y*409, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_06", "D")
		
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_06") == "A" then
	     removeEventHandler("onClientRender", root, Questao_06)
	     addEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_06") == "B" then
	     removeEventHandler("onClientRender", root, Questao_06)
	     addEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
		 
 	  elseif getElementData(localPlayer, "Questão_06") == "C" then
	     removeEventHandler("onClientRender", root, Questao_06)
	     addEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )

 	  elseif getElementData(localPlayer, "Questão_06") == "D" then
	     removeEventHandler("onClientRender", root, Questao_06)
	     addEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
	  end     
	 end     
    end
			
--[[
         ><><><><><><><><><><><><><><><
         ><     Fazer Questão 07     ><
         ><><><><><><><><><><><><><><><
--]]	    
    if isEventHandlerAdded("onClientRender", getRootElement(), Questao_07) then  	 
	 if isCursorOnElement(x*269, y*311, x*40, y*23) then -- Questão A
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_07", "A")
		
	 elseif isCursorOnElement(x*269, y*338, x*40, y*23) then -- Questão B
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_07", "B")
		
	 elseif isCursorOnElement(x*269, y*365, x*40, y*23) then -- Questão C
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_07", "C")
		
	 elseif isCursorOnElement(x*269, y*392, x*40, y*23) then -- Questão D
	    playSoundFrontEnd ( 6 )
	    setElementData(localPlayer, "Questão_07", "D")
		
		
	 elseif isCursorOnElement(x*488, y*525, x*406, y*44) then -- Proxima Etapa
	     playSoundFrontEnd ( 1 )
 	  if getElementData(localPlayer, "Questão_07") == "A" then
	     removeEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
      setTimer(function()	
		 Aprovado_Reprovado ()
      end, 500, 1)		 
		 
 	  elseif getElementData(localPlayer, "Questão_07") == "B" then
	     removeEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
      setTimer(function()	
		 Aprovado_Reprovado ()
      end, 500, 1)		 
		 
 	  elseif getElementData(localPlayer, "Questão_07") == "C" then
	     removeEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Erros", Erros + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
      setTimer(function()	
		 Aprovado_Reprovado ()
      end, 500, 1)		 

 	  elseif getElementData(localPlayer, "Questão_07") == "D" then
	     removeEventHandler("onClientRender", root, Questao_07)
	     playSoundFrontEnd ( 2 )
	     setElementData ( localPlayer, "DNL:Acertos", Acertos + 1 )
	     setElementData ( localPlayer, "DNL:Timer", Timer + 1 )
      setTimer(function()	
		 Aprovado_Reprovado ()
      end, 500, 1)		 
	  end     
	 end     
    end

--[[
         ><><><><><><><><><><><><><><><
         ><    Fazer Teste Direção   ><
         ><><><><><><><><><><><><><><><
--]]	
    if isEventHandlerAdded("onClientRender", getRootElement(), Aprovado) then  	 
	 if isCursorOnElement(x*488, y*372, x*406, y*44) then -- Fazer Teste Direção
	    playSoundFrontEnd ( 2 )
	    showChat(true)
		showCursor(true)
		removeEventHandler("onClientRender", root, Aprovado)
		addEventHandler("onClientRender", root, Dx_Categorias)

	 elseif isCursorOnElement(x*488, y*432, x*406, y*44) then -- Desistir
	    playSoundFrontEnd ( 2 )
	    showChat(true)
		showCursor(false)
		removeEventHandler("onClientRender", root, Aprovado)
	 end     
    end	

--[[
         ><><><><><><><><><><><><><><><
         ><         Reprovado        ><
         ><><><><><><><><><><><><><><><
--]]	
    if isEventHandlerAdded("onClientRender", getRootElement(), Reprovado) then  	 
	 if isCursorOnElement(x*488, y*605, x*406, y*44) then -- Fechar Detran
	    showChat(true)
		showCursor(false)
		removeEventHandler("onClientRender", root, Reprovado)
	 end     
    end	
	
  end
end
addEventHandler ( "onClientClick", root, Comecar_Prova )

function RemoverDatas ()
	setElementData ( localPlayer, "DNL:Timer", 0 )
	setElementData ( localPlayer, "DNL:Acertos", 0 )
	setElementData ( localPlayer, "DNL:Erros", 0 )
	setElementData ( localPlayer, "Questão_01", nil )
	setElementData ( localPlayer, "Questão_02", nil )
	setElementData ( localPlayer, "Questão_03", nil )
	setElementData ( localPlayer, "Questão_04", nil )
	setElementData ( localPlayer, "Questão_05", nil )
	setElementData ( localPlayer, "Questão_06", nil )
	setElementData ( localPlayer, "Questão_07", nil )
end

function Aprovado_Reprovado ()
  local Acertos = tonumber(getElementData(localPlayer, "DNL:Acertos")) or 0	 
  local Erros = tonumber(getElementData(localPlayer, "DNL:Erros")) or 0	
  if Acertos >= 6 then
    addEventHandler("onClientRender", root, Aprovado)  
  elseif Acertos < 6 then
    addEventHandler("onClientRender", root, Reprovado)
  end
end

--[[
         ><><><><><><><><><><><><><><><
         ><          IGNORA          ><
         ><><><><><><><><><><><><><><><
--]]
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
