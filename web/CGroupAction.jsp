<%-- 
    Document   : CGroupAction
    Created on : 18 Feb, 2023, 10:32:21 AM
    Author     : GKV
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
String role=request.getParameter("gname");


ResultSet r=Queries.getExecuteQuery("Select count(*) from groups where group_name='"+role+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into groups values(null,'"+role+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("group Created Successfull..!!");
       window.location="CreateGroups.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("group Creation Failed..!!");
       window.location="CreateGroups.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("group Already Exist..!!");
       window.location="CreateGroups.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
