sudoku([[A11,A12,A13,A14],
	   [A21,A22,A23,A24],
	   [A31,A32,A33,A34],
	   [A41,A42,A43,A44]]):-
		  ligne(A11,A12,A13,A14),
		  ligne(A21,A22,A23,A24),
		  carre(A11,A12,A21,A22),
		  carre(A13,A14,A24,A23),

		  ligne(A31,A32,A33,A34),
		  ligne(A41,A42,A43,A44),
		  carre(A31,A32,A41,A42),
		  carre(A33,A34,A43,A44),

		  colonne(A11,A21,A31,A41),
		  colonne(A12,A22,A32,A42),
		  colonne(A13,A23,A33,A43),
		  colonne(A14,A24,A34,A44).

ligne(A1,A2,A3,A4):- perm([A1,A2,A3,A4],[1,2,3,4]).

colonne(B1,B2,B3,B4):- is_set([B1,B2,B3,B4]).

carre(C1,C2,C3,C4):- is_set([C1,C2,C3,C4]).

insert(X,R,[X|R]).
insert(X,[F|S],[F|R]):-insert(X,S,R).

perm(Perm,[Head|Rest]):- perm(Tmp,Rest),insert(Head,Tmp,Perm).
perm([],[]).

