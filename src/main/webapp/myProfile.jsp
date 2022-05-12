<%-- 
    Document   : myProfile
    Created on : May 12, 2022, 10:53:43 AM
    Author     : raghavendra
--%>

<%@page import="java.util.Date"%>
<%@page import="com.mycitysmart.entities.Address"%>
<%@page import="com.mycitysmart.entities.Customer"%>
<%@page import="com.mycitysmart.entities.ServiceProvider"%>
<%@page import="com.mycitysmart.dao.ServiceProviderDAO"%>
<%@page import="com.mycitysmart.dao.CustomerDAO"%>
<%@page import="com.mycitysmart.helper.SessionProvider"%>
<%@page import="com.mycitysmart.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
     <head>
       <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Smart City - My Profile</title>
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
         <section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"><%= user.getFirstName()+" "+user.getLastName() %></h5>
            <p class="text-muted mb-1"><%= user.getUsertype() %></p>
            <p class="text-muted mb-4"><%= user.getAddress().getArea() %></p>
<!--            <div class="d-flex justify-content-center mb-2">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div>-->
          </div>
        </div>
        <div class="card mb-4 mb-lg-0">
            <%
                if(user.getUsertype().equals("serviceprovider")){
            %>
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fas fa-globe fa-lg text-warning"></i>
                <p class="mb-0"><a href="<%= sp.getWebsite() %>" target="blank" ><%= sp.getWebsite() %></a></p>
              </li>
            </ul>
          </div>
              <%  } %>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= user.getFirstName()+" "+user.getLastName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= user.getEmail() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= user.getPhone() %></p>
              </div>
            </div>
              <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Gender</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= user.getGender() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Age</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= (new Date().getMonth()-user.getDOB().getMonth()<=0)?new Date().getYear() - user.getDOB().getYear():new Date().getYear() - user.getDOB().getYear()-1 %> Years</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                 <%
                     Address ad=user.getAddress();
                 %>
                <p class="text-muted mb-0"><%= ad.getHouseNo()+","+ad.getStreet()+","+ad.getArea()+","+ad.getPincode() %></p>
              </div>
            </div>
              <%
                if(user.getUsertype().equals("serviceprovider")){
            %>
            
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Setup Type</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= sp.getSetupType() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Description</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%= sp.getDescription() %></p>
              </div>
            </div>
            <% } %>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>   
        <jsp:include page="footer.jsp" />
    </body>
</html>
