-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '522.txd' ) 
engineImportTXD( txd, 522 ) 
dff = engineLoadDFF('522.DFF', 522) 
engineReplaceModel( dff, 522 )
end)
