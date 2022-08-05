function upLevel (thePlayer)
    for i,player in ipairs(getElementsByType("player")) do
        if ( player ) then
            if ( getPlayerAccount(player) ) and not ( isGuestAccount(getPlayerAccount(player)) ) then
                setElementData(player,"minutes",(getElementData(player,"minutes") or 0) +1)
                if ( getElementData(player,"minutes") > 59 ) then
                    setElementData(player,"minutes",0)
                    setElementData(player,"Level",(getElementData(player,"Level") or 0) +1)
                        local bonus = math.random(200,950)
                        local interest = math.random(100,200)
                        local value = (bonus-interest)
                    givePlayerMoney(player,value)
                        outputChatBox("#FFFFFF[ #FAAC58Level System #FFFFFF]", player, 255, 255, 255, true )
                        outputChatBox("#FFFFFFPagamento : R$ #00FF00"..value, player, 255, 255, 255, true )
                    local accName = getAccountName ( getPlayerAccount ( player ) )
                    if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Everyone" ) ) then
                    end
                end
            end
        end
    end
end
setTimer(upLevel,60000,0)

function setLevelLogin ()
	local account = getPlayerAccount(source)
	if ( account ) then
		local Level = (getAccountData(account,"Level") or 0)
		local minutes = (getAccountData(account,"minutes") or 0)
		setElementData(source,"Level",Level)
		setElementData(source,"minutes",minutes)
	end
end
addEventHandler("onPlayerLogin",getRootElement(),setLevelLogin)

function setLevelJoin ()
	setElementData(source,"Level",0)
	setElementData(source,"minutes",0)
end
addEventHandler("onPlayerJoin",getRootElement(),setLevelJoin)

function setLevelQuit ()
	local account = getPlayerAccount(source)
	if ( account ) then
		local minutes = (getElementData(source,"minutes") or 0)
		local Level = (getElementData(source,"Level") or 0)
		setAccountData(account,"minutes",minutes)
		setAccountData(account,"Level",Level)
	end
end
addEventHandler("onPlayerQuit",getRootElement(),setLevelQuit)