<%-- 
    Document   : header
    Created on : May 5, 2022, 3:03:32 PM
    Author     : raghavendra
--%>
<%@page import="com.mycitysmart.entities.User"%>
<%!
    User user;
    String userType="none";
%>
<%
    if(session.getAttribute("user")!=null){
        userType=(String)session.getAttribute("usertype");
    }
%>


<!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Smart City</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            <%
            
                switch(userType){
                    case "serviceprovider":
            %>
          <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
<!--          <li><a class="nav-link scrollto" href="login.jsp">Login</a></li>-->
          <li class="dropdown"><span>My Account</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="myProfile.jsp">My profile</a></li>
              <li><a href="myServices.jsp">My Services</a></li>
              <li><a href="myStaff.jsp">My Staff</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="logout">Logout</a></li>
          <%
              break;
              case "customer":
          %>
          
          <li><a class="nav-link scrollto active" href="userHome.jsp">Home</a></li>
<!--          <li><a class="nav-link scrollto" href="signup.jsp">SignUp</a></li>-->
          <li class="dropdown"><span>My Account</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="myProfile.jsp">My Profile</a></li>
              <li><a href="logout">Logout</a></li>
            </ul>
          </li>
          <%
              break;
              
              default:
          %>
          
          <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="login.jsp">Login</a></li>
          <li><a class="nav-link scrollto" href="signup.jsp">SignUp</a></li>
          
          <%
            break;
              }
          %>
          
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      
    </div>
  </header><!-- End Header -->