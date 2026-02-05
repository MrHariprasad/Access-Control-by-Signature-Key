<%-- 
    Document   : TManager
    Created on : 18 Feb, 2023, 9:27:53 AM
    Author     : GKV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Cloud Computing</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content=""> 
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
</head>
<body>
  <!--header section start -->
    <div class="header_section">
      <div class="header_left">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="logo">Access Control <br>by Signature-Keys</div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item">
                <a class="nav-link" href="index.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="TManager.jsp">Transaction Manager</a>
              </li>
             <li class="nav-item">
                <a class="nav-link" href="Client.jsp">Users</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Cloud.jsp">Cloud</a>
              </li>
            
            </ul>
          </div>
        </nav>
        <div class="banner_main">
          <h1 style="margin-top: 100px;">Transaction Manager Login<br></h1>
          <form action="TMAction.jsp" method="post">
                                    <table>
                                        <tr><th>UserName</th><td><input type="text" name="username" required=""></td></tr>
                                        <tr><th>Password</th><td><input type="password" name="password" required=""></td></tr>
                                        <tr><th></th><td><input type="submit" value="Login"> <input type="reset" value="Reset"></td></tr>
                                   
                                    </table>
                                    </form>
        </div>
      </div>
      <div class="header_right">
        <img src="images/banner-img.png" class="banner_img">
      </div>
    </div>
    <!--header section end -->
    <!--about section start -->
    <div class="services_section layout_padding">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <h1 class="services_taital">WELCOME TO CAMPUS AUTOMATION</h1>
            <p class="services_text"  style="text-align: justify;">
              Along with this student’s information will be maintained in the cloud and different tasks such as training sessions, Interview Schedule, Seminar, and Student eligibility can be shown in the News Feed so that students can act according to it. All this will be established with the help of cloud services which will provide ease in work not only for college but also for companies and students
            </p>
            
            <div class="moremore_bt"><a href="#">Read More </a></div>
          </div>
          <div class="col-md-4">
            <div><img src="images/Cloud.webp" class="image_1"></div>
          </div>
        </div>
      </div>
    </div>
    <!--about section end -->
   
    <!--footer section end -->
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- javascript --> 
    <script src="js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script> 
</body>
</html>