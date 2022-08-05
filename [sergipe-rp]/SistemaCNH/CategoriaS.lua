--[[  
                             
--]]
--[[                               
--]]

--[[ ===================================== --]]
--   =            CATEGORIA A            =   --
--[[ ===================================== --]]

function CNHMoto (source, seat)
if getElementData( source, "DNL:TestePratico", true ) then return end
if getElementData(source, "DNL:Categoria(A)", true) then return end
	local temp = getPedOccupiedVehicle(source)
if (getElementModel (temp) == 581) or (getElementModel (temp) == 462) or (getElementModel (temp) == 521) or (getElementModel (temp) == 463) or (getElementModel (temp) == 522)
or (getElementModel (temp) == 461) or (getElementModel (temp) == 448) or (getElementModel (temp) == 468) or (getElementModel (temp) == 586) or (getElementModel (temp) == 523)  then 
--	if getVehicleOccupant(temp,0) then 
if seat == 0 then

	triggerClientEvent(source,"CNH:AlertaMoto",source)	 
  end
 end
end
addEventHandler ( "onVehicleEnter", root, CNHMoto )


--[[ ===================================== --]]
--   =            CATEGORIA B            =   --
--[[ ===================================== --]]

function CNHCarro (source, seat)
if getElementData( source, "DNL:TestePratico", true ) then return end
if getElementData(source, "DNL:Categoria(B)", true) then return end
	local temp = getPedOccupiedVehicle(source)
if (getElementModel (temp) == 602) or (getElementModel (temp) == 496) or (getElementModel (temp) == 401) or (getElementModel (temp) == 518) or (getElementModel (temp) == 527) 
or (getElementModel (temp) == 589) or (getElementModel (temp) == 419) or (getElementModel (temp) == 587) or (getElementModel (temp) == 533) or (getElementModel (temp) == 526) 
or (getElementModel (temp) == 474) or (getElementModel (temp) == 545) or (getElementModel (temp) == 517) or (getElementModel (temp) == 410) or (getElementModel (temp) == 600) 
or (getElementModel (temp) == 436) or (getElementModel (temp) == 439) or (getElementModel (temp) == 549) or (getElementModel (temp) == 491) or (getElementModel (temp) == 445) 
or (getElementModel (temp) == 604) or (getElementModel (temp) == 507) or (getElementModel (temp) == 585) or (getElementModel (temp) == 466) or (getElementModel (temp) == 492) 
or (getElementModel (temp) == 546) or (getElementModel (temp) == 551) or (getElementModel (temp) == 516) or (getElementModel (temp) == 467) or (getElementModel (temp) == 426) 
or (getElementModel (temp) == 547) or (getElementModel (temp) == 405) or (getElementModel (temp) == 580) or (getElementModel (temp) == 409) or (getElementModel (temp) == 550) 
or (getElementModel (temp) == 566) or (getElementModel (temp) == 540) or (getElementModel (temp) == 421) or (getElementModel (temp) == 529) or (getElementModel (temp) == 485) 
or (getElementModel (temp) == 438) or (getElementModel (temp) == 574) or (getElementModel (temp) == 420) or (getElementModel (temp) == 490) or (getElementModel (temp) == 470) 
or (getElementModel (temp) == 596) or (getElementModel (temp) == 598) or (getElementModel (temp) == 599) or (getElementModel (temp) == 597) or (getElementModel (temp) == 531)
or (getElementModel (temp) == 536) or (getElementModel (temp) == 575) or (getElementModel (temp) == 534) or (getElementModel (temp) == 567) or (getElementModel (temp) == 535)
or (getElementModel (temp) == 576) or (getElementModel (temp) == 429) or (getElementModel (temp) == 541) or (getElementModel (temp) == 415) or (getElementModel (temp) == 480)
or (getElementModel (temp) == 562) or (getElementModel (temp) == 565) or (getElementModel (temp) == 434) or (getElementModel (temp) == 494) or (getElementModel (temp) == 502)
or (getElementModel (temp) == 503) or (getElementModel (temp) == 411) or (getElementModel (temp) == 559) or (getElementModel (temp) == 561) or (getElementModel (temp) == 560)
or (getElementModel (temp) == 506) or (getElementModel (temp) == 451) or (getElementModel (temp) == 558) or (getElementModel (temp) == 555) or (getElementModel (temp) == 477)
or (getElementModel (temp) == 568) or (getElementModel (temp) == 424) or (getElementModel (temp) == 504) or (getElementModel (temp) == 457) or (getElementModel (temp) == 483)
or (getElementModel (temp) == 571) or (getElementModel (temp) == 500) or (getElementModel (temp) == 444) or (getElementModel (temp) == 556) or (getElementModel (temp) == 557)
or (getElementModel (temp) == 471) or (getElementModel (temp) == 495) or (getElementModel (temp) == 539) or (getElementModel (temp) == 459) or (getElementModel (temp) == 422)
or (getElementModel (temp) == 482) or (getElementModel (temp) == 605) or (getElementModel (temp) == 530) or (getElementModel (temp) == 418) or (getElementModel (temp) == 572)
or (getElementModel (temp) == 582) or (getElementModel (temp) == 413) or (getElementModel (temp) == 440) or (getElementModel (temp) == 543) or (getElementModel (temp) == 583)
or (getElementModel (temp) == 554) or (getElementModel (temp) == 579) or (getElementModel (temp) == 400) or (getElementModel (temp) == 404) or (getElementModel (temp) == 489)
or (getElementModel (temp) == 505) or (getElementModel (temp) == 479) or (getElementModel (temp) == 422) or (getElementModel (temp) == 458) or (getElementModel (temp) == 402) then 
--if getVehicleOccupant(temp,0) then 
if seat == 0 then
   triggerClientEvent(source,"CNH:AlertaCar",source)
  end
 end
