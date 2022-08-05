function message(player, msg, type)
    triggerClientEvent(player, "N3xT.dxNotification", resourceRoot, msg, type)
end

function getPlayerID(id)
    v = false
    for i, player in ipairs (getElementsByType("player")) do
        if getElementData(player, "ID") == id then
            v = player
            break
        end
    end
    return v
end

local tableAccents = { ["à"] = "a",["á"] = "a",["â"] = "a",["ã"] = "a",["ä"] = "a",["ç"] = "c",["è"] = "e",["é"] = "e",["ê"] = "e",["ë"] = "e",["ì"] = "i",["í"] = "i",["î"] = "i",["ï"] = "i",["ñ"] = "n",["ò"] = "o",["ó"] = "o", ["ô"] = "o",["õ"] = "o",["ö"] = "o",["ù"] = "u",["ú"] = "u",["û"] = "u",["ü"] = "u",["ý"] = "y",["ÿ"] = "y",["À"] = "A",["Á"] = "A",["Â"] = "A",["Ã"] = "A",["Ä"] = "A",["Ç"] = "C",["È"] = "E",["É"] = "E",["Ê"] = "E",["Ë"] = "E",["Ì"] = "I",["Í"] = "I",["Î"] = "I",["Ï"] = "I",["Ñ"] = "N",["Ò"] = "O",["Ó"] = "O",["Ô"] = "O",["Õ"] = "O",["Ö"] = "O",["Ù"] = "U",["Ú"] = "U",["Û"] = "U",["Ü"] = "U",["Ý"] = "Y" }
function removeAccents(str)
	local noAccentsStr = ""
	for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if (tableAccents[strChar] ~= nil) then
			noAccentsStr = noAccentsStr..tableAccents[strChar]
		else
			noAccentsStr = noAccentsStr..strChar
		end
	end
	return noAccentsStr
end