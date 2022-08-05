-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '589.txd' ) 
engineImportTXD( txd, 567 ) 
dff = engineLoadDFF('589.dff', 567) 
engineReplaceModel( dff, 567 )
end)
