addEvent("N3xT.onClickPolicial", true)
addEvent("N3xT.onAlgemar", true)
addEvent("N3xT.onViatura", true)
addEvent("N3xT.onAgarrar", true)
addEvent("N3xT.onMultar", true)
addEvent("N3xT.ItensPM", true)
addEvent("N3xT.takeWeaponPM", true)

addEventHandler("N3xT.onClickPolicial", root,
	function(click)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("Policial")) then
			triggerClientEvent(source, "N3xT.onPainelPolicial", resourceRoot, click)
		end
	end
)

addEventHandler("N3xT.onAlgemar", root,
	function()
		local receiver = getElementData(source, "ReceiverPM")
		if (receiver) and not isPedInVehicle(receiver) then
			if not getElementData(receiver, "Algemado") then
				setElementData(receiver, "Algemado", true)
				message(source, "O jogador foi algemado.", "success")
				message(receiver, "Você foi algemado!", "info")
			else
				setElementData(receiver, "Algemado", nil)
				setPedAnimation(receiver, false)
				message(source, "O jogador foi desalgemado.", "success")
				message(receiver, "Você foi desalgemado.", "info")
			end
		end
	end
)

local carros = {}

function salvacarro(vei, assento, vitima)
	carros[source] = vei
end
addEventHandler("onPlayerVehicleEnter", root, salvacarro)

addEventHandler("N3xT.onViatura", root,
	function()
		local receiver = getElementData(source, "ReceiverPM")
		local vtr      = carros[source]
		if (receiver) and (vtr) then
			local vrx, vry, vrz = getElementRotation(vtr)
    		local px, py, pz    = getElementPosition(vtr)
			if not getElementData(receiver, "NaViatura") then
				if not isPedInVehicle(receiver) then
					setElementData(receiver, "NaViatura", true)
					message(source, "O jogador foi colocado na viatura.", "success")
					message(receiver, "Você foi colocado na viatura!", "info")

					attachElements(receiver, vtr, 0.2, -1.5, 0, 0,0,90)
            		setPedAnimation(receiver, 'ped','CAR_dead_LHS')
            		setElementRotation(receiver, vrx, vry, vrz + 83)
            	end
			else
				setElementData(receiver, "NaViatura", nil)
				message(source, "O jogador foi retirado da viatura.", "success")
				message(receiver, "Você foi retirado da viatura!", "info")

				detachElements(receiver, getElementAttachedTo(receiver))
				setElementPosition(receiver, px + 2, py + 2, pz)
				setPedAnimation(receiver)
			end
		end
	end
)

addEventHandler("N3xT.onAgarrar", root,
	function()
		local receiver = getElementData(source, "ReceiverPM")
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

addEventHandler("N3xT.onMultar", root,
	function(motivo, valor)
		local receiver = getElementData(source, "ReceiverPM")
		if (receiver) and not isPedInVehicle(receiver) then
			local money = getPlayerMoney(receiver)
			if (money >= tonumber(valor)) then
				message(source, "A multa foi aplicada com sucesso.", "success")
				message(receiver, "Você foi multado no valor de #00ff7fR$"..valor.." #ffffffpelo motivo: #a9a9a9"..motivo.."#ffffff.", "info")	
				takePlayerMoney(receiver, tonumber(valor))
			else
				message(source, "O jogador não possuí o valor da multa!", "error")
			end	
		end
	end
)

addEventHandler("N3xT.ItensPM", root,
	function(value, item, quantia)
		local receiver = getElementData(source, "ReceiverPM")
		if (receiver) then
			local next = exports.n3xt_inventario
			if (value == 1) then
				local itemTable = next:getAllItens(receiver)
				triggerClientEvent(source, "N3xT.refreshGridItemPM", resourceRoot, itemTable)
			elseif (value == 2) then
				next:takeItemS(source, receiver, item, tonumber(quantia))
				triggerClientEvent(source, "N3xT.setWindowPM", resourceRoot, 1)
			end
		end
	end
)

addEventHandler("N3xT.takeWeaponPM", root,
	function(arma)
		local receiver = getElementData(source, "ReceiverPM")
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