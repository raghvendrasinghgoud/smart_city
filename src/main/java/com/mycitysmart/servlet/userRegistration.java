/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycitysmart.servlet;

import com.mycitysmart.dao.CustomerDAO;
import com.mycitysmart.dao.ServiceProviderDAO;
import com.mycitysmart.entities.Address;
import com.mycitysmart.entities.Customer;
import com.mycitysmart.entities.Service;
import com.mycitysmart.entities.ServiceProvider;
import com.mycitysmart.entities.Staff;
import com.mycitysmart.entities.User;
import com.mycitysmart.helper.SessionProvider;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author raghavendra
 */
public class userRegistration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,Exception {
        response.setContentType("text/html;charset=UTF-8");
        
        String email=request.getParameter("email");
        String FirstName=request.getParameter("fname");
        String LastName=request.getParameter("lname");
        String date=request.getParameter("date").replace('/','-');
        System.out.println(date);
        Date DOB=new SimpleDateFormat("dd-mm-yyyy").parse(date);
        String Gender=request.getParameter("gender");
        String Password=request.getParameter("password");
        String Phone=request.getParameter("phone");
        String UserType=request.getParameter("usertype");
        User user=new User();
        user.setEmail(email);
        user.setFirstName(FirstName);
        user.setLastName(LastName);
        user.setGender(Gender);
        user.setDOB(DOB);
        user.setPassword(Password);
        user.setPhone(Phone);
        user.setUsertype(UserType);
        //address variables;
        String HouseNo=request.getParameter("hno");
        String Street=request.getParameter("street");
        String Area=request.getParameter("area");
        int Pincode=Integer.parseInt(request.getParameter("pin"));
        user.setAddress(new Address(HouseNo,Street,Area,Pincode,user));
        System.out.println(user);
        
        
        //creating session
            HttpSession session=request.getSession();
            
        if(user.getUsertype().equals("customer")){
            Customer c=new Customer(user);
            System.out.println(c);
            
            //saving data in the database
            new CustomerDAO(SessionProvider.getSessionFactory()).SaveCustomer(c);
            
            
            //starting session
            session.setAttribute("user", c);
            
            //redirecting to home page
            response.sendRedirect("userHome.jsp");
        }else{
            if(user.getUsertype().equals("serviceprovider")){
                String SetupType=request.getParameter("setup");
                String Website=request.getParameter("web");
                ServiceProvider sp=new ServiceProvider(user);
                sp.setWebsite(Website);
                sp.setSetupType(SetupType);
                int StaffMemNo=Integer.parseInt(request.getParameter("staffnum"));
                int ServiceNo=Integer.parseInt(request.getParameter("servnum"));
                List<Staff> staff=new ArrayList<>();
                List<Service> services=new ArrayList<>();
                for(int i=1;i<=StaffMemNo;i++){
                    staff.add(new Staff(request.getParameter("ename"+i),request.getParameter("design"+i),sp));
                }
                System.out.println(staff);
                for(int i=1;i<=ServiceNo;i++){
                    services.add(new Service(request.getParameter("servname"+i),Float.parseFloat(request.getParameter("servrate"+i)),request.getParameter("servdesc"+i),sp));
                }
                //System.out.println(services);
                String Description=request.getParameter("description");
                sp.setDescription(Description);
                sp.setStaff(staff);
                sp.setServices(services);
                //System.out.println(sp);
                
                //savin service proder in the databse
                new ServiceProviderDAO(SessionProvider.getSessionFactory()).SaveServiceProvider(sp);
                
                //starting session
            session.setAttribute("user", sp);
            //redirecting to home page
            response.sendRedirect("userHome.jsp");
            }
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        processRequest(request, response);
        }catch(Exception e){
        
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(userRegistration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }   // </editor-fold>

}
