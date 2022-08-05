local animTable = {

	ifp = {},

	anims = {
		"IDLE_armed",
		"run_1armed",
		"run_armed",
		"WALK_armed",
		"WALK_start_armed",

	}

}

addEventHandler("onClientResourceStart", resourceRoot,
	function()

		animTable.ifp["block"] = "ped"
		animTable.ifp["ifp"] = engineLoadIFP("ped.ifp", animTable.ifp["block"])

		for _, v in ipairs(animTable.anims) do
			for _, p in ipairs(getElementsByType("player")) do
				engineReplaceAnimation(p, "ped", v, animTable.ifp["block"], v)
			end
		end

	end
)
