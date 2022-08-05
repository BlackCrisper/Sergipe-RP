-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'HUNTLEY.txd' ) 
engineImportTXD( txd, 597 ) 
dff = engineLoadDFF('HUNTLEY.dff', 597) 
engineReplaceModel( dff, 597 )
end)
