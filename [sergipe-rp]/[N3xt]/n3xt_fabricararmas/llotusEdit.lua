IP = "10.122.87.5:22003" -- Coloque o IP que aparece no /debugscript 3

-- Anuncio de Pollo MTA = Depois de ter colocado o ip e a porta do seu servidor escreva o comando /debugscript 3
-- Depois de refresh no F8, abrá o painel P da um refresh list depois da um restart nos mods do N3xT.
-- Ops: coloque no admin = resource.* para dar permissões pros scripts.

--[[
.....................................................................
.....................................................................
 __         __         ______     ______   __  __     ______    .....
/\ \       /\ \       /\  __ \   /\__  _\ /\ \/\ \   /\  ___\   .....
\ \ \____  \ \ \____  \ \ \/\ \  \/_/\ \/ \ \ \_\ \  \ \___  \  .....
 \ \_____\  \ \_____\  \ \_____\    \ \_\  \ \_____\  \/\_____\ .....
  \/_____/   \/_____/   \/_____/     \/_/   \/_____/   \/_____/ .....
.....................................................................                                                                
........Copyright 2020 by LLOTUS - ! ✝ L L O T U S 🐊#0001.........
.....................................................................
.....................................................................]]--


config = {

	Cx=2777.792, -- POSIÇÃO "X" DO MARKER DE COMPRAR CORPO DE ARMAS
	Cy=-2410.467, -- POSIÇÃO "Y" DO MARKER DE COMPRAR CORPO DE ARMAS
	Cz=13.635144233704-1, -- POSIÇÃO "Z" DO MARKER DE COMPRAR CORPO DE ARMAS
	Cr=0, -- COR "R" DO MARKER DE COMPRAR CORPO DE ARMAS
	Cg=255, -- COR "G" DO MARKER DE COMPRAR CORPO DE ARMAS
	Cb=255, -- COR "B" DO MARKER DE COMPRAR CORPO DE ARMAS
	Co=60, -- OPACIDADE DO MARKER DE COMPRAR CORPO DE ARMAS
	Cs=1.2, -- TAMANHO DO MARKER DE COMPRAR CORPO DE ARMAS

	Px=2785.966, -- POSIÇÃO "X" DO MARKER DE COMPRAR PEÇAS
	Py=-2410.467, -- POSIÇÃO "Y" DO MARKER DE COMPRAR PEÇAS
	Pz=13.635144233704-1, -- POSIÇÃO "Z" DO MARKER DE COMPRAR PEÇAS
	Pr=0, -- COR "R" DO MARKER DE COMPRAR PEÇAS
	Pg=255, -- COR "G" DO MARKER DE COMPRAR PEÇAS
	Pb=255, -- COR "B" DO MARKER DE COMPRAR PEÇAS
	Po=60, -- OPACIDADE DO MARKER DE COMPRAR PEÇAS
	Ps=1.2, -- TAMANHO DO MARKER DE COMPRAR PEÇAS

	Mx=2796.091, -- POSIÇÃO "X" DO MARKER DE FABRICAR MUNIÇÃO
	My=-2426.863, -- POSIÇÃO "Y" DO MARKER DE FABRICAR MUNIÇÃO
	Mz=13.632-1, -- POSIÇÃO "Z" DO MARKER DE FABRICAR MUNIÇÃO
	Mr=0, -- COR "R" DO MARKER DE FABRICAR MUNIÇÃO
	Mg=255, -- COR "G" DO MARKER DE FABRICAR MUNIÇÃO
	Mb=255, -- COR "B" DO MARKER DE FABRICAR MUNIÇÃO
	Mo=60, -- OPACIDADE DO MARKER DE FABRICAR MUNIÇÃO
	Ms=1.2, -- TAMANHO DO MARKER DE FABRICAR MUNIÇÃO

	Ax=2778.703, -- POSIÇÃO "X" DO MARKER DE FABRICAR ARMAS   2784.701, -2426.839, 13.634
	Ay=-2427.079, -- POSIÇÃO "Y" DO MARKER DE FABRICAR ARMAS
	Az=13.636-1, -- POSIÇÃO "Z" DO MARKER DE FABRICAR ARMAS
	Ar=0, -- COR "R" DO MARKER DE FABRICAR ARMAS
	Ag=255, -- COR "G" DO MARKER DE FABRICAR ARMAS
	Ab=255, -- COR "B" DO MARKER DE FABRICAR ARMAS
	Ao=60, -- OPACIDADE DO MARKER DE FABRICAR ARMAS
	As=1.2, -- TAMANHO DO MARKER DE FABRICAR ARMAS


	valorPecaCapsulas=50, -- VALOR DAS CAPSULAS NO MERCADO NEGRO
	valorPecaPolvora=185, -- VALOR DAS POLVORAS NO MERCADO NEGRO
	valorPecaMolas=58, -- VALOR DAS MOLAS NO MERCADO NEGRO
	valorPecaMetal=95, -- VALOR DAS PLACAS DE METAL NO MERCADO NEGRO
	valorPecaGatilho=105, -- VALOR DOS GATILHOS NO MERCADO NEGRO

	quantidadeCapsulas=20, -- QUANTIDADE DE CAPSULAS QUE VEM AO COMPRAR
	quantidadePolvora=40, -- QUANTIDADE DE POLVORA QUE VEM AO COMPRAR
	quantidadeMolas=1, -- QUANTIDADE DE MOLAS QUE VEM AO COMPRAR
	quantidadeMetal=1, -- QUANTIDADE DE PLACAS DE METAL QUE VEM AO COMPRAR
	quantidadeGatilho=1, -- QUANTIDADE DE GATILHOS QUE VEM AO COMPRAR

	valorCorpoM4=780, -- VALOR DO CORPO DA M4 NO MERCADO NEGRO
	valorCorpoAK47=1210, -- VALOR DO CORPO DA AK47 NO MERCADO NEGRO
	valorCorpoMP5=153, -- VALOR DO CORPO DA MP5 NO MERCADO NEGRO
	valorCorpoGlock=98, -- VALOR DO CORPO DA GLOCK NO MERCADO NEGRO
	valorCorpoMagnun=90, -- VALOR DO CORPO DA MAGNUN NO MERCADO NEGRO

	tempoFabricarMuniAk=120000, -- TEMPO PARA FABRICAR A MUNIÇÃO DE AK EM MILISEGUNDOS
	tempoFabricarMuniM4=60000, -- TEMPO PARA FABRICAR A MUNIÇÃO DE M4 EM MILISEGUNDOS
	tempoFabricarMuniMp5=60000, -- TEMPO PARA FABRICAR A MUNIÇÃO DE MP5 EM MILISEGUNDOS
	tempoFabricarMuniGlock=60000, -- TEMPO PARA FABRICAR A MUNIÇÃO DE GLOCK EM MILISEGUNDOS
	tempoFabricarMuniMagnun=60000, -- TEMPO PARA FABRICAR A MUNIÇÃO DE MAGNUN EM MILISEGUNDOS

	tempoFabricarArmaAk=120000, -- TEMPO PARA FABRICAR A ARMA AK-47 EM MILISEGUNDOS
	tempoFabricarArmaM4=60000, -- TEMPO PARA FABRICAR A ARMA M4 EM MILISEGUNDOS
	tempoFabricarArmaMP5=60000, -- TEMPO PARA FABRICAR A ARMA MP5 EM MILISEGUNDOS
	tempoFabricarArmaGlock=60000, -- TEMPO PARA FABRICAR A ARMA GLOCK EM MILISEGUNDOS
	tempoFabricarArmaMagnun=60000, -- TEMPO PARA FABRICAR A ARMA MAGNUN EM MILISEGUNDOS
}