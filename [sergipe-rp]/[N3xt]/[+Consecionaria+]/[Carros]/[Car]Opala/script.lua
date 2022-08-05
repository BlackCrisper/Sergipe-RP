-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '400.txd' ) 
engineImportTXD( txd, 475 ) 
dff = engineLoadDFF('400.dff', 475) 
engineReplaceModel( dff, 475 )
end)
