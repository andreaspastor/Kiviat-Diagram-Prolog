:- include('./aire.pl').
:- include('./list_utils.pl').
:- include('./data.pl').

:- initialization main.
main :-
  ListeDim = [dim1, dim2, dim3, dim4],
  ListeDiag = [diag1, diag2, diag3],
  findall((S, X), ( permutation(ListeDim, X) ,
    findall(AireValue, ( member(Diag, ListeDiag), aire(Diag, X, AireValue) ), S)
  ), Areas),
  find_min_sum(Areas, MaxAire, MaxPerm),
  format("Permutation donnant une aire maximale ~3f pour les diagrammes : ", MaxAire),
  writeln(MaxPerm),
  halt.
main :- halt(1).
