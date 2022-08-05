-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '529.txd' ) 
engineImportTXD( txd, 529 ) 
dff = engineLoadDFF('529.dff', 529) 
engineReplaceModel( dff, 529 )
end)
