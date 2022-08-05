-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '411.txd' ) 
engineImportTXD( txd, 411 ) 
dff = engineLoadDFF('411.dff', 411) 
engineReplaceModel( dff, 411 )
end)
