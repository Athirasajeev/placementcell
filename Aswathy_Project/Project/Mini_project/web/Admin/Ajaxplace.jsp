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
     String districtid=request.getParameter("districtid");
     %> 
     
   <select name="place" id="sel1">
<option value="select">select</option>
<%
    String sel1="select * from tbl_place where district_id='"+districtid+"'";
    ResultSet rr=obj.Select(sel1);
    while(rr.next())
    { %>
        <option value="<%=rr.getString("place_id")%>"><%=rr.getString("place_name")%></option>
        <% }
%>
    </select>
    
    </body>
</html>
