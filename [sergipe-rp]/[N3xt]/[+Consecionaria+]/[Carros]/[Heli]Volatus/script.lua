-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'maverick.txd' ) 
engineImportTXD( txd, 487 ) 
dff = engineLoadDFF('maverick.dff', 487) 
engineReplaceModel( dff, 487 )
end)
