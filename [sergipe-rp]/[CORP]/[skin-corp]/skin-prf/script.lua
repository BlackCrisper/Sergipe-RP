-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'dsher.txd' ) 
engineImportTXD( txd, 280 ) 
dff = engineLoadDFF('dsher.dff', 280) 
engineReplaceModel( dff, 280 )
end)
