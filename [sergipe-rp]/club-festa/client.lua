--Scriptet Írta: Csoki
--SanMTA
--2017.12.17
if fileExists("client.lua") then
	fileDelete("client.lua")
end



addEventHandler("onClientResourceStart", resourceRoot, function()
engineSetAsynchronousLoading ( true, true )
setOcclusionsEnabled(false)
loadMod("club",6404)
loadMod("club",6410,true)
end)


local dir = "files"
function loadMod(f, m, isLod)
	local txdFile = dir.."/"..f..".txd"
	local dffFile = dir.."/"..f..".dff"
	local colFile = dir.."/"..f..".col"
	if fileExists(txdFile) then
		local txd = EngineTXD(txdFile)
		if txd then
			txd:import(m)
		end
	end
	if fileExists(dffFile) then
		local dff = EngineDFF(dffFile,m)
		if dff then
			dff:replace(m)
		end
	end
	if not isLod then
		if fileExists(colFile) then
			local col = EngineCOL(colFile)
			if col then
				col:replace(m)
			end
		end
	end
end


function RemoveBuildingForPlayer(player,objectid,x,y,z,radius)  --SAMP mapoláshoz.
	removeWorldModel(objectid,radius,x,y,z)
end
--MAPFIX +Alap vh zászlók törlése,szerelő bugfix
RemoveBuildingForPlayer(playerid, 4003, 1481.0781, -1747.0313, 33.5234, 0.25);
RemoveBuildingForPlayer(playerid, 4748, 1760.1641, -1127.2734, 43.6641, 0.25);
RemoveBuildingForPlayer(playerid, 1266, 400.0938, -1753.1016, 17.1484, 0.25);
RemoveBuildingForPlayer(playerid, 6411, 415.6875, -1745.5313, 14.1328, 0.25);
RemoveBuildingForPlayer(playerid, 1461, 430.8984, -1754.9766, 8.1641, 0.25);
RemoveBuildingForPlayer(playerid, 1260, 400.0938, -1753.1094, 17.1406, 0.25);



--DISCO fény--
local texBall = dxCreateTexture ( "textures/cubebox.dds" )
local shWrd,shVeh,shObj,objBall
local isLightBallOn

local objPos = { 410.26822, -1745.78040, 19.15625 }
local objInt = 0 

local sBallSize = 3 --Gömb méret 
local sSpecularPower = 4 
local gRotAngle = { 2, 1, 0.5 } -- forgás sebesség
local gSelfShadow = 0.35 
local isFakeBump = true 
local maxEffectSwitch = 100
local gLightFade = { 150, 110, 55, 33 } 

local DBTimerUpdate = 200 

---------------------------------------------------------------------------------------------------------------------------------

local function createBall( pcam_x, pcam_y, pcam_z, intId )
	objBall = createObject( 2114, pcam_x, pcam_y, pcam_z, 0, 0, 0, true )
	setElementInterior ( objBall, intId )
	setElementFrozen(objBall,true)
	setElementCollisionsEnabled ( objBall, false )
	return objBall
end

local function destroyBall( objBall )
	local isDone = destroyElement( objBall )
	objBall = nil
	return isDone
end


addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource()), function()
	if CoordTimer then return end
	CoordTimer = setTimer(	function()
		if isElementStreamedIn(objBall) and isLightBallOn==true then
			dxSetShaderValue( shWrd, "sLightPosition",objPos )
			dxSetShaderValue( shVeh, "sLightPosition",objPos )
			dxSetShaderValue( shWrd, "isStr", true )
			dxSetShaderValue( shVeh, "isStr", true )
		end
	end
	,DBTimerUpdate,0 )
end
)

---------------------------------------------------------------------------------------------------------------------------------

local removeList = {
						"",			
						"basketball2","skybox_tex",	"flashlight_*",    
						"muzzle_texture*",								
						"font*","radar*","sitem16","snipercrosshair",	
						"siterocket","cameracrosshair",				
						"fireba*","wjet6",								
						"vehiclegeneric256","vehicleshatter128", 		
						"*shad*",										
						"coronastar","coronamoon","coronaringa",
						"coronaheadlightline",						
						"lunar",									
						"tx*",										
						"lod*",									
						"cj_w_grad",								
						"*cloud*",								
						"*smoke*",									
						"sphere_cj",									
						"particle*",									
						"water*","newaterfal1_256",
						"boatwake*","splash_up","carsplash_*",			
						"gensplash","wjet4","bubbles","blood*",			
						"fist","*icon","headlight*",
						"unnamed",	
						"sl_dtwinlights*","nitwin01_la","sfnite*","shad_exp",
						"vgsn_nl_strip","blueshade*",
					}

