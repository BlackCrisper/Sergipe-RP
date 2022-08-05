-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'copcarvg.txd' ) 
engineImportTXD( txd, 479 ) 
dff = engineLoadDFF('copcarvg.dff', 479) 
engineReplaceModel( dff, 479 )
end)
