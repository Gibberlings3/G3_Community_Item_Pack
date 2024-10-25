EXTEND_BOTTOM BOTSMITH 4
  IF ~PartyHasItem("g3cluck0")~ THEN GOTO PartyHasAtLeastOneItem
END

APPEND BOTSMITH
  IF ~~ THEN BEGIN PartyHasAtLeastOneItem SAY @1038
   IF ~PartyHasItem("miscau")
       PartyHasItem("miscb4")~ THEN GOTO PartyHasAllParts
   IF ~OR(2)
       !PartyHasItem("miscau")
       !PartyHasItem("miscb4")~ THEN GOTO PartyDoesNotHaveAllParts
  END

  IF ~~ THEN BEGIN PartyDoesNotHaveAllParts SAY @1039
   IF ~~ THEN GOTO MovingRightAlong
  END

  IF ~~ THEN BEGIN PartyHasAllParts SAY @1040
   IF ~PartyGoldLT(5000)~ THEN REPLY #66633 GOTO 10
   IF ~PartyGoldGT(4999)~ THEN DO ~SetGlobal("g3cupgrade","GLOBAL",1)
                                   TakePartyGold(5000)
                                   TakePartyItemNum("g3cluck0",1)
                                   DestroyItem("g3cluck0") 
                                   TakePartyItemNum("miscau",1)  
                                   DestroyItem("miscau")  
                                   TakePartyItemNum("miscb4",1) 
                                   DestroyItem("miscb4")  
                                   DestroyGold(5000)~ REPLY #66706 GOTO 11
   IF ~~ THEN REPLY #66650 GOTO MovingRightAlong
  END

  IF ~~ THEN BEGIN MovingRightAlong SAY @1041
   COPY_TRANS BOTSMITH 4
  END

  IF WEIGHT #-1 ~Global("g3cupgrade","GLOBAL",1)~ THEN BEGIN ItemForged SAY #70888
    IF ~~ THEN DO ~SetGlobal("g3cupgrade","GLOBAL",0)~ EXIT
  END

END 