local reApplyList = {
					"ws_tunnelwall2smoked", "shadover_law",
					"greenshade_64", "greenshade2_64", "venshade*", 
					"blueshade2_64",
					}

---------------------------------------------------------------------------------------------------------------------------------
					
local function createDiscoballEffect()
	shWrd = dxCreateShader ( "fx/shader_light.fx" ,1 , maxDistance,true, "world,object,ped" )
	shObj = dxCreateShader ( "fx/shader_ball.fx" ,1 , maxDistance,false, "object" ) 
	shVeh = dxCreateShader ( "fx/shader_light.fx" ,1 , maxDistance,true, "vehicle" )
	if not shWrd or not shVeh or not shObj then 
		return false
	else
	end
	dxSetShaderValue ( shWrd, "gBallTexture", texBall )
	dxSetShaderValue ( shWrd, "gRotAngle", gRotAngle )

	dxSetShaderValue ( shWrd, "isVeh", false )
	dxSetShaderValue ( shWrd, "gLightFade", gLightFade )

	dxSetShaderValue ( shWrd, "gSelfShad", gSelfShadow )
	dxSetShaderValue ( shWrd, "isFakeBump", isFakeBump )

	dxSetShaderValue ( shVeh, "gBallTexture", texBall )
	dxSetShaderValue ( shVeh, "gRotAngle", gRotAngle )
	dxSetShaderValue ( shVeh, "isVeh", true)
	dxSetShaderValue ( shVeh, "gLightFade", gLightFade )
	dxSetShaderValue ( shVeh, "gSelfShad", gSelfShadow )
	dxSetShaderValue ( shVeh, "isFakeBump", false )

	dxSetShaderValue ( shObj, "gBallTexture", texBall )
	dxSetShaderValue ( shObj, "gRotAngle", gRotAngle )
	dxSetShaderValue ( shObj, "sSpecularPower", sSpecularPower )
	dxSetShaderValue ( shObj, "sBallSize", sBallSize )

	if not objBall then 
		createBall( objPos[1], objPos[2], objPos[3], objInt ) 
	end
	engineApplyShaderToWorldTexture ( shObj, "*",objBall)
	engineApplyShaderToWorldTexture ( shWrd, "*" )
 
	for _,removeMatch in ipairs(removeList) do
		engineRemoveShaderFromWorldTexture ( shWrd, removeMatch )	
	end
	for _,applyMatch in ipairs(reApplyList) do
		engineApplyShaderToWorldTexture ( shWrd, applyMatch )	
	end	
	engineApplyShaderToWorldTexture ( shVeh, "*" )
	engineRemoveShaderFromWorldTexture ( shVeh, "unnamed" )
	return true
end		

local function destroyDiscoballEffect()
	if shWrd then
		engineRemoveShaderFromWorldTexture ( shWrd, "*" )
		destroyElement(shWrd)
		shWrd=nil
	end
	if shVeh then
		engineRemoveShaderFromWorldTexture ( shVeh, "*" )
		destroyElement(shVeh)
		shVeh=nil
	end
	if shObj then
		engineRemoveShaderFromWorldTexture ( shObj, "*",objBall )
		destroyElement(shObj)
		shObj=nil
	end
	if not shWrd then 
		return true
	else 
		return false 
	end
end


addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource()), function()
	if DBenTimer then return end
	DBenTimer = setTimer(	function()
		local cam_x, cam_y, cam_z, _, _, _ = getCameraMatrix()
		local getDist = getDistanceBetweenPoints3D(cam_x,cam_y,cam_z,objPos[1],objPos[2],objPos[3])
		if isElementStreamedIn(objBall) and not shVeh and not shWrd and isLightBallOn==false and getDist<=maxEffectSwitch then 
			if createDiscoballEffect() then
				dxSetShaderValue(shWrd,"isStr",true)
				dxSetShaderValue(shVeh,"isStr",true)
				isLightBallOn=true;
			end
		end
		if (not isElementStreamedIn(objBall) or getDist>maxEffectSwitch) and shVeh and shWrd and isLightBallOn==true then 
			dxSetShaderValue(shWrd,"isStr",false)
			dxSetShaderValue(shVeh,"isStr",false)
			if destroyDiscoballEffect() then
				isLightBallOn=false;
			end
		end
	end
	,DBTimerUpdate,0 )
end
)

addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource()), function()
	isLightBallOn=true
	local ver = getVersion ().sortable
	local build = string.sub( ver, 9, 13 )

	if build<"04938" or ver < "1.3.1" then 
		outputDebugString("[CLUB]: HIBA (RÉGI MTA)")
		return 
	end
	if createDiscoballEffect() then
		outputDebugString("[CLUB]: Fények elindultak")
	else 
		return 
	end
end
)

addEventHandler("onClientResourceStop", getResourceRootElement( getThisResource()), function()
	if objBall then destroyBall( objBall ) objBall = nil end
	if DBBlip then destroyElement( DBBlip ) DBBlip = nil end
	destroyDiscoballEffect()
	if texBall then destroyElement( texBall ) texBall = nil end
end
)

--PEDEK,ZENE--

local dj = createPed(1,395.55179, -1746.54639, 9.74219,-90)
setElementData(dj,"ped:club",true)
setElementFrozen(dj,true)

local or1 = createPed(98,410.85553, -1755.96545, 8.78125,-90) 
setElementData(or1,"ped:club",true)
setElementFrozen(or1,true)

local or2 = createPed(98,414.74768, -1755.74292, 8.78125,90) 
setElementData(or2,"ped:club",true)
setElementFrozen(or2,true)

local tancos1 = createPed(12,406.25272, -1740.77075, 9.15625,110)
setPedAnimation( tancos1, "dancing", "dnce_m_d")
setElementFrozen(tancos1,true)
setElementData(tancos1,"ped:club",true)

local tancos2 = createPed(48,404.81723, -1741.40833, 9.1562,-110)
setPedAnimation( tancos2, "dancing", "dnce_m_d")
setElementFrozen(tancos2,true)
setElementData(tancos2,"ped:club",true)

local tancos3 = createPed(46,403.33664,-1751.18738, 9.15625,-110)
setPedAnimation( tancos3, "dancing", "dnce_m_c")
setElementFrozen(tancos3,true)
setElementData(tancos3,"ped:club",true)

local tancos4 = createPed(90,415.21207, -1744.05115, 9.15625,-30)
setPedAnimation( tancos4, "dancing", "dnce_m_a")
setElementFrozen(tancos4,true)
setElementData(tancos4,"ped:club",true)

local tancos5 = createPed(83,415.81210, -1743.21216, 9.15625,80)
setPedAnimation( tancos5, "dancing", "dnce_m_b")
setElementFrozen(tancos5,true)
setElementData(tancos5,"ped:club",true)

local tancos6 = createPed(125,412.38950, -1738.23022, 9.15625,180)
setPedAnimation( tancos6, "dancing", "dan_down_a")
setElementFrozen(tancos6,true)
setElementData(tancos6,"ped:club",true)

local tancos7 = createPed(128,410.16248, -1746.90222, 9.15625,180)
setPedAnimation( tancos7, "dancing", "dan_down_a")
setElementFrozen(tancos7,true)
setElementData(tancos7,"ped:club",true)

local tancos8 = createPed(140,410.20187, -1748.53357, 9.15625,0)
setPedAnimation( tancos8, "dancing", "dan_down_a")
setElementFrozen(tancos8,true)
setElementData(tancos8,"ped:club",true)

addEventHandler("onClientPedDamage",  getRootElement(), function()
	if getElementData(source,"ped:club") then
		cancelEvent() 
	end
end)

function onResourceStart()
	local zene = playSound3D("http://212.108.220.144:1039/stream.mp3",409.69092, -1745.36731, 9.15625,false,true) --ZENE
	setSoundMaxDistance( zene,50 )
end
addEventHandler("onClientResourceStart", resourceRoot, onResourceStart)

