-------------------------- MODULE Vending  --------------------------

EXTENDS Naturals

CONSTANTS
    MAX_CANS,
    MAX_COINS

VARIABLES
    coinInserted,
    cansAvailable,
    cansDispensed,
    coinsCollected

vars == << coinInserted, cansAvailable, cansDispensed, coinsCollected >>

TypeOK ==
    /\ coinInserted \in {FALSE, TRUE}
    /\ cansAvailable \in 0 .. MAX_CANS
    /\ cansDispensed >= 0
    /\ coinsCollected \in 0 .. MAX_COINS

Init ==
    /\ coinInserted = FALSE
    /\ cansAvailable \in 0 .. MAX_CANS
    /\ coinsCollected \in 0 .. MAX_COINS
    /\ cansDispensed = coinsCollected

InsertCoin ==
    /\ coinsCollected <= MAX_COINS
    /\ coinInserted' = TRUE
    /\ coinsCollected' = coinsCollected + 1
    /\ UNCHANGED << cansAvailable, cansDispensed >>

Buy ==
    /\ cansAvailable > 0
    /\ coinInserted' = FALSE
    /\ cansAvailable' = cansAvailable - 1
    /\ cansDispensed' = cansDispensed + 1
    /\ UNCHANGED << coinsCollected >>

Cancel ==
    /\ coinInserted
    /\ coinInserted' = FALSE
    /\ coinsCollected' = coinsCollected - 1
    /\ UNCHANGED << cansAvailable, cansDispensed >>

\* Timeout

\* RestockInventory

\* CollectCoins

Next ==
    \/ InsertCoin
    \/ Buy
    \/ Cancel

Spec == Init /\ [][Next]_<<vars>> /\ WF_vars(Next)

Accounting == coinsCollected \in {cansDispensed, cansDispensed + 1}

Correctness == [](coinInserted ~> ~ coinInserted)

====
