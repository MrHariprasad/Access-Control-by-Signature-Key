<%-- 
    Document   : AssignAction
    Created on : 18 Feb, 2023, 11:51:16 AM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String id=request.getParameter("id");
String role=request.getParameter("role");


int i=Queries.getExecuteUpdate("update register set role='"+role+"'where id='"+id+"'");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Role Assigned Successfully..!!");
       window.location="ViewAllUsers.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Role Assign Failed..!!");
       window.location="ViewAllUsers.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
