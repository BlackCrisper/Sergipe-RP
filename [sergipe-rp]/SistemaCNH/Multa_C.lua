editBox = guiCreateEdit( 561, 383, 297, 28, "", false )
guiSetVisible( editBox, false)
guiSetAlpha ( editBox, 0 )

function Painel_Multa ()
        dxDrawRectangle(551, 314, 317, 152, tocolor(18, 18, 18, 255), false)
        dxDrawRectangle(551, 314, 317, 27, tocolor(35, 35, 35, 255), false)
        dxDrawLine(551, 341, 868, 341, tocolor(50, 50, 50, 255), 1, false)
        dxDrawText("Multas", 551, 314, 868, 341, tocolor(117, 117, 117, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
		if  isCursorOnElement(561, 425, 140, 31) then
		dxDrawRectangle(561, 425, 140, 31, tocolor(63, 63, 63, 255), false)
		else
        dxDrawRectangle(561, 425, 140, 31, tocolor(43, 43, 43, 255), false)
		end
        dxDrawText("Pagar", 560, 425, 701, 456, tocolor(117, 117, 117, 255), 1.00, "default", "center", "center", false, false, false, false, false)
		if  isCursorOnElement(717, 425, 141, 31) then
		dxDrawRectangle(717, 425, 141, 31, tocolor(63, 63, 63, 255), false)
		else
        dxDrawRectangle(717, 425, 141, 31, tocolor(43, 43, 43, 255), false)
		end
        dxDrawText("Fechar", 717, 425, 858, 456, tocolor(117, 117, 117, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("Sua multa esta no valor de #0174DF"..(getElementData(localPlayer,"FC:Multas") or 0).."#676767 Reais", 561, 345, 858, 376, tocolor(103, 103, 103, 255), 1.00, "arial", "center", "center", false, false, false, true, false)
        dxDrawRectangle(561, 383, 297, 28, tocolor(65, 65, 65, 255), false)
		dxDrawText( guiGetText ( editBox ), 565, 383, 858, 411, tocolor(200, 203, 203, 255), 1.00, "arial", "left", "center", false, false, false, false, false)
end

FCpainelMulta = false
function abrirpainel ()
if FCpainelMulta == false then
addEventHandler ("onClientRender", root, Painel_Multa)
FCpainelMulta = true
guiSetVisible( editBox, true)
showCursor (true)
end
end
addEvent ("DNL:Abrir_Multas", true)
addEventHandler ("DNL:Abrir_Multas", root, abrirpainel)

function Pagar (_,state)
if FCpainelMulta == true then
if  state == "down"  then
if  isCursorOnElement(561, 425, 140, 31) then
triggerServerEvent ("DNL:Pagar_Multas", localPlayer, guiGetText ( editBox ))
end
end
end
end
addEventHandler ("onClientClick", root, Pagar)

function fechar (_,state)
if FCpainelMulta == true then
if  state == "down"  then
if  isCursorOnElement(717, 425, 141, 31) then
removeEventHandler ("onClientRender", root, Painel_Multa)
showCursor (false)
guiSetVisible( editBox, false)
FCpainelMulta = false
end
end
end
end
addEventHandler ("onClientClick", root, fechar)

local x,y = guiGetScreenSize()
 function isCursorOnElement(x,y,w,h)
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end