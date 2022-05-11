/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.entities;

import java.util.Date;
import javax.persistence.Entity;

/**
 *
 * @author raghavendra
 */
@Entity
public class Customer extends User {

    public Customer(String Email, String Password, String FirstName, String LastName, Date DOB, String Gender, String Phone, String Usertype, Address address) {
        super(Email, Password, FirstName, LastName, DOB, Gender, Phone, Usertype, address);
    }

    public Customer() {
    }
    public Customer(User user) {
        super(user.getEmail(),user.getPassword(),user.getFirstName(),user.getLastName(),user.getDOB(),user.getGender(),user.getPhone(),user.getUsertype(),user.getAddress());
    }
    
    
}
