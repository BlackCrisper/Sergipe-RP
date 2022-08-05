-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'laemt1.txd' ) 
engineImportTXD( txd, 35 ) 
dff = engineLoadDFF('laemt1.dff', 35) 
engineReplaceModel( dff, 35 )
end)
