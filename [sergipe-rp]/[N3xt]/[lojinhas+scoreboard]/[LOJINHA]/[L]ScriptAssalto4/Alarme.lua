


--[[
███████╗███████╗███████╗██████╗     ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗██████╗
╚══███╔╝██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
  ███╔╝ █████╗  █████╗  ██║  ██║    ███████╗██║     ██████╔╝██║██████╔╝   ██║   █████╗  ██████╔╝
 ███╔╝  ██╔══╝  ██╔══╝  ██║  ██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ██╔══╝  ██╔══██╗
███████╗███████╗███████╗██████╔╝    ███████║╚██████╗██║  ██║██║██║        ██║   ███████╗██║  ██║
╚══════╝╚══════╝╚══════╝╚═════╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝╚═╝  ╚═╝
--]]


----------------------------------/ ALARME ASSALTO

function Zeed_Alarme_01 ()
    Alarme_Out = playSound3D("Alarme.mp3", 1834.824, -1848.089, 18.654) ----------------------------------/ POSIÇÃO ALARME
    setSoundVolume(Alarme_Out, 0.3) ----------------------------------/ VOLUME ALARME
    setSoundMinDistance(Alarme_Out, 0) ----------------------------------/ MINIMO. DISTANCIA SOM
    setSoundMaxDistance(Alarme_Out, 100) ----------------------------------/ MÁXIMO. DISTANCIA SOM
end
addEvent("Zeed_Ligar_Alarme1", true)
addEventHandler("Zeed_Ligar_Alarme1", root, Zeed_Alarme_01)

----------------------------------/ ALARME ASSALTO