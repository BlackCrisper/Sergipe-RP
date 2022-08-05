local Mes = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
local Sem = {"Dom", "Seg", "Ter", "Quar", "Quin", "Sex", "Sáb"}

local painel = false
local painel_02 = false

local photo = "wallpaper_01"
local page = "bloq"

local browser = guiCreateBrowser(x*1082, y*262, x*231, y*437, false, false, false)
local theBrowser = guiGetBrowser(browser)
guiSetVisible(browser, false)

local buscar_spotify = createElement("N3xT.Phone")
local select_music = false
local icon_music = "pause"
local musicas = {buscar = {}}

local n_titulo = createElement("N3xT.Phone")
local n_texto = createElement("N3xT.Phone")

local c_senha = createElement("N3xT.Phone")

local c_nome = createElement("N3xT.Phone")
local c_tel = createElement("N3xT.Phone")

local chat = createElement("N3xT.Phone")
local chats = {["twitter"] = {}, ["olx"] = {}, ["deepweb"] = {}}

local gridGPS = dxGridW:Create(1093, 318, 208, 240, false)
gridGPS:AddColumn("Contatos", 205)
gridGPS:SetVisible(false)

local motivo = createElement("N3xT.Phone")

local whatsapp = {}
local status = {}
local w_msg = createElement("N3xT.Phone")
local ws_msg = createElement("N3xT.Phone")

local d_id = createElement("N3xT.Phone")
local d_valor = createElement("N3xT.Phone")

