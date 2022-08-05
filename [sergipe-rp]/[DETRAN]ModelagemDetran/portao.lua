function createTheGate ()
 
         myGate1 = createObject ( 980, 1866.5999755859, -1742.8000488281 ,13.800000190735 , 0, 0, 0 )

 
      end
 
      addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createTheGate )
 
 
 
 -- https://dubmodsmta.blogspot.com.br --
 
 function openMyGate ( )
 moveObject ( myGate1, 2500, 1876.5,-1742.9000244141, 13.800000190735)
 end
 addCommandHandler("1",openMyGate)
 
 
 function movingMyGateBack ()
 moveObject ( myGate1, 2500,  1866.5999755859, -1742.8000488281 ,13.800000190735 )
 end
 addCommandHandler("2",movingMyGateBack)

-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
function createTheGate ()
 
         myGate3 = createObject ( 980, 1866.1999511719, -1684 ,13.800000190735 , 0, 0, 0 )

 
      end
 
      addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createTheGate )
 
 
 
 -- https://dubmodsmta.blogspot.com.br --
 
 function openMyGate ( )
 moveObject ( myGate3, 2500, 1876.5,-1684, 13.800000190735)
 end
 addCommandHandler("5",openMyGate)
 
 
 function movingMyGateBack ()
 moveObject ( myGate3, 2500, 1866.1999511719, -1684 ,13.800000190735 )
 end
 addCommandHandler("6",movingMyGateBack)