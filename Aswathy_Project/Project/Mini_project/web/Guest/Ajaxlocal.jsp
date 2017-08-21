<%-- 
    Document   : Ajaxplace
    Created on : Aug 12, 2017, 12:36:15 PM
    Author     : student8
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbconnection"id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
     String placeid=request.getParameter("placeid");
     %> 
     
  <select name="local" id="sel2">
<option value="select">select</option>
<%
    String sel2="select * from tbl_local where place_id='"+placeid+"'";
    ResultSet rc=obj.Select(sel2);
    while(rc.next())
    { %>
        <option value="<%=rc.getString("local_id")%>"><%=rc.getString("local_name")%></option>
        <% }
%>
    </select>
    
    </body>
</html>
