:- include('./aire.pl').
:- include('./list_utils.pl').

/*maxListeReturn(X, I) :-
  maxListe(X, 0, 0, 0, I).

maxListe([], _, _, IndiceMax, I) :-
  I is IndiceMax.

maxListe([A | X], 0, 0, 0, I) :-
  format('MaxListe 0 : ~w\n', A),
  maxListe(X, A, 0, 0, I).

maxListe([A | X], Max, Indice, IndiceMax, I) :-
  A <= Max,
  format('Je suis inferieure\n'),
  NewIndice is Indice+1,
  format('AireMax : ~w\n', Max),
  maxListe(X, Max, NewIndice, IndiceMax, I).

maxListe([A | X], Max, Indice, IndiceMax, I) :-
  A > Max,
  format('Je suis superieure\n'),
  NewIndice is Indice+1,
  NewIndiceMax is NewIndice,
  format('AireMax : ~w\n', A),
  maxListe(X, A, NewIndice, NewIndiceMax, I).
*/




:- initialization main.
main :-
  findall(Perm, permutation([(1, 1), (1, 8), (1,1), (1,8)], Perm), Perms),
  computeAllAreas(Perms, Rep),
  max_list(Rep, Max, I),
  getListe(Perms, I, BestPerm),
  format('Best permutation : '),
  writeln(BestPerm),
  format('Max aire : '),
  writeln(Max),
  halt.
main :- halt(1).
