(define (domain RobotExam)
    (:requirements :strips)
    (:types loc ob - object ; We define two types for locations and objects (things that can be collected)
            ro - ob) ; and a subtype for ropes to distinguish them from the key
    
    ; Fluents and non-Fluents
    (:predicates 
        (Location ?l - loc)
        (HasPit ?l - loc)
        (HasExit ?l - loc)
        (Key ?o - ob)
        (Rope ?r - ro)
        (connected ?x - loc ?y - loc)
        (SelfAt ?x - loc)
        (ObjectAt ?x - ob ?y - loc)
        (SelfStores ?x - ob)
    )
    
    ; Actions 
    
    ; moveTo(x)
    (:action moveTo
        :parameters (?x - loc)
        :precondition ( 
            and 
               (exists (?l - loc) (and (SelfAt ?l) (not (HasPit ?l)) (connected ?l ?x)))
        )
        :effect (
            and (SelfAt ?x)
                (forall (?l - loc) (when (not (= ?l ?x)) (not (SelfAt ?l))))
                (forall (?o - ob) (when (SelfStores ?o) (ObjectAt ?o ?x)))
                (forall (?o - ob ?l - loc) (when (and (SelfStores ?o) (ObjectAt ?o ?l) (not (= ?l ?x))) (not (ObjectAt ?o ?l))))
        )
    )
    
    ; jumpTo(x, y)
    (:action jumpTo
        :parameters (?x - loc ?y - ro)
        :precondition(
            and (Rope ?y)
                (SelfStores ?y)
                (exists (?l - loc) (and (SelfAt ?l) (connected ?l ?x)))
                (exists (?l - loc) (and (SelfAt ?l) (HasPit ?l))) ; Planner being weird, so I split this
        )
        :effect(
            and (SelfAt ?x)
                (forall (?l - loc) (when (not (= ?l ?x)) (not (SelfAt ?l))))
                (forall (?o - ob) (when (and (SelfStores ?o) (not (= ?o ?y))) (ObjectAt ?o ?x)))
                (forall (?o - ob ?l - loc) (when (and (SelfStores ?o) (ObjectAt ?o ?l) (not (= ?l ?x)) (not (= ?o ?y))) (not (ObjectAt ?o ?l))))
        )
    )
    
    ; collectObj(x)
    (:action collectObj
        :parameters (?x - ob)
        :precondition (
            and (not (SelfStores ?x))
            (exists (?l - loc) (and (SelfAt ?l) (ObjectAt ?x ?l)))
        )
        :effect(
            SelfStores ?x
        )
    )    
    
    ;dropAll()
    (:action dropAll
        :parameters ()
        :precondition(
            exists (?o - ob) (SelfStores ?o)
        )
        :effect(
            forall (?o - ob) (when (SelfStores ?o) (not (SelfStores ?o)))
        )
    )
)













