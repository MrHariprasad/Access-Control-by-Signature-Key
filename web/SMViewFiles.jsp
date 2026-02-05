<%-- 
    Document   : AViewFiles
    Created on : 18 Feb, 2023, 3:51:15 PM
    Author     : GKV
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
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
               <a class="nav-link" href="AdminHome.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="SMViewProfile.jsp">View Profile</a>
              </li>
            
                <li class="nav-item ">
                <a class="nav-link" href="SMViewFiles.jsp">View Files</a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="Client.jsp">Logout</a>
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
          <div class="col-md-8">
              <%
               String email=(String)session.getAttribute("email");
        String mobile=(String)session.getAttribute("mobile");
 String role=(String)session.getAttribute("role");
              
              %>
              <h2 class="services_taital">VEIW <font color="red">ALL FILES</font></h2>
              <table border="1">
                  <tr><th>FileName</th><th>File Data</th><th>Cipher Data</th><th>Uploaded Date</th><th>Delete</th></tr>
              <%
              try{
                  ResultSet r=Queries.getExecuteQuery("select * from file ");
                  
                  while(r.next()){
                   
                      %>
                  <tr>
                     
                      <td><%=r.getString("fname")%></td>
                      <td><textarea cols="50" rows="10"><%=r.getString("fdata")%></textarea></td>
                        <td><textarea cols="50" rows="10"><%=r.getString("cipher")%></textarea></td>
                         <td><%=r.getString("date")%></td>
                         <td><a href="Delete.jsp?id=<%=r.getString("id")%>"><font color="red">Delete</font></a></td>
                       
                  </tr>
                      <%
                  }
              }catch(Exception e){
                  System.out.println(e);
                          
              }%>
              </table>
            
           
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