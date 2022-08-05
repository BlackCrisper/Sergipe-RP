function createTheGate ()
 
         myGate1 = createObject ( 980, 2903.354, -730.634, 11.3044 , 0, 0, 90 )

 
      end
 
      addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createTheGate )
 
 
 
 -- https://dubmodsmta.blogspot.com.br --
 
 function openMyGate ( )
 moveObject ( myGate1, 2500,2903.354, -730.634, 3.3044)
 end
 addCommandHandler("ap",openMyGate)
 
 
 function movingMyGateBack ()
 moveObject ( myGate1, 2500,  2903.354, -730.634, 11.3044)
 end
 addCommandHandler("fp",movingMyGateBack)

-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
function createTheGate ()
 
         myGate1 = createObject ( 980, 2903.996, -673.493, 11.3038 , 0, 0, 90 )

 
      end
 
      addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createTheGate )
 
 
 
 -- https://dubmodsmta.blogspot.com.br --
 
 function openMyGate ( )
 moveObject ( myGate1, 2500,2903.996, -673.493, 3.3038 )
 end
 addCommandHandler("a1",openMyGate)
 
 
 function movingMyGateBack ()
 moveObject ( myGate1, 2500,  2903.996, -673.493, 11.3038)
 end
 addCommandHandler("f1",movingMyGateBack)



 
 -------------------------------------------------------------------------------------------------------------------------------------


function createTheGate ()
 
         myGate1 = createObject ( 980, 2904.2, -661.764, 11.5038, 0, 0, 89.3 )

 
      end
 
      addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createTheGate )
 
 
 
 -- https://dubmodsmta.blogspot.com.br --
 
 function openMyGate ( )
 moveObject ( myGate1, 2500, 2904.2, -661.764, 3.038 )
 end
 addCommandHandler("a2",openMyGate)
 
 
 function movingMyGateBack ()
 moveObject ( myGate1, 2500,  2904.2, -661.764, 11.5038)
 end
 addCommandHandler("f2",movingMyGateBack)