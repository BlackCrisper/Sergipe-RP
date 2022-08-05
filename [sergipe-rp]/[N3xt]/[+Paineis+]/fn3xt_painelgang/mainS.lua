addEvent("N3xT.onClickGang", true)
addEvent("N3xT.onSaquearDinheiro", true)
addEvent("N3xT.onAgarrarGANG", true)
addEvent("N3xT.ItensGANG", true)
addEvent("N3xT.takeWeaponGANG", true)

addEventHandler("N3xT.onClickGang", root,
	function(click)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("gang")) then
			triggerClientEvent(source, "N3xT.onPainelGang", resourceRoot, click)
		end
	end
)

addEventHandler("N3xT.onSaquearDinheiro", root,
	function()
		local receiver = getElementData(source, "ReceiverGANG")
		if (receiver) and not isPedInVehicle(receiver) then
			if not getElementData(source, "SaqueouRecente") then
				if not getElementData(receiver, "SaqueadoRecente") then
					local money = getPlayerMoney(receiver)
					if (money >= 500) then
						local soma = math.floor(money / 8)
						takePlayerMoney(receiver, soma)
						givePlayerMoney(source, soma)
						message(source, "O jogador foi saqueado, #00ff7fR$"..soma.."#ffffff.", "success")
						message(receiver, "Você foi saqueado e perdeu #00ff7fR$"..soma.."#ffffff!", "info")
						setElementData(source, "SaqueouRecente", true)
						setElementData(receiver, "SaqueadoRecente", true)
						setTimer(setElementData, 60000 * 5, 1, receiver, "SaqueadoRecente", nil)
						setTimer(setElementData, 60000 * 5, 1, source, "SaqueouRecente", nil)
					else
						message(source, "O jogador não possuí dinheiro suficiente para ser saqueado!", "error")
					end
				else
					message(source, "O jogador foi saqueado recentemente!", "error")
				end
			else
				message(source, "Você saqueou um jogador recentemente!", "error")
			end
		end
	end
)

addEventHandler("N3xT.onAgarrarGANG", root,
	function()
		local receiver = getElementData(source, "ReceiverGANG")
		if (receiver) and not isPedInVehicle(receiver) then
			if not (getElementData(receiver, "Agarrado") == true) then
				setElementData(receiver, "Agarrado", true)
				message(source, "O jogador foi agarrado.", "success")
				message(receiver, "Você foi agarrado!", "info")

				attachElements(receiver, source, 0, 1, 0)
			else
				setElementData(receiver, "Agarrado", nil)
				message(source, "O jogador foi desagarrado.", "success")
				message(receiver, "Você foi desagarrado!", "info")

				detachElements(receiver, source)
			end
		end
	end
)

addEventHandler("N3xT.ItensGANG", root,
	function(value, item, quantia)
		local receiver = getElementData(source, "ReceiverGANG")
		if (receiver) then
			local next = exports.n3xt_inventario
			if (value == 1) then
				local itemTable = next:getAllItens(receiver)
				triggerClientEvent(source, "N3xT.refreshGridItemGANG", resourceRoot, itemTable)
			elseif (value == 2) then
				next:takeItemS(source, receiver, item, tonumber(quantia))
				triggerClientEvent(source, "N3xT.setWindowPM", resourceRoot, 1)
			end
		end
	end
)

addEventHandler("N3xT.takeWeaponGANG", root,
	function(arma)
		local receiver = getElementData(source, "ReceiverGANG")
		if (receiver) then
			local id = getWeaponIDFromName(arma)
			takeWeapon(receiver, id)
			triggerClientEvent(source, "N3xT.setWindowPM", resourceRoot, 1)
			message(source, "A arma foi retirada com sucesso.", "success")
			message(receiver, "Foi retirado de você a arma #00ff7f"..arma.."#ffffff.", "info")
		end
	end
)

function message(player, message, type)
	triggerClientEvent(player, "N3xT.dxNotification", resourceRoot, message, type)
end