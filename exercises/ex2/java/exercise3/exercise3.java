package exercise3;

import java.util.ArrayList;
import java.util.Collections;

public class exercise3 {
    public boolean equals(list l1, list l2) {

        Collections.sort(l1.integerList);
        Collections.sort(l2.integerList);

        if ( empty(l1) && empty(l2) ) { return true; }
        if ( !head(l1) == head(l2) ) { return false; }
        if ( !tail(l1) == tail(l2) ) { return false; }

        return true;
    }

    public static int head(list intList) {
        return intList.integerList.get(0);
    }

    public static list tail(list intList) {
        list tailList = new list();

        for (int i = 1; i < intList.integerList.size(); i++) {
            tailList.integerList.add(intList.integerList.get(i));
        }

        return tailList;
    }

    public static boolean empty(list l1) {
        return (l1.integerList.size() == 0);
    }

    public static void main(String[] args) {
        list obj1 = new list();
        obj1.integerList.add(1);
        obj1.integerList.add(4);
        obj1.integerList.add(5);
        obj1.integerList.add(2);
        obj1.integerList.add(3);

        list obj2 = new list();
        obj2.integerList.add(1);
        obj2.integerList.add(2);
        obj2.integerList.add(3);
        obj2.integerList.add(4);

        System.out.println(obj1.equals(obj2)); // prints false
        obj2.integerList.add(6);
        System.out.println(obj1.equals(obj2)); // prints false
        obj2.integerList.remove(4);
        obj2.integerList.add(5);
        System.out.println(obj1.equals(obj2)); // prints true

        System.out.println(head(obj1)); // 1
        System.out.println(tail(obj1).toString()); // 2, 3, 4, 5

        list obj3 = new list();
        System.out.println(empty(obj3)); // true
        obj3.integerList.add(1);
        System.out.println(empty(obj3)); // false
    }
}
