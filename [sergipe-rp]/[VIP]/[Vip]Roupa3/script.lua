addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'feminina.txd' ) 
engineImportTXD( txd, 55 ) 
dff = engineLoadDFF('feminina.dff', 55) 
engineReplaceModel( dff, 55 )
end)