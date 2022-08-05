-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '400.txd' ) 
engineImportTXD( txd, 521 ) 
dff = engineLoadDFF('400.dff', 521) 
engineReplaceModel( dff, 521 )
end)
