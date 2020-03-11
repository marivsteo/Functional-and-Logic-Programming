% mainSubstitute(L : List, I: Int, R: List)
% mainSubstitute(i, i, o)
% mainSubstitute(l1...ln, i) =
%  - [] , n =0
%  - factorialProduct(i) U mainSubstitute(l2...ln, i+1), i mod 2 = 1
%  - l1 U mainSubstitute(l2...ln, i+1), otherwise
%  factorialProduct(N: Integer, R integer)
%  factorialProduct(i, o)
%  factorialProduct(n) =
%   - 1, n =0
%   - n * factorialProduct(n-1), otherwise
%   mainS(L: List, R: List)
%   mainS(i, o)
%   mainS(l1..ln) = mainSubstitute(l1..ln, 1)
factorialProduct(0, 1).
factorialProduct(N, R):-N2 is N-1, factorialProduct(N2, R2), R is R2*N.
mainSubstitute([], _, []).
mainSubstitute([H|T], I, [H|R]):-I mod 2 =:= 0,
    I2 is I+1,
    mainSubstitute(T, I2, R).
mainSubstitute([_|T], I, [F|R]):-I mod 2 \= 1,
    I2 is I+1,
    factorialProduct(I, F),
    mainSubstitute(T, I2, R).
mainS([],[]).
mainS(L, R):-mainSubstitute(L, 1, R).


