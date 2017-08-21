<%-- 
    Document   : LocalDetails
    Created on : Aug 12, 2017, 10:42:20 AM
    Author     : student8
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbconnection"id="obj"></jsp:useBean>
<!DOCTYPE html>
       
<html>
    <head>
        <script src="../jquery/jquery.min.js" ></script>
        <script>
            
            function selplace(distid)
            {
                alert(distid)
                $.ajax({url: "Ajaxplace.jsp?districtid="+distid, success:function(result){
                         //  alert(result)
                $("#sel1").html(result);            
                }});
            }
        </script>
    </head
    <body>
       
        <%
            String locname="",plcid="",distid="";
            String Editid="";
             if(request.getParameter("eid")!=null)
             {
                 String sel2="select * from tbl_local l,tbl_place p,tbl_district d where l.place_id=p.place_id and p.district_id=d.district_id and i.local_id='"+request.getParameter("eid")+"'";
                 ResultSet rs=obj.Select(sel2);
                 if(rs.next())
                 {
                     Editid=request.getParameter("eid");
                     locname=rs.getString("local_name");
                     plcid=rs.getString("place_id");
                     distid=rs.getString("district_id");
                 }
             }
      
           
           if(request.getParameter("did")!=null)
           {
               String del="delete from tbl_local where local_id='"+request.getParameter("did")+"'";
               boolean b=obj.insert(del);
               out.print(b);
               if(b)
               {
                   response.sendRedirect("LocalDetails.jsp");
               }
                
            }
           %>
            <form>
                <input type="hidden" name="hid" value="<%=Editid%>">
                <%
    String submit=request.getParameter("sub");
    if(submit!=null)
    {
        String local=request.getParameter("local");
        String place=request.getParameter("place");
        if(request.getParameter("hid")!="")
        {
            String up="update tbl_local set local_name='"+local+"',place_id='"+place+"' where local_id='"+request.getParameter("hid")+"'";
            out.println(up);
            boolean b=obj.insert(up);
            if(b)
            {
               response.sendRedirect("LocalDetails.jsp");
            }
            out.println(up);
        }
        else
        {
        String ins="insert into tbl_local(local_name,place_id)values('"+local+"','"+place+"')";
        out.println(ins);
        boolean b=obj.insert(ins);
        if(b)
        {
        response.sendRedirect("LocalDetails.jsp");    
        }
        out.println(b);
      }
    }
    %>
    <table>
<tr>
    <td>District Name:</td><td><select name="name" onchange="selplace(this.value)" id="sel">
<option value="select">select</option>
<%
    String sel="select * from tbl_district";
    ResultSet rs=obj.Select(sel);
    while(rs.next())
    { %>
    <option value="<%=rs.getString("district_id")%>"<%if(distid.equals(rs.getString("district_id"))){%> selected="" <%}%>> <%=rs.getString("district_name")%></option>
        <% }
%>
    </select></td>
</tr>

<tr>
<td>Place Name:</td><td>
 <select name="place" id="sel1">
<option value="select">select</option>
<%
    String sel1="select * from tbl_place";
    ResultSet rr=obj.Select(sel1);
    while(rr.next())
    { %>
         <option value="<%=rr.getString("place_id")%>"<%if(plcid.equals(rr.getString("place_id"))){%> selected="" <%}%>> <%=rr.getString("place_name")%></option>
        <% }
%>
    </select>
</td>
</tr>


<tr><td>Local name:</td><td><input type="text" name="local" id="local"></td></tr>
<tr>
<td><input type="submit" name="sub" value="submit"></td>
<td><input type="button" name="cancel" value="cancel"></td>
</tr>
</table>
    <table>
         <tr><td><h2>District name </h2></td><td><h2>Place name </h2></td><td><h2> Local name</h2></td></tr>
             <%
    String ss="select * from tbl_local l,tbl_place p,tbl_district d where l.place_id=p.place_id and p.district_id=d.district_id";
    ResultSet rf=obj.Select(ss);
    while(rf.next())
    { %>
    <tr><td><%=rf.getString("district_name")%></td>
        <td><%=rf.getString("place_name")%></td>
        <td><%=rf.getString("local_name")%></td>
        <td><a href="LocalDetails.jsp?eid=<%=rf.getString("local_id")%>">Edit</a>
            <a href="LocalDetails.jsp?did=<%=rf.getString("local_id")%>">delete</a> </td></tr>
        <% }
%>
  </table>
       </form>
 
    </body>
</html>
