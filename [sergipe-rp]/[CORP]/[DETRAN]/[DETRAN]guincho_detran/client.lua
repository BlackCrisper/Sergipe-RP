ID = 443

function TXDFile()
	TXD = engineLoadTXD("packer.txd")
	engineImportTXD(TXD,ID)
end
addEventHandler("onClientResourceStart",resourceRoot,TXDFile)


function DFFFile()
		DFF=engineLoadDFF("packer.dff")
		engineReplaceModel(DFF,ID)
end
addEventHandler("onClientResourceStart",resourceRoot,DFFFile)		