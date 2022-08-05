if fileExists("codeC.lua") then
	fileDelete("codeC.lua")
end

local monitorSize = {guiGetScreenSize()}
local panelSize = {280 + 40, 70}
local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]-panelSize[2]
local Font = dxCreateFont("files/myriadproregular.ttf", 9)
local Cars = { [462]=true, [458]=true, [462]=true, [495]=true, [479]=true, [418]=true, [516]=true, [416]=true, [426]=true, [550]=true, [467]=true, [604]=true, [421]=true, [596]=true, [597]=true, [598]=true, [599]=true, [400]=true, [427]=true, [490]=true, [523]=true, [404]=true, [599]=true, [547]=true , [507]=true, [566]=true, [528]=true , [470]=true , [529]=true,[426]=true, [585]=true, [479]=true }



local x,y = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]-panelSize[2]
local sirenaMove 
local soundElementsOutside = { }
local soundElementsOutsideHorn = { }
local sirenTable = {
	{"siren", 65, 131, 215, "police_sirena.mp3"},
	{"siren", 142, 193, 12, "police_sirena_2.mp3"},
	{"siren", 210, 77, 87, "omsz_sirena.mp3"},
	{"horn", 248, 148, 6, "horn.mp3"},
}

vehicleLampColor = {}

local song = nil
local horn = nil

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function ()
	if isPedInVehicle(localPlayer) then 
		
		local veh =  getPedOccupiedVehicle(localPlayer)
		local seat =  getPedOccupiedVehicleSeat(localPlayer)
		if not Cars[getElementModel(veh)] then return end
		if seat >= 2 then return end
		
		if  Cars[getElementModel(getPedOccupiedVehicle(localPlayer))] then 
			removeEventHandler("onClientRender", root, showSirenPanel)
			addEventHandler("onClientRender", root, showSirenPanel)
			removeEventHandler("onClientClick", root, sirenClick)
			addEventHandler("onClientClick", root, sirenClick)			
			createGui("create")
			currentSiren = 0
			current = 0
			getPedOccupiedVehicle(localPlayer):setData("vehicle:siren", 0) 
			getPedOccupiedVehicle(localPlayer):setData("vehicle:horn", 0) 
		end
	end
end)

addEventHandler("onClientVehicleEnter", root, function (player, seat)
	if player ~= getLocalPlayer() then return end
	if not Cars[getElementModel(source)] then return end
	if seat >= 2 then return end
	
	if Cars[getElementModel(source)] then
		if seat < 2 then
			removeEventHandler("onClientRender", root, showSirenPanel)	
			addEventHandler("onClientRender", root, showSirenPanel)
			removeEventHandler("onClientClick", root, sirenClick)
			addEventHandler("onClientClick", root, sirenClick)
			createGui("create")
			currentSiren = 0
			current = 0
		end
	end
end)

addEventHandler("onClientVehicleExit", root, function (player)
	if player ~= getLocalPlayer() then return end
		removeEventHandler("onClientRender", root, showSirenPanel)	
		removeEventHandler("onClientClick", root, sirenClick)
		createGui("remove")
		currentSiren = 0
		current = 0
end)


function createGui(type)
	if type == "create" then 
		if not isElement(sirenaMove) then
			sirenaMove = guiCreateWindow( monitorSize[1]/2-panelSize[1]/2+30, monitorSize[2]-panelSize[2]-120,panelSize[1] -60, panelSize[2], "", false)
			guiSetAlpha(sirenaMove, 0)
			guiWindowSetSizable ( sirenaMove, false )
		end
	else
		--if isElement(sirenaMove) then destroyElement(sirenaMove) end
	end
end

