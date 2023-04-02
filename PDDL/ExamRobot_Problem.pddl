(define (problem RobotExam)
    (:domain RobotExam)
    (:objects   
        L1 - loc 
        L2 - loc
        L3 - loc 
        L4 - loc 
        L5 - loc 
        L6 - loc 
        L7 - loc 
        L8 - loc 
        L9 - loc 
        key - ob
        rope1 - ro
        rope2 - ro
        rope3 - ro
    )
    (:init (Location L1)
           (Location L2)
           (Location L3)
           (Location L4)
           (Location L5)
           (Location L6)
           (Location L7)
           (Location L8)
           (Location L9)
           (SelfAt L1)
           (Key key)
           (Rope rope1)
           (Rope rope2)
           (Rope rope3)
           (HasExit L8)
           (HasPit L2)
           (HasPit L7)
           (HasPit L9)
           (ObjectAt key L5)
           (ObjectAt rope1 L1)
           (ObjectAt rope2 L3)
           (ObjectAt rope3 L4)
           (connected L1 L2)
           (connected L1 L3)
           (connected L1 L4)
           (connected L2 L5)
           (connected L3 L5)
           (connected L3 L6)
           (connected L4 L7)
           (connected L5 L1)
           (connected L5 L9)
           (connected L6 L9)
           (connected L7 L9)
           (connected L8 L9)
           (connected L9 L8)
           (connected L9 L1)
    )
    (:goal (exists (?x - loc ?y - ob) (and (SelfAt ?x) (HasExit ?x) (SelfStores ?y) (Key ?y))))
)










