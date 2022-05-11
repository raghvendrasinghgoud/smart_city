/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.dao;

import com.mycitysmart.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author raghavendra
 */
public class UserDAO {
    
    final Session session;
    Transaction tx;
    public UserDAO(Session session) {
        this.session = session;
        
    }
    
    public boolean isUserExists(String Id){
        if(getUserById(Id)!=null) return true;
        else return false;
    }
    
    
    public boolean UserLogin(String Id,String Password,String Usertype){
        if(isUserExists(Id)){
            if(getUserById(Id).getPassword().equals(Password) && getUserById(Id).getUsertype().equals(Usertype)) return true;
        }
        return false;
    }
    public void SaveUser(User user){
        tx=session.beginTransaction();
            session.save(user);
        tx.commit();
    }
    public User getUserById(String Id){
        User user=session.get(User.class, Id);
        if(user==null) System.out.println("User not found in database");
        return user;
    }
    public User UpdateUser(User user){
        tx=session.beginTransaction();
        session.update(user);
        tx.commit();
        return getUserById(user.getEmail());
    }
    
    public List<User> getAllUsers(){
        return session.createQuery("FROM User", User.class).getResultList(); 
    }
}
