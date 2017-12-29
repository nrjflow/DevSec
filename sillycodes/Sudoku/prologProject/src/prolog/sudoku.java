package prolog;
import jpl.*;
public class sudoku {

	public static int state = 0;

	public static String[][] resoudre(String rows) {
		//Consulter le ficher prolog
		Query q1 = new Query("consult('sudoku.pl')");
		if ( !q1.hasSolution() ){
			System.out.println( "consult('sudoku') failed" );
			System.exit( 1 );
		}
		
		//construire la requete
		String P="Rows=["+rows+"],sudoku(Rows).";
		Query q2 = new Query(P);
		//recuperer le resultat contenu dans la variable Rows
		Term listOfLists = (Term) q2.oneSolution().get("Rows");
		
		int i=0,j=0;
		//La matrice qui va contenir le resultat
		String[][] Res=new String [9][9];
		//Le resultat est une liste des listes, on prend chaque liste de Rows contenu dans listOfLists;
		for (Term oneList : listOfLists.toTermArray()) {
			//puis on prend chaque valeur de la liste extraite de listOfLists
			for (Term oneElem : oneList.toTermArray()) {
				  Res[i][j]=oneElem.toString();
				  j++;
				  j=(j==9?0:j);
			}
			i++;
			i=(i==9?0:i);
		}
		
		return Res;
	}

}
