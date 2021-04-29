import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Department {
    @Id
    private String dept_name;
    private String building;
    private double budget;

    @OneToMany(mappedBy = "department")
    private List<Instructor> instructors;


    public String getDeptName() {
        return dept_name;
    }

    public String getBuilding() {
        return building;
    }

    public double getBudget() {
        return budget;
    }

    public List<Instructor> getInstructors() {
        return instructors;
    }

    @Override
    public String toString() {
        String instructorString = "";
        for (Instructor i : instructors) {
            instructorString = instructorString.concat(i.toString() + ",");
        }
        return "Department [dept_name=" + dept_name +
                ", building=" + building +
                ", budget=" + budget +
                ", instructors=" + instructorString + "]";
    }
}
