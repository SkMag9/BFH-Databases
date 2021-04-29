import javax.persistence.*;

@Entity
public class Instructor {
    @Id
    private Integer id;
    private String name;
    @ManyToOne
    @JoinColumn(name="dept_name", nullable=false)
	private Department department;
	private float salary;

    public Instructor() {
        super();
    }

    @Override
    public String toString() {
        return "Instructor [id=" + id +
				", name=" + name +
				", dept_name=" + department.getDeptName() +
				", salary=" + salary + "]";
    }

}
