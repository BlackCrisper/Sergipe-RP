--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==Sistema do Som/Alarme--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==- 
local eventosomLS = "somLS"

function alarmbankcLS ()
alarmbankc1 = playSound3D("alarmbankc.mp3", 1116.6099853516, -1111.6259765625, 27.97500038147, true)
if isElement(alarmbankc1) then
setSoundVolume(alarmbankc1,1.0)
setSoundMaxDistance(alarmbankc1, 100)
setTimer ( function()
stopSound (alarmbankc1)
	end, 180000, 1 )
	 
	 
end
end
addEvent(eventosomLS, true)
addEventHandler(eventosomLS, root, alarmbankcLS)


----------------------------------------------------------------

local doorsongLS = "cofresomLS"

function vaultbankcLS ()
vaultbankc = playSound3D("doorbankc.mp3", 1144.0858154297,-1098.6868896484,19.467041015625, true)
if isElement(vaultbankc) then
setSoundVolume(vaultbankc,1.0)
setSoundMaxDistance(vaultbankc, 20)
setTimer ( function()
stopSound (vaultbankc)
	end, 1200, 1 )
	 
	
end
end
addEvent(doorsongLS, true)
addEventHandler(doorsongLS, root, vaultbankcLS)



                         




 


