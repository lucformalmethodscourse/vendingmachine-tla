-------------------------- MODULE Vending  --------------------------

EXTENDS Naturals

CONSTANTS
    MAX_STEPS

VARIABLES 
    coinInserted,
    cansDispensed,
    coinsCollected,
    steps

vars == << coinInserted, cansDispensed, coinsCollected, steps >>

TypeOK ==
    /\ coinInserted \in {FALSE, TRUE}
    /\ cansDispensed >= 0
    /\ coinsCollected >= 0
    /\ steps >= 0

Continue == steps < MAX_STEPS /\ steps' = steps + 1

Terminate == steps >= MAX_STEPS

Done == 
    /\ Terminate
    /\ UNCHANGED vars

Init == 
    /\ coinInserted = FALSE
    /\ cansDispensed = 0
    /\ coinsCollected = 0
    /\ steps = 0

InsertCoin == 
    /\ Continue
    /\ coinInserted' = TRUE
    /\ coinsCollected' = coinsCollected + 1
    /\ UNCHANGED << cansDispensed >>

Buy == 
    /\ Continue
    /\ coinInserted
    /\ coinInserted' = FALSE
    /\ cansDispensed' = cansDispensed + 1
    /\ UNCHANGED << coinsCollected >>

Cancel == 
    /\ Continue
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
    \/ Done

Spec == Init /\ [][Next]_<<vars>> /\ WF_vars(Next)

Safety == TRUE \* coinInserted ~> ~ coinInserted

====
