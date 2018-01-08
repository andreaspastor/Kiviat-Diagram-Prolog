:- include('./test.pl').

:- initialization main.

main :- run_tests, halt.
main :- halt(1).
