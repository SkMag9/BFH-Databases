package exercise4;

public class exercise4 {
    public static boolean subset(boolean[] s, boolean[] t){
        for (int i = 0; i < s.length; i++) {
            if (s[i]) {
                if (!t[i]) {
                    return false;
                }
            }
        }

        return true;
    }

    public static boolean[] union(boolean[] s, boolean[] t){
        boolean[] solArr;
        if (s.length > t.length) {
            solArr = new boolean[s.length];
        } else {
            solArr = new boolean[t.length];
        }

        for (int i = 0; i < s.length || i < t.length ;i++){
            if ( i < s.length) { if (s[i]) { solArr[i] = true; } }
            if ( i < t.length) { if (t[i]) { solArr[i] = true; } }
        }

        return solArr;
    }

    public static void main(String[] args) {

    }
}
