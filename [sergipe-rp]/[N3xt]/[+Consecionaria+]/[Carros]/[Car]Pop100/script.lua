-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '462.txd' ) 
engineImportTXD( txd, 462 ) 
dff = engineLoadDFF('462.dff', 462) 
engineReplaceModel( dff, 462 )
end)
