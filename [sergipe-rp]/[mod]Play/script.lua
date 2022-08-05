-- Configurações para quando um jogador entrar
	-- XYZ coördinates
	local joinX = 1481.085
	local joinY = -1765.318
	local joinZ = 18.796
	-- Armas e tiros
	local joinWeapon = 0
	local joinAmmo = 0
	-- Menssagem para o jogador
	local joinMessage = ""
	-- Pele do jogador
	local joinSkin = 2

-- Configurações para quando um jogador morrer
	-- XYZ coördinates
	local spawnX = 1185.226
	local spawnY = -1326.475
	local spawnZ = 13.573
	-- Armas e tiros
	local spawnWeapon = 0
	local spawnAmmo = 0
	-- Pele do jogador
	local spawnSkin = 0

-- Definições para as quantidades de dinheiro
	-- Dinheiro por matar um jogador
	local killerMoney = 0
	-- O dinheiro retirado do jogador quando morrem
	local deadPlayerMoney = 100
	-- Dinheiro ganho quando entra no server
	local joinMoney = 5500

-- Functions
-- This function spawns players when they join
function spawnOnJoin()
	spawnPlayer(source, joinX, joinY, joinZ, 0 , joinSkin)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox(joinMessage, source)
	giveWeapon(source, joinWeapon, joinAmmo)
	givePlayerMoney(source, joinMoney)
end

-- This function spawns players after they died
function spawnOnDead(ammo, killer, weapon, bodypart)
	outputChatBox()
	takePlayerMoney(source, deadPlayerMoney)
	if (killer) and (killer ~= source) then
		givePlayerMoney(killer, killerMoney)
	end
	setTimer(spawnPlayer, 3000, 1, source, spawnX, spawnY, spawnZ, 0, spawnSkin)
	setCameraTarget(source, source)
	setTimer(giveWeapon, 3000, 1, source, spawnWeapon, spawnAmmo)
end

-- Event handlers
addEventHandler("onPlayerJoin", getRootElement(), spawnOnJoin)
addEventHandler("onPlayerWasted", getRootElement(), spawnOnDead)