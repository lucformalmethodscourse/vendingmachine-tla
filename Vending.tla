-------------------------- MODULE Vending  --------------------------

EXTENDS Naturals

CONSTANTS
    MAX_COINS

VARIABLES 
    coinInserted,
    cansDispensed,
    coinsCollected

vars == << coinInserted, cansDispensed, coinsCollected >>

TypeOK ==
    /\ coinInserted \in {FALSE, TRUE}
    /\ cansDispensed >= 0
    /\ coinsCollected >= 0

Init == 
    /\ coinInserted = FALSE
    /\ cansDispensed = 0
    /\ coinsCollected = 0

InsertCoin == 
    /\ coinsCollected <= MAX_COINS
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

Next == 
    \/ InsertCoin
    \/ Buy
    \/ Cancel

Spec == Init /\ [][Next]_<<vars>> /\ WF_vars(Next)

Safety == TRUE \* coinInserted ~> ~ coinInserted

====
