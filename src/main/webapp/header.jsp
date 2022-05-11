<%-- 
    Document   : header
    Created on : May 5, 2022, 3:03:32 PM
    Author     : raghavendra
--%>
<%@page import="com.mycitysmart.entities.User"%>
<%!
    String userType="guest";

%>
<%
    if(session.getAttribute("user")!=null){
        User user=(User)session.getAttribute("user");
        if(user.getUsertype().equals("customer")){
            userType="customer";
        }else{
            if(user.getUsertype().equals("serviceprovider")){
                userType="serviceprovider";
            }
        }
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
            
          <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="login.jsp">Login</a></li>
          <li><a class="nav-link scrollto" href="signup.jsp">SignUp</a></li>
<!--          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>-->
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      
    </div>
  </header><!-- End Header -->