:- use_module(library(clpfd)).
 
sudoku(Lignes) :-
        length(Lignes, 9),
        ligne(Lignes),
        colonne(Lignes),
        carres(Lignes),
		maplist(writeln,Lignes).
 
 
ligne(Ls):- append(Ls, Vs), Vs ins 1..9,
           maplist(all_distinct, Ls).

colonne(Ls):-transpose(Ls, Colonnes), maplist(all_distinct, Colonnes).

carres(Ls):- Ls = [L1,L2,L3,L4,L5,L6,L7,L8,L9],
        	carre(L1, L2, L3), carre(L4, L5, L6), carre(L7, L8, L9).

carre([], [], []).
carre([V1,V2,V3|C1], [V4,V5,V6|C2], [V7,V8,V9|C3]) :-
        all_distinct([V1,V2,V3,V4,V5,V6,V7,V8,V9]),
        carre(C1, C2, C3).
 
