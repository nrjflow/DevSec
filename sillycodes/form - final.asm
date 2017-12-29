segment .data
org 256
Menu db 13,"  .------------------------------------------------------------------------.",13,10
db " /  .-.             ____  _                                            .-.  \ ",13,10
db "|  /   \           |  _ \(_)          Projet d'assembleur 2012/2013    /   \  |",13,10
db "| |\_.  |          | |_) |_  ___ _ ____   _____ _ __  _   _           |    /| |",13,10
db "|\|  | /|          |  _ <| |/ _ \ '_ \ \ / / _ \ '_ \| | | |          |\  | |/|",13,10
db "| `---' |          | |_) | |  __/ | | \ V /  __/ | | | |_| |          | `---' |",13,10
db "|       |          |____/|_|\___|_| |_|\_/ \___|_| |_|\__,_|          |       |",13,10
db "|       |-------------------------------------------------------------|       |",13,10
db " \     //= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =\\     /",13,10
db "  `---'/= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =\`---'  ",13,10   
db "    _ ||                                                               || _",13,10
db "   ( }||   Pour utiliser le programme, Veillez taper l'un de ces choix: ||{ )",13,10
db "    X ||    (NB: les entier saisis doivent etre compris entre 1 et 9)  || X",13,10
db "   (_}||                                                               ||{_)",13,10
db "    _ ||             1 : Pour afficher le Rectangle                    || _",13,10
db "   (_}||             2 : Pour afficher le Triangle                     ||{_)",13,10
db "    X ||             3 : Pour afficher le Triangle Inverse             || X",13,10
db "   (_}||             4 : Pour afficher la combinaison final            ||{_)",13,10
db "    _ ||             0 : Pour quitter                                  || _",13,10
db "   ( }||                                                               ||{ )",13,10
db "    X ||                                                               || X",13,10
db "   (_}||                          Encadre par: Mme Aouatif Amine       ||{_)",13,10
db "       \= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =/",13,10
db "        \= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =/",13,10,'$'

MsgClRect db 13,"Saisir le nombre de colonnes du rectangle",10,13,'$'
MsgLnRect db 13,"Saisir le nombre de lignes du rectangle",10,13,'$'
MsgClTrIn db 13,"Saisir le nombre de colonnes du triangle inverse",10,13,'$'
MsgLnTr db 13,"Saisir le nombre de lignes du triangle",10,13,'$'

QuitterYN db 13,"              ,''''''-.        ???",10,13
db "           `,X          `.      ???   ",10,13
db "           /` `           `._    ???  ",10,13
db "          (            ,   ,_\      ",10,13
db "          |          ,---.,'o `.    ",10,13
db "          |         / o   \     ) ",10,13
db "           \ ,.    (      .____,        ",10,13
db "            \| \    \____,'     \   ",10,13
db "          '`'\  \        _,____,' 			",10,13
db "         \  ,--      ,-'     \       Voulez vous quitter l'application ?",10,13
db "            ( C     ,'         \         'O' pour quitter",10,13
db "             `--'  .'           |         Autre touche pour revenir",10,13
db "               |   |         .O | ",10,13
db "             __|    \        ,-'_ ",10,13
db "            / `L     `._  _,'  ' `. ",13,10
db "           /    `--.._  `',.   _\  ` ",13,10
db "           `-.       /\  | `. ( ,\  \",13,10
db "          _/  `-._  /  \ |--'  (     \ ",13,10
db "         '  `-.   `'    \/\`.   `.    )",13,10
db "               \           \ `.  |    |",13,10,'$'

QuitterMsg db "     #####",13,10
db "    #### _\_  ________",13,10
db "    ##=-[.].]| \      \",13,10
db "    #(    _\ |  |------|",13,10
db "     #   __| |  ||||||||			Au revoir :)",13,10
db "      \  _/  |  ||||||||",13,10
db "   .--'--'-. |  | ____ |",13,10
db "  / __      `|__|[o__o]|",13,10
db "_(____nm_______ /____\____ ",13,10,10
db "				Realise par :",13,10,13,10
db "         |\\\\\\\|        ,,,,,        ______       \|||||/ ",13,10
db "         | _   _ |       |     |      |-    -|     ( ~   ~ )      .xxxx. ",13,10
db "        ( (o) (o) )      |<a <a|      |O    O|    @( 0   0 )@    |(o)(o)| ",13,10
db "         |  . .  |      (|  ^  |)     |  ^   |     (   C   )     | (__) |",13,10
db "          \  _  /        | -=- |      |  --  |      \ \_/ /       | __ |",13,10
db "           \___/          \___/        \||||/        |___|         \__/",13,10
db "	     		  |   |",13,10
db "          Soufiane         Hamza         Khalid     Mohamed       Soufyane",13,10
db "         El AISSAOUI    EL HASSNAOUI    ERRAOUCHA  BOUTJANGOUT     TAROU",13,10,'$'

