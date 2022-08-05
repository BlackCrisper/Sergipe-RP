-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '507.txd' ) 
engineImportTXD( txd, 602 ) 
dff = engineLoadDFF('507.dff', 602) 
engineReplaceModel( dff, 602 )
end)
