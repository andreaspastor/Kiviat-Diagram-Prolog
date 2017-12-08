aire(A, S) :-
  aireCalc(A, 0, S).

aireCalc([ (LastD, LastMD) | []], Acc, S, (FirstD, FirstMD)) :-
  S is (Acc + 1/2 * (LastD/LastMD) * (FirstD/FirstMD)).

aireCalc([(D1, MD1), (D2, MD2) | X], Acc, S, (FirstD, FirstMD)) :-
  Acc1 is (Acc + 1/2 * (D1/MD1) * (D2/MD2)),
  aireCalc([(D2, MD2) | X], Acc1, S, (FirstD, FirstMD)).

aireCalc([(D1, MD1), (D2, MD2) | X], Acc, S) :-
  Acc1 is (Acc + 1/2 * (D1/MD1) * (D2/MD2)),
  aireCalc([(D2, MD2) | X], Acc1, S, (D1, MD1)).


computeAllAreas(X, Rep) :-
  computeAllAreas(X, [], Rep).

computeAllAreas([], Temp, Rep) :-
  Rep = Temp.

computeAllAreas([X | L], [], Rep) :-
  aire(X, S),
  computeAllAreas(L, [S], Rep).

computeAllAreas([X | L], Temp, Rep) :-
  aire(X, S),
  computeAllAreas(L, [S | Temp], Rep).
