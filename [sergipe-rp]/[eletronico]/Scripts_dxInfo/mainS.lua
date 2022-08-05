function dxInfoAddBox(sourceElement, text, type)
    triggerClientEvent(sourceElement, "dxInfoAddBox", sourceElement, text, type)
end
addEvent("dxInfoAddBox", true)
addEventHandler("dxInfoAddBox", root, dxInfoAddBox)