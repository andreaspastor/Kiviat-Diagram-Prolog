:- include('./aire.pl').
:- include('./list_utils.pl').
:- include('./data.pl').
:- include('./similarity.pl').

:- initialization main.
main :-
  % Données
  ListeDim = [dim1, dim2, dim3, dim4],
  ListeDiag = [diag1, diag2, diag3, diag4],

  % Calcul des permutations et des aires
  findall((S, X), ( permutation(ListeDim, X) ,
    findall(AireValue, ( member(Diag, ListeDiag), aire(Diag, X, AireValue) ), S)
  ), Areas),

  % Recherche de la meilleure permutation
  find_min_sum(Areas, MaxAire, MaxPerm),
  format("Permutation donnant une aire maximale ~3f pour les diagrammes : ", MaxAire),
  writeln(MaxPerm),

  % Calcul des permutations et des similarités
  findall(D, permutation(ListeDiag, D), PermDiags),
  findall((Pdiag, Val), ( member(Pdiag, PermDiags), sq_sim_list(Pdiag, MaxPerm, Val) ), ListeGrid),

  % Recherche du meilleur alignement
  find_best_grid(ListeGrid, BestGrid),
  format("Alignement de diagrammes donnant la meilleure similarité entre deux diagrammes voisins : "),
  writeln(BestGrid),
  halt.
main :- halt(1).
