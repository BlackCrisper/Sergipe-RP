-----------------
----- ITENS -----
-----------------

-- Atenção! --
-- Não retirar nenhum item do ID 56 para cima. (caso precise contate o desenvolvedor.)
-- Não alterar quantidade máxima das Armas/Máscaras.
-- Não alterar nome das Armas.
-- Não colocar peso e não mudar nome da Mochila. (A Mochila não é considerável um item.)
-- Não colocar peso e não trocar nome do item Dinheiro Sujo.
-- Você pode editar a ação da maioria dos itens no arquivo use.lua
--------------

-- Como adicionar itens? -- (Necessário ter conhecimento básico como programador LUA.)
--[[
	1 - Primeiro você deve ir ao arquivo config.lua, la você deve ir na tabela dos itens;


	2 - Abaixo do ultimo item (Dinheiro Sujo) você abre uma nova linha e cole o seguinte.

		[Coloque aqui o ID do item na sequencia] = {nome="NovoItem", peso=0.4, tipo="outros", maxitem=10, image="files/gfx/others/novoitem.png"},

		Observação: Todo item é necessário ter: Nome, Peso, Tipo, Quantidade Máxima e Imagem. (É recomendável deixar novos itens com o tipo 'outros',
		e não esqueça de carregar a imagem do novo item no meta.xml)


	3 - Agora você deve ir configurar a ação do mesmo quando usar no arquivo use.lua;
	

	4 - Na linha 191 coloque o nome do item e programe o que vai acontecer quando o jogador usar.
]]


------------------------------
----- FUNÇÕES EXPORTADAS -----
------------------------------

----- getSpaceMochila (player, nome_item, quantia)                  -- server-side
----- isItemEquipped  (player, nome_item)                           -- server-side
----- getItem         (player, nome_item)                           -- server-side
----- giveItem        (player, nome_item, quantia)                  -- server-side
----- giveItemS       (player, receiver_player, nome_item, quantia) -- server-side
----- takeItem        (player, nome_item, quantia)                  -- server-side
----- takeItemS       (player, receiver_player, nome_item, quantia) -- server-side

--------------------------

---------------------------
----- getSpaceMochila -----
---------------------------
--[[
	Retorna um valor Boleano, 'true' se a mochila possuí espaço no inventário,
	caso contrário 'false'.
]]

-- Como usar? --
local next = exports.n3xt_inventario

if (next:getSpaceMochila(source, "Chocolate", 1) == true) then
	-- Seu código aqui.
end
---------------

--------------------------
----- isItemEquipped -----
--------------------------
--[[
	Retorna um valor Boleano, 'true' se o item está equipado, caso contrário 'false'.
	(Usado para verificar itens que são equipáveis como Armas e Máscaras.)
]]

-- Como usar? --
local next = exports.n3xt_inventario

if next:isItemEquipped(source, "AK47") then
	-- Seu código aqui.
end
-------------------------

-------------------
----- getItem -----
-------------------
--[[
	Retorna um valor Numérico, se o jogador possuí o item retorna a quantidade
	que ele possuí, caso contrário retorna 0.
]]

-- Como usar? --
local next = exports.n3xt_inventario
local item = next:getItem(source, "Chocolate")

if (item) and (item >= 1) then
	-- Seu código aqui.
end
----------------

--------------------
----- giveItem -----
--------------------
--[[
	Usado para dar item apenas para o jogador source.
]]

-- Como usar? --
local next = exports.n3xt_inventario

next:giveItem(source, "Chocolate", 1)
----------------

--------------------
----- takeItem -----
--------------------
--[[
	Usado para retirar item apenas para o jogador source.
]]

-- Como usar? --
local next = exports.n3xt_inventario

next:takeItem(source, "Chocolate", 1)
---------------

---------------------
----- giveItemS -----
---------------------
--[[
	Usado para dar item para o jogador receiver e retornar info ao source.
]]

-- Como usar? --
local next = exports.n3xt_inventario

next:giveItemS(source, receiver, "Chocolate", 1)
---------------

---------------------
----- takeItemS -----
---------------------
--[[
	Usado para retirar item do jogador receiver e retornar info ao source.
]]

-- Como usar? --
local next = exports.n3xt_inventario

next:takeItemS(source, receiver, "Chocolate", 1)
---------------