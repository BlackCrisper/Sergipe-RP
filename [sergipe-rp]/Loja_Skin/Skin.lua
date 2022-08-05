addEventHandler('onClientResourceStart', resourceRoot, 
function() 
	txd = engineLoadTXD ( "243.txd" )
	engineImportTXD ( txd, 12 )
        
	dff = engineLoadDFF ( "243.dff", 12 )
        engineReplaceModel ( dff, 12 ) 
  
     txd = engineLoadTXD ( "244.txd" )
	engineImportTXD ( txd, 13 )
	
	dff = engineLoadDFF ( "244.dff", 13 )
        engineReplaceModel ( dff, 13 ) 

        txd = engineLoadTXD ( "245.txd" )
	engineImportTXD ( txd, 14 )
        
	dff = engineLoadDFF ( "245.dff", 14 )
        engineReplaceModel ( dff, 14 ) 
   
        txd = engineLoadTXD ( "247.txd" )
	engineImportTXD ( txd, 15 )
        
	dff = engineLoadDFF ( "247.dff", 15 )
        engineReplaceModel ( dff, 15 )
		
		 txd = engineLoadTXD ( "248.txd" )
	engineImportTXD ( txd, 16 )
        
	dff = engineLoadDFF ( "248.dff", 16 )
        engineReplaceModel ( dff, 16 )
		
		 txd = engineLoadTXD ( "249.txd" )
	engineImportTXD ( txd, 26 )
        
	dff = engineLoadDFF ( "249.dff", 26 )
        engineReplaceModel ( dff, 26 )

    txd = engineLoadTXD( 'bfori.txd' ) 
    engineImportTXD( txd, 17 ) 
   dff = engineLoadDFF('bfori.dff', 17) 
   engineReplaceModel( dff, 17 )

   txd = engineLoadTXD( 'hmyri.txd' ) 
engineImportTXD( txd, 18 ) 
dff = engineLoadDFF('hmyri.dff', 18) 
engineReplaceModel( dff, 18 )

txd = engineLoadTXD( '19.txd' ) 
engineImportTXD( txd, 19 ) 
dff = engineLoadDFF('19.dff', 19) 
engineReplaceModel( dff, 19 )

txd = engineLoadTXD( 'bmybe.txd' ) 
engineImportTXD( txd, 20 ) 
dff = engineLoadDFF('bmybe.dff', 20) 
engineReplaceModel( dff, 20 )
txd = engineLoadTXD( 'ofyri.txd' ) 

engineImportTXD( txd, 21 ) 
dff = engineLoadDFF('ofyri.dff', 21) 
engineReplaceModel( dff, 21 )

txd = engineLoadTXD( 'wmosci.txd' ) 
engineImportTXD( txd, 22 ) 
dff = engineLoadDFF('wmosci.dff', 22) 
engineReplaceModel( dff, 22 )

txd = engineLoadTXD( 'bfost.txd' ) 
engineImportTXD( txd, 25 ) 
dff = engineLoadDFF('bfost.dff', 25) 
engineReplaceModel( dff, 25 )

txd = engineLoadTXD( 'hfyri.txd' ) 
engineImportTXD( txd, 1 ) 
dff = engineLoadDFF('hfyri.dff', 1) 
engineReplaceModel( dff, 1 )

txd = engineLoadTXD( '7.txd' ) 
engineImportTXD( txd, 7 ) 
dff = engineLoadDFF('7.dff', 7) 
engineReplaceModel( dff, 7 )

txd = engineLoadTXD( '2.txd' ) 
engineImportTXD( txd, 2 ) 
dff = engineLoadDFF('2.dff', 2) 
engineReplaceModel( dff, 2 )

txd = engineLoadTXD( '9.txd' ) 
engineImportTXD( txd, 9 ) 
dff = engineLoadDFF('9.dff', 9) 
engineReplaceModel( dff, 9 )

txd = engineLoadTXD( 'Rename.txd' ) 
engineImportTXD( txd, 10 ) 
dff = engineLoadDFF('Rename.dff', 10) 
engineReplaceModel( dff, 10 )

txd = engineLoadTXD( 'bmyap.txd' ) 
engineImportTXD( txd, 27 ) 
dff = engineLoadDFF('bmyap.dff', 27) 
engineReplaceModel( dff, 27 )

txd = engineLoadTXD( '24.txd' ) 
engineImportTXD( txd, 24 ) 
dff = engineLoadDFF('24.dff', 24) 
engineReplaceModel( dff, 24 )

end 
) 