<%-- 
    Document   : exclude
    Created on : 18 Feb, 2023, 2:58:35 PM
    Author     : GKV
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String id=request.getParameter("id");



int i=Queries.getExecuteUpdate("update newservice set group_name='No Group Assigned' where id='"+id+"'");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Excluded From Group..!!");
       window.location="GroupUsers.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Failed To Exclude Failed..!!");
       window.location="GroupUsers.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
