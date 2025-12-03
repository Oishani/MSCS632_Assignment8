#!/bin/bash

PROLOG_FILE="family_tree.pl"

swipl -q -g main -s "$PROLOG_FILE" <<'END_PROLOG'
main :-
    nl, write('--- Family Tree Demo ---'), nl, nl,
    write('1. Children of john:'), nl,
    findall(C, child(C, john), L1), writeln(L1),

    write('2. Siblings of mary:'), nl,
    sibling_list(mary, L2), writeln(L2),

    write('3. Grandparents of alice:'), nl,
    findall(G, grandparent(G, alice), L3), writeln(L3),

    write('4. Mother of carol:'), nl,
    findall(M, mother(M, carol), L4), writeln(L4),

    write('5. Father of dave:'), nl,
    findall(F, father(F, dave), L5), writeln(L5),

    write('6. Cousins of emma:'), nl,
    cousin_list(emma, L6), writeln(L6),

    write('7. Siblings for each person:'), nl,
    forall((male(X);female(X)), (sibling_list(X, L), L \= [] -> (write('  '), write(X), write(': '), writeln(L)); true)), nl,

    write('8. Is alice a cousin of carol? '),
    (cousin(alice, carol) -> writeln('yes'); writeln('no')), nl,

    write('9. Descendants of john:'), nl,
    findall(D, descendant(D, john), L7), writeln(L7),

    write('10. Ancestors of grace:'), nl,
    findall(A, ancestor(A, grace), L8), writeln(L8),

    write('11. Uncles/Aunts of bob:'), nl,
    uncle_or_aunt_list(bob, L9), writeln(L9),

    write('12. Children of frank (should be empty):'), nl,
    findall(C, child(C, frank), L10), writeln(L10),

    write('13. Cousins of henry (should be empty):'), nl,
    cousin_list(henry, L11), writeln(L11),

    write('--- End of Demo ---'), nl,
    halt.

:- main.
END_PROLOG
