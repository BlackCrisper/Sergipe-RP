txd = engineLoadTXD ( "detran.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 5408 ) --Coloque o ID do objeto que voc� quer modificar
col = engineLoadCOL ( "detran.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 5408 ) --Coloque o ID do objeto que voc� quer modificar
dff = engineLoadDFF ( "detran.dff", 0 ) --Coloque o nome do DFF e n�o mexa nesse 0
engineReplaceModel ( dff, 5408 ) --Coloque o ID do objeto que voc� quer modificar
engineSetModelLODDistance(5408, 500) --ID do objeto e a dist�ncia que ele ir� carregar - distancia est� como 500
