-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'euros.txd' ) 
engineImportTXD( txd, 502 ) 
dff = engineLoadDFF('euros.dff', 502) 
engineReplaceModel( dff, 502 )
end)
