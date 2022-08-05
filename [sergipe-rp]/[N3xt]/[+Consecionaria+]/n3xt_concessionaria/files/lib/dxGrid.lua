local font = dxCreateFont("files/font/font1.ttf", 10)
local font2 = dxCreateFont("files/font/font1.ttf", 11)

--[[*************************************************************************
*	PROJECT:		dxGridWlists
*	DEVELOPERS:		t3wz < github.com/t3wz >
*	VERSION:		1.2
****************************************************************************]]

dxGridW          =   { items = {} };
local cursorOn;

local NATIVE_RESOLUTION		=	{ 1366, 768 }
if ( table.maxn ( NATIVE_RESOLUTION ) == 2 ) then
	FIT_MODE				=	true
	RES                   	=   { guiGetScreenSize() };
	X,Y                   	=   RES[1] / NATIVE_RESOLUTION[1], RES[2] / NATIVE_RESOLUTION[2];
	SCALE                 	=   ( 1 / NATIVE_RESOLUTION[1] ) * RES[1];
end

function dxGridW:Create ( x, y, width, height, postGUI )

    if __checkParams ( "Create", "nnnn", x, y, width, height ) then
        local data = {
            x       =       FIT_MODE and ( x * X ) or x;    							
            y       =       FIT_MODE and ( y * Y ) or y;   								
            w       =       FIT_MODE and ( width * X ) or width;						
            h       =       FIT_MODE and ( height * Y ) or height; 						
            pg      =       postGUI or false;           								
            i       =       {};                         								
            mi      =       __calcMaxItems ( FIT_MODE and ( height * Y ) or height );	
            s       =       1;                          								
            r       =       -1;                         								
            se      =       -1;                         								
            mo      =       nil;                        								
            vis     =       true                        								
        };

        setmetatable ( data, { __index = dxGridW } );
        table.insert ( dxGridW.items, data );

        return data;
    end
end

function dxGridW:Destroy ()

    for k, v in pairs ( dxGridW.items ) do
        if v == self then
            dxGridW.items[k] = nil;
            return true;
        end
    end
    return false;
end

function dxGridW:SetVisible ( visible )
    
    if __checkParams ( "SetVisible", "b", visible ) then
        self.vis = visible

        return true
    else
        return false
    end
end

function dxGridW:IsVisible ( )

    return self.vis
end

function dxGridW:AddColumn ( title, width )

    if __checkParams ( "AddColumn", "sn", title, width ) then
        local data = {
            info    =   { title = title, width = FIT_MODE and ( width * X ) or width }
        };

        table.insert ( self.i, data );

        return #self.i;
    end
end

