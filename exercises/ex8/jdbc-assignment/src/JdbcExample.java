
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

class JdbcExample {
    public static void main(String[] args) {

        // just check if we can load the JDBC driver
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            throw new Error("Cannot find JDBC Driver", e);
        }

        // establish connection and fetch and print some data
        try (Connection conn =
                     DriverManager.getConnection(
                             "jdbc:sqlite:../university.db")) {
            try (Statement stmt = conn.createStatement()) {
                String query = "select d.dept_name, avg(i.salary) as avg_salary from department as d " +
                        "inner join instructor as i on i.dept_name = d.dept_name " +
                        "group by d.dept_name";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    String department = rs.getString("dept_name");
                    double avgSalary = rs.getDouble("avg_salary");
                    System.out.println(department + " | " + avgSalary);
                }
            } catch (SQLException e) {
                throw new Error("Problem executing query", e);
            }

        } catch (SQLException e) {
            throw new Error("Cannot establish database connection", e);
        }
    }
}
