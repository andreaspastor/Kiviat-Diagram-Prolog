/*aire(A, S) :-
  aireCalc(A, 0, S).

aireCalc([ (LastD, LastMD) | []], Acc, S, (FirstD, FirstMD)) :-
  S is (Acc + 1/2 * (LastD/LastMD) * (FirstD/FirstMD)).

aireCalc([(D1, MD1), (D2, MD2) | X], Acc, S, (FirstD, FirstMD)) :-
  Acc1 is (Acc + 1/2 * (D1/MD1) * (D2/MD2)),
  aireCalc([(D2, MD2) | X], Acc1, S, (FirstD, FirstMD)).

aireCalc([(D1, MD1), (D2, MD2) | X], Acc, S) :-
  Acc1 is (Acc + 1/2 * (D1/MD1) * (D2/MD2)),
  aireCalc([(D2, MD2) | X], Acc1, S, (D1, MD1)).*/

aireCalc(Diag, [Dim1, Dim2 | Perm], Temp, S, FirstDim) :-
  max(Dim1, MD1),
  max(Dim2, MD2),
  value(Diag, Dim1, D1),
  value(Diag, Dim2, D2),
  Temp1 is (Temp + 1/2 * ( D1 / MD1 ) * ( D2 / MD2 )),
  aireCalc(Diag, [Dim2 | Perm], Temp1, S, FirstDim).

aireCalc(Diag, [LastDim | []], Temp, S, FirstDim) :-
  max(LastDim, MD1),
  max(FirstDim, MD2),
  value(Diag, LastDim, D1),
  value(Diag, FirstDim, D2),
  S is (Temp + 1/2 * ( D1 / MD1 ) * ( D2 / MD2 )).

aireCalc(Diag, [Dim1, Dim2 | Perm], Temp, S) :-
  max(Dim1, MD1),
  max(Dim2, MD2),
  value(Diag, Dim1, D1),
  value(Diag, Dim2, D2),
  Temp1 is (Temp + 1/2 * ( D1 / MD1 ) * ( D2 / MD2 )),
  aireCalc(Diag, [Dim2 | Perm], Temp1, S, Dim1).

aire(Diag, Perm, S) :-
  aireCalc(Diag, Perm, 0, S).
