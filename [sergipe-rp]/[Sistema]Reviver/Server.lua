
createEvent = function(event,element,func)
    addEvent(event,true)
    addEventHandler(event,element,func)
end;

DerrubarPlayer = function(player)
    if player then
        data = getElementData(player,'MDN:Derrubado')
        if data ~= true then
            setElementFrozen(player,true)
            setElementData(player,'MDN:Derrubado',true)
            removePedFromVehicle(player)
            setPedAnimation(player, "CRACK", "crckidle2", -1, false, false, false, true)
        end
    end
end
createEvent('MDN:Cair',root,DerrubarPlayer)

LevantarPlayer = function(player)
    if player then
        setElementFrozen(player,false)
        setElementHealth(player,100)
        setElementData(player,'MDN:Derrubado',false)
        setPedAnimation(player,nil) 
    end
end
createEvent('MDN:Levantar',root,LevantarPlayer)


addEventHandler( "onPlayerDamage", getRootElement(), 
function (attacker, damage_causing, bodypart, loss) 
    if getElementHealth(source) < 30 then
        if getElementData(source,'MDN:Derrubado') ~= true then 
            setElementData(source,'MDN:Derrubado',false)
            triggerClientEvent(source,'MDN:Derrubar',source,'cair')
        end
    end
end)


addEventHandler('onPlayerDamage', root, function(attacker, weapon, bodypart, loss)
    if (bodypart == 9 and attacker and attacker ~= source) then
        setElementHealth(source, 10)
    end
end
)