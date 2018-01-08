/* LOG HISTORY
cd403ca	Antonin Arquey	Fri Jan 5 15:42:55 2018 +0100	Correction de bug calcul de somme des aires + ajout de commentaires
a9bd086	Antonin Arquey	Sun Dec 24 16:47:41 2017 +0100	Calcul du meilleur alignement de diagrammes pour maximiser leur similarités
*/

/**
  * square_similarity(Diag1, Diag2, Perm, Ret)
  * Calcule la différence carré  entre deux diagrammes
  * @arg Diag1, Diag2   Deux diagrammes dont on veut calculer la différence
  * @arg Perm           Permutation des dimensions des diagrammes
  * @arg Ret            Valeur de la similarité
**/

square_similarity(Diag1, Diag2, Perm, Ret) :-
  square_similarity(Diag1, Diag2, Perm, 0, Ret).

square_similarity(_, _, [], Temp, Temp).

square_similarity(Diag1, Diag2, [Dim | Perm], Temp, Ret) :-
  value(Diag1, Dim, V1),
  value(Diag2, Dim, V2),
  Temp1 is Temp + (V1-V2) * (V1-V2),
  square_similarity(Diag1, Diag2, Perm, Temp1, Ret).


  /**
    * sq_sim_list(ListeDiags, Perm, Ret)
    * Calcule la somme des différences carré pour une permutation d'une grille de diagramme
    * @arg ListeDiags     Liste de diagramme
    * @arg Perm           Permutation des dimensions de ces diagrammes
    * @arg Ret            Valeur de la somme des différence carrés
  **/

sq_sim_list(ListeDiags, Perm, Ret) :-
  sq_sim_list(ListeDiags, Perm, 0, Ret).

sq_sim_list([_ | []], _, Temp, Temp).

sq_sim_list([D1, D2 | ListeDiags], Perm, Temp, Ret) :-
  square_similarity(D1, D2, Perm, V),
  sq_sim_list([D2 | ListeDiags], Perm, Temp+V, Ret).


  /**
    * find_best_grid(ListeGrid, Grid)
    * Recherche la grille ou la différence entre deux diagrammes voisins est minimale
    * @arg ListeGrid      Liste des permutations de grilles différentes
    * @arg Grid           Grille donnant le résultat voulu
  **/

find_best_grid(ListeGrid, Grid) :-
  find_best_grid(ListeGrid, 1000000, _, Grid).

find_best_grid([(G,V) | ListeGrid], Max, _, GridFinal) :-
  V < Max,
  find_best_grid(ListeGrid, V, G, GridFinal).

find_best_grid([(_,V) | ListeGrid], Max, Grid, GridFinal) :-
  V >= Max,
  find_best_grid(ListeGrid, Max, Grid, GridFinal).

find_best_grid([], _, Grid, Grid).
