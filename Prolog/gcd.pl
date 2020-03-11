%9. b. Define a predicate to determine the greatest common divisor of all numbers from a list.

%gcd(X,Y - the two numbers for computing,
%    Z - the gcd of the two numbers)
%flow(i,i,o).

%gcd(x,y)={gcd(x-y,y), x>=y,
%          gcd(y-x,x), x<y}

gcd(0,X,X):-X>0,!.
gcd(X,Y,Z):-X>=Y,X1 is X-Y,gcd(X1,Y,Z).
gcd(X,Y,Z):-X<Y,X1 is Y-X,gcd(X1,X,Z).

%listGCD(L - the list of numbers,
%        R - the gcd of all numbers in the list)
%flow(i,o).
%
%listGCD(l1,...,ln)={1,l=[],
%                    gcd(l1,l2), n=2,
%                    listGCD(gcd(l1,l2),l3,...,ln), otherwise}
%
listGCD([],1).
listGCD([H,H1|T],R):-gcd(H,H1,X),listGCD([X|T],R).
listGCD([H1,H2],R):-gcd(H1,H2,R).
