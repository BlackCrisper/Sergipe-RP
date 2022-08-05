-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '400.txd' ) 
engineImportTXD( txd, 496 ) 
dff = engineLoadDFF('400.dff', 496) 
engineReplaceModel( dff, 496 )
end)
