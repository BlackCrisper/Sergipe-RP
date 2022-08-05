--[[



 ################################################
 #                                              #
 #              Script Criado Por               #
 #           FACEBOOK.COM/AIRNEWSCR             #
 #             Visual Editado Por               #
 #                   Shelby~                    #
 ################################################



--]]

local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

Painel_VIP_AirNewSCR = false

CorSel_R, CorSel_G, CorSel_B, CorSel_A = 255, 255, 255, 35

Abrir_Fechar_BindAirNewSCR = "f6"

setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Não" )
setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Não" )

setElementData ( localPlayer, "Alpha_Arma(s)", "Desbloqueado" )
setElementData ( localPlayer, "Epsylon_Arma(s)", "Desbloqueado" )

setElementData ( localPlayer, "Epsylon_Vida", "Desbloqueado" )
setElementData ( localPlayer, "Sigma_Vida", "Desbloqueado" )

function PainelVIP_AirNewSCR ( )

    dxDrawRectangle(x*0, y*0, x*1366, y*768, tocolor(255, 255, 255, 11), false)

    dxDrawRectangle(x*0, y*168, x*1366, y*433, tocolor(0, 0, 0, 50), false)
    dxDrawRectangle(x*0, y*172, x*1366, y*425, tocolor(0, 0, 0, 50), false)
	
	dxDrawRectangle(x*111, y*191, x*221, y*388, tocolor(0, 0, 0, 51), false)
    dxDrawRectangle(x*412, y*191, x*221, y*388, tocolor(0, 0, 0, 51), false)
    dxDrawRectangle(x*734, y*191, x*221, y*388, tocolor(0, 0, 0, 51), false)
    dxDrawRectangle(x*1034, y*191, x*221, y*388, tocolor(0, 0, 0, 51), false)

	dxDrawRectangle(x*0, y*85, x*1366, y*73, tocolor(0, 0, 0, 50), false)
    dxDrawRectangle(x*0, y*89, x*1366, y*64, tocolor(0, 0, 0, 50), false)

    ------------------------------- VIP 01 -------------------------------

    if getElementData ( localPlayer, "VIP_01" ) ~= "Sim" then
	    dxDrawImage(x*153, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
	    dxDrawText("Você não possui Acesso ao\nVIP Alpha\Santafé",   x*111, y*486, x*331, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	else
	    if P ( x*121, y*249, x*201, y*22 ) then
		    dxDrawRectangle(x*121, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - Lamborghini Huracan
		else
	        dxDrawRectangle(x*121, y*249, x*201, y*22, tocolor(139,69,19, 150), false) -- Veiculo - Bugatti GG
		end
	    if P ( x*121, y*275, x*201, y*22 ) then
		    dxDrawRectangle(x*121, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Pack de Armas (01)
		else
	        dxDrawRectangle(x*121, y*275, x*201, y*22, tocolor(139,69,19, 150), false) -- Pack de Armas (01)
		end
		if P ( x*121, y*301, x*201, y*22 ) then
		    dxDrawRectangle(x*121, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (01)
		else
	        dxDrawRectangle(x*121, y*301, x*201, y*22, tocolor(139,69,19, 150), false) -- Personagem VIP (01)
		end
	end

    ------------------------------- VIP 02 -------------------------------

    if getElementData ( localPlayer, "VIP_02" ) ~= "Sim" then
	    dxDrawImage(x*456, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
		dxDrawText("Você não possui Acesso ao\nVIP Epsylon\Santafé", x*412, y*486, x*632, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	else
	    if P ( x*422, y*249, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - Lamborghini Huracan
		else
	        dxDrawRectangle(x*422, y*249, x*201, y*22, tocolor(192,192,192, 150), false) -- Veiculo - Camaro
		end
	    if P ( x*422, y*275, x*201, y*22 ) then
	    dxDrawRectangle(x*422, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - R1
		else
	        dxDrawRectangle(x*422, y*275, x*201, y*22, tocolor(192,192,192, 150), false) -- Veiculo - XJ6
		end
	    if P ( x*422, y*301, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Vida 80%
		else
	        dxDrawRectangle(x*422, y*301, x*201, y*22, tocolor(192,192,192, 150), false) -- Vida 80%
		end
	    if P ( x*422, y*327, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*327, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Pack de Armas (01)
		else
	        dxDrawRectangle(x*422, y*327, x*201, y*22, tocolor(192,192,192, 150), false) -- Pack de Armas (01)
		end
	    if P ( x*422, y*353, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*353, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (01)
		else
	        dxDrawRectangle(x*422, y*353, x*201, y*22, tocolor(192,192,192, 150), false) -- Personagem VIP (01)
		end
	    if P ( x*422, y*379, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*379, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (02)
		else
	        dxDrawRectangle(x*422, y*379, x*201, y*22, tocolor(192,192,192, 150), false) -- Personagem VIP (02)
		end
	end
	
	------------------------------- VIP 03 -------------------------------
	
	if getElementData ( localPlayer, "VIP_03" ) ~= "Sim" then
	    dxDrawImage(x*778, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
		dxDrawText("Você não possui Acesso ao\nVIP Sigma\Santafé",   x*734, y*486, x*954, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	else
		if P ( x*744, y*249, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - Lamborghini Huracan
		else
	        dxDrawRectangle(x*744, y*249, x*201, y*22, tocolor(0,191,255, 150), false) -- Veiculo - Lamborghini Huracan
		end
	    if P ( x*744, y*275, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - R1
		else
	        dxDrawRectangle(x*744, y*275, x*201, y*22, tocolor(0,191,255, 150), false) -- Veiculo - R1
		end
	    if P ( x*744, y*301, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Vida 100%
		else
	        dxDrawRectangle(x*744, y*301, x*201, y*22, tocolor(0,191,255, 150), false) -- Vida 100%
		end
	    if P ( x*744, y*327, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*327, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Colete 50%
		else
	        dxDrawRectangle(x*744, y*327, x*201, y*22, tocolor(0,191,255, 150), false) -- Colete 50%
		end
		if P ( x*744, y*353, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*353, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Pack de Armas (01)
		else
	        dxDrawRectangle(x*744, y*353, x*201, y*22, tocolor(0,191,255, 150), false) -- Pack de Armas (01)
		end
		if P ( x*744, y*379, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*379, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Pack de Armas (02)
		else
	        dxDrawRectangle(x*744, y*379, x*201, y*22, tocolor(0,191,255, 150), false) -- Pack de Armas (02)
		end
		if P ( x*744, y*405, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*405, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (01)
		else
	        dxDrawRectangle(x*744, y*405, x*201, y*22, tocolor(0,191,255, 150), false) -- Personagem VIP (01)
		end
		if P ( x*744, y*431, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*431, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (02)
		else
	        dxDrawRectangle(x*744, y*431, x*201, y*22, tocolor(0,191,255, 150), false) -- Personagem VIP (02)
		end
		if P ( x*744, y*457, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*457, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (03)
		else
	        dxDrawRectangle(x*744, y*457, x*201, y*22, tocolor(0,191,255, 150), false) -- Personagem VIP (03)
		end
		if P ( x*744, y*483, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*483, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo Colorido
		else
	        dxDrawRectangle(x*744, y*483, x*201, y*22, tocolor(0,191,255, 150), false) -- Veiculo Colorido
		end
		if P ( x*744, y*509, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*509, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Farol Colorido
		else
	        dxDrawRectangle(x*744, y*509, x*201, y*22, tocolor(0,191,255, 150), false) -- Farol Colorido
		end
	end

    ------------------------------- VIP 04 -------------------------------
    
	if getElementData ( localPlayer, "VIP_04" ) ~= "Sim" then
	    dxDrawImage(x*1078, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
        dxDrawText("Você não possui Acesso ao\nVIP Omega\Santafé",   x*1034, y*486, x*1254, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    else
    	if P ( x*1044, y*249, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - MacLaren
    	else
            dxDrawRectangle(x*1044, y*249, x*201, y*22, tocolor(255,0,0, 150), false) -- Veiculo - MacLaren
    	end
        if P ( x*1044, y*275, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo - R1
    	else
            dxDrawRectangle(x*1044, y*275, x*201, y*22, tocolor(255,0,0, 150), false) -- Veiculo - R1
    	end
        if P ( x*1044, y*301, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Vida 100%
    	else
            dxDrawRectangle(x*1044, y*301, x*201, y*22, tocolor(255,0,0, 150), false) -- Vida 100%
    	end
        if P ( x*1044, y*327, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*327, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Colete 100%
    	else
            dxDrawRectangle(x*1044, y*327, x*201, y*22, tocolor(255,0,0, 150), false) -- Colete 100%
    	end
        if P ( x*1044, y*353, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*353, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Pack de Armas (01)
    	else
            dxDrawRectangle(x*1044, y*353, x*201, y*22, tocolor(255,0,0, 150), false) -- Pack de Armas (01)
    	end
        if P ( x*1044, y*379, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*379, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Pack de Armas (02)
    	else
            dxDrawRectangle(x*1044, y*379, x*201, y*22, tocolor(255,0,0, 150), false) -- Pack de Armas (02)
    	end
        if P ( x*1044, y*405, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*405, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (01)
    	else
            dxDrawRectangle(x*1044, y*405, x*201, y*22, tocolor(255,0,0, 150), false) -- Personagem VIP (01)
    	end
        if P ( x*1044, y*431, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*431, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (02)
    	else
            dxDrawRectangle(x*1044, y*431, x*201, y*22, tocolor(255,0,0, 150), false) -- Personagem VIP (02)
    	end
        if P ( x*1044, y*457, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*457, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Personagem VIP (03)
    	else
            dxDrawRectangle(x*1044, y*457, x*201, y*22, tocolor(255,0,0, 150), false) -- Personagem VIP (03)
    	end
        if P ( x*1044, y*483, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*483, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Veiculo Colorido
    	else
            dxDrawRectangle(x*1044, y*483, x*201, y*22, tocolor(255,0,0, 150), false) -- Veiculo Colorido
    	end
        if P ( x*1044, y*509, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*509, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Farol Colorido
    	else
            dxDrawRectangle(x*1044, y*509, x*201, y*22, tocolor(255,0,0, 150), false) -- Farol Colorido
    	end
        if P ( x*1044, y*535, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*535, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false) -- Blindagem para o Veiculo
    	else
            dxDrawRectangle(x*1044, y*535, x*201, y*22, tocolor(255,0,0, 150), false) -- Blindagem para o Veiculo
    	end
	end
    
	if getElementData ( localPlayer, "VIP_01" ) == "Sim" then
	    dxDrawText("Veiculo - BMW M2",     x*121, y*249, x*322, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("Pack de Armas (01)",    x*121, y*275, x*322, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("Personagem VIP (01)",   x*121, y*301, x*322, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	if getElementData ( localPlayer, "VIP_02" ) == "Sim" then
		dxDrawText("Veiculo - PORCHE",     x*422, y*249, x*623, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veiculo - R1000",     x*422, y*275, x*623, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Vida 80%",              x*422, y*301, x*623, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas (01)",    x*422, y*327, x*623, y*349, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (01)",   x*422, y*353, x*623, y*375, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (02)",   x*422, y*379, x*623, y*401, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	if getElementData ( localPlayer, "VIP_03" ) == "Sim" then
		dxDrawText("Veiculo - CORVETTE",      x*744, y*249, x*945, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veiculo - R1000",     x*744, y*275, x*945, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Vida 100%",             x*744, y*301, x*945, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Colete 50%",            x*744, y*327, x*945, y*349, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas (01)",    x*744, y*353, x*945, y*375, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas (02)",    x*744, y*379, x*945, y*401, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (01)",   x*744, y*405, x*945, y*427, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (02)",   x*744, y*431, x*945, y*453, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (03)",   x*744, y*457, x*945, y*479, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veiculo Colorido",      x*744, y*483, x*945, y*505, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Farol Colorido",        x*744, y*509, x*945, y*531, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	if getElementData ( localPlayer, "VIP_04" ) == "Sim" then
		dxDrawText("Veiculo - Lamborghini Veneno",       x*1044, y*249, x*1245, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veiculo - R1",        x*1044, y*275, x*1245, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Vida 100%",                x*1044, y*301, x*1245, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Colete 100%",              x*1044, y*327, x*1245, y*349, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas (01)",       x*1044, y*353, x*1245, y*375, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas (02)",       x*1044, y*379, x*1245, y*401, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (01)",      x*1044, y*405, x*1245, y*427, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (02)",      x*1044, y*431, x*1245, y*453, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Personagem VIP (03)",      x*1044, y*457, x*1245, y*479, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veiculo Colorido",         x*1044, y*483, x*1245, y*505, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Farol Colorido",           x*1044, y*509, x*1245, y*531, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Blindagem para o Veiculo", x*1044, y*535, x*1245, y*557, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	dxDrawText("Bronze",   x*111 + 1, y*191 + 1, x*332 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Bronze",   x*111, y*191, x*332, y*249, tocolor(139,69,19, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Platina", x*412 + 1, y*191 + 1, x*633 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Platina", x*412, y*191, x*633, y*249, tocolor(192,192,192, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Diamante",   x*734 + 1, y*191 + 1, x*955 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Diamante",   x*734, y*191, x*955, y*249, tocolor(0,191,255, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Rubi",   x*1034 + 1, y*191 + 1, x*1255 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Rubi",   x*1034, y*191, x*1255, y*249, tocolor(255, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Benefícios [SFRP]", x*0 + 1, y*89 + 1, x*1366 + 1, y*153 + 1, tocolor(0, 0, 0, 255), x*1.70, "clear", "center", "center", false, false, false, false, false)
    dxDrawText("Benefícios [BCB]", x*0, y*89, x*1366, y*153, tocolor(255,255,255, 255), x*1.70, "clear", "center", "center", false, false, false, false, false)

end

local AirNewSCR_Remover = { "area_name", "vehicle_name", "radio" }

function Abrir_Fechar_AirNewSCR ( )
	if Painel_VIP_AirNewSCR == false then
	    for _, v in ipairs( AirNewSCR_Remover ) do
		    setPlayerHudComponentVisible ( v, false )
	    end
		showCursor ( true )
		showChat ( false )
		Painel_VIP_AirNewSCR = true
		addEventHandler ( "onClientRender", getRootElement(), PainelVIP_AirNewSCR )
		playSoundFrontEnd ( 1 )
    else
	    for _, v in ipairs( AirNewSCR_Remover ) do
		    setPlayerHudComponentVisible ( v, false )
	    end
	    showCursor ( false )
		showChat ( true )
		Painel_VIP_AirNewSCR = false
		removeEventHandler ( "onClientRender", getRootElement(), PainelVIP_AirNewSCR )
		playSoundFrontEnd ( 2 )
	end
end
bindKey ( Abrir_Fechar_BindAirNewSCR, "down", Abrir_Fechar_AirNewSCR )

function P ( x, y, Largura, Altura )
	if not isCursorShowing ( ) then
		return false
	end
	local sx, sy = guiGetScreenSize()
	local cx, cy = getCursorPosition()
	local cx, cy = (cx*sx), (cy*sy)
	if (cx >= x and cx <= x + Largura) and (cy >= y and cy <= y + Altura) then
		return true
	else
		return false
	end
end

function Selecionar_Opcao_AirNewSCR ( _, state )
    if Painel_VIP_AirNewSCR == true then
        if state == "down" then
		    if getElementData ( localPlayer, "VIP_01" ) == "Sim" then
                if P ( x*121, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Alpha", 1 )
                elseif P ( x*121, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Alpha", 1 )
	            elseif P ( x*121, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Alpha", 1 )
	            end
			end


            ------------------------------- VIP 02 -------------------------------

            if getElementData ( localPlayer, "VIP_02" ) == "Sim" then
                if P ( x*422, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Epsylon", 1 )
                elseif P ( x*422, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Epsylon", 2 )
                elseif P ( x*422, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Vida", "Epsylon", 1 )
                elseif P ( x*422, y*327, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Epsylon", 1 )
                elseif P ( x*422, y*353, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Epsylon", 1 )
                elseif P ( x*422, y*379, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Epsylon", 2 )
                end
			end
	
	        ------------------------------- VIP 03 -------------------------------
	
	        if getElementData ( localPlayer, "VIP_03" ) == "Sim" then
	            if P ( x*744, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Sigma", 1 )
                elseif P ( x*744, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Sigma", 2 )
                elseif P ( x*744, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Vida", "Sigma", 1 )
                elseif P ( x*744, y*327, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Colete", "Sigma", 1 )
   	            elseif P ( x*744, y*353, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Sigma", 1 )
	            elseif P ( x*744, y*379, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Sigma", 2 )
   	            elseif P ( x*744, y*405, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Sigma", 1 )
	            elseif P ( x*744, y*431, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Sigma", 2 )
	            elseif P ( x*744, y*457, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Sigma", 3 )
   	            elseif P ( x*744, y*483, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_VeiculoColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Sigma", "Função de Veiculo Colorido Ativada!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Sigma", "Função de Veiculo Colorido Desativada!" )
			    	end
	            elseif P ( x*744, y*509, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_FarolColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Sigma", "Função de Farol Colorido Ativada!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Sigma", "Função de Farol Colorido Desativada!" )
			    	end
	            end
			end


            ------------------------------- VIP 04 -------------------------------

            if getElementData ( localPlayer, "VIP_04" ) == "Sim" then
                if P ( x*1044, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Omega", 1 )
                elseif P ( x*1044, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Omega", 2 )
                elseif P ( x*1044, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Vida", "Omega", 1 )
                elseif P ( x*1044, y*327, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Colete", "Omega", 1 )
                elseif P ( x*1044, y*353, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Omega", 1 )
                elseif P ( x*1044, y*379, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Omega", 2 )
                elseif P ( x*1044, y*405, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Omega", 1 )
                elseif P ( x*1044, y*431, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Omega", 2 )
                elseif P ( x*1044, y*457, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Omega", 3 )
                elseif P ( x*1044, y*483, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_VeiculoColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Omega", "Função de Veiculo Colorido Ativada!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Omega", "Função de Veiculo Colorido Desativada!" )
			    	end
                elseif P ( x*1044, y*509, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_FarolColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Omega", "Função de Farol Colorido Ativada!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Omega", "Função de Farol Colorido Desativada!" )
			    	end
                elseif P ( x*1044, y*535, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Blindagem", "Omega", 1 )
                end
			end
        end
    end
end
addEventHandler ( "onClientClick", root, Selecionar_Opcao_AirNewSCR )

AirNewSCR_VeiculoColorido = {}

function VIPCarRainbowVIP ( )
	for _, player in pairs(getElementsByType("player")) do
		if getElementData ( player, "AirNewSCR_VeiculoColorido" ) == "Sim" then
			local vehicle = getPedOccupiedVehicle(player)
			if vehicle then
			  local seat = getPedOccupiedVehicleSeat(localPlayer)
			    if seat == 0 then
				if not AirNewSCR_VeiculoColorido[player] then
					AirNewSCR_VeiculoColorido[player] = 0
					return
				end
				local r, g, b = getVehicleColor(vehicle, true)
				if AirNewSCR_VeiculoColorido[player] == 0 then
					if r < 250  then
						r = r + 3
						if r > 255 then
							r = 250
						end
					else
						AirNewSCR_VeiculoColorido[player] = 1
					end
				end
				if AirNewSCR_VeiculoColorido[player] == 1 then
					if g < 250 then
						g = g + 3
					else
						AirNewSCR_VeiculoColorido[player] = 2
					end
				elseif AirNewSCR_VeiculoColorido[player] == 2 then
					if b < 255 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						b = b + 3
						if b > 255 then
							b = 255
						end
					else
						AirNewSCR_VeiculoColorido[player] = 3
					end
				elseif AirNewSCR_VeiculoColorido[player] == 3 then
					if g > 0 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						g = g - 3
						if g < 0 then
							g = 0
						end
					else
						AirNewSCR_VeiculoColorido[player] = 4
					end
				elseif AirNewSCR_VeiculoColorido[player] == 4 then
					if b > 0 then
						b = b - 3
						if b < 0 then
							b = 0
						end
					else
						b = 0
						AirNewSCR_VeiculoColorido[player] = 0
					end
				end
				if r < 0 then r = 0 end
				if g < 0 then g = 0 end
				if b < 0 then b = 0 end
				setVehicleColor(vehicle, r, g, b)
			end
		end
	end
end
end
addEventHandler ( "onClientPreRender", getRootElement(), VIPCarRainbowVIP )

AirNewSCR_FarolColorido = {}

function Farol_Colorido ( )
	for _, player in pairs(getElementsByType("player")) do
		if getElementData ( player, "AirNewSCR_FarolColorido" ) == "Sim" then
			local vehicle = getPedOccupiedVehicle(player)
			if vehicle then
				if not AirNewSCR_FarolColorido[player] then
					AirNewSCR_FarolColorido[player] = 0
					return
				end
				local r, g, b = getVehicleHeadLightColor(vehicle)
				if AirNewSCR_FarolColorido[player] == 0 then
					if r < 250  then
						r = r + 3
						if r > 255 then
							r = 250
						end
					else
						AirNewSCR_FarolColorido[player] = 1
					end
				end
				if AirNewSCR_FarolColorido[player] == 1 then
					if g < 250 then
						g = g + 3
					else
						AirNewSCR_FarolColorido[player] = 2
					end
				elseif AirNewSCR_FarolColorido[player] == 2 then
					if b < 255 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						b = b + 3
						if b > 255 then
							b = 255
						end
					else
						AirNewSCR_FarolColorido[player] = 3
					end
				elseif AirNewSCR_FarolColorido[player] == 3 then
					if g > 0 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						g = g - 3
						if g < 0 then
							g = 0
						end
					else
						AirNewSCR_FarolColorido[player] = 4
					end
				elseif AirNewSCR_FarolColorido[player] == 4 then
					if b > 0 then
						b = b - 3
						if b < 0 then
							b = 0
						end
					else
						b = 0
						AirNewSCR_FarolColorido[player] = 0
					end
				end
				if r < 0 then r = 0 end
				if g < 0 then g = 0 end
				if b < 0 then b = 0 end
				setVehicleHeadLightColor(vehicle, r, g, b)
			end
		end
	end
end
addEventHandler("onClientPreRender", getRootElement ( ), Farol_Colorido )