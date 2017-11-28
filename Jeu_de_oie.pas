{Jeu de l'oie : le jeu se joue seul. Le joueur est caractérisé par un nombre : place 
(variable), avec des cases comprises entre 0 et 66, qui situe sa position sur le plateau.
Après un jet des 2 dés, on applique règles suivantes : 
- On avance du nombre de cases indiquées par la somme des dés.
- Si on arrive pile sur la case 66, le jeu est terminé, sinon, on recule.
- Une oie toute les neuf cases, sauf en 63, double le déplacement en cours (le joueur
ne finira jamais son tour sur un multiple de 9).
- Une tête de mort à la case 58 renvoie à la position de départ case 0.

On s'efforcera d'utiliser au maximum l'emploie de constantes.
Production d'un algo et d'un programme lisible et clair (avec commentaires).
Vérifier que le jet de dé est valide.
Modulo pour test multiple de 9.

Modifs possibles :
-Randomn pour jets de dés.

Algorithme: Jeu_de_oie
//BUT: Réaliser un jeu de l'oie
//ENTREE: Le jet de dés sera réalisé grace à une saisi de l'utilisateur
//SORTIE: La victoire une fois que le joueur aura atteint la case 66

	CONST
		tête <- 58 : ENTIER
		arriver <- 66 : ENTIER

	VAR
		dé1, dé2, somme, place, recul :ENTIER

DEBUT
// Le déplacement manuel du joueur	
	REPETER
		ECRIRE "Ecrivez la valeur du premier dé."
		LIRE dé1
		ECRIRE "Le second dé sera lancé."
		LIRE dé2
		somme <- dé1 + dé2
		SI (somme >= 2 ET somme <= 12)
			ALORS place <- place + somme
		SINON
			ECRIRE "Veuillez entrer une valeur valide"
		FIN SI

// La case tête de mort
		SI (place = tête )
		ALORS
			place = 0
		FIN SI

// L'arriver à la case 66
		SI (place > arriver)
		ALORS 
			recul <- place - arriver
			place <- arriver - recul
		FIN SI
// Les cases oies
		TANT QUE ((place <> 63) ET (place MOD 9=0) ET (place <= arriver))
			FAIRE place <- place + somme
		FIN TANT QUE
// Montrer au joueur où est-il positionner
		ECRIRE ("Vous etes sur la case :", place)
	JUSQU'A (place = arriver)
	ECRIRE "Vous avez gagnez.....le droit de recommencer :)"
 }

 PROGRAM Jeu_de_oie;

 USES crt;

 CONST
    tete = 58;
    arriver = 66;

 VAR
 	de1, de2, somme, place, recul : integer;

 BEGIN
 	clrscr;
 	repeat

 		// Le déplacement manuel du joueur	
 		writeln ('Ecrivez la valeur du premier de :');
 		readln (de1);
 		writeln ('Ecrivez la valeur du second de :');
 		readln (de2);

 		somme := de1 + de2;

 		if (somme >= 2) AND (somme <= 12) then
 			place := place + somme
 		else
 			writeln ('Veuillez ecrire une valeur valide !');

 		// La case tête de mort	

 		if (place = tete) then
 			place := 0;

 		// L'arriver à la case 66	

 		if (place > arriver) then
 			begin
 			recul := place - arriver;
 			place := arriver - recul
 			end;

 		// 	Les cases des oies

 		while (place <> 63) AND (place Mod 9 = 0) AND (place <= arriver) do
 			place := place + somme;

 		// Montrer au joueur où est-il positionner

 		writeln ('Vous etes sur la case :', place);

 	until (place = arriver);

 	writeln ('Vous avez gagnez.....le droit de recommencer :)');

 	readln
END.