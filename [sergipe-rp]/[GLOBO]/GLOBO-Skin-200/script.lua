-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'CinegrafistaDaBand.txd.txd' ) 
engineImportTXD( txd, 200 ) 
dff = engineLoadDFF('CinegrafistaDaBand.dff', 200) 
engineReplaceModel( dff, 200 )
end)
