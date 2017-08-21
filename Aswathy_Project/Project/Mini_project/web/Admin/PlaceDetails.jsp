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
        <title>Place Details</title>
    </head>
    <body>
        <form>
       <%
           if(request.getParameter("did")!=null)
           {
               String del="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
               boolean b=obj.insert(del);
               out.print(b);
               if(b)
               {
                   response.sendRedirect("PlaceDetails.jsp");
               }
                
            }
    String submit=request.getParameter("sub");
    if(submit!=null)
    {
        String name=request.getParameter("place");
        String dist=request.getParameter("name");
        String ins="insert into tbl_place(place_name,district_id)values('"+name+"','"+dist+"')";
        boolean b=obj.insert(ins);
        out.println(b);
    }
    %>
<table>
<tr>
<td>District Name:</td><td><select name="name" id="sel">
<option value="select">select</option>
<%
    String sel="select * from tbl_district";
    ResultSet rs=obj.Select(sel);
    while(rs.next())
    { %>
        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
        <% }
%>
    </select></td>
</tr>
<tr><td>place name:</td><td><input type="text" name="place" id="place"></td></tr>
<tr>
<td><input type="submit" name="sub" value="submit"></td>
<td><input type="button" name="cancel" value="cancel"></td>
</tr>
</table>
     <table>
         <tr><td><h2>District</h2></td><td><h2>Place name</h2></td></tr>
               <%
    String ss="select * from tbl_place p,tbl_district d where d.district_id=p.district_id";
    ResultSet rf=obj.Select(ss);
    while(rf.next())
    { %>
    <tr><td><%=rf.getString("district_name")%></td><td><%=rf.getString("place_name")%></td><td><a href="#">Edit</a>
            <a href="PlaceDetails.jsp?did=<%=rf.getString("place_id")%>">delete</a> </td></tr>
        <% }
%>
  </table>
       </form>
 
    </body>
</html>
