-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'oceanic.txd' ) 
engineImportTXD( txd, 451 ) 
dff = engineLoadDFF('oceanic.dff', 451) 
engineReplaceModel( dff, 451 )
end)
