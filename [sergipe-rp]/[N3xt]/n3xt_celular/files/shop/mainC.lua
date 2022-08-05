addEvent("N3xT.onShopCelular", true)

local visible
local shop = function()
    exports.Blur:dxDrawBluredRectangle(x*0, y*0, screen[1], screen[2], tocolor(255,255,255))
    dxDrawImage(x*412, y*191, x*492, y*369, "files/shop/shop.png")
end

addEventHandler("N3xT.onShopCelular", root,
    function()
        if (visible ~= true) then
            addEventHandler("onClientRender", root, shop)
            showCursor(true)
            showChat(false)
            playSoundFrontEnd(20)
            setElementFrozen(localPlayer, true)
            visible = true
        end
    end
)

addEventHandler("onClientClick", root,
    function(button, state)
        if visible == true then
            if button == "left" and state == "down" then
                if isCursorOnElement(x*487, y*422, x*118, y*35) then
                    triggerServerEvent("N3xT.onBuyShopCelular", localPlayer, 1)
                elseif isCursorOnElement(x*689, y*422, x*118, y*35) then
                    triggerServerEvent("N3xT.onBuyShopCelular", localPlayer, 2)
                end
            end
        end
    end
)

addEventHandler("onClientKey", root,
    function(button)
        if button and button == "backspace" then
            if visible == true then
                removeEventHandler("onClientRender", root, shop)
                showCursor(false)
                showChat(true)
                playSoundFrontEnd(20)
                setElementFrozen(localPlayer, false)
                visible = false
            end            
        end
    end
)