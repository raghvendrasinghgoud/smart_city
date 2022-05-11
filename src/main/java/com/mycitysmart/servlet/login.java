/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycitysmart.servlet;

import com.mycitysmart.dao.CustomerDAO;
import com.mycitysmart.dao.ServiceProviderDAO;
import com.mycitysmart.dao.UserDAO;
import com.mycitysmart.entities.Customer;
import com.mycitysmart.entities.ServiceProvider;
import com.mycitysmart.entities.User;
import com.mycitysmart.helper.SessionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author raghavendra
 */
public class login extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String email=request.getParameter("email");
       String pass=request.getParameter("pass");
        System.out.println("email="+email+" pass="+pass);
        UserDAO ud=new UserDAO(SessionProvider.getSessionFactory());
       if(ud.UserLogin(email,pass)){
           HttpSession session=request.getSession();
           User user=ud.getUserById(email);
           if(user.getUsertype().equals("customer")){
               Customer c=new CustomerDAO(SessionProvider.getSessionFactory()).getCustomerById(email);
               session.setAttribute("user", c);
           }else{
               ServiceProvider sp=new ServiceProviderDAO(SessionProvider.getSessionFactory()).getServiceProviderById(email);
               session.setAttribute("user", ud);
           }
           response.sendRedirect("userHome.jsp");
       }else{
           response.sendRedirect("login.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
