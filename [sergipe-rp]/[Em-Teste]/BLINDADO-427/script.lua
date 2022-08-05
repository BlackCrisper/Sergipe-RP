-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'enforcer.txd' ) 
engineImportTXD( txd, 427 ) 
dff = engineLoadDFF('enforcer.dff', 427) 
engineReplaceModel( dff, 427 )
end)
