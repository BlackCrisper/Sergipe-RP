-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'panto.txd' ) 
engineImportTXD( txd, 474 ) 
dff = engineLoadDFF('panto.dff', 474) 
engineReplaceModel( dff, 474 )
end)
