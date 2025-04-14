# Simple Vending Machine in TLA+

[![Syntax-check models](https://github.com/lucformalmethodscourse/vendingmachine-tla/actions/workflows/main.yml/badge.svg)](https://github.com/lucformalmethodscourse/vendingmachine-tla/actions/workflows/main.yml)

This is a very simple soda can vending machine model in TLA+. 

It includes `TypeOK` and `Accounting` invariants and `Correctness` temporal property:

- `TypeOK` ensures basic sanity, e.g., the number of cans available for sale not becoming negative.
- `Accounting` ensures that we're not giving away cans for free.
- `Correctness` ensures that inserting a coin eventually results in the dispensal of a can of soda or return of the coin.

The example also allows us to observe concepts such as stuttering, deadlock, etc.

*The example isn't necessarily correct out of the box. This is intentional to give you the opportunity to experiment with it by enhancing the actions and invariants/properties.*
