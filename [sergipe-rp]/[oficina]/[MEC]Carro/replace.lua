txd = engineLoadTXD("525.txd")
engineImportTXD(txd,525)
dff = engineLoadDFF("525.dff",525)
engineReplaceModel(dff,525)