
package com.mycitysmart.entities;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author raghavendra
 */
@Entity
@Table(name = "service_provider")
public class ServiceProvider extends User {
    private String SetupType;
    private String Website;
    @OneToMany(mappedBy = "serviceprovider",cascade = CascadeType.ALL)
    private List<Service> services;
    @OneToMany(mappedBy = "serviceprovider",cascade = CascadeType.ALL)
    private List<Staff> staff;
    
    private String Description;

    public ServiceProvider(String SetupType, String Website, List<Service> services, List<Staff> staff, String Description, String Email, String Password, String FirstName, String LastName, Date DOB, String Gender, String Phone, String Usertype, Address address) {
        super(Email, Password, FirstName, LastName, DOB, Gender, Phone, Usertype, address);
        this.SetupType = SetupType;
        this.Website = Website;
        this.services = services;
        this.staff = staff;
        this.Description = Description;
    }

    public ServiceProvider(User user) {
            
        super(user.getEmail(),user.getPassword(),user.getFirstName(),user.getLastName(),user.getDOB(),user.getGender(),user.getPhone(),user.getUsertype(),user.getAddress());
         
    }
    
    public ServiceProvider() {
    }

    public String getSetupType() {
        return SetupType;
    }

    public void setSetupType(String SetupType) {
        this.SetupType = SetupType;
    }

    public String getWebsite() {
        return Website;
    }

    public void setWebsite(String Website) {
        this.Website = Website;
    }

    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }

    public List<Staff> getStaff() {
        return staff;
    }

    public void setStaff(List<Staff> staff) {
        this.staff = staff;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "ServiceProvider{" + "SetupType=" + SetupType + ", Website=" + Website + ", services=" + services + ", staff=" + staff + ", Description=" + Description + '}';
    }
    
    
    
    
}
