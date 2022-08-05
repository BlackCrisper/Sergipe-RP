-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'comet.txd' ) 
engineImportTXD( txd, 503 ) 
dff = engineLoadDFF('comet.dff', 503) 
engineReplaceModel( dff, 503 )
end)
