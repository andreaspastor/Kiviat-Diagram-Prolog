sum_list(L, S) :-
  sum_list(L, 0, S).

sum_list([X | L], Temp, S) :-
  Temp1 is Temp + X,
  sum_list(L, Temp1, S).

sum_list([X | []], Temp, S) :-
  S=Temp+X.

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
