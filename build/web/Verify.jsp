<%-- 
    Document   : Verify
    Created on : 18 Feb, 2023, 2:29:16 PM
    Author     : GKV
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.DBCon"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String email=request.getParameter("email");
String skey=request.getParameter("skey");
Connection con=DBCon.getConnection();
Statement st=con.createStatement();


ResultSet rs=Queries.getExecuteQuery("select * from register where email='"+email+"'");
if(rs.next()){
    String skey1=rs.getString("skey");
   if(skey1.equals(skey)){
    
    
    Queries.getExecuteUpdate("update newservice set status='user-trust' where email='"+email+"'");
    session.setAttribute("trust_email",email);
    %>
    <script type="text/javascript">
       window.alert("verified Successfully..!!");
       window.location="Assign_group.jsp";
        </script>
    <%
  }else{
Random r=new Random();
int c=r.nextInt(100000+899)+6000;
String s=""+c;

Queries.getExecuteUpdate("update newservice set skey='"+s+"',status='user-zero trust',group_name='No Group Assigned' where email='"+email+"'");
 %>
    <script type="text/javascript">
       window.alert("Verification Failed\n So generated Random Key And Sent To Users..!!");
       window.location="NewServiceUsers.jsp";
        </script>
    <%
}      
}
}catch(Exception e){
  out.println(e);  
}
%>
