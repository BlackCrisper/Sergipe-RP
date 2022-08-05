--[[
 █████╗ ██╗    ██╗   ██╗███████╗███████╗ ██████╗██████╗ 
██╔══██╗██║    ██║   ██║██╔════╝██╔════╝██╔════╝██╔══██╗
███████║██║    ██║   ██║█████╗  ███████╗██║     ██████╔╝
██╔══██║██║    ╚██╗ ██╔╝██╔══╝  ╚════██║██║     ██╔══██╗
██║  ██║███████╗╚████╔╝ ███████╗███████║╚██████╗██║  ██║
╚═╝  ╚═╝╚══════╝ ╚═══╝  ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝
--]]

--/ Edit \--

config = {
	Texts = { --> Posição dos texto Dx
		['Text'] = '#FFFFFF» #fd9999Banco 24 Horas#FFFFFF«\n» #fd9999Deposite #ffffff/ #fd9999Saque #ffffff/ #fd9999Transfira#ffffff «', --> Texto Dx
		
		['pos'] = { --> x, y, z
			--> LS
			{2375.75, -1415.90, 23.7};
	        {1674.15, -1716.71, 13.14};
	        {1002.65, -1131.2, 23.52};
	        {791.76, -1613.59, 13};

            --> SF
            {-2111.62, -405.37, 35.23};
            {-2362.24, -57.58, 35};
            {-2649.93, 361.52, 4};
            {-2353.42, 1002.22, 50.59};

            --> LV
            {-1952.06, 2388.75, 49.09};
            {-213.37, 1088.73, 19.44};
            {2017.16, 1210.31, 10.42};
            {2167.07, 1906.17, 10.42};
        },
	},

	Caixas = { --> Posição dos Caixas
		['Blip'] = 52, --> ID do blip dos caixas

		['pos'] = { --> number, ID, x, y, z, rx, ry, rz
			--> LS
			['1'] = createObject(2942, 2375.73, -1415.90, 23.7, 0, 0, 90);
	        ['2'] = createObject(2942, 1674.13, -1716.71, 13.14, 0, 0, 90);
	        ['3'] = createObject(2942, 1002.65, -1131.2, 23.52, 0, 0, 0);
	        ['4'] = createObject(2942, 791.74, -1613.59, 13, 0, 0, 270);

	        --> SF 
	        ['5'] = createObject(2942, -2111.60, -405.37, 35.23, 0, 0, 240);
	        ['6'] = createObject(2942, -2362.22, -57.58, 35, 0, 0, 270);
	        ['7'] = createObject(2942, -2649.91, 361.52, 4, 0, 0, 270);
	        ['8'] = createObject(2942, -2353.40, 1002.22, 50.59, 0, 0, 270);

	        --> LV
	        ['9'] = createObject(2942, -1952.04, 2388.75, 49.09, 0, 0, 200);
	        ['10'] = createObject(2942, -213.35, 1088.73, 19.44, 0, 0, 180);
	        ['11'] = createObject(2942, 2017.14, 1210.31, 10.42, 0, 0, 90);
	        ['12'] = createObject(2942, 2167.05, 1906.17, 10.42, 0, 0, 270);
	    },
	},

	Settings = {
		['NameBank'] = 'Banco 24 horas', --> Nome do banco
		['ColorRGB'] = tocolor(253, 153, 153, 180), --> Cor do painel
		['ColorHex'] = '#fd9999', --> Cor dos textos do painel
		['ElementData'] = 'AlveSCR:Bank', --> ElementData do banco

		['command'] = 'contabancaria', --> Comando para abrir o painel da conta bancaria

		['ACL'] = 'Console', --> ACL que podera usar o 'commandAdmin'
		['commandAdmin'] = 'adminmoney', --> Comando para ver o dinheiro na mao/banco: /adminmoney <ID>

		['ValueMinDeposit'] = 200, --> Valor minimo para depositar
		
		['ValueMinSaq'] = 5, --> Valor minimo para sacar

		['ValueMaxTransf'] = 200000, --> Valor maximo para transferir
		['ValueMinTransf'] = 200, --> Valor minimo para transferir
	},
};