local currentSiren = 0
function sirenClick(button, state, clickX, clickY)
	local x, y = guiGetPosition ( sirenaMove, false )
	local vehicle = getPedOccupiedVehicle(localPlayer)	
	if button == "left" and state == "down" then 
		for index, value in ipairs (sirenTable) do
			if dobozbaVan(x-55+index*(50)+17, y+panelSize[2]/2-10 , 40, 40, clickX, clickY) then 
				if vehicle:getData("vehicle:siren")  ~= index then 
					currentSiren = index
					if index ~= 4 then 
						vehicle:setData("vehicle:siren", currentSiren)
						triggerServerEvent("SirenSinc", localPlayer, currentSiren)
						--exports.global:sendLocalMeAction(localPlayer," bekapcsolja a szirénát a műszerfalon.")
						--vehicle:setData("vehicle:siren:sound", 0.1)
					else
						--vehicle:setData("vehicle:siren:sound", 0.1)
						vehicle:setData("vehicle:horn", 4) 
						triggerServerEvent("SirenHorn", localPlayer, 4)
						setTimer(function ()
							vehicle:setData("vehicle:horn", 0) 
							triggerServerEvent("SirenHorn", localPlayer, 0)	
						end, 800, 1)
					end
				else
					triggerServerEvent("SirenSinc", localPlayer, 0)
					vehicle:setData("vehicle:siren", 0) 
					--exports.global:sendLocalMeAction(localPlayer," kikapcsolja a szirénát a műszerfalon.")
				end
			end
		end
		if isInSlot(x-57+5+5*(50)+19, y+panelSize[2]/2-6 , 28, 28) then
			toggleFlashers()
		end
	end
end


function showSirenPanel()
	if not isPedInVehicle(localPlayer) then return end
	local x, y = guiGetPosition ( sirenaMove, false )
	dxDrawRectangle(x, y , panelSize[1]-60, panelSize[2], tocolor(0, 0, 0, 100))
	dxDrawBorder(x, y , panelSize[1]-60, panelSize[2], tocolor(0, 0, 0, 200),1)
	dxDrawRectangle(x, y , panelSize[1]-60, 20, tocolor(0, 0, 0, 90))
	dxDrawBorder(x, y , panelSize[1]-60, 20, tocolor(0, 0, 0, 200),1)
	dxDrawText("NP - Sirene",x+panelSize[1]/2-1, y+20/2+1, x+panelSize[1]/2-60-1, y+20/2+1, tocolor(0, 0, 0, 255),1, Font, "center", "center", false, false, false, true) 
	dxDrawText("#CC0C0ECNRP #ffffff- #ffffffSirene",x+panelSize[1]/2, y+20/2, x+panelSize[1]/2-60, y+20/2, tocolor(255, 255, 255, 255),1, Font, "center", "center", false, false, false, true) 
	for index, value in ipairs (sirenTable) do 
		if isInSlot(x-55+index*(50)+17, y+panelSize[2]/2-10 , 40, 40) or getPedOccupiedVehicle(localPlayer):getData("vehicle:siren") == index or getPedOccupiedVehicle(localPlayer):getData("vehicle:horn") == index then 
			dxDrawImage(x-57+5+index*(50)+17-1, y+panelSize[2]/2-7+1 , 32, 32, "files/" ..value[1].. ".png", 0, 0, 0, tocolor(0,0,0, 255))
			dxDrawImage(x-57+5+index*(50)+17, y+panelSize[2]/2-7 , 32, 32, "files/" ..value[1].. ".png", 0, 0, 0, tocolor(value[2], value[3], value[4], 255))
		else
			dxDrawImage(x-57+5+index*(50)+17-1, y+panelSize[2]/2-7+1 , 32, 32, "files/" ..value[1].. ".png", 0, 0, 0, tocolor(0, 0, 0, 255))
			dxDrawImage(x-57+5+index*(50)+17, y+panelSize[2]/2-7 , 32, 32, "files/" ..value[1].. ".png", 0, 0, 0, tocolor(255, 255, 255, 255))
		end
	end
	dxDrawImage(x-57+5+5*(50)+18, y+panelSize[2]/2-5 , 28, 28, "files/fenyjelzo.png",0,0,0, tocolor(0,0,0,255))
	if isInSlot(x-57+5+5*(50)+19, y+panelSize[2]/2-6 , 28, 28) then
		dxDrawImage(x-57+5+5*(50)+19, y+panelSize[2]/2-6 , 28, 28, "files/fenyjelzo.png",0,0,0, tocolor(61,122,188,255))
	else
		dxDrawImage(x-57+5+5*(50)+19, y+panelSize[2]/2-6 , 28, 28, "files/fenyjelzo.png",0,0,0, tocolor(255,255,255,255))
	end

	if getVehicleSirensOn(getPedOccupiedVehicle(localPlayer)) then
		dxDrawImage(x-57+5+5*(50)+19, y+panelSize[2]/2-6 , 28, 28, "files/fenyjelzo.png",0,0,0, tocolor(61,122,188,255))
	end
