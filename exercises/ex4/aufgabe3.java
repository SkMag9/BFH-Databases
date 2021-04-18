package ex4;

import java.util.ArrayList;

class Relation {
    public int[] relation = new int [2];
    public Relation(int i, int j){
        relation[0] = i;
        relation[1] = j;
    }

}

class Join {
    public int[] join = new int[3];
    public Join(int i, int j, int k){
        join[0] = i;
        join[1] = j;
        join[2] = k;
    }
}

public class Exercise3 {
    public static int[] headRelation(int[][] array) {
        int[] returnArray = {array[0][0],array[0][1]};
        return returnArray;
    }
    public static int headTupel(int[] array) {
        return array[0];
    }

    public static int[][] tailRelation(int[][] array) {
        int[][] returnArray = new int[2][2];

        for (int i = 1; i < 3; i++) {
            returnArray[i-1][0] = array[i][0];
            returnArray[i-1][1] = array[i][1];
        }

        return returnArray;
    }
    public static int tailTupel(int[] array) {
        return array[1];
    }

    public static int[][] consRelation(int a, int[][] l) {
        int[][] returnArray = new int[3][3];

        for (int i = 1; i < 3; i++) {
            returnArray[i][0] = a;
            returnArray[i][1] = l[i][0];
            returnArray[i][2] = l[i][1];
        }

        return null;
    }
    public static int[] consTupel(int a, int [] l) {
        int [] returnArray = new int [3];

        returnArray[0] = a;
        returnArray[1] = l[0];
        returnArray[2] = l[1];

        return returnArray;
    }

    public static Relation[][][] karthesischesProdukt(Relation[] r, Relation[] s) {
        Relation[][][] kartP = new Relation[3][3][2];

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++){
                kartP[i][j][0] = r[j];
                kartP[i][j][1] = s[j];
            }
        }
        return kartP;
    }

    public static ArrayList<Join> naturalJoin(Relation[] r, Relation[] s) {
        ArrayList<Join> returnJoin = new ArrayList<Join>();

        Relation[][][] kP = karthesischesProdukt(r, s);

        for (Relation[][] r2 : kP){
            for (Relation[] r1 : r2){
                if (r1[0].relation[1] == r1[1].relation[0]) {
                    Join join = new Join(r1[0].relation[0], r1[0].relation[1], r1[1].relation[0]);
                    returnJoin.add(join);
                }
            }
        }


        return returnJoin;
    }


    public static void main(String args[]) {
        Relation r1 = new Relation(1,2);
        Relation r2 = new Relation(2,3);
        Relation r3 = new Relation(3,4);

        Relation[] r = {r1, r2, r3};

        Relation s1 = new Relation(2,1);
        Relation s2 = new Relation(4,5);
        Relation s3 = new Relation(5,6);

        Relation[] s = {s1, s2, s3};



    }
}
