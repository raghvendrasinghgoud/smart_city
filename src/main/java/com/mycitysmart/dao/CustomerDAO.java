/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.dao;

import com.mycitysmart.entities.Customer;
import com.mycitysmart.entities.Customer;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author raghavendra
 */
public class CustomerDAO {
     final Session session;
    Transaction tx;
    public CustomerDAO(Session session) {
        this.session = session;
    }
    
    public void SaveCustomer(Customer customer){
        tx=session.beginTransaction();
            session.save(customer);
        tx.commit();
    }
    public Customer getCustomerById(String Id){
        Customer customer=session.get(Customer.class, Id);
        if(customer==null) System.out.println("Customer not found in database");
        return customer;
    }
    public Customer UpdateCustomer(Customer customer ){
        tx=session.beginTransaction();
        session.update(customer);
        tx.commit();
        return getCustomerById(customer.getEmail());
    }
     public List<Customer> getAllCustomers(){
        return session.createQuery("FROM Customer", Customer.class).getResultList(); 
    }
}
