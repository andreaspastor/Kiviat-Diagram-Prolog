aire([_ | []], [_ | []], S) :-
  write(S).

aire([A1, A2 | X], [B1, B2 | Y], S) :-
  S1 is (S + 1/2 * (A1/B1) * (A2/B2)),
  aire([A2 | X], [B2 | Y], S1).
