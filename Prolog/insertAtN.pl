%9. a. Insert an element on the position n in a list
%insertAt(El - the element to be inserted,
%         Pos - the position for inserting,
%         L - initial list,
%         R - resulted list)
%flow(i,i,i,o)

%insertAt(El,Pos,l1,...,ln)={[],l=[],
%                            El U l1,...,ln, Pos=0,
%                            insertAt(El,Pos-1,l2,...,ln), otherwise}
insertAt(_El,_Pos,[],[]).
insertAt(El,0,L,[El|L]).
insertAt(El,Pos,[E|L],[E|ZL]):-Pos1 is Pos-1,insertAt(El,Pos1,L,ZL).
