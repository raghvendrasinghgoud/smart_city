<%-- 
    Document   : userHome
    Created on : May 11, 2022, 2:19:00 PM
    Author     : raghavendra
--%>

<%@page import="com.mycitysmart.entities.Service"%>
<%@page import="java.util.List"%>
<%@page import="com.mycitysmart.helper.SessionProvider"%>
<%@page import="com.mycitysmart.dao.ServiceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        if(session.getAttribute("user")==null){
            response.sendRedirect("login.jsp");
        }
        ServiceDAO sd=new ServiceDAO(SessionProvider.getSessionFactory());
        List<Service> servlist;
        String query=request.getParameter("query");
        if(query!=null || query==""){
            servlist=sd.searchServices(query);
        }else{
            servlist=sd.getAllServices();
        }
    
%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Smart City - Home</title>
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
<!--        <div class="input-group rounded">-->
     <form class="input-group rounded" action="userHome.jsp" method="post">
  <input type="search" class="form-control rounded" name="query" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
  
  <span class="input-group-text border-0" id="search-addon">
    <i class="fas fa-search"></i>
  </span>
  </form>
<!--</div>-->
          <div class="my-5 d-flex align-content-stretch flex-wrap">
              
              <%
                  for(Service s:servlist){
              %>
                <div class="card" style="width: 18rem;margin: 10px">
  <div class="card-body">
    <h5 class="card-title"><%= s.getName()  %></h5>
    <h6 class="card-subtitle mb-2 text-muted"><%= s.getRate() %> &#8377</h6>
    <p class="card-text"><%= s.getDescription()  %></p>
    <a href="viewService.jsp?sid=<%= s.getSId() %>" class="card-link">Read More</a>
  </div>
</div>
                <%
                    }
                %>

        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
