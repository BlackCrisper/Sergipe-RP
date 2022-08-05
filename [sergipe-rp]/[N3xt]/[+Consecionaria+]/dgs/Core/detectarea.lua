--Dx Functions
local dxDrawImage = dxDrawImageExt
local dxDrawImageSection = dxDrawImageSectionExt
local dxDrawText = dxDrawText
local dxGetFontHeight = dxGetFontHeight
local dxDrawRectangle = dxDrawRectangle
local dxSetShaderValue = dxSetShaderValue
local dxGetPixelsSize = dxGetPixelsSize
local dxGetPixelColor = dxGetPixelColor
local dxSetRenderTarget = dxSetRenderTarget
local dxGetTextWidth = dxGetTextWidth
local dxSetBlendMode = dxSetBlendMode
--
detectAreaBuiltIn = {}
function dgsCreateDetectArea(x,y,sx,sy,relative,parent)
	if not x then
		local detectarea = createElement("dgs-dxdetectarea")
		dgsSetType(detectarea,"dgs-dxdetectarea")
		triggerEvent("onDgsCreate",detectarea,sourceResource)
		dgsDetectAreaSetFunction(detectarea,detectAreaBuiltIn.default)
		dgsSetData(detectarea,"debugTextureSize",{sW/2,sH/2})
		dgsSetData(detectarea,"debugModeAlpha",128)
		return detectarea
	else
		assert(type(x) == "number","Bad argument @dgsCreateDetectArea at argument 1, expect number got "..type(x))
		assert(type(y) == "number","Bad argument @dgsCreateDetectArea at argument 2, expect number got "..type(y))
		assert(type(sx) == "number","Bad argument @dgsCreateDetectArea at argument 3, expect number got "..type(sx))
		assert(type(sy) == "number","Bad argument @dgsCreateDetectArea at argument 4, expect number got "..type(sy))
		local detectarea = createElement("dgs-dxdetectarea")
		dgsSetType(detectarea,"dgs-dxdetectarea")
		dgsSetParent(detectarea,parent,true,true)
		dgsSetData(detectarea,"debugMode",false)
		dgsSetData(detectarea,"debugModeAlpha",128)
		calculateGuiPositionSize(detectarea,x,y,relative or false,sx,sy,relative or false,true)
		triggerEvent("onDgsCreate",detectarea,sourceResource)
		dgsDetectAreaSetFunction(detectarea,detectAreaBuiltIn.default)
		return detectarea
	end
end

detectAreaPreDefine = [[
	local args = {...}
	local mxRlt,myRlt,mxAbs,myAbs = args[1],args[2],args[3],args[4]
]]

detectAreaBuiltIn.default = [[
	return true
]]

detectAreaBuiltIn.circle = [[
	return math.sqrt((mxRlt-0.5)^2+(myRlt-0.5)^2)<0.5
]]

function dgsDetectAreaDefaultFunction(mxRlt,myRlt,mxAbs,myAbs)
	return true
end

function dgsDetectAreaSetFunction(detectarea,fncStr)
	assert(dgsGetType(detectarea) == "dgs-dxdetectarea","Bad argument @dgsDetectAreaSetFunction at argument 1, except dgs-dxdetectarea got "..dgsGetType(detectarea))
	assert(type(fncStr) == "string" or (isElement(fncStr) and getElementType(fncStr) == "texture"),"Bad argument @dgsDetectAreaSetFunction at argument 2, expect string/texture got "..dgsGetType(fncStr))
	if type(fncStr) == "string" then
		fncStr = detectAreaBuiltIn[fncStr] or fncStr
		local fnc = loadstring(detectAreaPreDefine..fncStr)
		assert(type(fnc) == "function","Bad argument @dgsDetectAreaSetFunction at argument 2, failed to load function")
		dgsSetData(detectarea,"checkFunction",fnc)
		dgsSetData(detectarea,"checkFunctionImage",nil)
	else
		local pixels = dxGetTexturePixels(fncStr)
		dgsSetData(detectarea,"checkFunction",pixels)
		dgsSetData(detectarea,"checkFunctionImage",fncStr)
	end
	dgsDetectAreaUpdateDebugView(detectarea)
	return true
end

