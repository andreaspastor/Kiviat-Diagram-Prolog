/* LOG HISTORY
cd403ca	Antonin Arquey	Fri Jan 5 15:42:55 2018 +0100	Correction de bug calcul de somme des aires + ajout de commentaires
5af2965	Andréas PASTOR	Thu Jan 4 19:52:32 2018 +0100	add clockwise/anticlokwise symmetry management
eb07473	Andréas PASTOR	Thu Jan 4 17:48:06 2018 +0100	add axes
d4a67fd	Andréas PASTOR	Thu Jan 4 17:33:11 2018 +0100	add cycle reduction
a9bd086	Antonin Arquey	Sun Dec 24 16:47:41 2017 +0100	Calcul du meilleur alignement de diagrammes pour maximiser leur similarités
4de5943	Antonin Arquey	Thu Dec 14 15:02:15 2017 +0100	Reccherche de la permutation minimisant l'aire des diagrammes
6c1b604	Antonin Arquey	Wed Dec 13 16:05:52 2017 +0100	Ajout de predicat stockant les données et calculs des aires pour chaque permutations des diagrammes
98ff045	Antonin Arquey	Fri Dec 8 11:36:08 2017 +0100	Ajout de fonctions sur les listes et fonction trouvant la meilleur permutation pour un diagramme
bf2b482	Antonin Arquey	Thu Dec 7 14:24:32 2017 +0100	Création de la fonction de calcul d'aire d'un diagramme
*/

:- include('./aire.pl').
:- include('./list_utils.pl').
:- include('./data.pl').
:- include('./similarity.pl').

:- initialization main.
main :-
  % Données
  ListeDim = [dim2, dim3, dim4, dim5, dim6, dim7, dim8, dim9], % Ne pas mettre la premiere dimension !
  ListeDiag = [diag1, diag2, diag3, diag4],

  % Calcul des permutations et des aires
  findall((S, X), ( permutation(ListeDim, Y), append([dim1], Y, X), [_,I2|_] = X, reverse(X,RX), [In|_] = RX, indexes(I2, E2), indexes(In,En), E2 < En,
    findall(AireValue, ( member(Diag, ListeDiag), aire(Diag, X, AireValue) ), S)
  ), Areas),

  % Recherche de la meilleure permutation maximisant l'aire
  find_max_sum(Areas, MaxAire, MaxPerm),
  format("Permutation donnant une aire maximale ~3f pour les diagrammes : ", MaxAire),
  writeln(MaxPerm),

  % Calcul des permutations et des similarités
  findall(D, permutation(ListeDiag, D), PermDiags),
  findall((Pdiag, Val), ( member(Pdiag, PermDiags), sq_diff_list(Pdiag, MaxPerm, Val) ), ListeGrid),

  % Recherche du meilleur alignement
  find_best_grid(ListeGrid, BestGrid),
  format("Alignement de diagrammes donnant la meilleure similarité entre deux diagrammes voisins : "),
  writeln(BestGrid),
  halt.
main :- halt(1).
