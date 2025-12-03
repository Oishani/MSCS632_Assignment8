% family_tree.pl
% Prolog Family Tree Program
% Defines family relationships and rules for querying parent, grandparent, sibling, cousin, descendant, ancestor, and uncle/aunt relationships.

% --- Facts ---
parent(john, mary).
parent(john, tom).
parent(susan, mary).
parent(susan, tom).
parent(mary, alice).
parent(mary, bob).
parent(mike, alice).
parent(mike, bob).
parent(tom, carol).
parent(tom, dave).
parent(lisa, carol).
parent(lisa, dave).
parent(bob, emma).
parent(bob, frank).
parent(carol, grace).
parent(carol, henry).

male(john).
male(tom).
male(mike).
male(bob).
male(dave).
male(frank).
male(henry).
female(susan).
female(mary).
female(lisa).
female(alice).
female(carol).
female(emma).
female(grace).

% --- Rules ---
% father(X, Y): X is the father of Y
father(X, Y) :- parent(X, Y), male(X).
% mother(X, Y): X is the mother of Y
mother(X, Y) :- parent(X, Y), female(X).
% grandparent(X, Y): X is a grandparent of Y
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
% sibling(X, Y): X and Y share a parent and are not the same person
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
% sibling_list(X, L): L is the list of unique siblings of X
sibling_list(X, L) :- setof(Y, sibling(X, Y), L), !; L = [].
% cousin(X, Y): X and Y have parents who are siblings
cousin(X, Y) :- parent(A, X), parent(B, Y), sibling(A, B), X \= Y.
% cousin_list(X, L): L is the list of unique cousins of X
cousin_list(X, L) :- setof(Y, cousin(X, Y), L), !; L = [].
% child(X, Y): X is a child of Y
child(X, Y) :- parent(Y, X).
% descendant(X, Y): X is a descendant of Y (recursive)
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).
% ancestor(X, Y): X is an ancestor of Y (recursive)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
% uncle_or_aunt(X, Y): X is an uncle or aunt of Y
uncle_or_aunt(X, Y) :- parent(Z, Y), sibling(X, Z).
% uncle_or_aunt_list(X, L): L is the list of unique uncles/aunts of X
uncle_or_aunt_list(X, L) :- setof(Y, uncle_or_aunt(Y, X), L), !; L = [].

% --- Sample Queries ---
% child(C, john).           % Who are the children of john?
% sibling_list(mary, L).    % Who are the siblings of mary?
% grandparent(G, alice).    % Who are the grandparents of alice?
% mother(M, carol).         % Who is the mother of carol?
% father(F, dave).          % Who is the father of dave?
% cousin_list(emma, L).     % Who are the cousins of emma?
% descendant(D, john).      % Who are the descendants of john?
% ancestor(A, grace).       % Who are the ancestors of grace?
% uncle_or_aunt_list(bob, L). % Who are the uncles/aunts of bob?
% child(C, frank).          % Who are the children of frank? (should be empty)
% cousin_list(henry, L).    % Who are the cousins of henry? (should be empty)

% --- Demo Entrypoint ---
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
