<%-- 
    Document   : ViewKeyRequest
    Created on : 18 Feb, 2023, 12:57:47 PM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
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
                <a class="nav-link" href="ManagerHome.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="CreateRoles.jsp">Create Roles</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="CreateGroups.jsp">Create Groups</a>
              </li>
                 <li class="nav-item ">
                <a class="nav-link" href="ViewAllUsers.jsp">View All Users</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="ViewKeyRequest.jsp">View Key Request</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="NewServiceUsers.jsp">Service Users</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="GroupUsers.jsp">Group Users</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="TManager.jsp">Logout</a>
              </li>
            
            </ul>
          </div>
        </nav>
       
      
      </div>
     
    </div>
    <!--header section end -->
    <!--about section start -->
    <div class="services_section layout_padding">
      <div class="container">
        <div class="row">
          <div class="col-md-8" style="height:700px;">
              <h1 class="services_taital">VIEW : <font color="red">ALL KEY REQUEST</font></h1>
          
             
                 <table border="1">
                  <tr><th>Name</th><th>Email</th><th>Mobile</th><th>Address</th><th>Status</th></tr>
              <%
              try{
                  ResultSet r=Queries.getExecuteQuery("select * from register where status='Pending'");
                  
                  while(r.next()){
                   
                      %>
                  <tr>
                     
                      <td><%=r.getString("name")%></td>
                       <td><%=r.getString("email")%></td>
                        <td><%=r.getString("mobile")%></td>
                         <td><%=r.getString("address")%></td>
                         <td><a href="Generatekey.jsp?id=<%=r.getString("id")%>&email=<%=r.getString("email")%>"><font color="red">Generate</font></a></td>
                  </tr>
                      <%
                  }
              }catch(Exception e){
                  System.out.println(e);
                          
              }%>
              </table>
          
          </div>
          <div class="col-md-4">
            <div><img src="images/company.webp" class="image_1"></div>
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