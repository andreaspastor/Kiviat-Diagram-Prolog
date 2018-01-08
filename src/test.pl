/*

Test unitaires

*/

max(dim1, 4).
max(dim2, 5).
max(dim3, 8).

value(diag1, dim1, 4).
value(diag1, dim2, 1).
value(diag1, dim3, 2).

value(diag2, dim1, 3).
value(diag2, dim2, 5).
value(diag2, dim3, 8).

value(diag3, dim1, 3).
value(diag3, dim2, 2).
value(diag3, dim3, 3).

:- include('./aire.pl').
:- include('./list_utils.pl').
:- include('./similarity.pl').

:- begin_tests(aire).
  test("Aire diagramme correcte") :-
    aire(diag1, [dim1, dim2, dim3], S),
    assertion(S == 0.25).

  test("Aire diagramme sans dimensions correcte") :-
    aire(diag1, [], S),
    assertion(S == 0).
:- end_tests(aire).

:- begin_tests(sum_list).
  test("Somme d'une liste vide correcte") :-
    sum_list([], S),
    assertion(S == 0).

  test("Somme d'une liste correcte") :-
    sum_list([1,2,3], S),
    assertion(S == 0+1+2+3).
:- end_tests(sum_list).

:- begin_tests(find_max_sum).
  test("Bonne recherche de la somme maximale") :-
    find_max_sum([([1,2,3], max), ([1,2,1], notmax)], M, R),
    assertion(R == max),
    assertion(M == 0+1+2+3).
:- end_tests(find_max_sum).

:- begin_tests(square_difference).
  test("Calcul de la différence carré correct") :-
    square_difference(diag1, diag2, [dim1, dim2, dim3], S),
    assertion(S == 53).
:- end_tests(square_difference).

:- begin_tests(sq_diff_list).
  test("Calcul de la différence carré d'une liste de diagramme") :-
    sq_diff_list([diag1, diag2, diag3], [dim1, dim2, dim3], S),
    assertion(S == 0+53+34).
:- end_tests(sq_diff_list).

:- begin_tests(find_best_grid).
  test("Meilleure grille trouvée") :-
    find_best_grid([([diag1, diag2, diag3], 5), ([diag2, diag1, diag3], 3)], G),
    assertion(G == [diag2, diag1, diag3]).
:- end_tests(find_best_grid).
