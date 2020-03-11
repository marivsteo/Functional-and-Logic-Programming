%isPP(N - integer, R - integer)
%flow(i,o)
%isPP(n,r) = - true, n=r*r
%            - false, n=r
%            - isPP(n,r+1), otherwise
isPPwrap(N):- isPP(N, 0).

isPP(N, R):- N =:= R * R.

isPP(N,R):- N > R * R, R1 is R+1, isPP(N, R1).

isPP(N,R):- N < R * R, fail.

% Se da o lista de numere intregi. Scrieti un predicat care sa stearga
% toate elementele care sunt patrat perfect
% removePP(L - list, R - result list)
% flow(i, o)
% removePP(l1,l2,...,ln) = - [], l = []
%                          - l1 U removePP(l2,...,ln), l1 is not perfect
%                          square
%                          - removePP(l2,...,ln), l1 is perfect
%                          square
% removePP([3,9,2,5,16,4,3,49,0,6]).
% removePP([1,4,5,9,10,16,17,25,26,36,37]).
removePP([], []).
removePP([H|T],R):-isPPwrap(H),removePP(T,R).
removePP([H|T],R):-removePP(T,R1), R = [H|R1].
