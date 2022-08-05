-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '405.txd' ) 
engineImportTXD( txd, 426 ) 
dff = engineLoadDFF('405.dff', 426) 
engineReplaceModel( dff, 426 )
end)
