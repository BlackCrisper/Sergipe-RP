-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'lapd1.txd' ) 
engineImportTXD( txd, 265 ) 
dff = engineLoadDFF('lapd1.dff', 265) 
engineReplaceModel( dff, 265 )
end)
