<%-- 
    Document   : CloudServiceregAction
    Created on : 18 Feb, 2023, 2:07:56 PM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String email=request.getParameter("email");
String role=request.getParameter("role");
String keystatus=request.getParameter("status");
String skey=request.getParameter("skey");
String sskey=null;
if (skey==null){
    sskey="No Key";
}else{
   sskey=skey;
}

ResultSet rr=Queries.getExecuteQuery("select count(*) from newservice where email='"+email+"'");
int c=0;
while(rr.next()){
   c=rr.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into newservice values(null,'"+email+"','"+role+"','"+keystatus+"','"+sskey+"','waiting','waiting')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("New Service Registration Successfully..!!");
       window.location="NewRegister.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("New Service Registration Failed..!!");
       window.location="NewRegister.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Service Registrations Already Sent..!!");
       window.location="NewRegister.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
