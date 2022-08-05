-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD ( "obj.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 3273 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "obj.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 3273 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "obj.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 3273 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(3273, 99999998888888888) --ID do objeto e a distância que ele irá carregar - distancia está como 500
end)





-------------------------------------------------

--- MEU DISCORD DE MODELAGEM: https://discord.gg/ffGeK9D

------Créditos

---Autor da modelagem: Mathx

---JÁ SABE, TEM DIREITOS AUTORAIS! 

  ---- BOM PROVEITO DA MODELAGEM!

     -- CopyRight 2020

---====================================

---==============
