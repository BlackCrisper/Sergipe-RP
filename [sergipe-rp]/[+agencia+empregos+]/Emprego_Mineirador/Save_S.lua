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
function Loadind_Itens ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			local Min_Cobre = tonumber(getAccountData ( conta, "min.Cobre" ))
			local Min_Prata = tonumber(getAccountData ( conta, "min.Prata" ))
			local Min_Ouro = tonumber(getAccountData ( conta, "min.Ouro" ))
			local Min_Esmeralda = tonumber(getAccountData ( conta, "min.Esmeralda" ))
			local Min_Rubi = tonumber(getAccountData ( conta, "min.Rubi" ))
			local Min_Safira = tonumber(getAccountData ( conta, "min.Safira" ))
			local Min_Diamante = tonumber(getAccountData ( conta, "min.Diamante" ))
			setElementData ( source, "min.Cobre", Min_Cobre )
			setElementData ( source, "min.Prata", Min_Prata )
			setElementData ( source, "min.Ouro", Min_Ouro )
			setElementData ( source, "min.Esmeralda", Min_Esmeralda )
			setElementData ( source, "min.Rubi", Min_Rubi )
			setElementData ( source, "min.Safira", Min_Safira )
			setElementData ( source, "min.Diamante", Min_Diamante )
			
		end
	end	
end

function Save_Itens ( conta )
	if conta then
		local source = getAccountPlayer ( conta )	
		local Min_Cobre = tonumber(getElementData(source, "min.Cobre")) or 0  
		local Min_Prata = tonumber(getElementData(source, "min.Prata")) or 0  
		local Min_Ouro = tonumber(getElementData(source, "min.Ouro")) or 0  
		local Min_Esmeralda = tonumber(getElementData(source, "min.Esmeralda")) or 0  
		local Min_Rubi = tonumber(getElementData(source, "min.Rubi")) or 0  
		local Min_Safira = tonumber(getElementData(source, "min.Safira")) or 0  
		local Min_Diamante = tonumber(getElementData(source, "min.Diamante")) or 0  
		setAccountData ( conta, "min.Cobre", Min_Cobre )
		setAccountData ( conta, "min.Prata", Min_Prata )
		setAccountData ( conta, "min.Ouro", Min_Ouro )
		setAccountData ( conta, "min.Esmeralda", Min_Esmeralda )
		setAccountData ( conta, "min.Rubi", Min_Rubi )
		setAccountData ( conta, "min.Safira", Min_Safira )
		setAccountData ( conta, "min.Diamante", Min_Diamante)
			
	end
end

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Loadind_Itens, 60, 1, acc )
  end
)

function Start_Server ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Loadind_Itens ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), Start_Server )

function Stop_Server ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Save_Itens ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), Stop_Server )

function Quit_Server ( quitType )
	local acc = getPlayerAccount(source)
	if not isGuestAccount ( acc ) then
		if acc then
			Save_Itens ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), Quit_Server )
