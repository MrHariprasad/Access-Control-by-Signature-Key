<%-- 
    Document   : Assign_group
    Created on : 18 Feb, 2023, 2:38:47 PM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign group</title>
    </head>
    <body style="border:2px solid black;margin:25px;height:650px;">
    <center>
        <%String temail=(String)session.getAttribute("trust_email");%>
        <h1><u>Assign group</u></h1>
        <form action="AssignGAction.jsp" method="post">
        <table>
            <tr><th>Email</th><td><input type="text" name="email" value="<%=temail%>" readonly=""></td></tr>
                        <tr><th>Select Group</th><td><select name="group">
                <%try{
                    ResultSet r=Queries.getExecuteQuery("select * from groups");
                    while(r.next()){
                        %>
                                    <option><%=r.getString("group_name")%></option>             
                                    <%
                    }
                }catch(Exception e){
                    System.out.println(e);
}%>
                    </select></td></tr>
                        <tr><th></th><td><input type="submit" value="Assign Group"></td></tr>
        </table>
    </form>
    </center>
    </body>
</html>
