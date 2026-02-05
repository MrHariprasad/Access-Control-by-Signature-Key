<%-- 
    Document   : CRoleAction
    Created on : 18 Feb, 2023, 9:44:20 AM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String role=request.getParameter("role");


ResultSet r=Queries.getExecuteQuery("Select count(*) from roles where role_name='"+role+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into roles values(null,'"+role+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Role Created Successfull..!!");
       window.location="CreateRoles.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Role Creation Failed..!!");
       window.location="CreateRoles.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Role Already Exist..!!");
       window.location="CreateRoles.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
