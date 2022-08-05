-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ambulan.txd' ) 
engineImportTXD( txd, 416 ) 
dff = engineLoadDFF('ambulan.dff', 416) 
engineReplaceModel( dff, 416 )
end)
