﻿txd = engineLoadTXD ( "porta.txd" )
engineImportTXD ( txd, 14582 )
col = engineLoadCOL ( "porta.col" )
engineReplaceCOL ( col, 14582 )
dff = engineLoadDFF ( "porta.dff" )
engineReplaceModel ( dff, 14582 )
engineSetModelLODDistance(14582, 99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)