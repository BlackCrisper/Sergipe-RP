-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'burrito.txd' ) 
engineImportTXD( txd, 497 ) 
dff = engineLoadDFF('burrito.dff', 497) 
engineReplaceModel( dff, 497 )
end)