HorsChoixMsg db "          , ,\ ,'\,'\ ,'\ ,\ , ",10,13
db "    ,  ;\/ \' `'     `   '  /| ",10,13
db "    |\/                      | ",10,13
db "    :                        | ",10,13
db "    :                        | ",10,13
db "     |                       | 		Serieusement !",10,13
db "     |                       |     Veuillez entrer un choix valide !",10,13
db "     :               -.     _| 	",10,13
db "      :                \     `. ",10,13
db "      |         ________:______\ ",10,13
db "      :       ,'o       / o    ; ",10,13
db "      :       \       ,'-----./ ",10,13
db "       \_      `--.--'        ) ",10,13
db "      ,` `.              ,---'| ",10,13
db "      : `                     | ",10,13
db "       `,-'                   | ",10,13
db "       /      ,---.          ,' ",10,13
db "    ,-'            `-,------' ",10,13
db "   '   `.        ,--' ",10,13
db "         `-.____/ ",10,13
db "                \ ",10,13,'$'

LnRect db 0
ClRect db 0
LnTr db 0
ClTrIn db 0

BorderDist db 0
BorderDistIn db 0
BorderDistRect db 0


segment .bss
segment .text
global _main
_main:
	call vider_ecran
	mov ah,09h			;fonction d'affichage ecran de la chaine de caract�re contenu dans edx
	mov edx,Menu
	int 21h
	
	mov ah,01h
	int 21h
	
	cmp al,'1'
	je case1
	cmp al,'2'
	je case2
	cmp al,'3'
	je case3
	cmp al,'4'
	je case4
	cmp al,'0'
	je case0
	jmp horsChoix
	
	case1:
	call SaisirLnRect
	call SaisirClRect
	
	mov ah,03h
	int 10h
	dec dl	
	mov ah,02h
	int 10h
	call rectangle
	mov ah,08h
	int 21h	
	call vider_ecran
	jmp Q_Quitter
	
	case2:
	call SaisirLnTr
	mov ah,03h
	int 10h
	dec dl	
	mov ah,02h
	int 10h
	call Triangle
	mov ah,08h
	int 21h	
	call vider_ecran
	jmp Q_Quitter
	
	case3:
	call SaisirClTrIn
	mov ah,03h
	int 10h
	dec dl	
	mov ah,02h
	int 10h
	call TriangleInverse
	mov ah,08h
	int 21h		
	call vider_ecran
	jmp Q_Quitter

	case4:
	call SaisirLnRect
	call SaisirClRect
	call SaisirLnTr
	call SaisirClTrIn
	call Combinaison
	mov ah,08h
	int 21h	
	call vider_ecran
	jmp Q_Quitter
	
	case0:
	call vider_ecran
	jmp Q_Quitter
	
	horsChoix:
	call vider_ecran
	mov edx,HorsChoixMsg
	mov ah,09h
	int 21h
	mov ah,08h
	int 21h
	jmp _main
	end:
ret




SaisirLnRect:
	mov ah,09h			;fonction d'affichage ecran de la chaine de caract�re contenu dans edx
	mov edx,MsgLnRect
	int 21h				;interuption DOS

	mov ah,01h			;fonction d'entr�e clavier
	int 21h				;interuption DOS

	sub al,30h
	cmp al,0
	je SaisirLnRect
	mov [LnRect],al
	
	mov ah,02			;fonction d'affichage ecran du caract�re contenu dans dl
	mov dl,0Ah			;retoure � la ligne
	int 21h				;interuption DOS


ret

SaisirLnTr:
	mov ah,09h			;fonction d'affichage ecran de la chaine de caract�re contenu dans edx
	mov edx,MsgLnTr
	int 21h				;interuption DOS

	mov ah,01h			;fonction d'entr�e clavier
	int 21h				;interuption DOS

	sub al,30h
	cmp al,0
	je SaisirLnTr
	mov [LnTr],al

	mov ah,02			;fonction d'affichage ecran du caract�re contenu dans dl
	mov dl,0Ah			;retoure � la ligne
	int 21h				;interuption DOS


ret

