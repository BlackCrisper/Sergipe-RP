-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'elegy.txd' ) 
engineImportTXD( txd, 562 ) 
dff = engineLoadDFF('elegy.dff', 562) 
engineReplaceModel( dff, 562 )
end)
