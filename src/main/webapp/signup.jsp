<%-- 
    Document   : signup
    Created on : May 5, 2022, 3:19:01 PM
    Author     : raghavendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>MakeMyCitySmart - Index</title>
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
    
    <!-- ======= Appointment Section ======= -->
    <section id="appointment" class="appointment section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Register Here</h2>
          <div class="alert alert-info" id="error" role="alert">
  Please Fill the form carefully 
</div>
        </div>

          <form action="userRegistration" method="post" role="form" class="php-email-form" onsubmit="return isAllTrue()" >
          <div class="row">
            <div class="col-md-4 form-group">
              <input type="text" name="fname" class="form-control" id="fname" placeholder="First Name">
              <div class="validate"></div>
            </div>
               <div class="col-md-4 form-group">
              <input type="text" name="lname" class="form-control" id="lname" placeholder="Last Name">
              <div class="validate"></div>
            </div>
            <div class="col-md-4 form-group">
              <select name="gender" id="gender" class="form-select">
                <option value="" selected disabled>Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
              <div class="validate"></div>
            </div>
              <div class="col-md-4 form-group">
              <input type="datetime" name="date" class="form-control datepicker" id="date" placeholder="Date of Birth(dd/mm/yyyy)" >
              <div class="validate"></div>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email">
              <div class="validate"></div>
            </div>
              <div style="display: none;" class="col-md-4 form-group mt-3 mt-md-0" id="otpinput">
              <input type="number" class="form-control" name="otpin" id="otpin" placeholder="Enter OTP">
              <div class="validate"></div>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="tel" class="form-control" name="phone" id="phone" placeholder="Your Phone" >
              <div class="validate"></div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="password" class="form-control" name="password" id="password" placeholder="Create Password" >
              <div class="validate"></div>
            </div>
              <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="hno" id="hno" placeholder="House No." >
              <div class="validate"></div>
            </div>
              <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="street" id="street" placeholder="Street" >
              <div class="validate"></div>
            </div>
              <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="area" id="area" placeholder="Area" >
              <div class="validate"></div>
            </div>
              <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="number" class="form-control" name="pin" id="pin" placeholder="Pincode" >
              <div class="validate"></div>
            </div>
            <div class="col-md-4 form-group">
              <select name="usertype" id="usertype" class="form-select">
                <option value="" selected disabled>User Type</option>
                <option value="customer">Customer</option>
                <option value="serviceprovider">Service provider</option>
              </select>
              <div class="validate"></div>
            </div>
          </div>
              
              <!--fields for service provider-->
              <div style="display:none" id="sp">
              <div class="row">
                   <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="setup" id="setup" placeholder="Setup Type" >
              <div class="validate"></div>
            </div>
                   <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="web" id="web" placeholder="Website" >
              <div class="validate"></div>
            </div>
                 <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="number" class="form-control" name="staffnum" id="staffnum" placeholder="Number staff Members" >
              <div class="validate"></div>
            </div>
                  
                  <!--staff members details start-->
             <div class="row" id="staffmem">
                                      
                  </div>
              <div class="col-md-12 form-group mt-3 mt-md-0">
              <input type="number" class="form-control" name="servnum" id="servnum" placeholder="Number Of Services You Provide" >
              <div class="validate"></div>
            </div>
                  
                  <!--service deatils list-->
                  <div class="row" id="servlist">
                            
                  </div>
              </div>
          <div class="form-group mt-3">
            <textarea class="form-control" name="description" rows="5" placeholder="Description..."></textarea>
            <div class="validate"></div>
          </div>
                  </div>
<!--          <div class="mb-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your appointment request has been sent successfully. Thank you!</div>
          </div>-->
          <div class="text-center"><button type="submit">Submit</button></div>
        </form>

      </div>
    </section><!-- End Appointment Section -->

    <jsp:include page="footer.jsp" />

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
<!--  <script src="assets/vendor/purecounter/purecounter.js"></script>-->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<!--  <script src="assets/vendor/php-email-form/validate.js"></script>-->
  <script src="assets/js/form_functions.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>