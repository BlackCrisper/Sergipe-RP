IP = "135.148.6.107" -- Coloque o IP que aparece no /debugscript 3

-- Anuncio de Pollo MTA = Depois de ter colocado o ip e a porta do seu servidor escreva o comando /debugscript 3
-- Depois de refresh no F8, abrá o painel P da um refresh list depois da um restart nos mods do N3xT.
-- Ops: coloque no admin = resource.* para dar permissões pros scripts.

config = {
    conce = { -- Concessionária.
        lojas = { -- Lojas - Pos X, Pos Y, Pos Z.
            {1763.986, -1776.788, 18.817},
        },

        aclestoque = "Console", -- ACL que Pode Setar Estoque de Veículos.
        setestoque = "setestoque", -- ( /setestoque Valor Categoria NomeVeículo ) Comando Setar Estoque Veículo na Concessionária.
        --[[ Categorias: Quatro, Duas, Aereos, Aquaticos ]]

        verdoc = "verdoc", -- Comando para ver Documento dentro do Veículo.

        acldoc = "PC", -- ACL que pode puxar Documento do Veículo pela Placa.
        verdoc2 = "puxardoc", -- Comando que pode puxar Documento do Veículo pela Placa.

        lojas_blip = 55, -- ID Blip das Lojas.

--                             ==================================================
--                             ============ EDITE OS CARROS AQUI ================
--                             ==================================================
        shop = {
            [5] = { -- Quatro Rodas | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
                {nome="Audi", valor=100000, id=466, estoque=129, foto="veiculos/Audi.png"},
                {nome="Audi Q7", valor=250000, id=445, estoque=135, foto="veiculos/AudiQ7.png"},
                {nome="BMW-M4", valor=212000, id=541, estoque=43, foto="veiculos/BMWM4.png"},
                {nome="Celta", valor=37200, id=576, estoque=128, foto="veiculos/Celta.png"},
                {nome="Ferrari", valor=2320000, id=411, estoque=23, foto="veiculos/Ferrari.png"},
                {nome="Panto", valor=5000, id=474, estoque=128, foto="veiculos/Panto.png"},
                {nome="Golf", valor=27500, id=567, estoque=87, foto="veiculos/Golf.png"},
                {nome="Gol Quadrado", valor=54000, id=496, estoque=1000, foto="veiculos/GolQuadrado.png"},
                {nome="GTR", valor=2000000, id=415, estoque=56, foto="veiculos/GTR.png"},
                {nome="HB20", valor=62000, id=426, estoque=176, foto="veiculos/HB20.png"},
                {nome="Lamborguini", valor=2200000, id=429, estoque=29, foto="veiculos/Lamborguini.png"},
                {nome="Maserati", valor=47200, id=560, estoque=185, foto="veiculos/Maserati.png"},
                {nome="Mercedes", valor=94500, id=603, estoque=58, foto="veiculos/Mercedes.png"},
                {nome="Skyline-R34", valor=3000000, id=562, estoque=32, foto="veiculos/SkylineR34.png"},
                {nome="Opala", valor=98400, id=475, estoque=153, foto="veiculos/Opala.png"},
                {nome="Peugeot", valor=58200, id=605, estoque=123, foto="veiculos/Peugeot.png"},
                {nome="S-10", valor=68700, id=467, estoque=132, foto="veiculos/S10.png"},
                {nome="Saveiro", valor=98500, id=422, estoque=43, foto="veiculos/Saveiro.png"},
                {nome="Siena", valor=52400, id=580, estoque=38, foto="veiculos/Siena.png"},
                {nome="Toyota", valor=79500, id=566, estoque=138, foto="veiculos/Toyota.png"},
            },

            [4] = { -- Duas Rodas | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
                {nome="Pop100", valor=43500, id=462, estoque=87, foto="veiculos/Pop100.png"},
                {nome="CBR 600", valor=139500, id=522, estoque=28, foto="veiculos/CBR600.png"},
                {nome="CG", valor=55000, id=468, estoque=45, foto="veiculos/CG.png"},
                {nome="Hornet", valor=110500, id=581, estoque=40, foto="veiculos/Hornet.png"},
                {nome="Suzuki", valor=156200, id=521, estoque=53, foto="veiculos/Suzuki.png"},
                {nome="Tiger", valor=112000, id=586, estoque=50, foto="veiculos/Tiger.png"},
            },

            [3] = { -- Aéreos | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
                {nome="Volatus", valor=50000000, id=487, estoque=6, foto="veiculos/Volatus.png"},
            },

            [2] = { -- Aquáticos | nome, valor, id, estoque inicial (pela primeira vez), foto (carregar também no meta.xml).
                {nome="Bote de Passeio", valor=50000, id=473, estoque=100, foto="veiculos/BoteDePasseio.png"},
                {nome="Jetmax", valor=15000000, id=493, estoque=10, foto="veiculos/Jetmax.png"},
                {nome="Tropic", valor=10000000, id=454, estoque=10, foto="veiculos/Tropic.png"},
            }
        }
    },

    garagem = { -- Garagem.
        pos = { -- Garagens - Pos X, Pos Y, Pos Z.
            {1779.062, -1766.842, 13.598},
            {1552.875, -1611.363, 13.383},
            {1835.822, -1721.825, 13.6},
            {1601.936, 92.686, 37.69},
        },

        aclveh = "Console", -- ACL que Pode Setar/Retirar Veículos.
        giveveh = "giveveh", -- ( /giveveh IDPlayer Categoria NomeVeículo ) Comando Setar Veículo na Garagem do Player.
        takeveh = "takeveh", -- ( /takeveh IDPlayer Categoria NomeVeículo ) Comando Retirar Veículo da Garagem do Player.
        --[[ Categorias: Quatro, Duas, Aereos, Aquaticos ]]

        trancar = "ç", -- Tecla para trancar o Veículo.

        garagem_blip = 32 -- ID Blip das Garagens.
    },

    desmanche = { -- Desmanche.
        zones = { -- Desmanches - Pos X, Pos Y, Pos Z.
            {1621.268, 132.644, 36.374},
        },

        model = { -- ID Veículos que podem ser Desmanchados.
            602,429,402,541,415,480,562,587,565,411,559,603,
            560,506,558,555,477,536,575,518,419,534,567,
            535,576,412,496,401,527,542,533,526,474,545,517,
            410,475,439,549,491,445,438,507,585,492,
            546,551,516,426,547,405,580,409,550,566,420,
            540,421,529,589,579,400,500,470,404,489,479,442,
            495,458,561,434,494,502,503,490,598,599,
            422,504,508,552,554,582,418,478,
        },

        acl = "Gangs", -- ACL que pode Desmanchar Veículos.

        valor = {50000, 800000} -- Valor entre 1000 e 20000 ganho no Desmanche do Veículo.
    },

    detran = { -- Detran.
        pos = { -- Detrans - Pos X, Pos Y, pos Z.
            {1612.433, 101.918, 37.43},
        },

        sigla = "BSR", -- Sigla do seu Servidor antes da Placa. 

        valorseguro = 10000, -- Preço Seguro.
        valorplaca = 5000, -- Preço Placa.

        blip = 43, -- ID Blip dos Detrans.

        apreender = { -- Apreender Veículos.
            {1617.676, 120.932, 36.868},
        },

        aclapreender = "DETRAN", -- ACL que pode Apreender Veículos.

        apreender2 = { -- Liberar Veículos Apreendidos.
            {1619.273, 106.914, 37.24},
        },

        valorapreender = 15000 -- Valor para Retirar o Veículo Apreendido.
    }
}