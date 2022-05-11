/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.dao;

import com.mycitysmart.entities.Service;
import com.mycitysmart.entities.Staff;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author raghavendra
 */
public class StaffDAO {
    final Session session;
    Transaction tx;
    public StaffDAO(Session session) {
        this.session = session;
        
    }
    
    public void SaveStaff(Staff staff){
            session.save(staff);
        tx.commit();
    }
    public Staff getStaffById(int Id){
        Staff staff=session.get(Staff.class, Id);
        if(staff==null) System.out.println("User not found in database");
        return staff;
    }
    public Staff UpdateStaff(Staff staff ){
        tx=session.beginTransaction();
        session.update(staff);
        tx.commit();
        return getStaffById(staff.getEId());
    }
     public List<Staff> getAllStaffes(){
        return session.createQuery("FROM Staff", Staff.class).getResultList(); 
    }
     public List<Staff> getServiceProviderStaff(String email){
         return session.createQuery("FROM Staff as s WHERE s.serviceprovider='"+email+"'", Staff.class).getResultList(); 
     }
}
