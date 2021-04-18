package exercise3;
import java.util.ArrayList;
import java.util.Collections;

public class list {
    public ArrayList<Integer> integerList = new ArrayList<Integer>();

    public String toString(){
        String returnString = "";
        for (int element: integerList){
            returnString += String.valueOf(element);
            returnString += ", ";
        }

        return returnString;
    }
}
