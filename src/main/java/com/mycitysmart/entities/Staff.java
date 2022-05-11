/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author raghavendra
 */
@Entity
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int EId;
    private String Name;
    private String designation;
    @ManyToOne
    @JoinColumn(name = "service_provider")
    private ServiceProvider serviceprovider;

    public Staff(int EId, String Name, String designation, ServiceProvider serviceprovider) {
        this.EId = EId;
        this.Name = Name;
        this.designation = designation;
        this.serviceprovider = serviceprovider;
    }
    

    public ServiceProvider getServiceprovider() {
        return serviceprovider;
    }

    public void setServiceprovider(ServiceProvider serviceprovider) {
        this.serviceprovider = serviceprovider;
    }

    public Staff(String Name, String designation, ServiceProvider serviceprovider) {
        this.Name = Name;
        this.designation = designation;
        this.serviceprovider = serviceprovider;
    }

    
    
    public Staff() {
    }

    public int getEId() {
        return EId;
    }

    public void setEId(int EId) {
        this.EId = EId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    @Override
    public String toString() {
        return "Staff{" + "EId=" + EId + ", Name=" + Name + ", designation=" + designation + '}';
    }

    
    
}
