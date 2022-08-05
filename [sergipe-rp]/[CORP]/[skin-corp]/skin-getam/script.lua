-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'lapdm1.txd' ) 
engineImportTXD( txd, 284 ) 
dff = engineLoadDFF('lapdm1.dff', 284) 
engineReplaceModel( dff, 284 )
end)
