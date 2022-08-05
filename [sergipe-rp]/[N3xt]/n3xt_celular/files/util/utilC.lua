screen = {guiGetScreenSize()} x, y = (screen[1]/1366), (screen[2]/768)

font = {
    dxCreateFont("files/font/yinmar.ttf", 36),
    dxCreateFont("files/font/yinmar.ttf", 12),
    dxCreateFont("files/font/MontserratSB.ttf", 18),
    dxCreateFont("files/font/MontserratMD.ttf", 12)
}

function message(msg, type)
    triggerEvent("N3xT.dxNotification", resourceRoot, msg, type)
end

function milToMin(value)
	seconds = math.floor(value/1000)
	local results = {}
	local sec = ( seconds %60 )
	local min = math.floor ( ( seconds % 3600 ) /60 )
	local hou = math.floor ( ( seconds % 86400 ) /3600 )
	if hou > 0 then
		return string.format("%01d:%02d:%02d", hou, min, sec)
	else
		return string.format("%02d:%02d", min, sec)
	end
end

function dxDrawRectangleBorde(x, y, w, h, borderColor, bgColor, postGUI)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200)
        end

        if (not bgColor) then
            bgColor = borderColor
        end

        dxDrawRectangle(x, y, w, h, bgColor, postGUI)

        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
    end
end

function isCursorOnElement(posX, posY, width, height)
    if isCursorShowing() then
        local MouseX, MouseY = getCursorPosition()
        local clientW, clientH = guiGetScreenSize()
        local MouseX, MouseY = MouseX * clientW, MouseY * clientH
        if (MouseX > posX and MouseX < (posX + width) and MouseY > posY and MouseY < (posY + height)) then
            return true
        end
    end
    return false
end