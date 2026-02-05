<%-- 
    Document   : Generatekey
    Created on : 18 Feb, 2023, 1:14:03 PM
    Author     : GKV
--%>



<%@page import="com.mail.Mail"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String id=request.getParameter("id");
String email=request.getParameter("email");


Random r=new Random();
int cc=r.nextInt(10000-500)+99;
String k=""+cc;

Mail.secretMail(k,email,email);

int i=Queries.getExecuteUpdate("update register set skey='"+k+"',status='Generated' where id='"+id+"'");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Key Generated And Sent To Their Mail ID..!!");
       window.location="ViewKeyRequest.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Key Generation Failed..!!");
       window.location="ViewKeyRequest.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
