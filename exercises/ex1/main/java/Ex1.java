import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;

public class Ex1 {
    static ArrayList<Instructor> instructorList = new ArrayList<>();
    static ArrayList<Department> departmentList = new ArrayList<>();

    static void read() throws FileNotFoundException {
        try {
            BufferedReader csvInstructor = new BufferedReader(new FileReader("/home/skmag9/IdeaProjects/databases-ex1/src/main/csv/instructor1.csv"));
            String row;
            boolean skip = false;
            while ((row = csvInstructor.readLine()) != null){
                String[] data = row.split(",");

                if (skip) {
                    Instructor temp = new Instructor(Integer.parseInt(data[0]), data[1], data[2], Integer.parseInt(data[3]));
                    instructorList.add(temp);
                } else {
                    skip = true;
                }
            }
            csvInstructor.close();

            skip = false;

            BufferedReader csvDepartment = new BufferedReader(new FileReader("/home/skmag9/IdeaProjects/databases-ex1/src/main/csv/department1.csv"));
            while ((row = csvDepartment.readLine()) != null){
                String[] data = row.split(",");

                if (skip) {
                    Department temp2 = new Department(data[0], data[1], Integer.parseInt(data[2]));
                    departmentList.add(temp2);
                } else {
                    skip = true;
                }
            }
            csvDepartment.close();
        }

        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
        // read
        try {
            read();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        // 1
        instructorList.forEach(instructor -> {
            if (instructor.id == 22222) {
                System.out.println(instructor.name);
            }
        });

        //2
        instructorList.forEach(instructor -> {
            if (instructor.name.equals("Einstein")){
                departmentList.forEach(department -> {
                    if (instructor.dept_name.equals(department.dept_name)) {
                        System.out.println(department.building);
                    }
                });
            }
        });
    }
}
