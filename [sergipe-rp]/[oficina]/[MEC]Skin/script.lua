-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByKLzada.txd' ) 
engineImportTXD( txd, 22 ) 
dff = engineLoadDFF('ByKLzada.dff', 22) 
engineReplaceModel( dff, 22 )
end)
