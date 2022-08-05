-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'vip2.txd' ) 
engineImportTXD( txd, 59 ) 
dff = engineLoadDFF('vip2.dff', 59) 
engineReplaceModel( dff, 59 )
end)
