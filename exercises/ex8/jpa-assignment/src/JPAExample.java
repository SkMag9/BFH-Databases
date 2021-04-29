import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class JPAExample {

    public static void main(String[] args) {

        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory("university");
        EntityManager em = factory.createEntityManager();

        TypedQuery<Department> q1 =
                em.createQuery("SELECT d FROM Department d", Department.class);
        List<Department> departments = q1.getResultList();

        for (Department d : departments) {
            System.out.println(d);
        }

        em.close();
        factory.close();
    }

}