-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'fbi.txd' ) 
engineImportTXD( txd, 267 ) 
dff = engineLoadDFF('fbi.dff', 267) 
engineReplaceModel( dff, 267 )
end)
