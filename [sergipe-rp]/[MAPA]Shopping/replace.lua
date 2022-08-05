txd = engineLoadTXD("shopping.txd", 1866 )
engineImportTXD(txd, 1866)
dff = engineLoadDFF("shopping.dff", 1866 )
engineReplaceModel(dff, 1866)
col = engineLoadCOL ( "shopping.col" )
engineReplaceCOL ( col, 1866 )
engineSetModelLODDistance(1866, 99999) --ID do objeto e a distância que ele irá carregar - distancia está como 500
