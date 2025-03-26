-------------------------- MODULE Vending  --------------------------

EXTENDS TLC, Naturals

VARIABLES 
    coinInserted,
    cansDispensed,
    coinsCollected

vars == << coinInserted, cansDispensed, coinsCollected >>

Init == 
    /\ coinInserted = FALSE
    /\ cansDispensed = 0
    /\ coinsCollected = 0

InsertCoin == 
    /\ coinInserted' = TRUE
    /\ coinsCollected' = coinsCollected + 1
    /\ UNCHANGED << cansDispensed >>

Buy == 
    /\ coinInserted
    /\ coinInserted' = FALSE
    /\ cansDispensed' = cansDispensed + 1
    /\ UNCHANGED << coinsCollected >>

Cancel == 
    /\ coinInserted
    /\ coinInserted' = FALSE
    /\ coinsCollected' = coinsCollected - 1
    /\ UNCHANGED << cansDispensed >>

\* ReturnCoin == TRUE

\* DispenseCan == TRUE

Next == 
    \/ InsertCoin
    \/ Buy
    \/ Cancel

Spec == Init /\ [][Next]_<<vars>> /\ WF_vars(Next)

Safety == coinInserted ~> ~ coinInserted

Limit == cansDispensed < 5

====
