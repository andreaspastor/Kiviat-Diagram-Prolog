
max_list([(X, _)|Xs],Max,Index):-
    max_list(Xs,X,0,0,Max,Index).

max_list([],OldMax,OldIndex,_, OldMax, OldIndex).

max_list([(X,_)|Xs],OldMax,_,CurrentIndex, Max, Index):-
    X > OldMax,
    NewCurrentIndex is CurrentIndex + 1,
    NewIndex is NewCurrentIndex,
    max_list(Xs, X, NewIndex, NewCurrentIndex, Max, Index).

max_list([(X,_)|Xs],OldMax,OldIndex,CurrentIndex, Max, Index):-
    X =< OldMax,
    NewCurrentIndex is CurrentIndex + 1,
    max_list(Xs, OldMax, OldIndex, NewCurrentIndex, Max, Index).

getListe([(_, P) | _], 0, R) :-
  R=P.

getListe([(_,_) | X], I, R) :-
  I1 is I-1,
  getListe(X, I1, R).
