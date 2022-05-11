/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.dao;

import com.mycitysmart.entities.Address;
import com.mycitysmart.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author raghavendra
 */
public class AddressDAO {
    final Session session;
    Transaction tx;
    public AddressDAO(Session session) {
        this.session = session;
     
    }
    
    public void SaveAddress(Address address){
        tx=session.beginTransaction();
            session.save(address);
        tx.commit();
    }
    public Address getAddressById(int Id){
        Address address=session.get(Address.class, Id);
        if(address==null) System.out.println("User not found in database");
        return address;
    }
    public Address UpdateAddress(Address address ){
        tx=session.beginTransaction();
        session.update(address);
        tx.commit();
        return getAddressById(address.getAddressId());
    }
     public List<Address> getAllAddresses(){
        return session.createQuery("FROM Address", Address.class).getResultList(); 
    }
}
