% is member or not
member1(X, [X|*]).
member1(X, [*|T]) :- member1(X, T).

% first element of a list
first([X|_],X).

% last element of a list
last([X],X).
last([_|T],X) :- last(T,X).

% two adjacent elements of a list

adjacent(X,Y,[X,Y|*]).
adjacent(X,Y,[*|T]) :- adjacent(X,Y,T).

% three adjacent elements of a list

adjacent3(X,Y,Z,[X,Y,Z|*]).
adjacent3(X,Y,Z,[*|T]) :- adjacent3(X,Y,Z,T).

% display a list

display([X],X).
display(X,X).

% append two lists

append1([], L2, L2).
append1([H|T1], L2, [H|L3]):-append1(T1, L2, L3).

% reverse a list

reverse1([],[]).
reverse1([H|T],L) :- reverse1(T,L1), append1(L1,[H],L).

% check if a list is a palindrome

palindrome(L) :- reverse1(L,L).

% listminuslist

listminuslist(L1,L2,L3):- append(L2,L3, L1).

% delete an ekement from a list

delete1(X,[X|T],T).
delete1(X,[H|T],[H|T1]) :- delete1(X,T,T1).

% insert an element into a list

insert1(X,L1,L2) :- delete1(X,L2,L1).

% remove one occurence of an element from a list
select(e, [1,e,3,4,5], L).

% sublist

sublist(S,L) :- append1(*,L2,L), append1(S,*,L2).

% other sublist method

append3(L1,L2,L3,L):-append1(L1,L2,L12),append1(L12,L3,L).
sublist(SL,L):-append3(*,SL,*,L).

% store all solutions in a list

prog(A,B,X).
findall(X,prog(A,B,X),L). % use this list to find the largest

% find negative numbers in a list

nel(L,E):-member1(E,L),E<0.
negList(L,NegList):-findall(E,nel(L,E),NegList).
setNeg(L,NegSet):-setof(E,nel(L,E),NegSet).

% forall predicate

allPos(L):- forall(member1(E,L),E>0).

% permutation

perm([],[]).
perm([H|T],L) :- perm(T,L1), insert1(H,L1,L).

% naive reverse(n^2)

nrev([],[]).
nrev([H|T],Rev) :- nrev(T,RT), append1(RT,[H],Rev).

% 8 queens problem

nocheck(_,[]).
nocheck(X/Y, [X1/Y1 | Rest]):- X =\= X1, Y =\= Y1, abs(X-X1) =\= abs(Y-Y1), nocheck(X/Y, Rest).

legal([]).
legal([X/Y|Rest]) :- legal(Rest), member(X, [1,2,3,4,5,6,7,8]), member(Y, [1,2,3,4,5,6,7,8]) , nocheck(X/Y, Rest).

eightqueens(X):- X=[1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_], legal(X).
