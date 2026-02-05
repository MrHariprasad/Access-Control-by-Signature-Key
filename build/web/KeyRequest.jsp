<%-- 
    Document   : KeyRequest
    Created on : 18 Feb, 2023, 12:35:23 PM
    Author     : GKV
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String id=request.getParameter("id");

ResultSet rr=Queries.getExecuteQuery("select count(*) from register where id='"+id+"'and status='Pending'");
int c=0;
while(rr.next()){
   c=rr.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("update register set status='Pending' where id='"+id+"'");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Request Sent Successfully..!!");
       window.location="RequestKey.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Request Failed..!!");
       window.location="RequestKey.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Request Already Sent..!!");
       window.location="RequestKey.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
