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
    /\ ~ coinInserted
    /\ coinInserted' = TRUE
    /\ UNCHANGED << cansAvailable, cansDispensed, coinsCollected >>

Buy ==
    /\ coinInserted
    /\ coinsCollected < MAX_COINS
    /\ cansAvailable > 0
    /\ coinInserted' = FALSE
    /\ coinsCollected' = coinsCollected + 1
    /\ cansAvailable' = cansAvailable - 1
    /\ cansDispensed' = cansDispensed + 1

Cancel ==
    /\ coinInserted
    /\ coinInserted' = FALSE
    /\ UNCHANGED << cansAvailable, cansDispensed, coinsCollected >>

\* Timeout

\* RestockInventory

\* CollectCoins

Next ==
    \/ InsertCoin
    \/ Buy
    \/ Cancel

Spec == Init /\ [][Next]_<<vars>> /\ WF_vars(Next)

Accounting == coinsCollected = cansDispensed

Correctness == [](coinInserted ~> ~ coinInserted)

====
