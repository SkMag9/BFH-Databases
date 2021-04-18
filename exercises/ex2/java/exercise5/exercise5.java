package exercise5;

public class exercise5 {
    public static boolean[][] compose(boolean[][] r, boolean[][] t) {
        boolean[][] composition;

        // assignment to the correct variable to avoid IndexOutOfBounds exception
        boolean[][] longerArray = r;
        boolean[][] shorterArray = t;
        if (r.length < t.length) { // if it's equal, the order doesn't matter anyway
            longerArray = t;
            shorterArray = r;
        }
        // initializing the composition array with some size and all "false" values
        composition = initialize(longerArray.length, longerArray.length);
        // looping over the longer array for its size
        for (int i = 0; i < longerArray.length; i++) {
            // looping over the subarray at index i of the longer array
            for (int j = 0; j < longerArray[i].length; j++) {
                if (longerArray[i][j]) { // if this is true, a relation exists
                    // the second index of the first array is used as the first index of the second array
                    for (int k = 0; k < shorterArray[j].length; k++) {
                        // if this is true, another relation was found and can be added to the final array
                        if (shorterArray[j][k]) {
                            // no need to check for duplicates
                            composition[i][k] = true;
                        }
                    }
                }
            }
        }
        return composition;
    }

    private static boolean[][] initialize(int dimension1, int dimension2) {
        boolean[][] b = new boolean[dimension1][dimension2];
        for (int i = 0; i < dimension1; i++) {
            for (int j = 0; j < dimension2; j++) {
                b[i][j] = false;
            }
        }
        return b;
    }

    public static void main(String[] args) {
        boolean[][] r = initialize(5, 6);
        r[0][2] = true;
        r[0][4] = true;
        r[1][0] = true;
        r[2][3] = true;
        r[2][5] = true;
        r[3][1] = true;
        // r = {(0, 2), (0, 4), (1, 0), (2, 3), (2, 5), (3, 1)}
        boolean[][] t = initialize(6, 5);
        t[0][4] = true;
        t[1][2] = true;
        t[2][1] = true;
        t[3][1] = true;
        t[4][1] = true;
        t[5][2] = true;
        // t = {(0, 4), (1, 2), (2, 1), (3, 1), (4, 1), (5, 2)}
        boolean[][] c = compose(r, t);
        // c should be = {(0, 1), (1, 4), (2, 1), (2, 2), (3, 2)}, (0, 1) will be duplicated but removed
    }
}
