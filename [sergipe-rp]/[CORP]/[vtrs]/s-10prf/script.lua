-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'yosemite.txd' ) 
engineImportTXD( txd, 404 ) 
dff = engineLoadDFF('yosemite.dff', 404) 
engineReplaceModel( dff, 404 )
end)
