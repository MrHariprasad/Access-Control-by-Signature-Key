<%-- 
    Document   : FileUpddate
    Created on : 20 Mar, 2019, 8:37:23 PM
    Author     : VENKAT
--%>

<%@page import="com.database.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>

<%
    String fid=request.getParameter("fid");
   
     try
    {
        Connection con=DBCon.getConnection();
        Statement st=con.createStatement();
      int i=st.executeUpdate("delete from file where id='"+fid+"'");
      if(i>0)
      {
          %>
          <script type="text/javascript">
              window.alert("File Deleted SuccessFully");
              window.location="SMViewFiles.jsp";
              </script>
          <%
      }
else
{
%>
          <script type="text/javascript">
              window.alert("Unable to Delete file Details Right Now");
              window.location="SMViewFiles.jsp";
              </script>
          <%
}
}
catch(Exception e)
{
out.println(e);
}
%>