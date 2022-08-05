


local screenW,screenH = guiGetScreenSize()
local resW, resH = 1365,767
local x, y = (screenW/resW), (screenH/resH)

function Pdx ()
        dxDrawImage(325, 102, 695, 552, "botao.png", 0, 0, 0, tocolor(0, 0, 0, 179), false)
        dxDrawText("CARRO PRIVADO", 406, 256, 535, 276, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("MOTO PRIVADA", 406, 291, 535, 311, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("DESTRUIR", 406, 326, 535, 346, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("SKIN PRIVADA", 406, 361, 535, 381, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
     
        dxDrawText("EM BREVE", 406, 438, 535, 458, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawLine(392, 284, 946, 285, tocolor(0, 0, 0, 242), 1, false)
        dxDrawLine(392, 320, 946, 321, tocolor(0, 0, 0, 242), 1, false)
        dxDrawLine(392, 355, 946, 356, tocolor(0, 0, 0, 242), 1, false)
        dxDrawLine(392, 389, 946, 390, tocolor(0, 0, 0, 242), 1, false)
        dxDrawLine(392, 427, 946, 428, tocolor(0, 0, 0, 242), 1, false)
        dxDrawRectangle(978, 160, 0, 68, tocolor(255, 255, 255, 255), false)
        dxDrawRectangle(367, 164, 615, 64, tocolor(0, 0, 0, 242), false)
        dxDrawText("PAINEL STAFF Alcatraz City", 535, 174, 805, 213, tocolor(125, 9, 215, 254), 2.50, "default", "left", "top", false, false, false, false, false)
        dxDrawRectangle(366, 513, 615, 64, tocolor(17, 1, 30, 254), false)
        dxDrawText("FUNDADOR Marcola", 370, 513, 461, 528, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawImage(825, 246, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(825, 284, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(825, 320, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(723, 355, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(825, 355, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(825, 389, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(723, 427, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(825, 427, 102, 39, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawImage(725, 241, 104, 92, "botao.png", 0, 0, 0, tocolor(4, 55, 218, 221), false)
        dxDrawText("PEGAR", 857, 258, 913, 274, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("PEGAR", 857, 295, 913, 311, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("DESTRUIR", 847, 331, 903, 347, tocolor(251, 0, 0, 254), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("PEGAR F", 851, 366, 907, 382, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("PEGAR M", 749, 366, 805, 382, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("USAR", 759, 438, 815, 454, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("REMOVER", 848, 438, 904, 454, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("TELEPORT", 848, 401, 904, 417, tocolor(3, 247, 9, 254), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("BLINDAR", 755, 278, 811, 294, tocolor(3, 247, 9, 254), 1.00, "default", "left", "top", false, false, false, false, false)
    end

function abrir (_,state)
if painel == false then
showCursor(true)
addEventHandler("onClientRender", root, Pdx)
painel = true
else
showCursor(false)
removeEventHandler("onClientRender", root, Pdx)
painel = false
end
end
addEvent("painelrota", true)
addEventHandler("painelrota", root , abrir)

function togglePanel()
	if getElementData(localPlayer,nomeDaACL_Comandante) then
		if not isEventHandlerAdded("onClientRender",root,onClientRender) then
			guiGridListClear(playerList)
			for id, player in ipairs(getElementsByType("player")) do
				guiGridListSetItemText(playerList, guiGridListAddRow(playerList), 1, getPlayerName(player):gsub('#%x%x%x%x%x%x', ''), false, false)
			end
			guiSetVisible(playerList,true)
			guiSetVisible(edit,true)
			aVisible = true
			rVisible = true
			addEventHandler("onClientRender",root,onClientRender)
			showCursor(true)
		else
			guiSetVisible(playerList,false)
			guiSetVisible(edit,false)
			removeEventHandler("onClientRender",root,onClientRender)
			showCursor(false)			
		end
	end
end

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

function carro (_,state)
if painel == true then
if ( state == "down" ) then
if ( isCursorOnElement(825, 246, 102, 39)) then
triggerServerEvent ("carropl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, carro)

function moto (_,state)
if painel == true then
if ( state == "down" ) then
if ( isCursorOnElement(825, 284, 102, 39)) then
triggerServerEvent ("motopl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, moto)

function destrui (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(825, 320, 102, 39) then
triggerServerEvent ("destruipl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, destrui)

function skinm (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(723, 355, 102, 39) then
triggerServerEvent ("skinmpl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, skinm)

function skinf (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(825, 355, 102, 39) then
triggerServerEvent ("skinfpl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, skinf)

function teleport (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(825, 389, 102, 39) then
triggerServerEvent ("teleportpl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, teleport)


function blindar (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(725, 241, 104, 92) then
triggerServerEvent ("blindarpl", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, blindar)


		 