function dgsDetectAreaSetDebugModeEnabled(detectarea,state,alpha)
	assert(dgsGetType(detectarea) == "dgs-dxdetectarea","Bad argument @dgsDetectAreaSetDebugModeEnabled at argument 1, except dgs-dxdetectarea got "..dgsGetType(detectarea))
	dgsSetData(detectarea,"debugMode",state)
	dgsSetData(detectarea,"debugModeAlpha",alpha or dgsElementData[detectarea].debugModeAlpha)
	if state then
		dgsDetectAreaUpdateDebugView(detectarea)
	elseif isElement(dgsElementData[detectarea].debugTexture) then
		destroyElement(dgsElementData[detectarea].debugTexture)
	end
end

function dgsDetectAreaGetDebugModeEnabled(detectarea)
	assert(dgsGetType(detectarea) == "dgs-dxdetectarea","Bad argument @dgsDetectAreaGetDebugModeEnabled at argument 1, except dgs-dxdetectarea got "..dgsGetType(detectarea))
	return dgsElementData[detectarea].debugMode
end

function dgsDetectAreaUpdateDebugView(detectarea)
	if not dgsElementData[detectarea].debugMode then return end
	local checkFunction = dgsElementData[detectarea].checkFunction
	local absSize = dgsElementData[detectarea].absSize or dgsElementData[detectarea].debugTextureSize
	if isElement(dgsElementData[detectarea].debugTexture) then
		local mX,mY = dxGetMaterialSize(dgsElementData[detectarea].debugTexture)
		if mX ~= absSize[1] and mY ~= absSize[2] then
			if isElement(dgsElementData[detectarea].debugTexture) then
				destroyElement(dgsElementData[detectarea].debugTexture)
			end
		end
	end
	if not isElement(dgsElementData[detectarea].debugTexture) then
		local texture = dxCreateTexture(absSize[1],absSize[2])
		dgsSetData(detectarea,"debugTexture",texture)
	end
	if type(checkFunction) == "function" then
		local pixels = dxGetTexturePixels(dgsElementData[detectarea].debugTexture)
		for i=0,absSize[1]-1 do
			for j=0,absSize[2]-1 do
				local color = checkFunction((i+1)/absSize[1],(j+1)/absSize[2]) and {255,255,255,255} or {0,0,0,0}
				dxSetPixelColor(pixels,i,j,color[1],color[2],color[3],color[4])
			end
		end
		dxSetTexturePixels(dgsElementData[detectarea].debugTexture,pixels)
	else
		dxSetTexturePixels(dgsElementData[detectarea].debugTexture,checkFunction)
	end
	return true
end

function dgsDetectAreaAttachToElement(da,ele)
	local fnc = function(source,mx,my,collideBox)
		local x,y,w,h = collideBox[1],collideBox[2],collideBox[3],collideBox[4]
		if mx >= x and mx <= x+w and my >= y and my <= y+h then
			return source
		end
	end
	dgsSetData(ele,"dgsCollider",fnc)
end

----------------------------------------------------------------
--------------------------Renderer------------------------------
----------------------------------------------------------------
dgsRenderer["dgs-dxdetectarea"] = function(source,x,y,w,h,mx,my,cx,cy,enabled,eleData,parentAlpha,isPostGUI,rndtgt)
	local color = 0xFFFFFFFF
	if enabled[1] and mx then
		local checkPixel = eleData.checkFunction
		if checkPixel then
			local _mx,_my = (mx-x)/w,(my-y)/h
			if _mx > 0 and _my > 0 and _mx <= 1 and _my <= 1 then
				if type(checkPixel) == "function" then
					local checkFnc = eleData.checkFunction
					if checkFnc((mx-x)/w,(my-y)/h,mx,my) then
						MouseData.hit = source
						color = 0xFFFF0000
					end
				else
					local px,py = dxGetPixelsSize(checkPixel)
					local pixX,pixY = _mx*px,_my*py
					local r,g,b = dxGetPixelColor(checkPixel,pixX-1,pixY-1)
					if r then
						local gray = (r+g+b)/3
						if gray >= 128 then
							MouseData.hit = source
							color = 0xFFFF0000
						end
					end
				end
			end
		end
	end
	local debugTexture = eleData.debugTexture
	if eleData.debugMode and isElement(debugTexture) then
		dxDrawImage(x,y,w,h,debugTexture,0,0,0,color,isPostGUI)
	end
	return rndtgt
end