-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'McLaren.txd' ) 
engineImportTXD( txd, 436 ) 
dff = engineLoadDFF('McLaren.dff', 436) 
engineReplaceModel( dff, 436 )
end)