end

addEventHandler ( "onClientElementDataChange", getRootElement(),
	function ( dataName )
		if getElementType ( source ) == "vehicle" and dataName == "vehicle:siren" then
			local newStation =  getElementData(source, "vehicle:siren") or 0
			if (isElementStreamedIn (source)) then
				if newStation ~= 0 then
					if (soundElementsOutside[source]) then
						stopSound(soundElementsOutside[source])
					end
					local x, y, z = getElementPosition(source)
					song = nil
					song = sirenTable[newStation][5]
					newSoundElement = playSound3D("files/"..song, x, y, z, true)
					soundElementsOutside[source] = newSoundElement
					setElementDimension(newSoundElement, getElementDimension(source))
					setElementDimension(newSoundElement, getElementDimension(source))
					setSoundMinDistance(soundElementsOutside[source], 40)
					setSoundMaxDistance(soundElementsOutside[source], 80)
					--setSoundVolume(soundElementsOutside[source], getElementData(source, "vehicle:siren:sound"))
					setSoundVolume(soundElementsOutside[source], 0.1)
				else
					if (soundElementsOutside[source]) then
						stopSound(soundElementsOutside[source])
						soundElementsOutside[source] = nil
					end
				end

			end
		end
		if getElementType ( source ) == "vehicle" and dataName == "vehicle:horn" then
			local newhorn =  getElementData(source, "vehicle:horn") or 0
			if (isElementStreamedIn (source)) then
				if newhorn ~= 0 then
					if (soundElementsOutsideHorn[source]) then
					end
					local x, y, z = getElementPosition(source)
					horn = nil
					horn = sirenTable[newhorn][5]
					newSoundHorn = playSound3D("files/"..horn, x, y, z, false)
					soundElementsOutsideHorn[source] = newSoundHorn
					setElementDimension(newSoundHorn, getElementDimension(source))
					setElementDimension(newSoundHorn, getElementDimension(source))
					setSoundMinDistance(soundElementsOutsideHorn[source], 60)
					setSoundMaxDistance(soundElementsOutsideHorn[source], 120)
					--setSoundVolume(soundElementsOutsideHorn[source], getElementData(source, "vehicle:siren:sound"))
setSoundVolume(soundElementsOutsideHorn[source], 0.1)
				end

			end
		end
	end 
)

addEventHandler("onClientElementDestroy", getRootElement(), function ()
	local siren = getElementData(source, "vehicle:siren") or 0
	if getElementType(source) == "vehicle" and siren ~= 0 then
		if isElement(newSoundElement) then
			stopSound(newSoundElement)
		end
		setElementData(source, "vehicle:siren", 0)
	end
end)
addEventHandler("onClientElementDestroy", getRootElement(), function ()
	local horn = getElementData(source, "vehicle:horn") or 0
	if getElementType(source) == "vehicle" and horn ~= 0 then
		if isElement(newSoundHorn) then
			stopSound(newSoundHorn)
		end
		setElementData(source, "vehicle:horn", 0)
	end
end)

addEventHandler( "onClientPreRender", getRootElement(),
	function()
		if soundElementsOutside ~= nil then
			for element, sound in pairs(soundElementsOutside) do
				if (isElement(sound) and isElement(element)) then
					local x, y, z = getElementPosition(element)
					setElementPosition(sound, x, y, z)
					setElementInterior(sound, getElementInterior(element))
					getElementDimension(sound, getElementDimension(element))

				end
			end
		end
	end	
)

