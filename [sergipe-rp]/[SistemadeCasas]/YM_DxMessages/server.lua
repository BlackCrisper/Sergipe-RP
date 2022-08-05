function addBox(sourceElement, msg, type)
    triggerClientEvent(sourceElement, "addBox", sourceElement, msg, type)
end
addEvent("addBox", true)
addEventHandler("addBox", root, addBox)