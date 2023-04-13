weight([],0).
weight([food(W,_,_)|T],TW) :- weight(T,W1), TW is W1+W.

calories([],0).
calories([food(_,C,_)|T],TC) :- calories(T,C1), TC is C1+C.

subseq([],[]).
subseq([H|T],[H|T1]) :- subseq(T,T1).
subseq(X,[_|T]) :- subseq(X,T).

knapsack(L,Capacity,Goal,Klist) :- subseq(L,S), weight(S,W1), W1=<Capacity, calories(S,C1), C1=<Goal.