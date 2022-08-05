function PlayerLogin(username, password, checksave)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount ( username, password )
			if ( account ~= false ) then
				if checksave == true then
					triggerClientEvent(source, "saveLoginToXML", getRootElement(), username, password)
				else
					triggerClientEvent(source, "resetSaveXML", getRootElement(), username, password)
				end
				local chek = logIn(source, account, password)
				if chek then 
					triggerClientEvent(source, "setLoginPanelVisible", getRootElement(), false)
				else
					triggerClientEvent(source, "showWarning", getRootElement(), 1, false, "Esta conta já está registrada")
				end
			else
				triggerClientEvent(source, "showWarning", getRootElement(), 1, false, "Login ou senha incorretos")
				triggerClientEvent(source, "showWarning", getRootElement(), 2, false, "Login ou senha incorretos")
			end
		else
			triggerClientEvent(source, "showWarning", getRootElement(), 2, false, "Digite a senha")
		end
	else
		triggerClientEvent(source, "showWarning", getRootElement(), 1, false, "Digite o login")
	end
end
addEvent("onRequestLogin", true)
addEventHandler("onRequestLogin", getRootElement(), PlayerLogin)

function outputChatBox (msg, pl)
exports.dpChat:message (pl, "global", msg)
end

function registerPlayer(username, email, password)
	if not (username == "") then
		if not (password == "") then
			if not (email == "") then
				local account = getAccount (username, password)
				if (account == false) then
					if getEmailFromAllAccount(email) then
						local accountID = #getAccounts() + 1
						local accountAdded = addAccount(tostring(username),tostring(password))
						if (accountAdded) then
							triggerEvent("rmta_save.createNewAccount", root, accountAdded, accountID, email)
							triggerClientEvent(source, "onAccountCreate", getRootElement())
						else
							triggerClientEvent(source, "showWarning", getRootElement(), 3, false, "Tente outros dados")
							triggerClientEvent(source, "showWarning", getRootElement(), 4, false, "Tente outros dados")
							triggerClientEvent(source, "showWarning", getRootElement(), 5, false, "Tente outros dados")
						end
					else
						triggerClientEvent(source, "showWarning", getRootElement(), 4, false, "Este email já está em uso")
					end
				else
					triggerClientEvent(source, "showWarning", getRootElement(), 3, false, "Este login está registrado")
				end
			else
				triggerClientEvent(source, "showWarning", getRootElement(), 4, false, "Digite o e-mail, por exemplo: nome@email.com")
			end
		else
			triggerClientEvent(source, "showWarning", getRootElement(), 5, false, "Digite a senha")
		end
	else
		triggerClientEvent(source, "showWarning", getRootElement(), 3, false, "Digite o login")
	end
end
addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",getRootElement(),registerPlayer)

function getEmailFromAllAccount(email) -- проверка 
	local accountTable = getAccounts ()
	for _, account in ipairs(accountTable) do
		if getAccountData(account, "account.email") == email then 
			return false 
		end
	end
	return true
end

function loggedOut()
	cancelEvent()
end
addEventHandler("onPlayerLogout",getRootElement(),loggedOut)