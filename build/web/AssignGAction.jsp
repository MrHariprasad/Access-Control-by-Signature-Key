<%-- 
    Document   : AssignGAction
    Created on : 18 Feb, 2023, 2:45:13 PM
    Author     : GKV
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String email=request.getParameter("email");
String group=request.getParameter("group");


int i=Queries.getExecuteUpdate("update newservice set group_name='"+group+"'where email='"+email+"'");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Group Assigned Successfully..!!");
       window.location="NewServiceUsers.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Group Assign Failed..!!");
       window.location="NewServiceUsers.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
