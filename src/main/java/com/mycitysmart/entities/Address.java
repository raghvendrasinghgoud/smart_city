/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

/**
 *
 * @author raghavendra
 */
@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int AddressId;
    private String HouseNo;
    private String Street;
    private String Area;
    private int Pincode;
    @OneToOne(mappedBy = "address")
    private User users;

    public Address(String HouseNo, String Street, String Area, int Pincode,User users) {
        this.HouseNo = HouseNo;
        this.Street = Street;
        this.Area = Area;
        this.Pincode = Pincode;
        this.users=users;
    }


    public Address(int AddressId, String HouseNo, String Street, String Area, int Pincode,User users) {
        this.AddressId = AddressId;
        this.HouseNo = HouseNo;
        this.Street = Street;
        this.Area = Area;
        this.Pincode = Pincode;
        this.users=users;
    }
    
    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }
    
    public Address() {
    }

    public int getAddressId() {
        return AddressId;
    }

    public void setAddressId(int AddressId) {
        this.AddressId = AddressId;
    }
    
    public String getHouseNo() {
        return HouseNo;
    }

    public void setHouseNo(String HouseNo) {
        this.HouseNo = HouseNo;
    }

    public String getStreet() {
        return Street;
    }

    public void setStreet(String Street) {
        this.Street = Street;
    }

    public String getArea() {
        return Area;
    }

    public void setArea(String Area) {
        this.Area = Area;
    }

    public int getPincode() {
        return Pincode;
    }

    public void setPincode(int Pincode) {
        this.Pincode = Pincode;
    }

    @Override
    public String toString() {
        return "Address{" + "AddressId=" + AddressId + ", HouseNo=" + HouseNo + ", Street=" + Street + ", Area=" + Area + ", Pincode=" + Pincode + '}';
    }

   
    
    
    
}
