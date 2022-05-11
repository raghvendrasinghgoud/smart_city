/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.dao;

import com.mycitysmart.entities.Service;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author raghavendra
 */
public class ServiceDAO {
    final Session session;
    Transaction tx;
    public ServiceDAO(Session session) {
        this.session = session;
        
    }
    
    public void SaveService(Service service){
        tx=session.beginTransaction();
            session.save(service);
        tx.commit();
    }
    public Service getServiceById(int Id){
        Service service=session.get(Service.class, Id);
        if(service==null) System.out.println("User not found in database");
        return service;
    }
    public Service UpdateService(Service service ){
        tx=session.beginTransaction();
        session.update(service);
        tx.commit();
        return getServiceById(service.getSId());
    }
     public List<Service> getAllServices(){
        return session.createQuery("FROM Service", Service.class).getResultList(); 
    }
    
     public List<Service> getServiceProviderServices(String email){
         return session.createQuery("FROM Service as s WHERE s.serviceprovider='"+email+"'", Service.class).getResultList(); 
     }
}
