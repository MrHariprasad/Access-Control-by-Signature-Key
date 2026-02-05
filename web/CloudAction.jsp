<%-- 
    Document   : CloudAction
    Created on : 18 Feb, 2023, 11:35:36 AM
    Author     : GKV
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

try{

    String uname=request.getParameter("username");
    String password=request.getParameter("password");
    

    ResultSet rs=Queries.getExecuteQuery("select * from cloud where username='"+uname+"'and password='"+password+"'");
    if(rs.next()){
      
           %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="CloudHome.jsp";
    </script>
    <%    
    }else{
    %>
    <script type='text/javascript'>
        window.alert("Please Check UerName/Password");
        window.location="Cloud.jsp";
    </script>
    <%
    }
}catch(Exception e){
 out.println(e);   
}



%>