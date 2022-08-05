--[[
/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\/
										            Curta a Minha Página <3									        
 									     	https://www.facebook.com/danilinmtascr/		
								   
                        :::::::::      :::     ::::    ::: ::::::::::: :::        ::::::::::: ::::    ::: 
                        :+:    :+:   :+: :+:   :+:+:   :+:     :+:     :+:            :+:     :+:+:   :+: 
                        +:+    +:+  +:+   +:+  :+:+:+  +:+     +:+     +:+            +:+     :+:+:+  +:+ 
                        +#+    +:+ +#++:++#++: +#+ +:+ +#+     +#+     +#+            +#+     +#+ +:+ +#+ 
                        +#+    +#+ +#+     +#+ +#+  +#+#+#     +#+     +#+            +#+     +#+  +#+#+# 
                        #+#    #+# #+#     #+# #+#   #+#+#     #+#     #+#            #+#     #+#   #+#+# 
                        #########  ###     ### ###    #### ########### ########## ########### ###    #### 
                                        						
/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\/
--]]
--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><            Salvar Dados            ><
         ><><><><><><><><><><><><><><><><><><><><
--]]
function Loadind_Empregos ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			
			local Emprego = getAccountData ( conta, "Emprego" ) or "Desempregado"
			setElementData ( source, "Emprego", Emprego )
			
			setElementData ( source, "DNL:Categoria(Nenhuma)", true )
		end
	end	
end
		
function Save_Empregos ( conta )
	if conta then
		local source = getAccountPlayer ( conta )
		
		local Empregos = getElementData ( source, "Emprego" ) or "Desempregado"
		setAccountData ( conta, "Emprego", Empregos )
	end
end

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Loadind_Empregos, 60, 1, acc )
  end
)

function Start_Empregos ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Loadind_Empregos ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), Start_Empregos )

function Stop_Empregos ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Save_Empregos ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), Stop_Empregos )

function Quit_Server ( quitType )
	local acc = getPlayerAccount(source)
	if not isGuestAccount ( acc ) then
		if acc then
			Save_Empregos ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), Quit_Server )