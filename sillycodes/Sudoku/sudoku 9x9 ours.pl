:- use_module(library(clpfd)).

sudoku([L1,L2,L3,L4,L5,L6,L7,L8,L9]) :-
[L1,L2,L3,L4,L5,L6,L7,L8,L9]=[[A11,A12,A13, A14,A15,A16, A17,A18,A19],
						     [A21,A22,A23, A24,A25,A26, A27,A28,A29],
						     [A31,A32,A33, A34,A35,A36, A37,A38,A39],

						     [A41,A42,A43, A44,A45,A46, A47,A48,A49],
						     [A51,A52,A53, A54,A55,A56, A57,A58,A59],
						     [A61,A62,A63, A64,A65,A66, A67,A68,A69],

						     [A71,A72,A73, A74,A75,A76, A77,A78,A79],
						     [A81,A82,A83, A84,A85,A86, A87,A88,A89],
						     [A91,A92,A93, A94,A95,A96, A97,A98,A99]],

	    L1 ins 1..9,L2 ins 1..9,L3 ins 1..9,L4 ins 1..9,L5 ins 1..9,
	    L6 ins 1..9,L7 ins 1..9,L8 ins 1..9,L9 ins 1..9,

		ligne([A11,A12,A13,A14,A15,A16,A17,A18,A19]),
	    ligne([A21,A22,A23,A24,A25,A26,A27,A28,A29]),
	    ligne([A31,A32,A33,A34,A35,A36,A37,A38,A39]),
	    ligne([A41,A42,A43,A44,A45,A46,A47,A48,A49]),
	    ligne([A51,A52,A53,A54,A55,A56,A57,A58,A59]),
	    ligne([A61,A62,A63,A64,A65,A66,A67,A68,A69]),	    
	    ligne([A71,A72,A73,A74,A75,A76,A77,A78,A79]),
	    ligne([A81,A82,A83,A84,A85,A86,A87,A88,A89]),
	    ligne([A91,A92,A93,A94,A95,A96,A97,A98,A99]),

		carre([A11,A12,A13,A21,A22,A23,A31,A32,A33]),
	    carre([A14,A15,A16,A24,A25,A26,A34,A35,A36]),
	    carre([A17,A18,A19,A27,A28,A29,A37,A38,A39]),
	    carre([A41,A42,A43,A51,A52,A53,A61,A62,A63]),
	    carre([A44,A45,A46,A54,A55,A56,A64,A65,A66]),
	    carre([A47,A48,A49,A57,A58,A59,A67,A68,A69]),
	    carre([A71,A72,A73,A81,A82,A83,A91,A92,A93]),
	    carre([A74,A75,A76,A84,A85,A86,A94,A95,A96]),
	    carre([A77,A78,A79,A87,A88,A89,A97,A98,A99]),

		colonne([A11,A21,A31,A41,A51,A61,A71,A81,A91]),
	    colonne([A12,A22,A32,A42,A52,A62,A72,A82,A92]),
	    colonne([A13,A23,A33,A43,A53,A63,A73,A83,A93]),
	    colonne([A14,A24,A34,A44,A54,A64,A74,A84,A94]),
	    colonne([A15,A25,A35,A45,A55,A65,A75,A85,A95]),
	    colonne([A16,A26,A36,A46,A56,A66,A76,A86,A96]),
	    colonne([A17,A27,A37,A47,A57,A67,A77,A87,A97]),
	    colonne([A18,A28,A38,A48,A58,A68,A78,A88,A98]),
	    colonne([A19,A29,A39,A49,A59,A69,A79,A89,A99]),
	   	label(L1),
	    label(L2),
	    label(L3),
	    label(L4),
	    label(L5),
	    label(L6),
	    label(L7),
	    label(L8),
		label(L9),
		writeln([A11,A12,A13,A14,A15,A16,A17,A18,A19]),
	    writeln([A21,A22,A23,A24,A25,A26,A27,A28,A29]),
	    writeln([A31,A32,A33,A34,A35,A36,A37,A38,A39]),
	    writeln([A41,A42,A43,A44,A45,A46,A47,A48,A49]),
	    writeln([A51,A52,A53,A54,A55,A56,A57,A58,A59]),
	    writeln([A61,A62,A63,A64,A65,A66,A67,A68,A69]),
	    writeln([A71,A72,A73,A74,A75,A76,A77,A78,A79]),
	    writeln([A81,A82,A83,A84,A85,A86,A87,A88,A89]),
	    writeln([A91,A92,A93,A94,A95,A96,A97,A98,A99]).
	    
ligne(L):- all_distinct(L).

colonne(C):- all_distinct(C).

carre(R):- all_distinct(R).