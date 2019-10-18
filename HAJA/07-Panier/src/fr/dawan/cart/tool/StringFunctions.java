package fr.dawan.cart.tool;

public class StringFunctions {

	 /**
     * Met le premier caract�re en majuscule
     * @param string
     * La cha�ne d'entr�e
     * @return
     * Retourne la cha�ne string apr�s avoir remplac� le premier caract�re par sa majuscule, si le premier caract�re est alphab�tique.
     */
    public static String ucFirst(String string){
        if(!string.equals(""))
            return string.substring(0, 1).toUpperCase()+ string.substring(1).toLowerCase();
        else
            return "";
    }
    
}
