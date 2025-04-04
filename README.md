# Simple Vending Machine in TLA+

This is a very simple soda can vending machine model in TLA+. 

It includes `TypeOK` and `Accounting` invariants and `Correctness` temporal property:

- `TypeOK` ensures basic sanity, e.g., the number of cans available for sale not becoming negative.
- `Accounting` ensures that we're not giving away cans for free.
- `Correctness` ensures that inserting a coin eventually results in the dispensal of a can of soda or return of the coin.

The example also allows us to observe concepts such as stuttering, deadlock, etc.