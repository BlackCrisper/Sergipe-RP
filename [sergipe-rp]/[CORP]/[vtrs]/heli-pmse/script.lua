-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'polmav.txd' ) 
engineImportTXD( txd, 447 ) 
dff = engineLoadDFF('polmav.dff', 447) 
engineReplaceModel( dff, 447 )
end)
