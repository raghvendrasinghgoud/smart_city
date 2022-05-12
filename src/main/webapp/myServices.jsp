<%-- 
    Document   : myServices
    Created on : May 12, 2022, 12:27:22 PM
    Author     : raghavendra
--%>

<%@page import="com.mycitysmart.entities.Service"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.mycitysmart.dao.CustomerDAO"%>
<%@page import="com.mycitysmart.dao.ServiceProviderDAO"%>
<%@page import="com.mycitysmart.helper.SessionProvider"%>
<%@page import="com.mycitysmart.entities.User"%>
<%@page import="com.mycitysmart.entities.Customer"%>
<%@page import="com.mycitysmart.entities.ServiceProvider"%>
<%@page import="com.mycitysmart.entities.ServiceProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
        if(session.getAttribute("user")==null){
            response.sendRedirect("login.jsp");
        }
        ServiceProvider sp=null;
        Customer cus=null;
        User user=(User)session.getAttribute("user");
        if(user.getUsertype().equals("customer")){
            cus=new CustomerDAO(SessionProvider.getSessionFactory()).getCustomerById(user.getEmail());
        }else{
            if(user.getUsertype().equals("serviceprovider")){
                sp=new ServiceProviderDAO(SessionProvider.getSessionFactory()).getServiceProviderById(user.getEmail());
            }else{
                response.sendRedirect("login.jsp");
            }
        }
%>

<html>
    <head>
       <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Smart City - My Services</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Medilab - v4.7.1
  * Template URL: https://bootstrapmade.com/medilab-free-medical-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container my-5">
            
            <h3 class="text-center m-5">My Services</h3>
            
            <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Service Name</th>
      <th scope="col">Rate</th>
      <th scope="col">Description</th>
    </tr>
  </thead>
  <tbody>
      <%
          List<Service> srvlist=sp.getServices();
          
            for(Service srv:srvlist){
      %>
    <tr>
      <th scope="row"><%= srv.getSId() %></th>
      <td><%= srv.getName() %></td>
      <td><%= srv.getRate() %></td>
      <td><%= srv.getDescription() %></td>
    </tr>
    <%  } %>
    
  </tbody>
</table>
        </div>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
