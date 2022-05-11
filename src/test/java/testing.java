
import com.mycitysmart.dao.UserDAO;
import com.mycitysmart.entities.Address;
import com.mycitysmart.entities.Customer;
import com.mycitysmart.entities.Service;
import com.mycitysmart.entities.ServiceProvider;
import com.mycitysmart.entities.Staff;
import com.mycitysmart.entities.User;
import com.mycitysmart.helper.SessionProvider;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.sound.midi.Soundbank;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author raghavendra
 */
public class testing {
    public static void main(String[] args) throws ParseException {
        
            Configuration cfg=new Configuration().configure();
            SessionFactory sf=cfg.buildSessionFactory();
            Session session=sf.openSession();
            
            //creating objects
            User u=new Customer();
                    //creating customer address
                    Address ad=new Address("H-368","NHDC colony","Narmada nagar",450119,u);
                    u.setDOB(new SimpleDateFormat("dd-mm-yyyy").parse("13-09-1999"));
                    u.setEmail("raghvendrasingh@gmail.com");
                    u.setFirstName("Raghvendra");
                    u.setPassword("1234");
                    u.setLastName("Singh");
                    u.setGender("male");
                    u.setPhone("7089812836");
                    u.setUsertype("customer");
                    u.setAddress(ad);
            
            
            
            Customer c=new Customer();
                    //creating customer address
                    Address ad2=new Address("H-368","NHDC colony","Narmada nagar",450119,c);
                    c.setDOB(new SimpleDateFormat("dd-mm-yyyy").parse("13-09-1999"));
                    c.setEmail("raghvendrasinghgoud@gmail.com");
                    c.setPassword("1234");
                    c.setFirstName("Raghvendra");
                    c.setLastName("Singh");
                    c.setGender("male");
                    c.setPhone("7089818436");
                    c.setUsertype("customer");
                    c.setAddress(ad2);
                    
            ServiceProvider sp=new ServiceProvider();
            Address ad1=new Address("H-56","Great colony","Narmada vihar",450789,sp);
            sp.setDOB(new SimpleDateFormat("dd-mm-yyyy").parse("20-08-1999"));
                    sp.setEmail("raghav@gmail.com");
                    sp.setPassword("1234");
                    sp.setFirstName("Raghav");
                    sp.setLastName("Singh");
                    sp.setGender("male");
                    sp.setPhone("7083218436");
                    sp.setUsertype("service_provider");
                    sp.setAddress(ad1);
                     List<Service> services=new ArrayList<>();
            services.add(new Service("servicename", (float) 78.023,"greatre service",sp));
            services.add(new Service("servicename1", (float) 73.023,"greatre service1",sp));
            services.add(new Service("servicename2", (float) 76.023,"greatre service2",sp));
                    sp.setServices(services);
                    
                    List<Staff> staff=new ArrayList<>();
            staff.add(new Staff("Navin","java decveloper",sp));
            staff.add(new Staff("ajay","python decveloper",sp));
            staff.add(new Staff("rakesh","php decveloper",sp));
            staff.add(new Staff("raju","Android decveloper",sp));
            sp.setDescription("We are a very good service provider of gym here we have all the equipments");
            
            
            
            UserDAO ud=new UserDAO(SessionProvider.getSessionFactory());
            ud.SaveUser(u);
            System.out.println("old name"+u.getFirstName());
            u.setFirstName("Krishna");
            ud.UpdateUser(u);
            u=ud.getUserById(u.getEmail());
            System.out.println("new name"+u.getFirstName());
            System.out.println(ud.getUserById(u.getEmail()));
            
            System.out.println((ud.UserLogin(u.getEmail(), u.getPassword(), u.getUsertype()))?"loggedIn":"user not found");
            
            System.out.println((ud.isUserExists(u.getEmail())?"exists":"not exists"));
            System.out.println("xyz@gmail ="+(ud.isUserExists("xyz@gmail")?"exists":"not exists"));
            
            List<User> li=ud.getAllUsers();
            for(User i:li) System.out.println(i);
}
}
