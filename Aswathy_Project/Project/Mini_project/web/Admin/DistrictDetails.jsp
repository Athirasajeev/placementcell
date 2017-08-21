<%-- 
    Document   : DistrictDetails
    Created on : Aug 7, 2017, 12:36:14 PM
    Author     : student8
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbconnection"id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <title>District</title>
    </head>
    <body>
        <form>
       <%
             String distname="",distid="";
             if(request.getParameter("eid")!=null)
             {
                 String sel1="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                 ResultSet rs=obj.Select(sel1);
                 if(rs.next())
                 {
                     distname=rs.getString("district_name");
                 }
             }
           if(request.getParameter("did")!=null)
           {
               String del="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
               boolean b=obj.insert(del);
               out.print(b);
               if(b)
               {
                   response.sendRedirect("DistrictDetails.jsp");
               }
                
            }
           
    String submit=request.getParameter("sub");
    if(submit!=null)
    {
        String name=request.getParameter("name");
        String ins="insert into tbl_district(district_name)values('"+name+"')";
        boolean b=obj.insert(ins);
        out.println(b);
    }
    %>
       <form name="frm">
<table>
<tr>
<td>District Name:</td><td><input type="text" value="<%=distname%>" id="name" name="name"></td>
</tr>
<tr>
<td><input type="submit" name="sub" value="submit"></td>
<td><input type="button" name="cancel" value="cancel"></td>
</tr>
</table>
           <table>
               <tr><td>DISTRICT NAME</td></tr>
               <%
    String sel="select * from tbl_district";
    ResultSet rs=obj.Select(sel);
    while(rs.next())
    { %>
    <tr><td><%=rs.getString("district_name")%></td><td><a href="DistrictDetails.jsp?eid=<%=rs.getString("district_id")%>">Edit</a>
            <a href="DistrictDetails.jsp?did=<%=rs.getString("district_id")%>">delete</a> </td></tr>
        <% }
%>
  </table>
 </form>
 
 </body>
</html>
