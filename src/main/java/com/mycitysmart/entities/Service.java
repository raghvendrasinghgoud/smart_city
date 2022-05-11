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
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int SId;
    private String name;
    private float rate;
    private String Description;
    @ManyToOne
    @JoinColumn(name = "service_provider")
    private ServiceProvider serviceprovider;

    public Service(int SId, String name, float rate, String Description, ServiceProvider serviceprovider) {
        this.SId = SId;
        this.name = name;
        this.rate = rate;
        this.Description = Description;
        this.serviceprovider = serviceprovider;
    }

    public Service() {
    }

    public Service(String name, float rate, String Description, ServiceProvider serviceprovider) {
        this.name = name;
        this.rate = rate;
        this.Description = Description;
        this.serviceprovider = serviceprovider;
    }

    public int getSId() {
        return SId;
    }

    public void setSId(int SId) {
        this.SId = SId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public ServiceProvider getServiceprovider() {
        return serviceprovider;
    }

    public void setServiceprovider(ServiceProvider serviceprovider) {
        this.serviceprovider = serviceprovider;
    }

    @Override
    public String toString() {
        return "Service{" + "SId=" + SId + ", name=" + name + ", rate=" + rate + ", Description=" + Description + ", serviceprovider=" + serviceprovider + '}';
    }
   
    
}
