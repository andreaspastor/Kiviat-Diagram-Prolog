/**
  * sum_list(L,S)
  * Calcule la somme des élements d'une liste
  * @arg L  Liste d'élements (nombres)
  * @arg S  Somme des élements de la liste
**/

sum_list(L, S) :-
  sum_list(L, 0, S).

sum_list([X | L], Temp, S) :-
  sum_list(L, Temp+X, S).

sum_list([X | []], Temp, Temp+X).

  /**
    * find_max_sum(L, Max, Perm)
    * Recherche la liste où la somme des éléments est maximale
    * @arg L      Liste d'élements (nombres)
    * @arg Max    Somme des élements de la liste
    * @arg Perm   Permutation donnant l'aire maximale
  **/

find_max_sum(L, Max, Perm) :-
  find_max_sum(L, -1, Max, _, Perm).

find_max_sum([(Areas, Perm) | L], Temp, MaxFinal, _, PermFinal) :-
  sum_list(Areas, S),
  S >= Temp,
  find_max_sum(L, S, MaxFinal, Perm, PermFinal).

find_max_sum([(Areas, _) | L], Temp, MaxFinal, PermTemp, PermFinal) :-
  sum_list(Areas, S),
  S < Temp,
  find_max_sum(L, Temp, MaxFinal, PermTemp, PermFinal).

find_max_sum([], Temp, Temp, Perm, Perm).
