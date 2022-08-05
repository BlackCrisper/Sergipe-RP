-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'sanchez.txd' ) 
engineImportTXD( txd, 468 ) 
dff = engineLoadDFF('sanchez.dff', 468) 
engineReplaceModel( dff, 468 )
end)
