-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '400.txd' ) 
engineImportTXD( txd, 560 ) 
dff = engineLoadDFF('400.dff', 560) 
engineReplaceModel( dff, 560 )
end)
