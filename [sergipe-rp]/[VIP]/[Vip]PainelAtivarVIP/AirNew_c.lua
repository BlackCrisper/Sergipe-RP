--[[



 ################################################
 #                                              #
 #              Script Criado Por               #
 #           FACEBOOK.COM/AIRNEWSCR             #
 #                                              #
 #                                              #
 ################################################



--]]

--------------------------------------------------------------------------------------------

setElementData ( localPlayer, "Mostrando_Mensagem_AirNewSCR", "Não" )

local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

local dxfont0_fonte = dxCreateFont("Arquivos/fonte.ttf", x*22)
local screenW, screenH = guiGetScreenSize()

function Mensagem_Ativacao ()
    if getElementData ( localPlayer, "Mostrando_Mensagem_AirNewSCR" ) == "Sim" then
        dxDrawText("O(A) Cidadão(a) "..getElementData ( localPlayer, "Ultimo_Ativador" ).."\nAtivou um Plano VIP "..getElementData ( localPlayer, "VIP_do_Ultimo_Ativador" ).." com Sucesso!", x*0 + 1, y*0 + 1, x*1366 + 1, y*768 + 1, tocolor(0, 0, 0, 255), x*1.00, dxfont0_fonte, "center", "center", false, false, false, true, false)
    end
end
addEventHandler ( "onClientRender", getRootElement ( ), Mensagem_Ativacao )

function Ativador_Musica ( Musica_Selecionada )
    setElementData ( localPlayer, "Mostrando_Mensagem_AirNewSCR", "Sim" )
	setTimer ( function() setElementData ( localPlayer, "Mostrando_Mensagem_AirNewSCR", "Não" ) end, 14000, 1 )
	if Musica_Selecionada == 1 then
	    Musica = playSound ( "Arquivos/Sidoka.mp3" )
	elseif Musica_Selecionada == 2 then
	    Musica = playSound ( "Arquivos/Sidoka.mp3" )
	elseif Musica_Selecionada == 3 then
	    Musica = playSound ( "Arquivos/Sidoka.mp3" )
	end
end
addEvent( "AirNewSCR_Ativar_VIP", true )
addEventHandler( "AirNewSCR_Ativar_VIP", root, Ativador_Musica )