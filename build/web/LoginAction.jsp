<%-- 
    Document   : LoginAction
    Created on : 18 Feb, 2023, 11:58:07 AM
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

    String username=request.getParameter("username");
    String password=request.getParameter("password");
     String role=request.getParameter("role");

    ResultSet rs=Queries.getExecuteQuery("select * from register where username='"+username+"'and password='"+password+"' and role='"+role+"'");
    if(rs.next()){
        String status=rs.getString("role");
        if(status.equals("waiting")){
             %>
    <script type='text/javascript'>
        window.alert("No Role Assigned By Manager..!!");
        window.location="Client.jsp";
    </script>
    <%
        }else if(role.equals("Admin")){
         session.setAttribute("email",rs.getString("email"));
        session.setAttribute("mobile",rs.getString("mobile"));
        session.setAttribute("role",rs.getString("role"));
     %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="AdminHome.jsp";
    </script>
    <%
      }else if(role.equals("SystemManager")){
        session.setAttribute("email",rs.getString("email"));
        session.setAttribute("mobile",rs.getString("mobile"));
 session.setAttribute("role",rs.getString("role"));
     %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="SystemManagerHome.jsp";
    </script>
    <%
}else if(role.equals("Client")){
 session.setAttribute("email",rs.getString("email"));
        session.setAttribute("mobile",rs.getString("mobile"));
 session.setAttribute("role",rs.getString("role"));
     %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="ClientHome.jsp";
    </script>
    <%
}else{
%>
    <script type='text/javascript'>
        window.alert("Please Check UerName/Password");
        window.location="Client.jsp";
    </script>
    <%
}
    }else{
    %>
    <script type='text/javascript'>
        window.alert("Please Check UerName/Password");
        window.location="Client.jsp";
    </script>
    <%
    }
}catch(Exception e){
 out.println(e);   
}



%>