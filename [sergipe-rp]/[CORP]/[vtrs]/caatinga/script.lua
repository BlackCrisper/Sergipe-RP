-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'fbiranch.txd' ) 
engineImportTXD( txd, 599 ) 
dff = engineLoadDFF('fbiranch.dff', 599) 
engineReplaceModel( dff, 599 )
end)
