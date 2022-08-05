-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'fbiranch.txd' ) 
engineImportTXD( txd, 596 ) 
dff = engineLoadDFF('fbiranch.dff', 596) 
engineReplaceModel( dff, 596 )
end)
