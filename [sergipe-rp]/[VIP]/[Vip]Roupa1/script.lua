addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'rasta.txd' ) 
engineImportTXD( txd, 46 ) 
dff = engineLoadDFF('rasta.dff', 46) 
engineReplaceModel( dff, 46 )
end)
