/* LOG HISTORY
cd403ca	Antonin Arquey	Fri Jan 5 15:42:55 2018 +0100	Correction de bug calcul de somme des aires + ajout de commentaires
8875add	Antonin Arquey	Thu Dec 14 15:32:07 2017 +0100	Ajout de commentaires
4de5943	Antonin Arquey	Thu Dec 14 15:02:15 2017 +0100	Reccherche de la permutation minimisant l'aire des diagrammes
6c1b604	Antonin Arquey	Wed Dec 13 16:05:52 2017 +0100	Ajout de predicat stockant les données et calculs des aires pour chaque permutations des diagrammes
98ff045	Antonin Arquey	Fri Dec 8 11:36:08 2017 +0100	Ajout de fonctions sur les listes et fonction trouvant la meilleur permutation pour un diagramme
*/

/**
  * sum_list(L,S)
  * Calcule la somme des élements d'une liste
  * @arg L  Liste d'élements (nombres)
  * @arg S  Somme des élements de la liste
**/

sum_list(L, S) :-
  sum_list(L, 0, S).

sum_list([], 0).

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