end
addEventHandler ( "onVehicleEnter", root, CNHCarro )


--[[ ===================================== --]]
--   =            CATEGORIA C            =   --
--[[ ===================================== --]]
function CNHCaminhao (source, seat)
if getElementData( source, "DNL:TestePratico", true ) then return end
if getElementData(source, "DNL:Categoria(C)", true) then return end
	local temp = getPedOccupiedVehicle(source)
if (getElementModel (temp) == 525) or (getElementModel (temp) == 408) or (getElementModel (temp) == 552) or (getElementModel (temp) == 416) or (getElementModel (temp) == 433) 
or (getElementModel (temp) == 427) or (getElementModel (temp) == 528) or (getElementModel (temp) == 407) or (getElementModel (temp) == 544) or (getElementModel (temp) == 601)
or (getElementModel (temp) == 428) or (getElementModel (temp) == 499) or (getElementModel (temp) == 609) or (getElementModel (temp) == 498) or (getElementModel (temp) == 524)
or (getElementModel (temp) == 532) or (getElementModel (temp) == 578) or (getElementModel (temp) == 486) or (getElementModel (temp) == 406) or (getElementModel (temp) == 573)
or (getElementModel (temp) == 455) or (getElementModel (temp) == 588) or (getElementModel (temp) == 423) or (getElementModel (temp) == 414) or (getElementModel (temp) == 443)
or (getElementModel (temp) == 456) or (getElementModel (temp) == 478) or (getElementModel (temp) == 508) or (getElementModel (temp) == 431) or (getElementModel (temp) == 437) then

if seat == 0 then

	triggerClientEvent(source,"CNH:AlertaCAM",source)	 
  end
 end
end
addEventHandler ( "onVehicleEnter", root, CNHCaminhao )


--[[ ===================================== --]]
--   =            CATEGORIA D            =   --
--[[ ===================================== --]]
function CNHCarreta (source, seat)
if getElementData( source, "DNL:TestePratico", true ) then return end
if getElementData(source, "DNL:Categoria(D)", true) then return end
	local temp = getPedOccupiedVehicle(source)
if (getElementModel (temp) == 403) or (getElementModel (temp) == 515) or (getElementModel (temp) == 514) then

if seat == 0 then

	triggerClientEvent(source,"CNH:AlertaCARRETA",source)	 
  end
 end
end
addEventHandler ( "onVehicleEnter", root, CNHCarreta )

--[[ ===================================== --]]
--   =         PILOTO Helicoptero         =   --
--[[ ===================================== --]]

function CNHHeli (source, seat)
if getElementData(source, "DNL:Categoria(PH)", true) then return end
	local temp = getPedOccupiedVehicle(source)
if (getElementModel (temp) == 548) or (getElementModel (temp) == 488) or (getElementModel (temp) == 469)
or (getElementModel (temp) == 487) then

if seat == 0 then

	triggerClientEvent(source,"CNH:AlertaHeli",source)	 
  end
 end
end
addEventHandler ( "onVehicleEnter", root, CNHHeli )

--[[ ===================================== --]]
--   =             PILOTO Avião           =   --
--[[ ===================================== --]]

function CNHAviao (source, seat)
if getElementData(source, "DNL:Categoria(PA)", true) then return end
	local temp = getPedOccupiedVehicle(source)
if (getElementModel (temp) == 511) or (getElementModel (temp) == 593) or (getElementModel (temp) == 519) then

if seat == 0 then

	triggerClientEvent(source,"CNH:AlertaAviao",source)	 
  end
 end
end
addEventHandler ( "onVehicleEnter", root, CNHAviao )

--[[ ===================================== --]]
--   =             REMOVER CNH            =   --
--[[ ===================================== --]]

function RemCNH (source, seat)
if seat == 0 then
	triggerClientEvent(source,"CNH:AlertaMoto_Off",source)	 
	triggerClientEvent(source,"CNH:AlertaCar_Off",source)
	triggerClientEvent(source,"CNH:AlertaCAM_Off",source)	
	triggerClientEvent(source,"CNH:AlertaCARRETA_Off",source)	 
	triggerClientEvent(source,"CNH:AlertaHeli_Off",source)
	triggerClientEvent(source,"CNH:AlertaAviao_Off",source)
  end
end
addEventHandler ( "onVehicleExit", root, RemCNH )
