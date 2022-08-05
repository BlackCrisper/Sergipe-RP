config = {
	precocelular = 500, -- Preço comprar celular.
	precochip = 100, -- Preço comprar chip.

	bind = "F1", -- Tecla que abre o celular.
	
	lojas = { -- Lojas de celular.
		{1689.278, -1251.064, 15.029},
	},
	blip_lojas = 47, -- ID blip das lojas.

	keySound = "90d140308348273b897fab79f44a7c89",
	--[[
		Caso o Spotify pare de funcionar use outra key.
		
		"DwqGOXHZ3lGjIjuEdEZTIyENVhV4q2hm",
		"6cNXLxGM04XhrBxiIpYlrW7b0bf0vdxl",
		"86913ee69789fcba86f317a6471e20b3",
		"73e3c687ca5a2f6c5fa3143b76c4c665",
		"90d140308348273b897fab79f44a7c89",
		"331298d3dba3e267911a9e2b14f734f6",
		"a8dc0bd0cb12743bc319ff304e098c20",
		"50383c11fb5ad9dd88440a5a1555fa63",
		"a3e059563d7fd3372b49b37f00a00bcf",
	]]

	acl_emergencia = { -- ACL de cada emergência.
		["SAMU"] = "SAMU",
		["Polícia"] = "pm",
		["Mecânico"] = "Mecanico",
		["Staff"] = "Staff"
	}
}