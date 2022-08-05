-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'buffalo.txd' ) 
engineImportTXD( txd, 494 ) 
dff = engineLoadDFF('buffalo.dff', 494) 
engineReplaceModel( dff, 494 )
end)
