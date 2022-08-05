-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'swat.txd' ) 
engineImportTXD( txd, 285 ) 
dff = engineLoadDFF('swat.dff', 285) 
engineReplaceModel( dff, 285 )
end)
