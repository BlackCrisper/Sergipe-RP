local function Skin( ) 
    if eventName == 'onPlayerSpawn' then 
        local nData = getElementData( source, 'save-skin' ) 
        if nData then 
            setElementModel( source, nData ) 
        end 
    else 
        setElementData( source, 'save-skin', getElementModel( source ) ) 
    end 
end 
addEventHandler( 'onPlayerWasted', root, Skin ) 
addEventHandler( 'onPlayerSpawn', root, Skin )