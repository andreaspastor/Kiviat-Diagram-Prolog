:- include('./aire.pl').
:- include('./list_utils.pl').
:- include('./data.pl').

:- initialization main.
main :-
  ListeDim=[dim1, dim2, dim3, dim4],
  ListeDiag=[diag1, diag2, diag3],
  findall((S, X), ( permutation(ListeDim, X) ,
    findall(AireValue, ( member(Diag, ListeDiag), aire(Diag, X, AireValue) ), S)
  ), Areas),
  writeln(Areas),
  halt.
main :- halt(1).