function dxPanel()
        if page == "bloq" then
            dxDrawImage(x*1082, y*262, x*231, y*469, "files/gfx/"..dados.fundo[1]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/bloqueio.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1170, y*627, x*50, y*50, "files/gfx/digital.png", 0, 0, 0, (isCursorOnElement(x*1170, y*627, x*50, y*50) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            
        elseif page == "menu" then
            dxDrawImage(x*1082, y*262, x*231, y*469, "files/gfx/"..dados.fundo[2]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/inicial.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        elseif page == "galery_m" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/galeria_main.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        
        elseif page == "galery_i" then
            dxDrawImage(x*1069, y*242, x*254, x*503, "files/gfx/galeria_imgs.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            
            if isCursorOnElement(x*1143, y*306, x*55, y*54) then
                dxDrawImage(x*1142, y*303, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1200, y*306, x*54, y*54) then
                dxDrawImage(x*1198, y*303, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1256, y*306, x*54, y*54) then
                dxDrawImage(x*1254, y*303, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1143, y*363, x*54, y*54) then
                dxDrawImage(x*1142, y*360, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1200, y*363, x*54, y*54) then
                dxDrawImage(x*1198, y*360, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1256, y*363, x*54, y*54) then
                dxDrawImage(x*1254, y*360, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1143, y*418, x*54, y*54) then
                dxDrawImage(x*1142, y*415, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1200, y*418, x*54, y*54) then
                dxDrawImage(x*1198, y*415, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1256, y*418, x*54, y*54) then
                dxDrawImage(x*1254, y*415, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1143, y*474, x*54, y*54) then
                dxDrawImage(x*1142, y*471, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1200, y*474, x*54, y*54) then
                dxDrawImage(x*1198, y*471, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1256, y*474, x*54, y*54) then
                dxDrawImage(x*1254, y*471, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1143, y*530, x*54, y*54) then
                dxDrawImage(x*1142, y*528, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1200, y*530, x*54, y*54) then
                dxDrawImage(x*1198, y*528, x*58, 59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            elseif isCursorOnElement(x*1256, y*530, x*54, y*54) then
                dxDrawImage(x*1254, y*528, x*58, y*59, "files/gfx/galeria_select.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end
            dxDrawImage(x*1144, y*306, x*166, y*278, "files/gfx/galeria_wall.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        
        elseif page == "galery_v" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/galeria_view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1108, y*306, x*182, y*389, "files/gfx/"..photo..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            if painel_02 == true then
                dxDrawImage(x*1089, y*304, x*217, y*82, "files/gfx/galeria_noti.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end
        
        elseif page == "contact_m" then
            dxDrawImage(x*1069, y*242, x*257, y*503, "files/gfx/contact_main.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1263, y*644, x*42, y*42, "files/gfx/ncontact.png", 0, 0, 0, (isCursorOnElement(x*1263, y*644, x*42, y*42) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), false)
            
            if dados.telefone ~= "" then
                dxDrawText("Seu Número: "..dados.telefone, x*1106, y*630, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if contatos[1] then
                dxDrawImage(x*1095, y*334, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*334, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(contatos[1][1].."\n"..contatos[1][2], x*1135, y*340, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if contatos[2] then
                dxDrawImage(x*1095, y*382, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*382, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(contatos[2][1].."\n"..contatos[2][2], x*1135, y*388, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if contatos[3] then
                dxDrawImage(x*1095, y*430, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*430, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(contatos[3][1].."\n"..contatos[3][2], x*1135, y*436, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if contatos[4] then
                dxDrawImage(x*1095, y*478, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*478, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(contatos[4][1].."\n"..contatos[4][2], x*1135, y*484, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if contatos[5] then
                dxDrawImage(x*1095, y*526, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*526, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(contatos[5][1].."\n"..contatos[5][2], x*1135, y*532, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if contatos[6] then
                dxDrawImage(x*1095, y*574, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*574, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(contatos[6][1].."\n"..contatos[6][2], x*1135, y*580, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.00, "default", "left", "top", false, false, false, false, false)
            end

        elseif page == "contact_a" then
            dxDrawImage(x*1069, y*242, x*257, y*503, "files/gfx/contact_main.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1096, y*454, x*198, y*39, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1147, y*508, x*101, y*39, (isCursorOnElement(x*1147, y*508, x*101, y*39) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            dxDrawRectangleBorde(x*1096, y*405, x*198, y*39, tocolor(255, 255, 255, 255), false)
            dxDrawText("Salvar", x*1176, y*516, x*210, y*537, tocolor(100, 100, 100, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            dxDrawEditBox("Nome", x*1100, y*404, x*195, y*40, false, 15, c_nome)
            dxDrawEditBox("Telefone", x*1100, y*453, x*195, y*40, false, 15, c_tel)
        
        elseif page == "contact_l" then
            dxDrawImage(x*1069, y*242, x*257, y*503, "files/gfx/contact_main.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1170, y*328, x*46, y*46, "files/gfx/ncontact.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1115, y*386, x*160, y*57, tocolor(255, 255, 255, 255), false)
            dxDrawText(contatos[contatos_index][1].."\n"..contatos[contatos_index][2], x*1130, y*396, x*1287, y*363, tocolor(0, 0, 0, 200), x*1.2, "default-bold", "left", "top", false, false, false, false, false)
            if not isNumberEmergency(contatos[contatos_index][2]) then
                dxDrawImage(x*1206, y*459, x*31, y*32, "files/gfx/whatsapp.png", 0, 0, 0, (isCursorOnElement(x*1206, y*459, x*31, y*32) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), false)
                dxDrawImage(x*1179, y*578, x*38, y*37, "files/gfx/excluir.png", 0, 0, 0, (isCursorOnElement(x*1179, y*578, x*38, y*37) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), false)
            else
                dxDrawRectangleBorde(x*1096, y*540, x*198, y*39, tocolor(255, 255, 255, 255), false)
                dxDrawEditBox("Motivo", x*1100, y*539, x*195, y*40, false, 50, motivo)
            end
            dxDrawImage(x*1155, y*460, x*27, y*29, "files/gfx/call.png", 0, 0, 0, (isCursorOnElement(x*1155, y*460, x*27, y*29) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), false)

        elseif page == "internet" then
            dxDrawRectangle(x*1082, y*262, x*231, y*469, tocolor(200, 200, 200, 255), false) 
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)

        elseif page == "calculadora" then
            local calculatorText = getElementData(localPlayer,"calculatorText")
            dxDrawRectangle(x*1082, y*262, x*231, y*469, tocolor(100, 100, 100, 255), false) 
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangle(x*1090, y*370, x*211, y*32, tocolor(0, 255, 127, 200), false)
            dxDrawText("Calculadora", x*1129, y*368, x*0, y*0, tocolor(255, 255, 255, 200), x*1, font[3], "left", "top", false, false, false, false, false)
            dxDrawRectangle(x*1090, y*400, x*211, y*15, tocolor(255, 255, 255, 200), false)
            dxDrawText(calculatorText, x*1100, y*400, x*0, y*0, tocolor(50, 50, 50, 255), x*1.00, "default", "left", "top", false, false, false, false, false)

        elseif page == "spotify_bu" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/spotify_buscar.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1270, y*329, x*29, y*29, "files/gfx/buscar.png", 0, 0, 0, (isCursorOnElement(x*1270, y*329, x*29, y*29) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            dxDrawImage(x*1176, y*623, x*39, y*37, "files/gfx/"..icon_music..".png", 0, 0, 0, (isCursorOnElement(x*1176, y*623, x*39, y*37) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), true)
            dxDrawEditBox("Buscar...", x*1100, y*327, x*160, y*35, false, 25, buscar_spotify)
            
            if musicas.buscar[1] then
                if select_music == 1 then
                    dxDrawRectangleBorde(x*1090, y*372, x*216, y*44, tocolor(20, 20, 20, 255), false)
                    dxDrawImage(x*1278, y*396, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, tocolor(0, 255, 127, 255), false)
                else
                    dxDrawRectangleBorde(x*1090, y*372, x*216, y*44, (isCursorOnElement(x*1090, y*372, x*216, y*44) and tocolor(20, 20, 20, 255) or tocolor(30, 30, 30, 255)), false)
                    dxDrawImage(x*1278, y*396, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, (isCursorOnElement(x*1090, y*372, x*216, y*44) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
                end
                dxDrawText(musicas.buscar[1][1], x*1096, y*378, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText(musicas.buscar[1][2], x*1096, y*393, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
            end    
            if musicas.buscar[2] then
                if select_music == 2 then
                    dxDrawRectangleBorde(x*1090, y*425, x*216, y*44, tocolor(20, 20, 20, 255), false)
                    dxDrawImage(x*1278, y*450, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, tocolor(0, 255, 127, 255), false)
                else
                    dxDrawRectangleBorde(x*1090, y*425, x*216, y*44, (isCursorOnElement(x*1090, y*425, x*216, y*44) and tocolor(20, 20, 20, 255) or tocolor(30, 30, 30, 255)), false)
                    dxDrawImage(x*1278, y*450, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, (isCursorOnElement(x*1090, y*425, x*216, y*44) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
                end
                dxDrawText(musicas.buscar[2][1], x*1096, y*430, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText(musicas.buscar[2][2], x*1096, y*445, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if musicas.buscar[3] then
                if select_music == 3 then
                    dxDrawRectangleBorde(x*1090, y*478, x*216, y*44, tocolor(20, 20, 20, 255), false)
                    dxDrawImage(x*1278, y*502, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, tocolor(0, 255, 127, 255), false)
                else
                    dxDrawRectangleBorde(x*1090, y*478, x*216, y*44, (isCursorOnElement(x*1090, y*478, x*216, y*44) and tocolor(20, 20, 20, 255) or tocolor(30, 30, 30, 255)), false)
                    dxDrawImage(x*1278, y*502, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, (isCursorOnElement(x*1090, y*478, x*216, y*44) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
                end
                dxDrawText(musicas.buscar[3][1], x*1096, y*485, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText(musicas.buscar[3][2], x*1096, y*500, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if musicas.buscar[4] then
                if select_music == 4 then
                    dxDrawRectangleBorde(x*1090, y*531, x*216, y*44, tocolor(20, 20, 20, 255), false)
                    dxDrawImage(x*1278, y*555, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, tocolor(0, 255, 127, 255), false)
                else
                    dxDrawRectangleBorde(x*1090, y*531, x*216, y*44, (isCursorOnElement(x*1090, y*531, x*216, y*44) and tocolor(20, 20, 20, 255) or tocolor(30, 30, 30, 255)), false)
                    dxDrawImage(x*1278, y*555, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, (isCursorOnElement(x*1090, y*531, x*216, y*44) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
                end
                dxDrawText(musicas.buscar[4][1], x*1096, y*537, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText(musicas.buscar[4][2], x*1096, y*552, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if musicas.buscar[5] then
                if select_music == 5 then
                    dxDrawRectangleBorde(x*1090, y*584, x*216, y*44, tocolor(20, 20, 20, 255), false)
                    dxDrawImage(x*1278, y*608, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, tocolor(0, 255, 127, 255), false)
                else
                    dxDrawRectangleBorde(x*1090, y*584, x*216, y*44, (isCursorOnElement(x*1090, y*584, x*216, y*44) and tocolor(20, 20, 20, 255) or tocolor(30, 30, 30, 255)), false)
                    dxDrawImage(x*1278, y*608, x*34, y*17, "files/gfx/bb.png", 0, 0, 0, (isCursorOnElement(x*1090, y*584, x*216, y*44) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
                end
                dxDrawText(musicas.buscar[5][1], x*1096, y*590, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText(musicas.buscar[5][2], x*1096, y*605, x*1280, y*604, tocolor(200, 200, 200, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
            end

        elseif page == "notas_i" then
            dxDrawImage(x*1069, y*242, x*257, y*503, "files/gfx/notas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(x*1263, y*644, x*42, y*42, "files/gfx/notas_ntext.png", 0, 0, 0, (isCursorOnElement(x*1263, y*644, x*42, y*42) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), false)

            if dados.notas[1] then
                dxDrawImage(x*1095, y*334, x*202, y*38, "files/gfx/notas_text.png", 0, 0, 0, (isCursorOnElement(x*1095, y*334, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(dados.notas[1][1], x*1135, y*347, x*1287, y*363, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if dados.notas[2] then
                dxDrawImage(x*1095, y*382, x*202, y*38, "files/gfx/notas_text.png", 0, 0, 0, (isCursorOnElement(x*1095, y*382, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(dados.notas[2][1], x*1135, y*395, x*1287, y*363, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if dados.notas[3] then
                dxDrawImage(x*1095, y*430, x*202, y*38, "files/gfx/notas_text.png", 0, 0, 0, (isCursorOnElement(x*1095, y*430, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(dados.notas[3][1], x*1135, y*443, x*1287, y*363, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if dados.notas[4] then
                dxDrawImage(x*1095, y*478, x*202, y*38, "files/gfx/notas_text.png", 0, 0, 0, (isCursorOnElement(x*1095, y*478, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(dados.notas[4][1], x*1135, y*491, x*1287, y*363, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if dados.notas[5] then
                dxDrawImage(x*1095, y*526, x*202, y*38, "files/gfx/notas_text.png", 0, 0, 0, (isCursorOnElement(x*1095, y*526, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(dados.notas[5][1], x*1135, y*539, x*1287, y*363, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if dados.notas[6] then
                dxDrawImage(x*1095, y*574, x*202, y*38, "files/gfx/notas_text.png", 0, 0, 0, (isCursorOnElement(x*1095, y*574, x*202, y*38) and tocolor(150, 150, 150, 255) or tocolor(255, 255, 255, 255)), false)
                dxDrawText(dados.notas[6][1], x*1135, y*587, x*1287, y*363, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end

        elseif page == "notas_t" then
            dxDrawImage(x*1069, y*242, x*257, y*503, "files/gfx/notas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1096, y*454, x*198, y*39, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1147, y*508, x*101, y*39, (isCursorOnElement(x*1147, y*508, x*101, y*39) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            dxDrawRectangleBorde(x*1096, y*405, x*198, y*39, tocolor(255, 255, 255, 255), false)
            dxDrawText("Salvar", x*1176, y*516, x*210, y*537, tocolor(100, 100, 100, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            dxDrawEditBox("Título", x*1100, y*404, x*195, y*40, false, 15, n_titulo)
            dxDrawEditBox("Texto", x*1100, y*453, x*195, y*40, false, 150, n_texto)

        elseif page == "notas_s" then
            dxDrawImage(x*1069, y*242, x*257, y*503, "files/gfx/notas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1096, y*338, x*198, y*220, tocolor(255, 255, 255, 255), false)
            if notas_index then dxDrawText(dados.notas[notas_index][2], x*1105, y*348, x*1284, y*548, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, true, false, false, false) end
            dxDrawImage(x*1179, y*578, x*38, y*37, "files/gfx/excluir.png", 0, 0, 0, (isCursorOnElement(x*1179, y*578, x*38, y*37) and tocolor(255, 255, 255, 255) or tocolor(255, 255, 255, 200)), false)

        elseif page == "config" then
            dxDrawImage(x*1064, y*240, x*259, y*507, "files/gfx/config.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        elseif page == "config_l" then
            dxDrawImage(x*1068, y*240, x*255, y*507, "files/gfx/config_bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1096, y*454, x*198, y*39, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1147, y*508, x*101, y*39, (isCursorOnElement(x*1147, y*508, x*101, y*39) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            dxDrawText("Redefinir", x*1165, y*516, x*210, y*537, tocolor(100, 100, 100, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            dxDrawEditBox("Nova Senha", x*1100, y*453, x*195, y*40, true, 25, c_senha)

        elseif page == "config_s" then
            dxDrawImage(x*1068, y*240, x*255, y*507, "files/gfx/config_bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText("Click", x*1099, y*345, x*1151, y*358, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("Chamada", x*1100, y*449, x*1152, y*462, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("Notificações", x*1100, y*554, x*1152, y*567, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)

            if dados.toque[1] == "1" then
                dxDrawRectangleBorde(x*1144, y*367, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*367, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if dados.toque[1] == "2" then
                dxDrawRectangleBorde(x*1144, y*388, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*388, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if dados.toque[1] == "3" then
                dxDrawRectangleBorde(x*1144, y*411, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*411, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            dxDrawText("1", x*1161, y*366, x*1213, y*379, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("2", x*1162, y*387, x*1214, y*400, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("3", x*1162, y*410, x*1214, y*423, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)

            if dados.toque[2] == "chamada_01" then
                dxDrawRectangleBorde(x*1144, y*472, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*472, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if dados.toque[2] == "chamada_02" then
                dxDrawRectangleBorde(x*1144, y*496, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*496, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if dados.toque[2] == "chamada_03" then
                dxDrawRectangleBorde(x*1144, y*520, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*520, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            dxDrawText("1", x*1162, y*472, x*1214, y*485, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("2", x*1162, y*495, x*1214, y*508, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("3", x*1162, y*520, x*1214, y*533, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)

            if dados.toque[3] == "notify_01" then
                dxDrawRectangleBorde(x*1144, y*577, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*577, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if dados.toque[3] == "notify_02" then
                dxDrawRectangleBorde(x*1144, y*601, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*601, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if dados.toque[3] == "notify_03"  then
                dxDrawRectangleBorde(x*1144, y*625, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*625, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            dxDrawText("1", x*1162, y*577, x*1214, y*590, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("2", x*1162, y*600, x*1214, y*613, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("3", x*1162, y*625, x*1214, y*638, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)

        elseif page == "config_n" then
            dxDrawImage(x*1068, y*240, x*255, y*507, "files/gfx/config_bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText("Receber Chamadas", x*1099, y*345, x*1151, y*358, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawText("Notificações WhatsApp", x*1100, y*449, x*1152, y*462, tocolor(69, 69, 69, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)

            if not getElementData(localPlayer, "cancelReceiveCall") then
                dxDrawRectangleBorde(x*1144, y*367, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*367, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end
            if not getElementData(localPlayer, "cancelMessageWhatsApp") then
                dxDrawRectangleBorde(x*1144, y*472, x*13, y*14, tocolor(0, 255, 127, 255), false)
            else
                dxDrawRectangleBorde(x*1144, y*472, x*13, y*14, tocolor(255, 255, 255, 255), false)
            end

        elseif page == "config_r" then
            dxDrawImage(x*1068, y*240, x*255, y*507, "files/gfx/config_bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText("Restaurar padrão de fábrica\nredefini os seguintes dados:\n\nSons, Notificações, Contatos,\nNotas, Fundos de Tela e Avatar.", x*1113, y*370, x*1151, y*358, tocolor(69, 69, 69, 255), x*1, "default-bold", "left", "top", false, false, false, false, false)
            dxDrawRectangleBorde(x*1147, y*508, x*101, y*39, (isCursorOnElement(x*1147, y*508, x*101, y*39) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            dxDrawText("Redefinir", x*1165, y*516, x*210, y*537, tocolor(100, 100, 100, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)

        elseif page == "t_discagem" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/discagem.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText(t_number, x*1103, y*355, x*1176, y*376, tocolor(100, 100, 100, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)

        elseif page == "twitter" or page == "olx" or page == "deepweb" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/"..page..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawEditBox("Digite aqui...", x*1100, y*320, x*195, y*40, false, 150, chat)

            if chats[page][1] then
                dxDrawImage(x*1088, y*369, x*222, y*127, "files/gfx/tweet.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                if page ~= "deepweb" then
                    dxDrawText(chats[page][1][1], x*1128, y*410, x*1154, y*424, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                else
                    dxDrawText("Anônimo", x*1128, y*410, x*1154, y*424, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                end
                dxDrawText(chats[page][1][2], x*1099, y*434, x*1250, y*448, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*434, x*1301, y*448, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if chats[page][2] then
                dxDrawImage(x*1088, y*441, x*222, y*127, "files/gfx/tweet.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                if page ~= "deepweb" then
                    dxDrawText(chats[page][2][1], x*1128, y*482, x*1154, y*496, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                else
                    dxDrawText("Anônimo", x*1128, y*482, x*1154, y*496, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                end
                dxDrawText(chats[page][2][2], x*1099, y*506, x*1250, y*520, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*506, x*1301, y*520, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if chats[page][3] then
                dxDrawImage(x*1088, y*513, x*222, y*127, "files/gfx/tweet.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                if page ~= "deepweb" then
                    dxDrawText(chats[page][3][1], x*1128, y*554, x*1154, y*568, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                else
                    dxDrawText("Anônimo", x*1128, y*554, x*1154, y*568, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                end
                dxDrawText(chats[page][3][2], x*1099, y*578, x*1250, y*592, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*578, x*1301, y*592, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if chats[page][4] then
                dxDrawImage(x*1088, y*585, x*222, y*127, "files/gfx/tweet.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                if page ~= "deepweb" then
                    dxDrawText(chats[page][4][1], x*1128, y*627, x*1154, y*641, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                else
                    dxDrawText("Anônimo", x*1128, y*627, x*1154, y*641, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
                end
                dxDrawText(chats[page][4][2], x*1099, y*651, x*1250, y*665, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", true, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*651, x*1301, y*665, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end

        elseif page == "chat_lermais" then
            dxDrawRectangle(x*1082, y*262, x*231, y*469, tocolor(100, 100, 100, 255), false)
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1096, y*338, x*198, y*220, tocolor(255, 255, 255, 255), false)
            if chat_lermais_i[3] ~= "deepweb" then
                dxDrawText(chat_lermais_i[1], x*1105, y*300, x*1284, y*548, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
            else
                dxDrawText("Anônimo", x*1105, y*300, x*1284, y*548, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, true, false)
            end
            dxDrawText(chat_lermais_i[2], x*1105, y*348, x*1284, y*548, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, true, false, false, false)

        elseif page == "gps" then
            dxDrawRectangle(x*1082, y*262, x*231, y*469, tocolor(100, 100, 100, 255), false)
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1149, y*577, x*97, y*40, (isCursorOnElement(x*1149, y*577, x*97, y*40) and tocolor(0, 255, 127, 255) or tocolor(255, 255, 255, 255)), false)
            dxDrawText("Enviar Localização", x*1135, y*290, x*1188, y*308, tocolor(255, 255, 255, 255), x*0.9, font[2], "left", "top", false, false, false, false, false)
            dxDrawText("Enviar", x*1175, y*585, x*1213, y*605, tocolor(100, 100, 100, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)

        elseif page == "scall" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/scall.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            local receiver = getElementData(localPlayer, "emChamada")
            if receiver and type(receiver) == "table" then
                dxDrawText(getNameContatoByNumber(receiver[2]), x*1147, y*386, x*1247, y*404, tocolor(255, 255, 255, 255), x*1.25, "default-bold", "center", "top", false, false, false, false, false)
            end
            if call_count == true then
                if not systemUpTime then
                    systemUpTime = getTickCount()
                end
                currentCount = getTickCount()
                dxDrawText(milToMin(currentCount - systemUpTime), x*1174, y*457, x*1226, y*478, tocolor(255, 255, 255, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
            end

        elseif page == "rcall" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/rcall.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            local receiver = getElementData(localPlayer, "emChamada")
            if receiver and type(receiver) == "table" then
                dxDrawText(getNameContatoByNumber(receiver[2]), x*1147, y*386, x*1247, y*404, tocolor(255, 255, 255, 255), x*1.25, "default-bold", "center", "top", false, false, false, false, false)
            end

        elseif page == "whatsapp_p" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/whatsapp_p.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

            if dados.avatar ~= "" then
                dxDrawImage(x*1273, y*282, x*31, y*30, "files/gfx/avatars/"..dados.avatar..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end
            if whatsapp[1] then
                dxDrawImage(x*1095, y*344, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*344, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[1][3] ~= "" then
                    dxDrawImage(x*1100, y*348, x*31, y*30, "files/gfx/avatars/"..whatsapp[1][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[1][1]), x*1135, y*350, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[1][2][#whatsapp[1][2]][2], x*1135, y*362, x*1270, y*383, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[1][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*360, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*361, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[1][2][#whatsapp[1][2]][1] and whatsapp[1][2][#whatsapp[1][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*360, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*360, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end
            if whatsapp[2] then
                dxDrawImage(x*1095, y*392, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*392, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[2][3] ~= "" then
                    dxDrawImage(x*1100, y*396, x*31, y*30, "files/gfx/avatars/"..whatsapp[2][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[2][1]), x*1135, y*398, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[2][2][#whatsapp[2][2]][2], x*1135, y*410, x*1270, y*429, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[2][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*408, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*409, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[2][2][#whatsapp[2][2]][1] and whatsapp[2][2][#whatsapp[2][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*408, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*408, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end
            if whatsapp[3] then
                dxDrawImage(x*1095, y*440, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*440, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[3][3] ~= "" then
                    dxDrawImage(x*1100, y*443, x*31, y*30, "files/gfx/avatars/"..whatsapp[3][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[3][1]), x*1135, y*446, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[3][2][#whatsapp[3][2]][2], x*1135, y*458, x*1270, y*475, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[3][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*457, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*458, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[3][2][#whatsapp[3][2]][1] and whatsapp[3][2][#whatsapp[3][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*457, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*457, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end
            if whatsapp[4] then
                dxDrawImage(x*1095, y*488, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*488, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[4][3] ~= "" then
                    dxDrawImage(x*1100, y*492, x*31, y*30, "files/gfx/avatars/"..whatsapp[4][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[4][1]), x*1135, y*494, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[4][2][#whatsapp[4][2]][2], x*1135, y*506, x*1270, y*521, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[4][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*505, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*506, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[4][2][#whatsapp[4][2]][1] and whatsapp[4][2][#whatsapp[4][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*505, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*505, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end
            if whatsapp[5] then
                dxDrawImage(x*1095, y*536, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*536, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[5][3] ~= "" then
                    dxDrawImage(x*1100, y*540, x*31, y*30, "files/gfx/avatars/"..whatsapp[5][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[5][1]), x*1135, y*542, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[5][2][#whatsapp[5][2]][2], x*1135, y*554, x*1270, y*613, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[5][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*553, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*554, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[5][2][#whatsapp[5][2]][1] and whatsapp[5][2][#whatsapp[5][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*553, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*553, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end
            if whatsapp[6] then
                dxDrawImage(x*1095, y*584, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*584, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[6][3] ~= "" then
                    dxDrawImage(x*1100, y*588, x*31, y*30, "files/gfx/avatars/"..whatsapp[6][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[6][1]), x*1135, y*590, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[6][2][#whatsapp[6][2]][2], x*1135, y*602, x*1270, y*620, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[6][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*601, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*602, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[6][2][#whatsapp[6][2]][1] and whatsapp[6][2][#whatsapp[6][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*601, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*601, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end
            if whatsapp[7] then
                dxDrawImage(x*1095, y*632, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*632, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                if whatsapp[7][3] ~= "" then
                    dxDrawImage(x*1100, y*636, x*31, y*30, "files/gfx/avatars/"..whatsapp[7][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end
                dxDrawText(getNameContatoByNumber(whatsapp[7][1]), x*1135, y*638, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(whatsapp[7][2][#whatsapp[7][2]][2], x*1135, y*650, x*1270, y*666, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", true, false, false, false, false)
                local view = getMessageViewWhatsApp(whatsapp[7][2])
                if view ~= 0 then
                    dxDrawImage(x*1276, y*649, x*17, y*17, "files/gfx/noview.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    dxDrawText(tostring(view), x*1281, y*650, x*1297, y*377, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
                else
                    if dados.telefone == whatsapp[7][2][#whatsapp[7][2]][1] and whatsapp[7][2][#whatsapp[7][2]][4] ~= "view" then
                        dxDrawImage(x*1276, y*649, x*17, y*17, "files/gfx/view2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    else
                        dxDrawImage(x*1276, y*649, x*17, y*17, "files/gfx/view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end
                end
            end

        elseif page == "whatsapp_m" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/whatsapp_m.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawEditBox("Digite aqui...", x*1088, y*686, x*185, y*40, false, 150, w_msg)

            if type(whatsapp_index) == "string" then
                dxDrawText(whatsapp_index, x*1132, y*294, x*1261, y*311, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "top", true, false, false, false, false)
                wi = getConversaWhatsApp(getNumberContatoByName(whatsapp_index))
                if not wi then return end
            else
                dxDrawText(getNameContatoByNumber(whatsapp[whatsapp_index][1]), x*1132, y*294, x*1261, y*311, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "top", true, false, false, false, false)
                wi = whatsapp_index
            end
            if whatsapp[wi][3] ~= "" then
                dxDrawImage(x*1098, y*286, x*28, y*28, "files/gfx/avatars/"..whatsapp[wi][3]..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end
            if whatsapp[wi][2][1] then
                if whatsapp[wi][2][1][1] ~= dados.telefone then
                    dxDrawImage(x*1088, y*297, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                else
                    dxDrawImage(x*1088, y*297, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(152, 251, 152, 255), false)
                end
                dxDrawText(whatsapp[wi][2][1][2], x*1099, y*337, x*1249, y*382, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", true, true, false, false, false)
                dxDrawText(whatsapp[wi][2][1][3], x*1258, y*342, x*1301, y*448, tocolor(0, 0, 0, 130), x*1.00, "default", "left", "top", false, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*362, x*1301, y*448, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if whatsapp[wi][2][2] then
                if whatsapp[wi][2][2][1] ~= dados.telefone then
                    dxDrawImage(x*1088, y*369, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                else
                    dxDrawImage(x*1088, y*369, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(152, 251, 152, 255), false)
                end
                dxDrawText(whatsapp[wi][2][2][2], x*1099, y*409, x*1249, y*454, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", true, true, false, false, false)
                dxDrawText(whatsapp[wi][2][2][3], x*1258, y*414, x*1301, y*448, tocolor(0, 0, 0, 130), x*1.00, "default", "left", "top", false, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*434, x*1301, y*448, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if whatsapp[wi][2][3] then
                if whatsapp[wi][2][3][1] ~= dados.telefone then
                    dxDrawImage(x*1088, y*441, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                else
                    dxDrawImage(x*1088, y*441, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(152, 251, 152, 255), false)
                end
                dxDrawText(whatsapp[wi][2][3][2], x*1099, y*482, x*1249, y*527, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", true, true, false, false, false)
                dxDrawText(whatsapp[wi][2][3][3], x*1258, y*486, x*1301, y*520, tocolor(0, 0, 0, 130), x*1.00, "default", "left", "top", false, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*506, x*1301, y*520, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if whatsapp[wi][2][4] then
                if whatsapp[wi][2][4][1] ~= dados.telefone then
                    dxDrawImage(x*1088, y*513, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                else
                    dxDrawImage(x*1088, y*513, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(152, 251, 152, 255), false)
                end
                dxDrawText(whatsapp[wi][2][4][2], x*1099, y*553, x*1249, y*598, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", true, true, false, false, false)
                dxDrawText(whatsapp[wi][2][4][3], x*1258, y*558, x*1301, y*592, tocolor(0, 0, 0, 130), x*1.00, "default", "left", "top", false, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*578, x*1301, y*592, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end
            if whatsapp[wi][2][5] then
                if whatsapp[wi][2][5][1] ~= dados.telefone then
                    dxDrawImage(x*1088, y*585, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                else
                    dxDrawImage(x*1088, y*585, x*222, y*127, "files/gfx/wa_message.png", 0, 0, 0, tocolor(152, 251, 152, 255), false)
                end
                dxDrawText(whatsapp[wi][2][5][2], x*1099, y*626, x*1249, y*671, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", true, true, false, false, false)
                dxDrawText(whatsapp[wi][2][5][3], x*1258, y*631, x*1301, y*665, tocolor(0, 0, 0, 130), x*1.00, "default", "left", "top", false, false, false, false, false)
                dxDrawText("Ler mais", x*1258, y*651, x*1301, y*665, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
            end

        elseif page == "whatsapp_s" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/whatsapp_s.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            
            local l_status = getElementData(localPlayer, "statusWhatsApp")
            if l_status and type(l_status) == "table" then
                dxDrawText(l_status[#l_status][3], x*1135, y*360, x*1270, y*429, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", false, false, false, false, false)
            end
            if status[1] then
                dxDrawImage(x*1095, y*420, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*420, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                dxDrawText(getNameContatoByNumber(status[1][#status[1]][1]), x*1135, y*425, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(status[1][#status[1]][3], x*1135, y*438, x*1270, y*429, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", false, false, false, false, false)
            end
            if status[2] then
                dxDrawImage(x*1095, y*473, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*473, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                dxDrawText(getNameContatoByNumber(status[2][#status[2]][1]), x*1135, y*479, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(status[2][#status[2]][3], x*1135, y*492, x*1270, y*429, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", false, false, false, false, false)
            end
            if status[3] then
                dxDrawImage(x*1095, y*526, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*526, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                dxDrawText(getNameContatoByNumber(status[3][#status[3]][1]), x*1135, y*532, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(status[3][#status[3]][3], x*1135, y*545, x*1270, y*429, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", false, false, false, false, false)
            end
            if status[4] then
                dxDrawImage(x*1095, y*579, x*202, y*38, "files/gfx/ncontact2.png", 0, 0, 0, (isCursorOnElement(x*1095, y*579, x*202, y*38) and tocolor(220, 220, 220, 255) or tocolor(245, 245, 245, 255)), false)
                dxDrawText(getNameContatoByNumber(status[4][#status[4]][1]), x*1135, y*585, x*1285, y*383, tocolor(0, 0, 0, 200), x*1.00, "bold", "left", "top", false, false, false, false, false)
                dxDrawText(status[4][#status[4]][3], x*1135, y*598, x*1270, y*429, tocolor(0, 0, 0, 130), x*1.00, "arial", "left", "top", false, false, false, false, false)
            end

        elseif page == "whatsapp_s2" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/whatsapp_s2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawEditBox("Digite aqui...", x*1088, y*686, x*185, y*40, false, 150, ws_msg)
            local wm = getElementData(ws_msg, "text2")
            if wm then
                dxDrawText(wm, x*1114, y*402, x*1274, y*584, tocolor(255, 255, 255, 255), x*1.50, "default-bold", "center", "top", true, true, false, false, false)
            end

        elseif page == "whatsapp_s3" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/whatsapp_s3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)            
            if status_index == 0 then
                local l_status = getElementData(localPlayer, "statusWhatsApp")
                if l_status and type(l_status) == "table" then
                    dxDrawText(l_status[status_count][2], x*1114, y*402, x*1274, y*584, tocolor(255, 255, 255, 255), x*1.50, "default-bold", "center", "top", true, true, false, false, false)
                end
            else
                dxDrawText(status[status_index][status_count][2], x*1114, y*402, x*1274, y*584, tocolor(255, 255, 255, 255), x*1.50, "default-bold", "center", "top", true, true, false, false, false)
            end

        elseif page == "avatar" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/galeria_view.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            if avatar_i > 0 then
                dxDrawImage(x*1170, y*440, x*50, y*50, "files/gfx/avatars/"..avatar_i..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end

        elseif page == "chat_lermais2" then
            dxDrawRectangle(x*1082, y*262, x*231, y*469, tocolor(100, 100, 100, 255), false)
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1096, y*338, x*198, y*220, tocolor(255, 255, 255, 255), false)
            dxDrawText(chat_lermais_i2, x*1105, y*348, x*1284, y*548, tocolor(0, 0, 0, 255), x*1.00, "default", "left", "top", false, true, false, false, false)

        elseif page == "camera" then
            dxDrawText("Pressione 'backspace' para voltar (desative o cursor para girar a câmera)", x*485, y*687, x*786, y*707, tocolor(255, 255, 255, 150), x*1.00, "arial", "left", "top", false, false, false, false, false)

        elseif page == "dinheiro" then
            dxDrawImage(x*1069, y*242, x*254, y*503, "files/gfx/dinheiro.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawRectangleBorde(x*1151, y*622, x*85, y*35, (isCursorOnElement(x*1151, y*622, x*85, y*35) and tocolor(0, 255, 127, 255) or tocolor(230, 230, 230, 255)), false)
            dxDrawText("Enviar", x*1174, y*628, x*1225, y*649, tocolor(69, 69, 69, 255), x*1.20, "default", "left", "top", false, false, false, false, false)
            dxDrawText(getPlayerMoney(), x*1115, y*349, x*1166, y*370, tocolor(254, 254, 254, 255), x*1.60, "default", "left", "top", false, false, false, false, false)
            dxDrawEditBox("ID", x*1130, y*495, x*135, y*40, false, 15, d_id)
            dxDrawEditBox("Valor", x*1130, y*562, x*135, y*40, false, 15, d_valor)
        end
end

function dxText()
    local time = getRealTime()
    local meses_do_ano = Mes[time.month + 1]
    local semana = Sem[time.weekday + 1]
    local diaMes = time.monthday
    local minuto = time.minute
    local hora = time.hour

    if hora < 10 then
        hora = "0"..hora
    end
    
    if minuto < 10 then
        minuto = "0"..minuto
    end

        if page == "bloq" then
            dxDrawText(hora..":"..minuto, x*1083, y*273, x*1308, y*447, tocolor(255, 255, 255, 255), x*1.00, font[1], "center", "center", false, false, false, false, false)
            dxDrawText(semana..", "..diaMes.." de "..meses_do_ano, x*1083, y*350, x*1308, y*447, tocolor(255, 255, 255, 255), x*1.00, font[2], "center", "center", false, false, false, false, false)
        
        elseif page == "menu" then
            dxDrawText(hora..":"..minuto, x*1251, y*265, x*1299, y*288, tocolor(255, 255, 255, 255), x*1.00, font[2], "center", "center", false, false, false, false, false)

            if isCursorShowing() then
            local mx, my = getCursorPosition()
            local cx, cy = mx * screen[1], my * screen[2]

            if isCursorOnElement(x*1205, y*290, x*40, y*40) then
                dxDrawText("Whatsapp", cx - x*50, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1150, y*290, x*40, y*40) then
                dxDrawText("Internet", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1252, y*292, x*40, y*40) then
                dxDrawText("Notas", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1101, y*290, x*40, y*40) then
                dxDrawText("Galeria", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1104, y*341, x*40, y*40) then
                dxDrawText("Twitter", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1154, y*341, x*40, y*40) then
                dxDrawText("OLX", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1204, y*341, x*40, y*40) then
                dxDrawText("Spotify", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1254, y*341, x*40, y*40) then
                dxDrawText("Calculadora", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1102, y*651, x*40, y*40) then
                dxDrawText("Telefone", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1153, y*651, x*40, y*40) then
                dxDrawText("Contatos", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1204, y*651, x*40, y*40) then
                dxDrawText("GPS", cx - x*50, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1253, y*651, x*40, y*40) then
                dxDrawText("Configurações", cx - x*70, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1104, y*390, x*40, y*40) then
                dxDrawText("Deep Web", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1154, y*390, x*40, y*40) then
                dxDrawText("Transferir Dinheiro", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            elseif isCursorOnElement(x*1204, y*390, x*40, y*40) then
                dxDrawText("Câmera", cx - x*30, cy - y*30, x*625, y*326, tocolor(255, 255, 255, 255), x*1.00, font[2], "left", "top", false, false, false, false, false)
            end
            end

        elseif page == "galery_v" then
            if photo == "wallpaper_01" then
                dxDrawText("01/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_02" then
                dxDrawText("02/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_03" then
                dxDrawText("03/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_04" then
                dxDrawText("04/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_05" then
                dxDrawText("05/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_06" then
                dxDrawText("06/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_07" then
                dxDrawText("07/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_08" then
                dxDrawText("08/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_09" then
                dxDrawText("09/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_10" then
                dxDrawText("10/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_11" then
                dxDrawText("11/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_12" then
                dxDrawText("12/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_13" then
                dxDrawText("13/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_14" then
                dxDrawText("14/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            elseif photo == "wallpaper_15" then
                dxDrawText("15/15", x*1087, y*693, x*1310, y*725, tocolor(255, 255, 255, 255), x*1.00, font[4], "center", "center", false, false, false, false, false)
            end
           
            if painel_02 == true then
                if isCursorOnElement(x*1092, y*310, x*117, y*15) then
                    dxDrawRectangle(x*1092, y*311, x*177, y*4, tocolor(60, 100, 255, 255), false)
                elseif isCursorOnElement(x*1092, y*333, x*137, y*15) then
                    dxDrawRectangle(x*1092, y*329, x*177, y*4, tocolor(60, 100, 255, 255), false)
                elseif isCursorOnElement(x*1092, y*350, x*177, y*15) then
                    dxDrawRectangle(x*1092, y*346, x*177, y*4, tocolor(60, 100, 255, 255), false)
                end
            end
        end
end

function dxController(v_dados)
    if painel == false then
        dados = v_dados
        page = "bloq"
        painel = true
        painel_02 = false
        addEventHandler("onClientRender", root, dxPanel)
        addEventHandler("onClientRender", root, dxText)
        triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 1)
        playSoundFrontEnd(33)
    else
        if not getElementData(localPlayer, "emChamada") then
            painel = false
            painel_02 = false
            removeEventHandler("onClientRender", root, dxPanel)
            removeEventHandler("onClientRender", root, dxText)
            triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 2)
            guiSetVisible(browser, false)
            gridGPS:SetVisible(false)
            setElementData(localPlayer, "calculator", false)
            playSoundFrontEnd(33)
            if c_som and isElement(c_som) then
                stopSound(c_som)
            end
            if page == "camera" then
                setPedAnimation( localPlayer, false)
                removeEventHandler ( "onClientPreRender", getRootElement(), render )
                removeEventHandler ( "onClientCursorMove", getRootElement(), mousecalc )
                setCameraTarget ( localPlayer )
                showPlayerHudComponent ( "radar", true )
            end
        end
    end
end
addEvent("N3xT.onOpenCelular", true)
addEventHandler("N3xT.onOpenCelular", root, dxController)

function dxClick(button, state)
    if painel == true then
        if button == "left" and state == "down" then
            if isCursorOnElement(x*1082, y*262, x*231, y*469) then
                if page ~= "config_s" then
                    playSoundFrontEnd(tonumber(dados.toque[1]))
                end
            end

            if page == "bloq" then
                if isCursorOnElement(x*1170, y*627, x*50, y*50) then
                    page = "menu"
                end

            elseif page == "menu" then
                if isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1101, y*290, x*40, y*40) then
                    page = "galery_m"
                elseif isCursorOnElement(x*1153, y*651, x*40, y*40) then
                    page = "contact_m"
                    index_d = 6
                    updateContatos()
                elseif isCursorOnElement(x*1150, y*290, x*40, y*40) then
                    page = "internet"
                    loadBrowserURL(theBrowser, "https://google.com/")
                    guiSetVisible(browser, true)
                elseif isCursorOnElement(x*1254, y*341, x*40, y*40) then
                    page = "calculadora"
                    setElementData(localPlayer, "calculator", true)
                elseif isCursorOnElement(x*1204, y*341, x*40, y*40) then
                    page = "spotify_bu"
                elseif isCursorOnElement(x*1252, y*292, x*40, y*40) then
                    page = "notas_i"
                elseif isCursorOnElement(x*1253, y*651, x*40, y*40) then
                    page = "config"
                elseif isCursorOnElement(x*1102, y*651, x*40, y*40) then
                    page = "t_discagem"
                    t_number = ""
                elseif isCursorOnElement(x*1104, y*341, x*40, y*40) then
                    page = "twitter"
                    triggerServerEvent("N3xT.updateChatMessage", localPlayer, localPlayer, "twitter", "source")
                elseif isCursorOnElement(x*1154, y*341, x*40, y*40) then
                    page = "olx"
                    triggerServerEvent("N3xT.updateChatMessage", localPlayer, localPlayer, "olx", "source")
                elseif isCursorOnElement(x*1104, y*390, x*40, y*40) then
                    page = "deepweb"
                    triggerServerEvent("N3xT.updateChatMessage", localPlayer, localPlayer, "deepweb", "source")
                elseif isCursorOnElement(x*1204, y*651, x*40, y*40) then
                    page = "gps"
                    gridGPS:SetVisible(true)
                    updateContatosGPS()
                elseif isCursorOnElement(x*1205, y*290, x*40, y*40) then
                    page = "whatsapp_p"
                    index_d2 = 7
                    triggerServerEvent("N3xT.onUpdateWhatsApp", localPlayer)
                elseif isCursorOnElement(x*1204, y*390, x*40, y*40) then
                    page = "camera"
                    if isElement ( getCameraTarget ( ) ) then
                        setPedAnimation( localPlayer, "PED", "gang_gunstand")
                        addEventHandler ( "onClientPreRender", getRootElement(), render )
                        addEventHandler ( "onClientCursorMove", getRootElement(), mousecalc )
                        showPlayerHudComponent ( "radar", false )
                    end
                elseif isCursorOnElement(x*1154, y*390, x*40, y*40) then
                    page = "dinheiro"
                end

            elseif page == "galery_m" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1097, y*327, x*94, y*94) then
                    page = "galery_i"
                end

            elseif page == "galery_i" then
                if isCursorOnElement(x*1092, y*271, x*25, y*25) then
                    page = "galery_m"
                elseif isCursorOnElement(x*1143, y*306, x*55, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_01"
                elseif isCursorOnElement(x*1200, y*306, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_02"
                elseif isCursorOnElement(x*1256, y*306, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_03"
                elseif isCursorOnElement(x*1143, y*363, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_04"
                elseif isCursorOnElement(x*1200, y*363, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_05"
                elseif isCursorOnElement(x*1256, y*363, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_06"
                elseif isCursorOnElement(x*1143, y*418, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_07"
                elseif isCursorOnElement(x*1200, y*418, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_08"
                elseif isCursorOnElement(x*1256, y*418, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_09"
                elseif isCursorOnElement(x*1143, y*474, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_10"
                elseif isCursorOnElement(x*1200, y*474, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_11"
                elseif isCursorOnElement(x*1256, y*474, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_12"
                elseif isCursorOnElement(x*1143, y*530, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_13"
                elseif isCursorOnElement(x*1200, y*530, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_14"
                elseif isCursorOnElement(x*1256, y*530, x*54, y*54) then
                    page = "galery_v"
                    photo = "wallpaper_15"
                end

            elseif page == "galery_v" then
                if isCursorOnElement(x*1096, y*271, x*27, y*25) then
                    painel_02 = false
                    page = "galery_i"
                elseif isCursorOnElement(x*1279, y*271, x*27, y*25) then
                    if painel_02 == true then
                        painel_02 = false
                    elseif painel_02 == false then
                        painel_02 = true
                    end
                elseif isCursorOnElement(x*1287, y*488, x*27, y*25) then
                    if painel_02 == false then
                        if photo == "wallpaper_01" then
                            photo = "wallpaper_02"
                        elseif photo == "wallpaper_02" then
                            photo = "wallpaper_03"
                        elseif photo == "wallpaper_03" then
                            photo = "wallpaper_04"
                        elseif photo == "wallpaper_04" then
                            photo = "wallpaper_05"
                        elseif photo == "wallpaper_05" then
                            photo = "wallpaper_06"
                        elseif photo == "wallpaper_06" then
                            photo = "wallpaper_07"
                        elseif photo == "wallpaper_07" then
                            photo = "wallpaper_08"
                        elseif photo == "wallpaper_08" then
                            photo = "wallpaper_09"
                        elseif photo == "wallpaper_09" then
                            photo = "wallpaper_10"
                        elseif photo == "wallpaper_10" then
                            photo = "wallpaper_11"
                        elseif photo == "wallpaper_11" then
                            photo = "wallpaper_12"
                        elseif photo == "wallpaper_12" then
                            photo = "wallpaper_13"
                        elseif photo == "wallpaper_13" then
                            photo = "wallpaper_14"
                        elseif photo == "wallpaper_14" then
                            photo = "wallpaper_15"
                        elseif photo == "wallpaper_15" then
                            photo = "wallpaper_01"
                        end
                    end
                elseif isCursorOnElement(x*1084, y*488, x*27, y*25) then
                    if painel_02 == false then
                        if photo == "wallpaper_01" then
                            photo = "wallpaper_15"
                        elseif photo == "wallpaper_02" then
                            photo = "wallpaper_01"
                        elseif photo == "wallpaper_03" then
                            photo = "wallpaper_02"
                        elseif photo == "wallpaper_04" then
                            photo = "wallpaper_03"
                        elseif photo == "wallpaper_05" then
                            photo = "wallpaper_04"
                        elseif photo == "wallpaper_06" then
                            photo = "wallpaper_05"
                        elseif photo == "wallpaper_07" then
                            photo = "wallpaper_06"
                        elseif photo == "wallpaper_08" then
                            photo = "wallpaper_07"
                        elseif photo == "wallpaper_09" then
                            photo = "wallpaper_08"
                        elseif photo == "wallpaper_10" then
                            photo = "wallpaper_09"
                        elseif photo == "wallpaper_11" then
                            photo = "wallpaper_10"
                        elseif photo == "wallpaper_12" then
                            photo = "wallpaper_11"
                        elseif photo == "wallpaper_13" then
                            photo = "wallpaper_12"
                        elseif photo == "wallpaper_14" then
                            photo = "wallpaper_13"
                        elseif photo == "wallpaper_15" then
                            photo = "wallpaper_14"
                        end
                    end
                elseif isCursorOnElement(x*1092, y*310, x*117, y*15) then
                    if painel_02 == true then
                        dados.fundo[2] = photo
                        painel_02 = false
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1092, y*333, x*137, y*15) then
                    if painel_02 == true then
                        dados.fundo[1] = photo
                        painel_02 = false
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1092, y*350, x*177, y*15) then
                    if painel_02 == true then
                        dados.fundo[1] = photo
                        dados.fundo[2] = photo
                        painel_02 = false
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                end

            elseif page == "contact_m" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1263, y*644, x*42, y*42) then
                    page = "contact_a"
                    setElementData(c_nome, "text2", "")
                    setElementData(c_tel, "text2", "")
                elseif isCursorOnElement(x*1095, y*334, x*202, y*38) then
                    if contatos[1] then
                        contatos_index = 1
                        page = "contact_l"
                        setElementData(motivo, "text2", "")
                    end
                elseif isCursorOnElement(x*1095, y*382, x*202, y*38) then
                    if contatos[2] then
                        contatos_index = 2
                        page = "contact_l"
                        setElementData(motivo, "text2", "")
                    end
                elseif isCursorOnElement(x*1095, y*430, x*202, y*38) then
                    if contatos[3] then
                        contatos_index = 3
                        page = "contact_l"
                        setElementData(motivo, "text2", "")
                    end
                elseif isCursorOnElement(x*1095, y*478, x*202, y*38) then
                    if contatos[4] then
                        contatos_index = 4
                        page = "contact_l"
                        setElementData(motivo, "text2", "")
                    end
                elseif isCursorOnElement(x*1095, y*526, x*202, y*38) then
                    if contatos[5] then
                        contatos_index = 5
                        page = "contact_l"
                    end
                elseif isCursorOnElement(x*1095, y*574, x*202, y*38) then
                    if contatos[6] then
                        contatos_index = 6
                        page = "contact_l"
                    end
                end

            elseif page == "contact_a" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "contact_m"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1147, y*508, x*101, y*39) then
                    local nti = getElementData(c_nome, "text2")
                    local nte = getElementData(c_tel, "text2")
                    if nti and nti ~= "" then
                        if nte and tonumber(nte) then
                            for _, v in ipairs(dados.contatos) do
                                if v[1] == nti then
                                    return message("Você não pode salvar um Contato com o Nome de Outro!", "error")
                                end
                                if v[2] == nte then
                                    return message("Você não pode salvar um Contato com o Telefone de Outro!", "error")
                                end
                            end
                            if nte ~= dados.telefone then
                                triggerServerEvent("N3xT.onAddContact", localPlayer, nti, nte)
                            else
                                message("Você não pode salvar um Contato com seu Número de Telefone!", "error")
                            end
                        else
                            message("Preencha o Telefone!", "error")
                        end
                    else
                        message("Preencha Nome!", "error")
                    end
                end

            elseif page == "contact_l" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "contact_m"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1155, y*460, x*27, y*29) then
                    if not isNumberEmergency(contatos[contatos_index][2]) then
                        triggerServerEvent("N3xT.onDiscarNumber", localPlayer, contatos[contatos_index][2], dados.telefone)
                    else
                        if not getElementData(localPlayer, "recentEmergency") then
                            local mt = getElementData(motivo, "text2")
                            if mt and mt ~= "" then
                                triggerServerEvent("N3xT.onDiscarEmergency", localPlayer, contatos[contatos_index][1], mt)
                            else
                                message("Preencha o Motivo!", "error")
                            end
                        else
                            message("Você Ligou para um Serviço de Emergência recentemente!", "error")
                        end
                    end
                elseif isCursorOnElement(x*1206, y*459, x*31, y*32) then
                    if not isNumberEmergency(contatos[contatos_index][2]) then
                        page = "whatsapp_m"
                        whatsapp_index = contatos[contatos_index][1]
                        setElementData(w_msg, "text2", "")
                        triggerServerEvent("N3xT.onUpdateWhatsApp", localPlayer)
                    end
                elseif isCursorOnElement(x*1179, y*578, x*38, y*37) then
                    if not isNumberEmergency(contatos[contatos_index][2]) then
                        page = "contact_m"
                        table.remove(dados.contatos, contatos_index)
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                        message("Contato deletado com sucesso.", "success")
                        updateContatos()
                    end
                end

            elseif page == "internet" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    guiSetVisible(browser, false)
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    guiSetVisible(browser, false)
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    guiSetVisible(browser, false)
                    page = "bloq"
                end

            elseif page == "calculadora" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    setElementData(localPlayer, "calculator", false)
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    setElementData(localPlayer, "calculator", false)
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    setElementData(localPlayer, "calculator", false)
                    page = "bloq"
                end

            elseif page == "spotify_bu" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1267, y*330, x*32, y*29) then
                    local bs = getElementData(buscar_spotify, "text2")
                    if bs then
                        select_music = false
                        for i = 1, #musicas.buscar do
                            if musicas.buscar[i] then
                                table.remove(musicas.buscar, i)
                            end
                        end
                        triggerServerEvent("N3xT.searchMusics", resourceRoot, bs)
                    end
                elseif isCursorOnElement(x*1176, y*623, x*39, y*37) then
                    if som then
                        if icon_music == "play" then
                            icon_music = "pause"
                            setSoundPaused(som, true)
                        else
                            icon_music = "play"
                            setSoundPaused(som, false)
                        end
                    end
                elseif isCursorOnElement(x*1090, y*372, x*216, y*44) then
                    if select_music ~= 1 then
                        select_music = 1
                        icon_music = "play"
                        if som then
                            stopSound(som)
                        end
                        som = playSound("https://api.soundcloud.com/tracks/"..tostring(musicas.buscar[1][3]).."/stream?client_id="..config.keySound)
                    end
                elseif isCursorOnElement(x*1090, y*425, x*216, y*44) then
                    if select_music ~= 2 then
                        select_music = 2
                        icon_music = "play"
                        if som then
                            stopSound(som)
                        end
                        som = playSound("https://api.soundcloud.com/tracks/"..tostring(musicas.buscar[2][3]).."/stream?client_id="..config.keySound)
                    end
                elseif isCursorOnElement(x*1090, y*478, x*216, y*44) then
                    if select_music ~= 3 then
                        select_music = 3
                        icon_music = "play"
                        if som then
                            stopSound(som)
                        end
                        som = playSound("https://api.soundcloud.com/tracks/"..tostring(musicas.buscar[3][3]).."/stream?client_id="..config.keySound)
                    end
                elseif isCursorOnElement(x*1090, y*531, x*216, y*44) then
                    if select_music ~= 4 then
                        select_music = 4
                        icon_music = "play"
                        if som then
                            stopSound(som)
                        end
                        som = playSound("https://api.soundcloud.com/tracks/"..tostring(musicas.buscar[4][3]).."/stream?client_id="..config.keySound)
                    end
                elseif isCursorOnElement(x*1090, y*584, x*216, y*44) then
                    if select_music ~= 5 then
                        select_music = 5
                        icon_music = "play"
                        if som then
                            stopSound(som)
                        end
                        som = playSound("https://api.soundcloud.com/tracks/"..tostring(musicas.buscar[5][3]).."/stream?client_id="..config.keySound)
                    end
                end

            elseif page == "notas_i" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1263, y*644, x*42, y*42) then
                    page = "notas_t"
                    setElementData(n_titulo, "text2", "")
                    setElementData(n_texto, "text2", "")
                elseif isCursorOnElement(x*1095, y*334, x*202, y*38) then
                    if dados.notas[1] then
                        notas_index = 1
                        page = "notas_s"
                    end
                elseif isCursorOnElement(x*1095, y*382, x*202, y*38) then
                    if dados.notas[2] then
                        notas_index = 2
                        page = "notas_s"
                    end
                elseif isCursorOnElement(x*1095, y*430, x*202, y*38) then
                    if dados.notas[3] then
                        notas_index = 3
                        page = "notas_s"
                    end
                elseif isCursorOnElement(x*1095, y*478, x*202, y*38) then
                    if dados.notas[4] then
                        notas_index = 4
                        page = "notas_s"
                    end
                elseif isCursorOnElement(x*1095, y*526, x*202, y*38) then
                    if dados.notas[5] then
                        notas_index = 5
                        page = "notas_s"
                    end
                elseif isCursorOnElement(x*1095, y*574, x*202, y*38) then
                    if dados.notas[6] then
                        notas_index = 6
                        page = "notas_s"
                    end
                end

            elseif page == "notas_t" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "notas_i"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1147, y*508, x*101, y*39) then
                    local nti = getElementData(n_titulo, "text2")
                    local nte = getElementData(n_texto, "text2")
                    if nti and nti ~= "" then
                        if nte and nte ~= "" then
                            if #dados.notas < 6 then
                                table.insert(dados.notas, {nti, nte})
                                triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                                message("Nota salva com sucesso.", "success")
                                page = "notas_i"
                            else
                                message("Você excedeu o limite de Notas!", "error")
                            end
                        else
                            message("Preencha o Título!", "error")
                        end
                    else
                        message("Preencha Texto!", "error")
                    end
                end

            elseif page == "notas_s" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "notas_i"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1179, y*578, x*38, y*37) then
                    if notas_index then
                        page = "notas_i"
                        table.remove(dados.notas, notas_index)
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                        message("A Nota foi apagada com sucesso.", "success")
                    else
                        message("Ocorreu um erro ao apagar a Nota!", "error")
                    end
                end

            elseif page == "config" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1083, y*308, x*227, y*37) then
                    page = "config_l"
                    setElementData(c_senha, "text2", "")
                elseif isCursorOnElement(x*1083, y*355, x*227, y*37) then
                    page = "config_s"
                elseif isCursorOnElement(x*1083, y*402, x*227, y*37) then
                    page = "config_n"
                elseif isCursorOnElement(x*1083, y*453, x*227, y*37) then
                    page = "config_r"
                end
                
            elseif page == "config_l" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "config"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1147, y*508, x*101, y*39)  then
                    local pass = getElementData(c_senha, "text2")
                    if pass and string.len(pass) >= 5 then
                        triggerServerEvent("N3xT.setAccountPass", localPlayer, pass)
                    else
                        message("Sua senha deve conter no mínimo 5 caracteres!", "error")
                    end
                end

            elseif page == "config_s" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "config"
                    if c_som and isElement(c_som) then
                        stopSound(c_som)
                    end
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                    if c_som and isElement(c_som) then
                        stopSound(c_som)
                    end
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                    if c_som and isElement(c_som) then
                        stopSound(c_som)
                    end
                elseif isCursorOnElement(x*1144, y*367, x*13, y*14) then
                    if dados.toque[1] ~= "1" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[1] = "1"
                        c_som = playSoundFrontEnd(1)
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*388, x*13, y*14) then
                    if dados.toque[1] ~= "2" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[1] = "2"
                        c_som = playSoundFrontEnd(2)
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*411, x*13, y*14) then
                    if dados.toque[1] ~= "3" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[1] = "3"
                        c_som = playSoundFrontEnd(3)
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*472, x*13, y*14) then
                    if dados.toque[2] ~= "chamada_01" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[2] = "chamada_01"
                        c_som = playSound("files/sfx/chamada_01.mp3")
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*496, x*13, y*14) then
                    if dados.toque[2] ~= "chamada_02" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[2] = "chamada_02"
                        c_som = playSound("files/sfx/chamada_02.mp3")
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*520, x*13, y*14) then
                    if dados.toque[2] ~= "chamada_03" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[2] = "chamada_03"
                        c_som = playSound("files/sfx/chamada_03.mp3")
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*577, x*13, y*14) then
                    if dados.toque[3] ~= "notify_01" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[3] = "notify_01"
                        c_som = playSound("files/sfx/notify_01.mp3")
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*601, x*13, y*14) then
                    if dados.toque[3] ~= "notify_02" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[3] = "notify_02"
                        c_som = playSound("files/sfx/notify_02.mp3")
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                elseif isCursorOnElement(x*1144, y*625, x*13, y*14) then
                    if dados.toque[3] ~= "notify_03" then
                        if c_som and isElement(c_som) then
                            stopSound(c_som)
                        end
                        dados.toque[3] = "notify_03"
                        c_som = playSound("files/sfx/notify_03.mp3")
                        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    end
                end

            elseif page == "config_n" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "config"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1144, y*367, x*13, y*14) then
                    if not getElementData(localPlayer, "cancelReceiveCall") then
                        setElementData(localPlayer, "cancelReceiveCall", true)
                    else
                        setElementData(localPlayer, "cancelReceiveCall", nil)
                    end
                elseif isCursorOnElement(x*1144, y*472, x*13, y*14) then
                    if not getElementData(localPlayer, "cancelMessageWhatsApp") then
                        setElementData(localPlayer, "cancelMessageWhatsApp", true)
                    else
                        setElementData(localPlayer, "cancelMessageWhatsApp", nil)
                    end
                end

            elseif page == "config_r" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "config"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1147, y*508, x*101, y*39) then
                    page = "config"
                    dados.notas = {}
                    dados.contatos = {
                        {"SAMU", "192"},
                        {"Polícia", "190"},
                        {"Mecânico", "185"},
                        {"Staff", "000"}
                    }
                    dados.fundo = {
                        "wallpaper_04",
                        "wallpaper_04"
                    }
                    dados.toque = {
                        "1",
                        "chamada_01",
                        "notify_01"
                    }
                    dados.avatar = ""
                    setElementData(localPlayer, "cancelReceiveCall", nil)
                    setElementData(localPlayer, "cancelMessageWhatsApp", nil)
                    triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                    message("Seu Celular foi Redefinido com sucesso.", "success")
                end

            elseif page == "t_discagem" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1135, y*443, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."1"
                    end
                elseif isCursorOnElement(x*1179, y*443, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."2"
                    end              
                elseif isCursorOnElement(x*1223, y*443, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."3"
                    end
                elseif isCursorOnElement(x*1135, y*487, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."4"
                    end                    
                elseif isCursorOnElement(x*1179, y*487, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."5"
                    end
                elseif isCursorOnElement(x*1223, y*487, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."6"
                    end
                elseif isCursorOnElement(x*1135, y*531, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."7"
                    end
                elseif isCursorOnElement(x*1179, y*531, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."8"
                    end
                elseif isCursorOnElement(x*1223, y*531, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."9"
                    end
                elseif isCursorOnElement(x*1179, y*575, x*34, y*34) then
                    if string.len(t_number) < 15 then
                        t_number = t_number.."0"
                    end
                elseif isCursorOnElement(x*1241, y*655, x*34, y*34) then
                    t_number = string.sub(t_number, 1, string.len(t_number) -1)
                elseif isCursorOnElement(x*1177, y*654, x*37, y*37) then
                    if t_number ~= dados.telefone then
                        if t_number ~= "" then
                            triggerServerEvent("N3xT.onDiscarNumber", localPlayer, t_number, dados.telefone)
                        else
                            message("Preencha o Número de Telefone!", "error")
                        end
                    else
                        message("Você não pode Ligar para você mesmo!", "error")
                    end
                end

            elseif page == "twitter" or page == "olx" or page == "deepweb" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1171, y*361, x*55, y*12) then
                    local tt = getElementData(chat, "text2")
                    if tt and tt ~= "" then
                        triggerServerEvent("N3xT.onMessageChat", localPlayer, page, tt)
                    else
                        message("Preencha a Mensagem!", "error")
                    end
                elseif isCursorOnElement(x*1258, y*434, x*40, y*15) then
                    if chats[page][1] then
                        chat_lermais_i = {chats[page][1][1], chats[page][1][2], page}
                        page = "chat_lermais"
                    end
                elseif isCursorOnElement(x*1258, y*506, x*40, y*15) then
                    if chats[page][2] then
                        chat_lermais_i = {chats[page][2][1], chats[page][2][2], page}
                        page = "chat_lermais"
                    end
                elseif isCursorOnElement(x*1258, y*578, x*40, y*15) then
                    if chats[page][3] then
                        chat_lermais_i = {chats[page][3][1], chats[page][3][2], page}
                        page = "chat_lermais"
                    end
                elseif isCursorOnElement(x*1258, y*651, x*40, y*15) then
                    if chats[page][4] then
                        chat_lermais_i = {chats[page][4][1], chats[page][4][2], page}
                        page = "chat_lermais"
                    end
                end

            elseif page == "chat_lermais" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = chat_lermais_i[3]
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                end

            elseif page == "gps" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                    gridGPS:SetVisible(false)
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                    gridGPS:SetVisible(false)
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                    gridGPS:SetVisible(false)
                elseif isCursorOnElement(x*1149, y*577, x*97, y*40) then
                    if gridGPS:GetSelectedItem() and gridGPS:GetSelectedItem() ~= -1 then
                        local c = gridGPS:GetItemDetails(1, gridGPS:GetSelectedItem())
                        local c = getNumberContatoByName(c)
                        if c then
                            triggerServerEvent("N3xT.onEnviarLoc", localPlayer, c)
                        else
                            message("Ocorreu algum problema ao enviar a Localização!", "error")
                        end
                    else
                        message("Selecione um Contato!", "error")
                    end
                end

            elseif page == "scall" then
                if isCursorOnElement(x*1165, y*573, x*63, y*66) then
                    page = "menu"
                    if s_som and isElement(s_som) then
                        stopSound(s_som)
                    end
                    local receiver = getElementData(localPlayer, "emChamada")
                    if receiver and type(receiver) == "table" and isElement(receiver[1]) and getElementType(receiver[1]) == "player" then
                        triggerServerEvent("N3xT.setCallEvent", receiver[1], "N3xT.StopLigacao")
                    end
                    setElementData(localPlayer, "emChamada", nil)
                end

            elseif page == "rcall" then
                if isCursorOnElement(x*1096, y*598, x*59, y*62) then
                    page = "scall"
                    call_count = true
                    systemUpTime = nil
                    if r_som and isElement(r_som) then
                        stopSound(r_som)
                    end
                    local receiver = getElementData(localPlayer, "emChamada")
                    if receiver and type(receiver) == "table" and isElement(receiver[1]) and getElementType(receiver[1]) == "player" then
                        setElementData(localPlayer, "emChamada", {receiver[1], receiver[2], true})
                        local receiver2 = getElementData(receiver[1], "emChamada")
                        if receiver2 and type(receiver2) == "table" and isElement(receiver2[1]) and getElementType(receiver2[1]) == "player" then
                            setElementData(receiver[1], "emChamada", {receiver2[1], receiver2[2], true})
                            triggerServerEvent("N3xT.setCallEvent", receiver[1], "N3xT.SetLigacaoAccept")
                        end
                    end
                elseif isCursorOnElement(x*1238, y*598, x*59, y*62) then
                    page = "menu"
                    if r_som and isElement(r_som) then
                        stopSound(r_som)
                    end
                    local receiver = getElementData(localPlayer, "emChamada")
                    if receiver and type(receiver) == "table" and isElement(receiver[1]) and getElementType(receiver[1]) == "player" then
                        triggerServerEvent("N3xT.setCallEvent", receiver[1], "N3xT.StopLigacao")
                    end
                    setElementData(localPlayer, "emChamada", nil)
                end

            elseif page == "whatsapp_p" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1095, y*344, x*202, y*38) then 
                    if whatsapp[1] then
                        page = "whatsapp_m"
                        whatsapp_index = 1
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1095, y*392, x*202, y*38) then
                    if whatsapp[2] then
                        page = "whatsapp_m"
                        whatsapp_index = 2
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1095, y*440, x*202, y*38) then
                    if whatsapp[3] then
                        page = "whatsapp_m"
                        whatsapp_index = 3
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1095, y*488, x*202, y*38) then
                    if whatsapp[4] then
                        page = "whatsapp_m"
                        whatsapp_index = 4
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1095, y*536, x*202, y*38) then
                    if whatsapp[5] then
                        page = "whatsapp_m"
                        whatsapp_index = 5
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1095, y*584, x*202, y*38) then
                    if whatsapp[6] then
                        page = "whatsapp_m"
                        whatsapp_index = 6
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1095, y*632, x*202, y*38) then
                    if whatsapp[7] then
                        page = "whatsapp_m"
                        whatsapp_index = 7
                        onViewWhatsApp()
                    end
                elseif isCursorOnElement(x*1276, y*283, x*26, y*27) then
                    page = "avatar"
                    if dados.avatar ~= "" then
                        avatar_i = tonumber(dados.avatar)
                    else
                        avatar_i = 0
                    end
                elseif isCursorOnElement(x*1218, y*317, x*52, y*18) then
                    page = "whatsapp_s"
                    index_d3 = 4
                    triggerServerEvent("N3xT.onUpdateStatusWhatsApp", localPlayer)
                end

            elseif page == "whatsapp_m" then
                if isCursorOnElement(x*1276, y*291, x*18, y*16) then
                    page = "whatsapp_p"
                elseif isCursorOnElement(x*1278, y*690, x*30, y*31) then
                    local wm = getElementData(w_msg, "text2")
                    if wm and wm ~= "" then
                        if type(whatsapp_index) == "string" then
                            triggerServerEvent("N3xT.onMessageWhatsApp", localPlayer, getNumberContatoByName(whatsapp_index), wm)
                        else
                            triggerServerEvent("N3xT.onMessageWhatsApp", localPlayer, whatsapp[whatsapp_index][1], wm)
                        end
                    else
                        message("Preencha a Mensagem!", "error")
                    end
                elseif isCursorOnElement(x*1258, y*362, x*40, y*15) then
                    if wi and whatsapp[wi][2][1] then
                        chat_lermais_i2 = whatsapp[wi][2][1][2]
                        page = "chat_lermais2"
                    end
                elseif isCursorOnElement(x*1258, y*434, x*40, y*15) then
                    if wi and whatsapp[wi][2][2] then
                        chat_lermais_i2 = whatsapp[wi][2][2][2]
                        page = "chat_lermais2"
                    end
                elseif isCursorOnElement(x*1258, y*506, x*40, y*15) then
                    if wi and whatsapp[wi][2][3] then
                        chat_lermais_i2 = whatsapp[wi][2][3][2]
                        page = "chat_lermais2"
                    end
                elseif isCursorOnElement(x*1258, y*578, x*40, y*15) then
                    if wi and whatsapp[wi][2][4] then
                        chat_lermais_i2 = whatsapp[wi][2][4][2]
                        page = "chat_lermais2"
                    end
                elseif isCursorOnElement(x*1258, y*651, x*40, y*15) then
                    if wi and whatsapp[wi][2][5] then
                        chat_lermais_i2 = whatsapp[wi][2][5][2]
                        page = "chat_lermais2"
                    end
                end

            elseif page == "whatsapp_s" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1120, y*317, x*52, y*18) then
                    page = "whatsapp_p"
                elseif isCursorOnElement(x*1262, y*647, x*41, y*42) then
                    page = "whatsapp_s2"
                    setElementData(ws_msg, "text2", "")
                elseif isCursorOnElement(x*1096, y*342, x*30, y*31) then
                    local l_status = getElementData(localPlayer, "statusWhatsApp")
                    if l_status and type(l_status) == "table" then
                        page = "whatsapp_s3"
                        status_index = 0
                        status_count = 1
                    end
                elseif isCursorOnElement(x*1095, y*420, x*202, y*38) then
                    if status[1] then
                        page = "whatsapp_s3"
                        status_count = 1
                        status_index = 1
                    end
                elseif isCursorOnElement(x*1095, y*473, x*202, y*38) then 
                    if status[2] then
                        page = "whatsapp_s3"
                        status_count = 1
                        status_index = 2
                    end
                elseif isCursorOnElement(x*1095, y*526, x*202, y*38) then
                    if status[3] then
                        page = "whatsapp_s3"
                        status_count = 1
                        status_index = 3
                    end
                elseif isCursorOnElement(x*1095, y*579, x*202, y*38) then
                    if status[4] then
                        page = "whatsapp_s3"
                        status_count = 1
                        status_index = 4
                    end
                end

            elseif page == "whatsapp_s2" then
                if isCursorOnElement(x*1280, y*291, x*18, y*16) then
                    page = "whatsapp_s"
                elseif isCursorOnElement(x*1278, y*690, x*30, y*31) then
                    local wm = getElementData(ws_msg, "text2")
                    if wm and wm ~= "" then
                        triggerServerEvent("N3xT.onStatusWhatsApp", localPlayer, wm)
                    else
                        message("Preencha a Mensagem!", "error")
                    end
                end

            elseif page == "whatsapp_s3" then
                if isCursorOnElement(x*1280, y*291, x*18, y*16) then
                    page = "whatsapp_s"
                elseif isCursorOnElement(x*1084, y*488, x*27, y*25) then
                    if status_count > 1 then
                        status_count = status_count - 1
                    end
                elseif isCursorOnElement(x*1287, y*488, x*27, y*25) then
                    if status_index ~= 0 then      
                        if status[status_index][status_count + 1] then
                            status_count = status_count + 1
                        end
                    else
                        local l_status = getElementData(localPlayer, "statusWhatsApp")
                        if l_status and type(l_status) == "table" then
                            if l_status[status_count + 1] then
                                status_count = status_count + 1
                            end
                        end
                    end
                end

            elseif page == "avatar" then
                if isCursorOnElement(x*1096, y*271, x*27, y*25) then
                    page = "whatsapp_p"
                elseif isCursorOnElement(x*1287, y*488, x*27, y*25) then
                    if avatar_i < 20 then
                        avatar_i = avatar_i + 1
                    else
                        avatar_i = 0
                    end
                    if avatar_i == 0 then
                        dados.avatar = ""
                    else
                        dados.avatar = tostring(avatar_i)
                    end
                    triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                elseif isCursorOnElement(x*1084, y*488, x*27, y*25) then
                    if avatar_i > 0 then
                        avatar_i = avatar_i - 1
                    else
                        avatar_i = 20
                    end
                    if avatar_i == 0 then
                        dados.avatar = ""
                    else
                        dados.avatar = tostring(avatar_i)
                    end
                    triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
                end

            elseif page == "chat_lermais2" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "whatsapp_m"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                end

            elseif page == "dinheiro" then
                if isCursorOnElement(x*1256, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1187, y*698, x*29, y*27) then
                    page = "menu"
                elseif isCursorOnElement(x*1106, y*698, x*29, y*27) then
                    page = "bloq"
                elseif isCursorOnElement(x*1151, y*622, x*85, y*35) then
                    local d1 = getElementData(d_id, "text2")
                    local d2 = getElementData(d_valor, "text2")
                    if d1 and tonumber(d1) and tonumber(d1) >= 1 then
                        if d2 and tonumber(d2) and tonumber(d2) >= 1 then
                            triggerServerEvent("N3xT.onEnviarDinheiro", localPlayer, tonumber(d1), tonumber(d2))
                        else
                            message("Preencha um Valor válido!", "error")
                        end
                    else
                        message("Preencha um ID válido!", "error")
                    end
                end
            end
        end
    end
end
addEventHandler("onClientClick", root, dxClick)

addEvent("N3xT.getMusics", true)
addEventHandler("N3xT.getMusics", root,
    function(musics)
        for i, v in ipairs(musics) do
            musicas.buscar[i] = {v.title, milToMin(v.duration), v.id}
        end
    end
)

addEvent("N3xT.updateChatMessage2", true)
addEventHandler("N3xT.updateChatMessage2", root,
    function(t_chat, c_chat)
        for i, v in ipairs(t_chat) do
            chats[c_chat][i] = {v[1], v[2]}
        end
    end
)

addEvent("N3xT.setEditChatNil", true)
addEventHandler("N3xT.setEditChatNil", root,
    function(lado)
        if lado == 1 then
            setElementData(chat, "text2", "")
        elseif lado == 2 then
            setElementData(w_msg, "text2", "")
        elseif lado == 3 then
            setElementData(ws_msg, "text2", "")
        end
    end
)

addEvent("N3xT.onAddContact2", true)
addEventHandler("N3xT.onAddContact2", root,
    function(nome, tel)
        table.insert(dados.contatos, {nome, tel})
        triggerServerEvent("N3xT.setDadosMe", localPlayer, dados)
        message("Contato salvo com sucesso.", "success")
        page = "contact_m"
        index_d = 6
        updateContatos()
    end
)

function updateContatos()
    contatos = {}
    for i, v in ipairs(dados.contatos) do
        table.insert(contatos, {v[1], v[2]})
        if i == 6 then
            break
        end
    end
end

function updateContatosGPS()
    gridGPS:Clear()
    for _, v in ipairs(dados.contatos) do
        if not isNumberEmergency(v[2]) then
            gridGPS:AddItem(1, v[1])
        end
    end
end

function getNumberContatoByName(nome)
    for _, v in ipairs(dados.contatos) do
        if nome == v[1] then
            return v[2]
        end
    end
    return false
end

function getNameContatoByNumber(nome)
    for _, v in ipairs(dados.contatos) do
        if nome == v[2] then
            return v[1]
        end
    end
    return nome
end

function scrollContatos(button)
    if painel == true and page == "contact_m" then
        if button == "mouse_wheel_up" then
            if index_d > 6 then
                index_d = index_d - 1
                for i = 5, 1, -1 do
                    contatos[i + 1][1] = contatos[i][1]
                    contatos[i + 1][2] = contatos[i][2]
                end
                contatos[1][1] = dados.contatos[index_d - 5][1]
                contatos[1][2] = dados.contatos[index_d - 5][2]
            end
        elseif button == "mouse_wheel_down" then
            if #dados.contatos > 6 then
                if index_d < #dados.contatos then
                    index_d = index_d + 1
                    for i = 2, 6 do
                        contatos[i - 1][1] = contatos[i][1]
                        contatos[i - 1][2] = contatos[i][2]
                    end
                    contatos[6][1] = dados.contatos[index_d][1]
                    contatos[6][2] = dados.contatos[index_d][2]
                end
            end
        end
    end
end
bindKey("mouse_wheel_up", "down", scrollContatos)
bindKey("mouse_wheel_down", "down", scrollContatos)

function isNumberEmergency(number)
    local n_e = {"192", "190", "185", "000"}
    for _, v in ipairs(n_e) do
        if number == v then
            return true
        end
    end
    return false
end

addEvent("N3xT.SetLigacao", true)
addEventHandler("N3xT.SetLigacao", root,
    function()
        page = "scall"
        call_count = false
        s_som = playSound("files/sfx/chamando.mp3", true)
    end
)

addEvent("N3xT.ReceberLigacao", true)
addEventHandler("N3xT.ReceberLigacao", root,
    function(dados_p)
        if painel == false then
            dados = dados_p
            page = "rcall"
            painel = true
            painel_02 = false
            call_count = false
            addEventHandler("onClientRender", root, dxPanel)
            addEventHandler("onClientRender", root, dxText)
            triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 1)
            r_som = playSound("files/sfx/"..dados.toque[2]..".mp3", true)
        else
            if page == "camera" then
                triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 2)
                triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 1)
                setPedAnimation( localPlayer, false)
                removeEventHandler ( "onClientPreRender", getRootElement(), render )
                removeEventHandler ( "onClientCursorMove", getRootElement(), mousecalc )
                setCameraTarget ( localPlayer )
                showPlayerHudComponent ( "radar", true )
            end
            page = "rcall"
            painel_02 = false
            call_count = false
            guiSetVisible(browser, false)
            gridGPS:SetVisible(false)
            setElementData(localPlayer, "calculator", false)
            if c_som and isElement(c_som) then
                stopSound(c_som)
            end
            r_som = playSound("files/sfx/"..dados.toque[2]..".mp3", true)
        end
    end
)

addEvent("N3xT.StopLigacao", true)
addEventHandler("N3xT.StopLigacao", root,
    function()
        if page == "rcall" then
            if r_som and isElement(r_som) then
                stopSound(r_som)
            end
        elseif page == "scall" then
            if s_som and isElement(s_som) then
                stopSound(s_som)
            end
        end
        setElementData(localPlayer, "emChamada", nil)
        page = "menu"
    end
)

addEvent("N3xT.SetLigacaoAccept", true)
addEventHandler("N3xT.SetLigacaoAccept", root,
    function()
        call_count = true
        systemUpTime = nil
        if s_som and isElement(s_som) then
            stopSound(s_som)
        end
    end
)

addEvent("N3xT.onUpdateWhatsApp2", true)
addEventHandler("N3xT.onUpdateWhatsApp2", root,
    function(v_whatsapp)
        t_whatsapp = v_whatsapp
        whatsapp = {}
        for i, v in ipairs(t_whatsapp) do
            table.insert(whatsapp, {v[1], v[2], v[3]})
            if i == 7 then
                break
            end
        end
        onViewWhatsApp()
    end
)

function onViewWhatsApp()
    setTimer(function()
        if painel == true and page == "whatsapp_m" and wi then
            for i, v in ipairs(whatsapp[wi][2]) do
                if v[1] ~= dados.telefone and v[4] == "noview" then
                    triggerServerEvent("N3xT.onViewWhatsApp", localPlayer, dados.telefone, v[1], i)
                end
            end
        end
    end, 100, 1)
end

function scrollWhatsApp(button)
    if painel == true and page == "whatsapp_p" then
        if t_whatsapp then
            if button == "mouse_wheel_up" then
                if index_d2 > 7 then
                    index_d2 = index_d2 - 1
                    for i = 6, 1, -1 do
                        whatsapp[i + 1][1] = whatsapp[i][1]
                        whatsapp[i + 1][2] = whatsapp[i][2]
                    end
                    whatsapp[1][1] = t_whatsapp[index_d2 - 6][1]
                    whatsapp[1][2] = t_whatsapp[index_d2 - 6][2]
                end
            elseif button == "mouse_wheel_down" then
                if #t_whatsapp > 7 then
                    if index_d2 < #t_whatsapp then
                        index_d2 = index_d2 + 1
                        for i = 2, 7 do
                            whatsapp[i - 1][1] = whatsapp[i][1]
                            whatsapp[i - 1][2] = whatsapp[i][2]
                        end
                        whatsapp[7][1] = t_whatsapp[index_d2][1]
                        whatsapp[7][2] = t_whatsapp[index_d2][2]
                    end
                end
            end
        end
    end
end
bindKey("mouse_wheel_up", "down", scrollWhatsApp)
bindKey("mouse_wheel_down", "down", scrollWhatsApp)

addEvent("N3xT.onNotifyWhatsApp", true)
addEventHandler("N3xT.onNotifyWhatsApp", root,
    function(toque)
        playSound("files/sfx/"..toque..".mp3")
    end
)

function getConversaWhatsApp(tel)
    if t_whatsapp and #t_whatsapp >= 1 then
        for i, v in ipairs(t_whatsapp) do
            if tel == v[1] then
                return i
            end
        end
    end
    return false
end

function getMessageViewWhatsApp(table_w)
    local count_view = 0
    for _, v in ipairs(table_w) do
        if v[1] ~= dados.telefone and v[4] == "noview" then
            count_view = count_view + 1
        end
    end
    return count_view
end

addEvent("N3xT.onUpdateStatusWhatsApp2", true)
addEventHandler("N3xT.onUpdateStatusWhatsApp2", root,
    function(v_status)
        t_status = v_status
        status = {}
        for i, v in ipairs(t_status) do
            table.insert(status, {v[1], v[2], v[3]})
            if i == 4 then
                break
            end
        end
    end
)

function scrollStatus(button)
    if painel == true and page == "whatsapp_s" then
        if t_status then
            if button == "mouse_wheel_up" then
                if index_d3 > 4 then
                    index_d3 = index_d3 - 1
                    for i = 3, 1, -1 do
                        status[i + 1][1] = status[i][1]
                        status[i + 1][2] = status[i][2]
                    end
                    status[1][1] = t_status[index_d3 - 3][1]
                    status[1][2] = t_status[index_d3 - 3][2]
                end
            elseif button == "mouse_wheel_down" then
                if #t_status > 4 then
                    if index_d3 < #t_status then
                        index_d3 = index_d3 + 1
                        for i = 2, 4 do
                            status[i - 1][1] = status[i][1]
                            status[i - 1][2] = status[i][2]
                        end
                        status[4][1] = t_status[index_d3][1]
                        status[4][2] = t_status[index_d3][2]
                    end
                end
            end
        end
    end
end
bindKey("mouse_wheel_up", "down", scrollStatus)
bindKey("mouse_wheel_down", "down", scrollStatus)

addEventHandler("onClientKey", root,
    function(button)
        if painel == true and page == "camera" then
            if button == "backspace" then
                triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 2)
                triggerServerEvent("N3xT.setAnimationPhone", localPlayer, 1)
                setPedAnimation( localPlayer, false)
                removeEventHandler ( "onClientPreRender", getRootElement(), render )
                removeEventHandler ( "onClientCursorMove", getRootElement(), mousecalc )
                setCameraTarget ( localPlayer )
                showPlayerHudComponent ( "radar", true )
                page = "menu"
            end
        end
    end
)

addEventHandler("onClientResourceStart", resourceRoot, function()
    local txd = engineLoadTXD("files/modell/phone.txd")
    engineImportTXD(txd, 330)
    local dff = engineLoadDFF("files/modell/phone.dff")
    engineReplaceModel(dff, 330)
end)

setElementData(localPlayer,"calculatorText","0")
setElementData(localPlayer,"calculator",false)

function insert (k,ks)
if getKeyState("lshift") == true or getKeyState("rshift") == true then return end
    if getElementData(localPlayer,"calculator") == true then
	   local dataText = getElementData(localPlayer,"calculatorText")
	    if string.find(k,"num_") then
	       local oldText = string.gsub(k,"num_","")
	       local newText = dataText..string.gsub(k,"num_","")	   
	        if getElementData(localPlayer,"calculatorText") == "0" or getElementData(localPlayer,"calculatorText") == "Error" then
	           setElementData(localPlayer,"calculatorText",oldText)
		    else
		       setElementData(localPlayer,"calculatorText",newText)
		    end
		else
		    local oldText = k
	        local newText = dataText..k	 
		    if getElementData(localPlayer,"calculatorText") == "0" or getElementData(localPlayer,"calculatorText") == "Error" then
	           setElementData(localPlayer,"calculatorText",oldText)
		    else
		       setElementData(localPlayer,"calculatorText",newText)
		    end
		end
	end
end

function bind ()
    for i=0,9 do
	    local toString = tostring(i)
		local num = "num_"..toString
		bindKey(num,"down",insert)
		bindKey(toString,"down",insert)
    end
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),bind)

local others = {".","*","/","-","+"}
local all = {"0","1","2","3","4","5","6","7","8","9",".","*","/","-","+"}

function insertOthers (c)
    if getElementData(localPlayer,"calculator") == true then
        for i,v in ipairs(others) do
    	    if c == v then
			    if getElementData(localPlayer,"calculatorText") == "0" or getElementData(localPlayer,"calculatorText") == "Error" then
				   setElementData(localPlayer,"calculatorText",c)
				else
			       local dataText = getElementData(localPlayer,"calculatorText")
			       local newText = dataText..v
			       setElementData(localPlayer,"calculatorText",newText)
				end
			end
		end
	end
end
addEventHandler("onClientCharacter",root,insertOthers)

function getResult ()
    if getElementData(localPlayer,"calculator") == true then
        local dataText = getElementData(localPlayer,"calculatorText")
        local result = loadstring ( "return "..dataText )
        if result then
            local theNumber = result()
            if theNumber then
               setElementData(localPlayer,"calculatorText",theNumber)
            end
		else
            setElementData(localPlayer,"calculatorText","Error")
        end
    end
end
bindKey("num_enter","down",getResult)
bindKey("enter","down",getResult)

function deleteLastCharacter ()
    if getElementData(localPlayer,"calculator") == true then
	   local dataText = getElementData(localPlayer,"calculatorText")
	    if string.len(dataText) > 1 then
	       local leng = string.len(dataText)
	        for i,v in pairs(all) do
		        if string.find(dataText,v,leng,leng) then
			       local newText = string.reverse(dataText)
				   local newText2 = string.gsub(newText,v,"",1)
				   local newText3 = string.reverse(newText2)
				   setElementData(localPlayer,"calculatorText",newText3)
				end
			end
		end
		if string.len(dataText) == 1 and dataText ~= "0" or dataText == "Error" then
		   setElementData(localPlayer,"calculatorText","0")
		end
	end
end
bindKey("backspace","down",deleteLastCharacter)

function deleteText ()
    if getElementData(localPlayer,"calculator") == true then
       setElementData(localPlayer,"calculatorText","0")
	end
end
bindKey("delete","down",deleteText)

local rootElement = getRootElement ( )
local mplayer = getLocalPlayer ( )
local sw, sh = guiGetScreenSize ( )

local speed, strafespeed = 0, 0
local rotX, rotY = 0,0
local mouseFrameDelay = 0

local options = 
{
    invertMouseLook = false,
    mouseSensitivity = 0.15
}

function math.clamp ( value, lower, upper )
 value, lower, upper = tonumber ( value ), tonumber ( lower ), tonumber ( upper )
 if value and lower and upper then
  if value < lower then 
   value = lower
  elseif value > upper then 
   value = upper 
  end
  return value
 end
 return false
end

function getElementOffset ( entity, offX, offY, offZ )
 local posX, posY, posZ = 0, 0, 0
 if isElement ( entity ) and type ( offX ) == "number" and type ( offY ) == "number" and type ( offZ ) == "number" then
  local center = getElementMatrix ( entity )
  if center then
   posX = offX * center [ 1 ] [ 1 ] + offY * center [ 2 ] [ 1 ] + offZ * center [ 3 ] [ 1 ] + center [ 4 ] [ 1 ]
   posY = offX * center [ 1 ] [ 2 ] + offY * center [ 2 ] [ 2 ] + offZ * center [ 3 ] [ 2 ] + center [ 4 ] [ 2 ]
   posZ = offX * center [ 1 ] [ 3 ] + offY * center [ 2 ] [ 3 ] + offZ * center [ 3 ] [ 3 ] + center [ 4 ] [ 3 ]
  end
 end
 return posX, posY, posZ
end

function render ( )
 local PI = math.pi
 if getKeyState ( "num_4" ) then
  rotX = rotX - options.mouseSensitivity * 0.05745
 elseif getKeyState ( "num_6" ) then
  rotX = rotX + options.mouseSensitivity * 0.05745
 end
 if getKeyState ( "num_8" ) then
  rotY = rotY + options.mouseSensitivity * 0.05745  
  rotY = math.clamp ( rotY, -PI / 2.05, PI / 2.05 )
 elseif getKeyState ( "num_2" ) then
  rotY = rotY - options.mouseSensitivity * 0.05745
  rotY = math.clamp ( rotY, -PI / 2.05, PI / 2.05 )
 end
 local cameraAngleX = rotX 
 local cameraAngleY = rotY

 local freeModeAngleZ = math.sin(cameraAngleY)
 local freeModeAngleY = math.cos(cameraAngleY) * math.cos(cameraAngleX)
 local freeModeAngleX = math.cos(cameraAngleY) * math.sin(cameraAngleX)

 local camPosX, camPosY, camPosZ = getPedBonePosition ( mplayer, 25 )
 camPosZ = camPosZ + 0.29

 if rotY < 0 and isPedInVehicle ( mplayer ) ~= true then
  local r = getPedRotation ( mplayer )
  camPosX = camPosX - math.sin ( math.rad(r) ) * (-rotY/4.5)
  camPosY = camPosY + math.cos ( math.rad(r) ) * (-rotY/4.5)
 end
 local camTargetX = camPosX + freeModeAngleX * 100
 local camTargetY = camPosY + freeModeAngleY * 100
 local camTargetZ = camPosZ + freeModeAngleZ * 100
  
 local camAngleX = camPosX - camTargetX
 local camAngleY = camPosY - camTargetY
 local camAngleZ = 0
 
 local angleLength = math.sqrt(camAngleX*camAngleX+camAngleY*camAngleY+camAngleZ*camAngleZ)

  local camNormalizedAngleX = camAngleX / angleLength
  local camNormalizedAngleY = camAngleY / angleLength
  local camNormalizedAngleZ = 0
 
  local normalAngleX = 0
  local normalAngleY = 0
  local normalAngleZ = 1

  local normalX = (camNormalizedAngleY * normalAngleZ - camNormalizedAngleZ * normalAngleY)
  local normalY = (camNormalizedAngleZ * normalAngleX - camNormalizedAngleX * normalAngleZ)
  local normalZ = (camNormalizedAngleX * normalAngleY - camNormalizedAngleY * normalAngleX)
  

  camPosX = camPosX + freeModeAngleX * speed
  camPosY = camPosY + freeModeAngleY * speed
  camPosZ = camPosZ + freeModeAngleZ * speed

  camPosX = camPosX + normalX * strafespeed
  camPosY = camPosY + normalY * strafespeed
  camPosZ = camPosZ + normalZ * strafespeed
  
  camTargetX = camPosX + freeModeAngleX * 100
  camTargetY = camPosY + freeModeAngleY * 100
  camTargetZ = camPosZ + freeModeAngleZ * 100
 
  if isPedInVehicle ( mplayer ) and getKeyState ( "mouse1" ) ~= true then
   if getControlState ( "vehicle_look_behind" ) then
    camTargetX, camTargetY, camTargetZ = getElementOffset ( mplayer, 0, -3, 0 )
   else
    camTargetX, camTargetY, camTargetZ = getElementOffset ( mplayer, 0, 3, 0 )
   end
  end
 
 setPedAimTarget ( mplayer, camTargetX, camTargetY, camTargetZ )
 setCameraMatrix ( camPosX, camPosY, camPosZ, camTargetX, camTargetY, camTargetZ )
end

function mousecalc ( _, _, aX, aY )
 if isCursorShowing ( ) or isMTAWindowActive ( ) then
  mouseFrameDelay = 5
  return
 elseif mouseFrameDelay > 0 then
  mouseFrameDelay = mouseFrameDelay - 1
  return
 end
 
 aX = aX - sw / 2 
 aY = aY - sh / 2
 
 if options.invertMouseLook then
  aY = -aY
 end
 
 rotX = rotX + aX * options.mouseSensitivity * 0.01745
 rotY = rotY - aY * options.mouseSensitivity * 0.01745
    
 local PI = math.pi
 if rotX > PI then
  rotX = rotX - 2 * PI
 elseif rotX < -PI then
  rotX = rotX + 2 * PI
 end
    
 if rotY > PI then
  rotY = rotY - 2 * PI
 elseif rotY < -PI then
  rotY = rotY + 2 * PI
 end

 rotY = math.clamp ( rotY, -PI / 2.05, PI / 2.05 )
end

local UniStat = { 
    items = { }
}

local sw, sh = guiGetScreenSize ( )

local colors = { 
    white = tocolor ( 255, 255, 255, 255 ) 
}

local lexemes = {
    [ "health" ] = {
        getString = function ( arg, player )
            local health = math.floor ( getElementHealth ( player ) + 0.5 )
            
            return health
        end
    },
    [ "armor" ] = { 
        getString = function ( arg, player )
            return math.floor ( getPedArmor ( player ) + 0.5 )
        end
    },
    [ "video" ] = {
        getString = function ( arg, player )
            if arg == "name" then
                return getElementData ( player, "vcName" )
            elseif arg == "ram" then
                return getElementData ( player, "vcRAM" )
            elseif arg == "ps" then
                return getElementData ( player, "vcPSVer" )
            end
        end,
        onInit = function ( player )
            local dxStat = dxGetStatus ( )
            
            setElementData ( player, "vcName", dxStat.VideoCardName )
            setElementData ( player, "vcRAM", dxStat.VideoCardRAM .. "MB" )
            setElementData ( player, "vcPSVer", dxStat.VideoCardPSVersion )
        end
    },
    [ "time" ] = {
        getString = function ( arg, player )
            local timestamp = getElementData ( player, "times" )
            local time = getRealTime ( timestamp )

            return time.hour .. ":" .. time.minute .. ":" .. time.second
        end,
        onInit = function ( )
            setTimer ( 
                function ( )
                    local timestamp = getRealTime ( ).timestamp
                    setElementData ( localPlayer, "times", timestamp )
                end
            , 1000, 0 )
        end
    },
    [ "tl" ] = {
        getString = function ( arg, player )
            local timeLeft = getElementData ( player, "tl" )
            
            if arg == "min" then
                return math.floor ( timeLeft / 60000 )
            elseif arg == "sec" then
                return math.floor ( timeLeft / 1000 )
            elseif arg == "msec" then
                return math.floor ( timeLeft )
            end
        end,
        onInit = function ( )
            UniStat.enterTime = getTickCount ( )
            
            setTimer ( 
                function ( )
                    local currentTime = getTickCount ( )
                    setElementData ( localPlayer, "tl", currentTime - UniStat.enterTime )
                end
            , 1000, 0 )
        end
    },
    [ "rot" ] = {
        getString = function ( arg, player )
            return math.floor ( getPedRotation ( player ) + 0.5 )
        end
    },
    [ "afk" ] = {
        getString = function ( arg, player )
            local isAFK = getElementData ( player, "afk" ) or 0
            local statusName = isAFK > 0 and "AFK" or "В ИГРЕ"
            
            return statusName
        end
    },
}

addEventHandler ( "onClientRender", root,
    function ( )
        local lpx, lpy, lpz = getCameraMatrix ( )
        
        for player, statStr in pairs ( UniStat.items ) do
            if isElement ( player ) then
                local px, py, pz = getPedBonePosition ( player, 25 )
                if isPedInVehicle ( player ) then 
                    pz = pz + 0.5 
                end
                
                local distance = getDistanceBetweenPoints3D ( lpx, lpy, lpz, px, py, pz )
                if distance <= 100 then
                    if isLineOfSightClear ( lpx, lpy, lpz, px, py, pz, true, false, false, true ) then
                        local scale = 5.9 / distance
                        if scale > 1.9 then 
                            scale = 1.9 
                        end
                        
                        px, py = getScreenFromWorldPosition ( px, py, pz + 0.3 )
                        if px then
                            dxDrawText ( statStr, px - dxGetTextWidth ( statStr, scale, "default-bold" ) / 2, py, sw, sh, colors.white, scale, "default-bold" )
                        end
                    end
                end
            end
        end
    end 
)

local function getStringFromLexeme ( lexemeName, lexemeArg, player )
    if lexemes [ lexemeName ] == nil then
        return
    end
    
    return lexemes [ lexemeName ].getString ( lexemeArg, player )
end

local function getPlayerStatString ( player )
    local statStr = getElementData ( player, "stat" )
    if not statStr then
        return
    end
    
    local words = split ( statStr, 32 )
    statStr = ""
    
    for _, word in ipairs ( words ) do
        local lexemeName = gettok ( word, 1, 64 )
        
        if word == "$" then
            word = "\n"
        elseif lexemeName then
            local lexemeArg = gettok ( word, 2, 64 )
            
            local lexemeResult = getStringFromLexeme ( lexemeName, lexemeArg, player )
            if lexemeResult then
                word = lexemeResult
            end
            
            word = word .. " "
        end
        
        statStr = statStr .. word
    end
    
    return statStr
end

function UniStat.updatePlayerStat ( player )
    local stat = getElementData ( player, "stat" )
    
    UniStat.items [ player ] = type ( stat ) == "string" and getPlayerStatString ( player ) or nil
end

function UniStat.updatePulse ( )
    local players = getElementsByType ( "player", root, true )
    for _, player in ipairs ( players ) do
        UniStat.updatePlayerStat ( player )
    end
end

function UniStat.setPlayerStat ( player, stat )
    setElementData ( player, "stat", stat )
end

addEventHandler ( "onClientResourceStart", resourceRoot,
    function ( )
        for _, lexeme in pairs ( lexemes ) do
            if lexeme.onInit then
                pcall ( lexeme.onInit, localPlayer )
            end
        end
        
        setTimer ( UniStat.updatePulse, 100, 0 )
    end
    )