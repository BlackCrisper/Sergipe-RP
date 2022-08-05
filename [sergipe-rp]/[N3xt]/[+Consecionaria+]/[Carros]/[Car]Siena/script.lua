-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '580.txd' ) 
engineImportTXD( txd, 580 ) 
dff = engineLoadDFF('580.dff', 580) 
engineReplaceModel( dff, 580 )
end)
