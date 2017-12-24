square_similarity(Diag1, Diag2, Perm, Ret) :-
  square_similarity(Diag1, Diag2, Perm, 0, Ret).

square_similarity(_, _, [], Temp, Temp).

square_similarity(Diag1, Diag2, [Dim | Perm], Temp, Ret) :-
  value(Diag1, Dim, V1),
  value(Diag2, Dim, V2),
  Temp1 is Temp + (V1-V2) * (V1-V2),
  square_similarity(Diag1, Diag2, Perm, Temp1, Ret).


sq_sim_list(ListeDiags, Perm, Ret) :-
  sq_sim_list(ListeDiags, Perm, 0, Ret).

sq_sim_list([_ | []], _, Temp, Temp).

sq_sim_list([D1, D2 | ListeDiags], Perm, Temp, Ret) :-
  square_similarity(D1, D2, Perm, V),
  Temp1 is Temp + V,
  sq_sim_list([D2 | ListeDiags], Perm, Temp1, Ret).

find_best_grid(ListeGrid, Grid) :-
  find_best_grid(ListeGrid, 1000000, _, Grid).

find_best_grid([(G,V) | ListeGrid], Max, _, GridFinal) :-
  V < Max,
  find_best_grid(ListeGrid, V, G, GridFinal).

find_best_grid([(_,V) | ListeGrid], Max, Grid, GridFinal) :-
  V >= Max,
  find_best_grid(ListeGrid, Max, Grid, GridFinal).

find_best_grid([], _, Grid, Grid).
