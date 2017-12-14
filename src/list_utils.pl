/**
  * sum_list(L,S)
  * Calcule la somme des élements d'une liste
  * @arg L  Liste d'élements (nombres)
  * @arg S  Somme des élements de la liste
**/

sum_list(L, S) :-
  sum_list(L, 0, S).

sum_list([X | L], Temp, S) :-
  Temp1 is Temp + X,
  sum_list(L, Temp1, S).

sum_list([X | []], Temp, S) :-
  S=Temp+X.

  /**
    * find_min_sum(L, Max, Perm)
    * Recherche la liste où la somme des éléments et la plus faible
    * @arg L      Liste d'élements (nombres)
    * @arg Max    Somme des élements de la liste
    * @arg Perm   Permutation donnant l'aire minimale
  **/

find_min_sum(L, Max, Perm) :-
  find_min_sum(L, 1000000, Max, _, Perm).

find_min_sum([(Areas, Perm) | L], Temp, MaxFinal, _, PermFinal) :-
  sum_list(Areas, S),
  S < Temp,
  find_min_sum(L, S, MaxFinal, Perm, PermFinal).

find_min_sum([(Areas, _) | L], Temp, MaxFinal, PermTemp, PermFinal) :-
  sum_list(Areas, S),
  S >= Temp,
  find_min_sum(L, Temp, MaxFinal, PermTemp, PermFinal).

find_min_sum([], Temp, Temp, Perm, Perm).
