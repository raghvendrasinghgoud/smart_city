/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.dao;

import com.mycitysmart.entities.ServiceProvider;
import com.mycitysmart.entities.ServiceProvider;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author raghavendra
 */
public class ServiceProviderDAO {
    final Session session;
    Transaction tx;
    public ServiceProviderDAO(Session session) {
        this.session = session;
        
    }
    
    public void SaveServiceProvider(ServiceProvider serviceprovider){
        tx=session.beginTransaction();
            session.save(serviceprovider);
        tx.commit();
    }
    public ServiceProvider getServiceProviderById(String Id){
        ServiceProvider serviceprovider=session.get(ServiceProvider.class, Id);
        if(serviceprovider==null) System.out.println("ServiceProvider not found in database");
        return serviceprovider;
    }
    public ServiceProvider UpdateServiceProvider(ServiceProvider serviceprovider ){
        tx=session.beginTransaction();
        session.update(serviceprovider);
        tx.commit();
        return getServiceProviderById(serviceprovider.getEmail());
    }
     public List<ServiceProvider> getAllServiceProviders(){
        return session.createQuery("FROM ServiceProvider", ServiceProvider.class).getResultList(); 
    }
}
