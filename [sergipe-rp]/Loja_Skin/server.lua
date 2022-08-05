addEvent("bySkin",true)
addEventHandler("bySkin",getRootElement(), function(price, skin)
	takePlayerMoney(source, price)
	setElementModel(source, skin)
end
)