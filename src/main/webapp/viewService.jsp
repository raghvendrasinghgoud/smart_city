<%-- 
    Document   : viewService
    Created on : May 12, 2022, 9:35:26 AM
    Author     : raghavendra
--%>

<%@page import="com.mycitysmart.entities.Address"%>
<%@page import="com.mycitysmart.entities.ServiceProvider"%>
<%@page import="com.mycitysmart.entities.Service"%>
<%@page import="java.util.List"%>
<%@page import="com.mycitysmart.dao.ServiceDAO"%>
<%@page import="com.mycitysmart.helper.SessionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        if(session.getAttribute("user")==null){
            response.sendRedirect("login.jsp");
        }
        
        
        int id=Integer.parseInt(request.getParameter("sid"));
        Service s=new ServiceDAO(SessionProvider.getSessionFactory()).getServiceById(id);
        ServiceProvider sp=s.getServiceprovider();
%>

<!DOCTYPE html>
<html>
    <head>
       <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Smart City - Service</title>
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
    <div class="card align-items-center " style="width: 70rem;">
        <div class="card-block text-center">
            <h4 class="card-title"><strong>Service Name:</strong> <%= s.getName() %></h4>
            <p class="card-text"><strong>Description:</strong> <%= s.getDescription() %></p>
        </div>
        <ul class="list-group list-group-flush w-100 align-items-stretch">
            <li class="list-group-item text-center d-inline-block"><strong>Service Provider Details Below</strong></li>
            <li class="list-group-item text-center d-inline-block"><strong>Name:</strong><%= sp.getFirstName() %> <%= sp.getLastName() %></li>
            <li class="list-group-item text-center d-inline-block"><strong>Setup Type:</strong><%= sp.getSetupType() %></li>
            <li class="list-group-item text-center d-inline-block"><strong>Other Services:</strong><ul class="d-flex align-items-center ">
            <% 
                List<Service>srvlist=sp.getServices();
                for(Service sv:srvlist){
            %>
            <li class="list-group-item text-center d-inline-block"><b><%= sv.getName() %></b> <a href="viewService.jsp?sid=<%=sv.getSId() %>">Explore...</a></li>
                
              <% } %>
            </ul>
            </li>
        </ul>
             <div class="card-block text-center">
            <h4 class="card-title"><strong>Contact info:</strong> <%= sp.getPhone()+" "+sp.getEmail() %></h4>
            <%
                Address ad=sp.getAddress();
            %>
            <p class="card-text"><strong>Address:</strong> <i><%= ad.getHouseNo()+" "+ad.getStreet()+" "+ad.getArea()+" "+ad.getPincode() %></i></p>
        </div>
        <div class="card-block">
            <h5><strong>Website:</strong><a href="<%= sp.getWebsite() %>" >Visit Us</a></h5>
            <h4 class="card-title"><strong>Price:</strong> <%= s.getRate() %>&#8377</h4>
            
        </div>
    </div>
</div>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>
