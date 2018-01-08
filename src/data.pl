/* LOG HISTORY
8875add	Antonin Arquey	Thu Dec 14 15:32:07 2017 +0100	Ajout de commentaires
6c1b604	Antonin Arquey	Wed Dec 13 16:05:52 2017 +0100	Ajout de predicat stockant les données et calculs des aires pour chaque permutations des diagrammes
98ff045	Antonin Arquey	Fri Dec 8 11:36:08 2017 +0100	Ajout de fonctions sur les listes et fonction trouvant la meilleur permutation pour un diagramme
bf2b482	Antonin Arquey	Thu Dec 7 14:24:32 2017 +0100	Création de la fonction de calcul d'aire d'un diagramme5af2965	Andréas PASTOR	Thu Jan 4 19:52:32 2018 +0100	add clockwise/anticlokwise symmetry management
eb07473	Andréas PASTOR	Thu Jan 4 17:48:06 2018 +0100	add axes
a9bd086	Antonin Arquey	Sun Dec 24 16:47:41 2017 +0100	Calcul du meilleur alignement de diagrammes pour maximiser leur similarités
8875add	Antonin Arquey	Thu Dec 14 15:32:07 2017 +0100	Ajout de commentaires
6c1b604	Antonin Arquey	Wed Dec 13 16:05:52 2017 +0100	Ajout de predicat stockant les données et calculs des aires pour chaque permutations des diagrammes
*/

/**
  * Dimensions
  * Dimension, Valeur Max de la dimension
**/

max(dim1, 4).
max(dim2, 5).
max(dim3, 8).
max(dim4, 5).
max(dim5, 12).
max(dim6, 2).
max(dim7, 14).
max(dim8, 5).
max(dim9, 7).

/**
  * Index des axes correspondants
  * Dimension, Index
**/

indexes(dim1, 1).
indexes(dim2, 2).
indexes(dim3, 3).
indexes(dim4, 4).
indexes(dim5, 5).
indexes(dim6, 6).
indexes(dim7, 7).
indexes(dim8, 8).
indexes(dim9, 9).

/**
  * Diagrammes
  * Nom du diagramme, Dimension, Valeur
**/

value(diag1, dim1, 4).
value(diag1, dim2, 1).
value(diag1, dim3, 2).
value(diag1, dim4, 2).
value(diag1, dim5, 2).
value(diag1, dim6, 2).
value(diag1, dim7, 2).
value(diag1, dim8, 2).
value(diag1, dim9, 2).


value(diag2, dim1, 3).
value(diag2, dim2, 5).
value(diag2, dim3, 8).
value(diag2, dim4, 3).
value(diag2, dim5, 3).
value(diag2, dim6, 1).
value(diag2, dim7, 2).
value(diag2, dim8, 2).
value(diag2, dim9, 2).

value(diag3, dim1, 3).
value(diag3, dim2, 2).
value(diag3, dim3, 3).
value(diag3, dim4, 5).
value(diag3, dim5, 5).
value(diag3, dim6, 0).
value(diag3, dim7, 2).
value(diag3, dim8, 2).
value(diag3, dim9, 2).

value(diag4, dim1, 1).
value(diag4, dim2, 1).
value(diag4, dim3, 1).
value(diag4, dim4, 1).
value(diag4, dim5, 5).
value(diag4, dim6, 0).
value(diag4, dim7, 2).
value(diag4, dim8, 2).
value(diag4, dim9, 2).
