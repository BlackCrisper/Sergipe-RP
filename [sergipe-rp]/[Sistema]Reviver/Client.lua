local screen = {guiGetScreenSize()};
local x,y = (screen[1]/1366), (screen[2]/768) 


CAIR = {    visible = false     };
cair = true
tick = 0  

function renderizar()
    local count = interpolateBetween(5, 0, 0, 0, 0, 0,((getTickCount()-tick)/5000), "Linear")
    if cair == false then 
      dxDrawText('APERTE A LETRA #00FF00[E]#FFFFFF PARA SE LEVANTAR',x*523*2,y*688,x*319,y*15,tocolor(255, 255, 255, 255), y*1.2, 'default-bold', 'center', 'top', false, false, false, true, false);
    else
      dxDrawText('AGUARDE #0000FF '..math.floor(count)..' SEGUNDOS#FFFFFF PARA LEVANTAR',x*524*2,y*664,x*317,y*15,tocolor(255, 255, 255, 255), y*1.2,  'default-bold', 'center', 'top', false, false, false, true, false);
    end
end;


createEvent = function(event,element,func)
    addEvent(event,true) 
    addEventHandler(event,element,func)
end;

CAIR.starter = function(state)
    if state == 'cair' then 
        if CAIR['visible'] == false then
            cair = true 
            addEventHandler('onClientRender',root,renderizar) 
            triggerServerEvent('MDN:Cair',localPlayer,localPlayer,localPlayer)
            CAIR['visible'] = true 
            tick = getTickCount()
            setTimer(function()
                cair = false
                tick = 0 
                setElementData(localPlayer,'MDN:Derrubado',false) 
            end,5000,1)
        end
    elseif state == 'fechar' then 
        if CAIR['visible'] == true then
            CAIR['visible'] = false 
            cair = false
            tick = 0
            triggerServerEvent('MDN:Levantar',localPlayer,localPlayer,localPlayer)
            removeEventHandler('onClientRender',root,renderizar)
        end
    end
end;
createEvent('MDN:Derrubar',root,CAIR.starter)

bindKey('E','down',function()
    if CAIR['visible'] == true then
        if cair == false then 
            CAIR.starter('fechar')
        end
    end
end)

addEventHandler( "onClientKey", getRootElement(), 
function (button, pressOrRelease) 
    if getElementData(localPlayer,'MDN:Derrubado') and button ~= 'E' then
        cancelEvent()
    end
end)