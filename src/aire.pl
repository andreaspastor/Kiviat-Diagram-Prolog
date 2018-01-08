/* LOG HISTORY
8875add	Antonin Arquey	Thu Dec 14 15:32:07 2017 +0100	Ajout de commentaires
6c1b604	Antonin Arquey	Wed Dec 13 16:05:52 2017 +0100	Ajout de predicat stockant les données et calculs des aires pour chaque permutations des diagrammes
98ff045	Antonin Arquey	Fri Dec 8 11:36:08 2017 +0100	Ajout de fonctions sur les listes et fonction trouvant la meilleur permutation pour un diagramme
bf2b482	Antonin Arquey	Thu Dec 7 14:24:32 2017 +0100	Création de la fonction de calcul d'aire d'un diagramme
*/

/**
  * aire(Diag, Perm, S)
  * Calcule l'aire d'un diagramme en fonction d'une permutation
  * @arg Diag   Diagramme dont on veut calculer l'aire
  * @arg Perm   Permutation des dimensions
  * @arg S      Résultat du calcul de l'aire
**/

aire(Diag, Perm, S) :-
  aire(Diag, Perm, 0, S).

aire(Diag, [Dim1, Dim2 | Perm], Temp, S, FirstDim) :-
  max(Dim1, MD1),
  max(Dim2, MD2),
  value(Diag, Dim1, D1),
  value(Diag, Dim2, D2),
  Temp1 is (Temp + 1/2 * ( D1 / MD1 ) * ( D2 / MD2 )),
  aire(Diag, [Dim2 | Perm], Temp1, S, FirstDim).

aire(Diag, [LastDim | []], Temp, S, FirstDim) :-
  max(LastDim, MD1),
  max(FirstDim, MD2),
  value(Diag, LastDim, D1),
  value(Diag, FirstDim, D2),
  S is (Temp + 1/2 * ( D1 / MD1 ) * ( D2 / MD2 )).

aire(Diag, [Dim1, Dim2 | Perm], Temp, S) :-
  max(Dim1, MD1),
  max(Dim2, MD2),
  value(Diag, Dim1, D1),
  value(Diag, Dim2, D2),
  Temp1 is (Temp + 1/2 * ( D1 / MD1 ) * ( D2 / MD2 )),
  aire(Diag, [Dim2 | Perm], Temp1, S, Dim1).
