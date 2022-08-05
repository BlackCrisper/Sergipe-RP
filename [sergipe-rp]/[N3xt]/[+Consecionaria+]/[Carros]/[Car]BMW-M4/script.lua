-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '506.txd' ) 
engineImportTXD( txd, 541 ) 
dff = engineLoadDFF('506.dff', 541) 
engineReplaceModel( dff, 541 )
end)
