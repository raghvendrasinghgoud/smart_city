/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycitysmart.helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author raghavendra
 */
public class SessionProvider {
    static Session session;
    public static Session getSessionFactory(){
        if(session!=null){
            return session;
        }
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        session= sf.openSession();
        return session;
    }
}
