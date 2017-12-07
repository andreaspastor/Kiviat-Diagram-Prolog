:- include('./aire.pl').
/*
printList([]) :-
  format('\n'),
  fail.
printList([A | B]) :-
  format('~w ', A),
  printList(B).

:- initialization main.
main :- permutation([1,2,3], L), printList(L), halt.
main :- halt(1).
*/



:- initialization main.
main :- S is 0, aire([1, 1, 1, 1, 1], [2, 2, 2, 2, 2], S), format('Aire = ~w\n', S) , halt.
main :- halt(1).