function dxGridW:RemoveColumn ( columnIndex )

    if __checkParams ( "RemoveColumn", "n", columnIndex ) then
        self.i[columnIndex] = nil;

        local highest = -1;

        for _, v in ipairs ( self.i ) do
            if #v > highest then
                highest = ( #v - 1 );
            end
        end

        self.r = highest;

        if ( ( ( self.s + self.mi ) - 2 ) == self.r ) then
            self.s = ( self.r - self.mi ) + 1;
        end

        return true
    end
    return false
end

function dxGridW:GetColumnCount ()

    return #self.i
end

function dxGridW:AddItem ( columnIndex, text, data, r, g, b )

    if __checkParams ( "AddItem", "ns", columnIndex, text ) then
        if self.i[columnIndex] then	
            local tColor = __checkRGB ( r, g, b ) and { r, g, b } or { 255, 255, 255 };
			
            table.insert ( self.i[columnIndex], { id = #self.i[columnIndex] + 1, text = tostring( text ), data = data, color = tColor } );

            if #self.i[columnIndex] > self.r then
                self.r = #self.i[columnIndex];
            end

            return #self.i[columnIndex];
        end
        return false;
    end
end

function dxGridW:RemoveItem ( column, itemID )

    if __checkParams ( "RemoveItem", "nn", column, itemID ) then
        if self.i[column] and self.i[column][itemID] then
            if self.r == #self.i[column] then
                local highest = -1;

                for _, v in ipairs ( self.i ) do
                    if #v > highest then
                        highest = ( #v - 1 );
                    end
                end

                self.r = highest;
            end

            if ( ( ( self.s + self.mi ) - 2 ) == self.r ) then
                self.s = ( self.r - self.mi ) + 1;
            end

            if itemID == self.se then
                local newItem   =   self.se - 1

                if newItem <= self.r then
                    self.se = math.max ( 0, newItem );
                else
                    self.se = -1
                end
            end

            table.remove ( self.i[column], itemID );

            return true;
        end
        return false
    end
end

function dxGridW:GetItemCount ( columnID )

    if __checkParams ( "GetItemCount", "n", columnID ) then
        if self.i[columnID] then
            return #self.i[columnID]
        end
        return false
    end
end

function dxGridW:Clear ()

    for k, v in ipairs ( self.i ) do
        self.i[k] = { info = v.info }
    end

    self.r = -1

    self.s = 1;

    return true
end

function dxGridW:GetSelectedItem ( )

    return self.se;
end

function dxGridW:SetSelectedItem ( itemID )

    if __checkParams ( "SetSelectedItem", "n", itemID ) then
        if itemID <= self.r then
            self.se = itemID;
            return self.se == itemID;
        end
        return false;
    end
end

function dxGridW:GetItemDetails ( column, itemID )

    if __checkParams ( "GetItemDetails", "nn", columnID, itemID ) then
        if self.i[column] then
            if self.i[column][itemID] then
                return self.i[column][itemID].text, self.i[column][itemID].data
            end
        end
        return false
    end
end

addEventHandler ( "onClientRender", root,
    function ( )
        if #dxGridW.items > 0 then
            for index, data in ipairs ( dxGridW.items ) do
                if data.vis then
                    dxDrawRectangle ( data.x, data.y, data.w, data.h, tocolor ( 0, 0, 0, 150 ), data.pg );

                    dxDrawRectangle ( data.x, data.y, data.w, 30 % data.h, tocolor ( 0, 255, 127, 200 ), data.pg );

                    cursorOn = nil
                    if __isMouseInPosition ( data.x, data.y, data.w, data.h ) then
                        cursorOn = index;
                    end

                    local seeFrom   =   data.s;
                    local seeTo     =   ( data.s + data.mi ) - 1;

                    if data.se and data.se <= data.r and data.se >= seeFrom and data.se <= seeTo then
                        local index     =   data.se - ( data.s - 1 );
                        local y2        =   data.y + ( ( index - 1 ) * 25 );

                        dxDrawRectangle ( data.x, ( 30 % data.h ) + y2, data.w, 27, tocolor ( 0, 255, 127, 50 ), data.pg );
                    end

                    if #data.i > 0 then
                    local cWidth = 0

                        for cIndex, cData in ipairs ( data.i ) do
                            if ( ( cWidth + cData.info.width ) <= data.w ) then
                                local x = data.x + cWidth;

                                dxDrawText ( cData.info.title, x, data.y, cData.info.width + x, ( 30 % data.h ) + data.y, tocolor ( 255, 255, 255 ), FIT_MODE and ( 1 * SCALE ) or 1, font2, "center", "center", true, false, data.pg, true, false );

                                cData.info.selected = -1;

                                if #cData > 0 then
                                    local seeFrom   =   data.s;
                                    local seeTo     =   ( data.s + data.mi ) - 1;

                                    for iIndex = seeFrom, seeTo do
                                        if cData[iIndex] then
                                            local index     =   iIndex - ( data.s - 1 );
                                            local y         =   data.y + ( index * 25 );
                                            local y2        =   data.y + ( ( index - 1 ) * 25 );

                                            if __isMouseInPosition ( data.x, ( 30 % data.h ) + y2, data.w, 27 ) then
                                                data.mo = iIndex;
                                            end
											
                                            if cData[iIndex]["text"] == "separation" then
                                            else
                                            dxDrawText ( cData[iIndex]["text"], x, y, cData.info.width + x, ( 35 % data.h ) + y, tocolor ( unpack ( cData[iIndex]["color"] ) ), FIT_MODE and ( 1 * SCALE ) or 1, font, "center", "center", false, false, data.pg, true, false );
                                            end
                                        end
                                    end
                                end

                                cWidth = cWidth + cData.info.width;
                            end
                        end
                    end
                end
            end
        end
    end
, true, "low-5")

addEventHandler ( "onClientKey", root,
    function ( button, press )
        if isCursorShowing () then
            if #dxGridW.items > 0 then
                if cursorOn then
                    if press and #button > 6 then
                        if dxGridW.items[cursorOn].r > dxGridW.items[cursorOn].mi then
                            local index         =   cursorOn;
                            local currentValue  =   dxGridW.items[index].s;
                            local newValue      =   math.max ( 1, button == "mouse_wheel_down" and currentValue + 1 or button == "mouse_wheel_up" and currentValue - 1 or button == "arrow_u" and currentValue -1 or button == "arrow_d" and currentValue +1 );

                            if ( ( newValue + dxGridW.items[index].mi ) > dxGridW.items[index].r ) then
                                newValue = ( dxGridW.items[index].r - dxGridW.items[index].mi ) + 1;
                            end

                            dxGridW.items[index].s = newValue;
                        end
                    elseif press and button == "mouse1" and dxGridW.items[cursorOn].mo then
                        dxGridW.items[cursorOn].se = dxGridW.items[cursorOn].mo;
                    end
                end
            end
        end
    end
)

function __calcMaxItems ( height )
    for i = 0, 9999 do
        if ( ( ( i + 1 ) * 25 ) >= math.floor ( height ) ) then
            return ( ( ( i + 1 ) * 25 ) > math.floor ( height ) and ( i - 1 ) or i );
        end
    end
    return false;
end

function __checkParams ( methodName, pattern, ... )
    local cTable = {
        ["string"] = "s";
        ["number"] = "n";
        ["boolean"] = "b";

        ["s"] = "string";
        ["n"] = "number";
        ["b"] = "boolean"
    };

    if #pattern > table.maxn ( { ... } ) then
        local index = table.maxn ( { ... } ) == 0 and 1 or table.maxn ( { ... } ) + 1
        return false, error ( "Bad Argument @ '"..methodName.."' [Expected "..cTable[ pattern:sub ( index, index ) ].." at argument "..index..", got none]" )
    end

    for k, v in pairs ( { ... } ) do
        if cTable[ type ( v ) ] ~= pattern:sub ( k, k ) then
            return false, error ( "Bad Argument @ '"..methodName.."' [Expected "..cTable[ pattern:sub ( k, k ) ].." at argument "..k..", got "..( type ( v ) or "none" ).."]" )
        end
    end
    return true;
end

function __checkRGB ( r, g, b )
	if ( not r ) or ( not g ) or ( not b ) then
		return false;
	end
	
	for _, v in ipairs ( { r, g, b } ) do
		if ( type ( v ) ~= "number" ) or ( v < 0 ) or ( v > 255 ) then
			return false;
		end
	end
	
	return true;
end

function __isMouseInPosition ( x, y, w, h )
    if not isCursorShowing() then return false end

    local res   =   { guiGetScreenSize() };
    local cpos  =   { getCursorPosition() };
    local fpos  =   { res[1] * cpos[1], res[2] * cpos[2] };
    return ( fpos[1] >= x and fpos[1] <= x + w ) and ( fpos[2] >= y and fpos[2] <= y + h )
end

local sx, sy = guiGetScreenSize()
local font = dxCreateFont("files/font/Medium.ttf", 8)

function dxDrawEditBox(text, x, y, w, h, password, maxCharacter, element)
	local getText = getElementData(element, "text2") or setElementData(element, "text2", "")
	local state = getElementData(element, "state") or setElementData(element, "state", false)
	local character = getElementData(element, "maximum") or setElementData(element, "maximum", maxCharacter)
	--dxDrawRectangle(x, y, w, h, tocolor(0, 0, 0, 180), false)
	if (#getElementData(element, "text2") == 0) then
		dxDrawText(text, x + 5, y, x + w - 10, y + h, tocolor(0, 0, 0, 180), 1, font, "center", "center", true, false, false)
	end
	if (dxGetTextWidth(password and string.gsub(getElementData(element, "text2"), ".", "•") or getElementData(element, "text2"), 1, font) <= w - 10) then
		dxDrawText(password and string.gsub(getElementData(element, "text2"), ".", "•") or getElementData(element, "text2"), x + 5, y, x + w - 10, y + h, tocolor(0, 0, 0, 180), 1, font, "left", "center", true, false, false)
	else
		dxDrawText(password and string.gsub(getElementData(element, "text2"), ".", "•") or getElementData(element, "text2"), x + 5, y, x + w - 10, y + h, tocolor(0, 0, 0, 180), 1, font, "right", "center", true, false, false)
	end
	if (getElementData(element, "state") == true) then
		if (dxGetTextWidth(password and string.gsub(getElementData(element, "text2"), ".", "•") or getElementData(element, "text2"), 1, font) <= w - 10) then
			dxDrawLine(x + 5 + dxGetTextWidth(password and string.gsub(getElementData(element, "text2"), ".", "•") or getElementData(element, "text2"), 1, font), y + 5, x + 5 + dxGetTextWidth(password and string.gsub(getElementData(element, "text2"), ".", "•") or getElementData(element, "text2"), 1, font), y + h - 5, tocolor(0, 0, 0, math.abs(math.sin(getTickCount() / 255) * 255)), 1, false)
		else
			dxDrawLine(x + w - 10, y + 5, x + w - 10, y + h - 5, tocolor(0, 0, 0, math.abs(math.sin(getTickCount() / 255) * 255)), 1, false)
		end
	end
	if (isCursorOnElement(x, y, w, h)) then
		setElementData(element, "mouseState", "hovered")
	else
		setElementData(element, "mouseState", "normal")
	end
end

function dxClickElement(button, state, cx, cy)
	if (button == "left") and (state == "down") then
		local buttonId = false
		for id, element in ipairs(getElementsByType("dxButton")) do
			if (getElementData(element, "mouseState") == "hovered") then
				buttonId = id
			end
		end
		if (buttonId) then
			if (isElement(getElementsByType("dxButton")[buttonId])) then
				setElementData(getElementsByType("dxButton")[buttonId], "mouseState", "clicked")
				triggerEvent("onClickButton", getElementsByType("dxButton")[buttonId])
			end
		end
	end
	if (button == "left") and (state == "down") then
		local editBoxId = false
		for id, element in ipairs(getElementsByType("N3xT.Conce")) do
			if (getElementData(element, "mouseState") == "hovered") then
				editBoxId = id
			elseif (getElementData(element, "mouseState") == "normal") then
				if (getElementData(element, "state") == true) then
					guiSetInputMode("allow_binds")
					setElementData(element, "state", false)
				end
			end
		end
		if (editBoxId) then
			if (isElement(getElementsByType("N3xT.Conce")[editBoxId])) then
				if (getElementData(getElementsByType("N3xT.Conce")[editBoxId], "state") == false) then
					guiSetInputMode("no_binds")
					setElementData(getElementsByType("N3xT.Conce")[editBoxId], "state", true)
				end
			end
		end
	end
	if (button == "left") and (state == "down") then
		local checkBoxId = false
		for id, element in ipairs(getElementsByType("dxCheckBox")) do
			if (getElementData(element, "mouseState") == "hovered") then
				checkBoxId = id
			end
		end
		if (checkBoxId) then
			if (isElement(getElementsByType("dxCheckBox")[checkBoxId])) then
				if (getElementData(getElementsByType("dxCheckBox")[checkBoxId], "state") == true) then
					setElementData(getElementsByType("dxCheckBox")[checkBoxId], "state", false)
				else
					setElementData(getElementsByType("dxCheckBox")[checkBoxId], "state", true)
				end
			end
		end
	end
	if (button == "left") then
		for _, element in ipairs(getElementsByType("dxGridList")) do
			if (getElementData(element, "mouseState") == "hovered") then
				local barCount = getElementData(element, "barCount")
				local barList = getElementData(element, "barList")
				if (#barList > barCount) then
					local x = getElementData(element, "x")
					local y = getElementData(element, "y")
					local w = getElementData(element, "w")
					local h = getElementData(element, "h")
					local scrollOffset = getElementData(element, "scrollOffset")
					local scrollY = getElementData(element, "scrollY")
					local scrollSpace = #barList > barCount and 11 or 0
					local size = barCount / #barList
					local scrollList = scrollOffset / #barList
					if (state == "down") then
						if (cx >= x + w - scrollSpace) and (cx <= x + w - scrollSpace + 3) and (cy >= y + scrollList * h) and (cy <= y + scrollList * h + size * h) then
							setElementData(element, "scrollAlpha", 255)
							setElementData(element, "scrollAttached", true)
							local mouseOffset = y + scrollY * (1 - size) * h
							setElementData(element, "scrollAttachedOffset", cy - mouseOffset)
						end
					end
				end
				if (state == "up") and not (getElementData(element, "scrollAttached")) then
					setElementData(element, "selected", {getElementData(element, "barAttached")[1], getElementData(element, "barAttached")[2] or ""})
					triggerEvent("loginClick", element)
				end
			end
			if (state == "up") then
				setElementData(element, "scrollAttached", false)
				setElementData(element, "scrollAlpha", 150)
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), dxClickElement)

function dxCharacterElement(button)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	for _, element in ipairs(getElementsByType("N3xT.Conce")) do
		if (getElementData(element, "state") == true) then
			if (#getElementData(element, "text2") < getElementData(element, "maximum")) then
				setElementData(element, "text2", getElementData(element, "text2")..button)
			end
		end
	end
end
addEventHandler("onClientCharacter", getRootElement(), dxCharacterElement)

function dxKeyElement(button, press)
	if (isChatBoxInputActive()) or (isConsoleActive()) or (isMainMenuActive()) then
		return
	end
	if (press) and (button == "backspace") then
		for _, element in ipairs(getElementsByType("N3xT.Conce")) do
			if (getElementData(element, "state") == true) then
				if (#getElementData(element, "text2") > 0) then
					setElementData(element, "text2", string.sub(getElementData(element, "text2"), 1, #getElementData(element, "text2") - 1))
				end
			end
		end
	end
end
addEventHandler("onClientKey", getRootElement(), dxKeyElement)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
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

function isCursorOnElement( posX, posY, width, height )
  	if isCursorShowing( ) then
   	 	local mouseX, mouseY = getCursorPosition( )
    	local clientW, clientH = guiGetScreenSize( )
    	local mouseX, mouseY = mouseX * clientW, mouseY * clientH
    	if mouseX > posX and mouseX < (posX + width) and mouseY > posY and mouseY < (posY + height) then
      		return true
   	 	end
  	end
  	return false
end