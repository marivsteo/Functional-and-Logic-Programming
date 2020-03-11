%divisible(X - int, Y - int)

%flow(i,i)

%divisible(x,y)={false, x%y<>0
%                true, x%y=0
%                divisible(x,y+1), x>y+1

divisible(X,Y):-0 is X mod Y, !.
divisible(X,Y):-X>Y+1, divisible(X,Y+1).

%isPrime(X - int)

%flow(i)

%isPrime(x)={true, x=2
%            false, x<2
%            not(divisible(x,2)), otherwise

isPrime(2):-true,!.
isPrime(X):-X<2,!,false.
isPrime(X):-not(divisible(X,2)).


% 10. a. For a list of integer numbers, define a predicate to write twice in list every prime number.
%
% doublePrime(L - the input list, R - the resulting list)
%
% flow(i,o)
%
% doublePrime(l1,...,ln)={[], list is empty
%                         (l1,l1) U doublePrime(l2,...,ln), l1 is prime
%                         l1 U doublePrime(l2,...,ln), otherwise
%
doublePrime([],[]).
doublePrime([H|T],[H,H|R]):-isPrime(H),!,doublePrime(T,R).
doublePrime([H|T],[H|R]):-doublePrime(T,R).


% 10. b. For a heterogeneous list, formed from integer numbers and list
% of numbers, define a predicate to write in every sublist twice every
% prime number
%
% doublePrimeList(L - list, R - resulted list)
%
% flow(i,o)
%
% doublePrimeList(l1,...,ln)={[], list is empty
%                             doublePrime(l1) U
%                             doublePrimeList(l2,...,ln), l1 is list
%                             l1 U doublePrimeList(l2,...,ln), l1 is
%                             number
%doublePrimeList([[1,2,3,4,5],6,7,8,9,10],R).
doublePrimeList([],[]).
doublePrimeList([H|T],[Rs|R]):-is_list(H),doublePrime(H,Rs),doublePrimeList(T,R),!.
doublePrimeList([H|T],[H|R]):-doublePrimeList(T,R).