SaisirClTrIn:
	mov ah,09h			;fonction d'affichage ecran de la chaine de caract�re contenu dans edx
	mov edx,MsgClTrIn
	int 21h				;interuption DOS

	mov ah,01h			;fonction d'entr�e clavier
	int 21h				;interuption DOS

	sub al,30h
	cmp al,0
	je SaisirClTrIn
	mov [ClTrIn],al

	mov ah,02			;fonction d'affichage ecran du caract�re contenu dans dl
	mov dl,0Ah			;retoure � la ligne
	int 21h				;interuption DOS


ret

SaisirClRect:
	mov ah,09h
	mov edx,MsgClRect
	int 21h

	mov ah,01h
	int 21h

	sub al,30h
	cmp al,0
	je SaisirClRect
	mov [ClRect],al

	mov ah,02
	mov dl,0Ah
	int 21h

ret


Q_Quitter:
	mov edx,QuitterYN
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	cmp al,'o'
	jne _main
	jmp Quitter
	cmp al,'O'   ; il faut considerer l'entrée en majiscule et en miniscule vue que les code ASCII sont differente
	jne _main
	jmp Quitter
ret
Quitter:
	call vider_ecran
	mov edx,QuitterMsg
	mov ah,09h
	int 21h
	
	mov ah,08h
	int 21h	
ret
TriangleInverse:	
	
	xor cx,cx
	xor bh,bh
	mov cl,[ClTrIn]	

	mov ah,02h
	int 10h	
	BoucleTrIn:

		
		mov al,'*'
		mov ah,0Ah
		int 10h

		cmp cx,1
		
		je endTrIn
		
		mov ah,02h
		mov dl,0Ah
		int 21h
	loop BoucleTrIn
	endTrIn:
ret


Triangle:
	xor cx,cx
	xor bh,bh
	mov cx,1
	mov bl,[LnTr]

	mov ah,02h
	int 10h
	BoucleTr:

		
		mov al,'*'
		mov ah,0Ah
		int 10h
				
		inc cx
		
		dec bl
		
		mov ah,02h
		mov dl,0Ah
		int 21h
		
		cmp bl,0		
		je endTr		
		jmp BoucleTr
	endTr:
ret


rectangle:

	xor cx,cx
	xor bh,bh
	mov cl,[ClRect]
	mov bl,[LnRect]
	
	mov ah,02h
	int 10h

	LigneRect:

		
		mov al,'*'
		mov ah,0Ah
		int 10h
		
		dec bl
		cmp bl,0
		
		je endRect
		
		mov ah,02h
		mov dl,0Ah
		int 21h
		
		
		jmp LigneRect
	endRect:
	
ret

vider_ecran :
	mov ah,00h
	mov al,03h		;video mode 80x25 16 color text
	int 10H
ret

Combinaison:
	call vider_ecran
	mov al,[LnTr]
	cmp al,[ClTrIn]
	jg CombinaisonLnTrGEClTrIn
	jle CombinaisonClTrInGLnTr

ret
CombinaisonLnTrGEClTrIn:
	
	
	xor dx,dx
	call Triangle
	
	mov ah,03h
	int 10h
	mov dl,[LnTr]
	call rectangle
	
	mov dh,[LnTr]
	sub dh,[ClTrIn]
	mov dl,[ClRect]
	add dl,[LnTr]
	call TriangleInverse
	
	mov dl,[LnTr]
	sub dl,[ClTrIn]
	mov dh,[LnRect]
	add dh,[LnTr]
	call TriangleInverse
	
	mov dl,[LnTr]
	add dl,[ClRect]
	mov dh,[LnTr]
	add dh,[LnRect]
	
	xor ax,ax
	mov al,[LnTr]
	add al,[LnTr]
	add al,[LnRect]
	cmp al,27
	jne OK
	sub dh,1

	OK:
	call Triangle
ret

CombinaisonClTrInGLnTr:
 
	xor dx,dx
	
	mov dl,[ClTrIn]
	sub dl,[LnTr]
	mov dh,[ClTrIn]
	sub dh,[LnTr]	
	call Triangle
	
	mov ah,03h
	int 10h
	mov dl,[ClTrIn]
	call rectangle
	
	mov dh,0
	mov dl,[ClRect]
	add dl,[ClTrIn]
	call TriangleInverse
		
	mov dl,0
	mov dh,[LnRect]
	add dh,[ClTrIn]
	call TriangleInverse
	

	
	mov dl,[ClTrIn]
	add dl,[ClRect]
	mov dh,[ClTrIn]
	add dh,[LnRect]

	xor ax,ax
	mov al,[ClTrIn]
	add al,[ClTrIn]
	add al,[LnRect]
	cmp al,26
	jne etiq27
	sub dh,1
	etiq27:
	cmp al,27
	jne OK2
	sub dh,2

	OK2:
	call Triangle
ret
