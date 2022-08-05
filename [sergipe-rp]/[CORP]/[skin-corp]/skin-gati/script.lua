-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'sfpd1.txd' ) 
engineImportTXD( txd, 266 ) 
dff = engineLoadDFF('sfpd1.dff', 266) 
engineReplaceModel( dff, 266 )
end)
