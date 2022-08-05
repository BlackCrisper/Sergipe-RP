-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '429.txd' ) 
engineImportTXD( txd, 429 ) 
dff = engineLoadDFF('429.dff', 429) 
engineReplaceModel( dff, 429 )
end)
