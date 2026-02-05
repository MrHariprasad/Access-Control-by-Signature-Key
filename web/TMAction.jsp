<%-- 
    Document   : TMAction
    Created on : 18 Feb, 2023, 9:30:17 AM
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
    

    ResultSet rs=Queries.getExecuteQuery("select * from manager where username='"+uname+"'and password='"+password+"'");
    if(rs.next()){
      
           %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="ManagerHome.jsp";
    </script>
    <%    
    }else{
    %>
    <script type='text/javascript'>
        window.alert("Please Check UerName/Password");
        window.location="TManager.jsp";
    </script>
    <%
    }
}catch(Exception e){
 out.println(e);   
}



%>