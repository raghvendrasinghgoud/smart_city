/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.entities;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author raghavendra
 */
@Entity
@Inheritance(strategy =InheritanceType.JOINED)
@Table(name = "users")
public class User {
    @Id
    @Column(name = "email",length=80,nullable = false)
    private String Email;
    @Column(name = "password",length=80,nullable = false)
    private String Password;
    @Column(length=50,nullable=false)
    private String FirstName;
    @Column(length=50,nullable=false)
    private String LastName;
    @Column(nullable=false)
    @Temporal(TemporalType.DATE)
    private Date DOB;
    @Column(nullable=false,length=10)
    private String Gender;
    @Column(nullable=false,unique=false,length=20)
    private String Phone;
    @Column(name="User_type",length=30)
    private String Usertype;
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "address_id")
    private Address address;

    public User(String Email, String Password, String FirstName, String LastName, Date DOB, String Gender, String Phone, String Usertype, Address address) {
        this.Email = Email;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.DOB = DOB;
        this.Gender = Gender;
        this.Phone = Phone;
        this.Usertype = Usertype;
        this.address = address;
    }

    

    public User() {
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getUsertype() {
        return Usertype;
    }

    public void setUsertype(String Usertype) {
        this.Usertype = Usertype;
    }

    @Override
    public String toString() {
        return "User{" + "FirstName=" + FirstName + ", LastName=" + LastName + ", DOB=" + DOB + ", Gender=" + Gender + ", Phone=" + Phone + ", Email=" + Email + ", address=" + address + ", Usertype=" + Usertype + '}';
    }
    
}