addEventHandler( "onClientElementStreamIn", getRootElement( ),
    function ( )
		spawnSound(source)
    end
)

function spawnSound(theVehicle)
	local newSoundElement = nil
    if getElementType( theVehicle ) == "vehicle" then
		local newStation = getElementData(theVehicle, "vehicle:siren") or 0
		if newStation ~= 0 then
			if (soundElementsOutside[source]) then
				stopSound(soundElementsOutside[source])
			end
			local x, y, z = getElementPosition(source)
			song = nil
			song = sirenTable[newStation][5]
			newSoundElement = playSound3D("files/"..song, x, y, z, true)
			soundElementsOutside[source] = newSoundElement
			setElementDimension(newSoundElement, getElementDimension(source))
			setElementDimension(newSoundElement, getElementDimension(source))
			--setSoundMinDistance(soundElementsOutside[source], 40)
			setSoundMaxDistance(soundElementsOutside[source], 30)
			--setSoundVolume(soundElementsOutside[source], getElementData(source, "vehicle:siren:sound"))
			setSoundVolume(soundElementsOutside[source], 0.1)
		end
    end
end

addEventHandler( "onClientElementStreamOut", getRootElement( ),
    function ( )
		local newSoundElement = nil
        if getElementType( source ) == "vehicle" then
			if (soundElementsOutside[source]) then
				stopSound(soundElementsOutside[source])
				soundElementsOutside[source] = nil
			end
        end
    end
)

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(dobozbaVan(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

local flashingVehicles = { }

function bindKeys(res)	
	for key, value in ipairs(getElementsByType("vehicle")) do
		if isElementStreamedIn(value) then
			local flasherState = getElementData(value, "lspd:flashers")
			if flasherState and flasherState > 0 then
				flashingVehicles[value] = true
			end
		end
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(), bindKeys)

function toggleFlashers()
	local theVehicle = getPedOccupiedVehicle(getLocalPlayer())
	if (theVehicle) and getPedOccupiedVehicleSeat(localPlayer) < 2  then




		if getElementModel(theVehicle) == 467 or getElementModel(theVehicle) == 578 or getElementModel(theVehicle) == 574 or getElementModel(theVehicle) == 462 or getElementModel(theVehicle) == 495 or getElementModel(theVehicle) == 516 or getElementModel(theVehicle) == 604 or getElementModel(theVehicle) == 525 or getElementModel(theVehicle) == 479 or getElementModel(theVehicle) == 418 or getElementModel(theVehicle) == 458 or getElementModel(theVehicle) == 404 or getElementModel(theVehicle) == 585 or getElementModel(theVehicle) == 547 or getElementModel(theVehicle) == 599 or getElementModel(theVehicle) == 470 or getElementModel(theVehicle) == 529 or getElementModel(theVehicle) == 507 or getElementModel(theVehicle) == 426 or getElementModel(theVehicle) == 598 or getElementModel(theVehicle) == 597 or getElementModel(theVehicle) == 599 or getElementModel(theVehicle) == 596 or getElementModel(theVehicle) == 416 or getElementModel(theVehicle) == 427 or getElementModel(theVehicle) == 490 or getElementModel(theVehicle) == 528 or getElementModel(theVehicle) == 586  then

			triggerServerEvent("lspd:toggleFlashers", theVehicle)
			triggerServerEvent("triggerTheLPSDSirens", localPlayer, localPlayer)
		end
	end
end

function streamIn()
	if getElementType( source ) == "vehicle" and getElementData( source, "lspd:flashers" ) then
		local flasherState = getElementData(source, "lspd:flashers")
		if flasherState and flasherState > 0 then
			flashingVehicles[source] = true
		end
	end
end
addEventHandler("onClientElementStreamIn", getRootElement(), streamIn)

function streamOut()
	if getElementType( source ) == "vehicle" then
		flashingVehicles[source] = nil
	end
end
addEventHandler("onClientElementStreamOut", getRootElement(), streamOut)

function updateSirens( name )
	if name == "lspd:flashers" and isElementStreamedIn( source ) and getElementType( source ) == "vehicle" then
		local flasherState = getElementData(source, "lspd:flashers")
		if flasherState and flasherState > 0 then
			flashingVehicles[source] = true
		else
			flashingVehicles[source] = false
		end
	end
end
addEventHandler("onClientElementDataChange", getRootElement(), updateSirens)



function doFlashes()
	for veh in pairs(flashingVehicles) do
		--local x,y,z = getElementPosition(veh)
		if not (isElement(veh)) then
			flashingVehicles[veh] = nil
		else
			local flasherState = getElementData(veh, "lspd:flashers")
			if flasherState and flasherState == 0 then
				flashingVehicles[veh] = nil

				if isElement(vlight) then
					destroyElement(vlight)
				end
				if isElement(vlight2) then
					destroyElement(vlight2)
				end

				setVehicleHeadLightColor(veh, 255, 255, 255)
				setVehicleLightState(veh, 0, 0)
				setVehicleLightState(veh, 1, 0)
				setVehicleLightState(veh, 2, 0)
				setVehicleLightState(veh, 3, 0)
			else
				local state = getVehicleLightState(veh, 0)
				if flasherState == 2 then
					setVehicleHeadLightColor(veh, 128, 64, 0)
				else
					if (state==0) then

						setVehicleHeadLightColor(veh, 0, 0, 255)

						if isElement(vlight) then
							destroyElement(vlight)

						--	exports.dynamic_lighting:destroyLight(vlight)
						end
						if isElement(vlight2) then
							destroyElement(vlight2)

							--exports.dynamic_lighting:destroyLight(vlight2)

						end
						--vlight2 = createLight(0, 0, 0, 0, 33, 0, 0, 255, 0, 0, 0, true)
						local lightRadius = 33 --2 * getElementRadius(localPlayer)
						vlight2 = createLight(1, 0, 0, 0, lightRadius)
						setLightColor(vlight2, 0, 0, 255)


						--vlight2 = exports.dynamic_lighting:createPointLight(x,y,z, 255, 0, 0, 255,1,true)


						--attachElements(vlight2, veh, 0.4, -0.2, 0.8)
						attachElements(vlight2, veh, 0, 0, 0)
					else
						
						setVehicleHeadLightColor(veh, 255, 0, 0)
						if isElement(vlight) then
							destroyElement(vlight)

							--exports.dynamic_lighting:destroyLight(vlight)
						end
						if isElement(vlight2) then
							destroyElement(vlight2)

							--exports.dynamic_lighting:destroyLight(vlight2)

						end
						--vlight = createLight(0, 0, 0, 0, 33, 255, 0, 0, 0, 0, 0, true)

						local lightRadius = 33 --2 * getElementRadius(localPlayer)
						vlight = createLight(1, 0, 0, 0, lightRadius)
						setLightColor(vlight, 255, 0, 0)

						--exports.dynamic_lighting:setDirLightColor(float colorR,colorG,colorB,colorA)

						--vlight = exports.dynamic_lighting:createPointLight(x,y,z,255, 0, 0,255,1,true)

						


						--attachElements(vlight, veh, 0.4, -0.2, 0.8)
						attachElements(vlight, veh, 0, 0, 0)
					end
				end
				setVehicleLightState(veh, 0, 1-state)
				setVehicleLightState(veh, 1, state)
				setVehicleLightState(veh, 2, 1-state)
				setVehicleLightState(veh, 3, state)
			end
		end		
	end
end
setTimer(doFlashes, 250, 0)

function dxDrawBorder( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end

addEventHandler("onVehicleEnter", root,function(thePlayer)
	triggerServerEvent("createLPSDSirens", localPlayer, localPlayer)
end)

