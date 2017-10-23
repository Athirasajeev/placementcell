<%-- 
    Document   : semester_add
    Created on : Sep 16, 2017, 11:24:14 AM
    Author     : student10
--%>

<%@include file="AdminHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <script>
            
            function validate()
            {
                var status="true";
                
                var regbatch=/^[0-9 -]{9}$/;
                var batch=document.getElementById('batch_name').value;
               
                if((batch.match(regbatch)))
                {
                    document.getElementById("valbatch").innerHTML=""
                }else
                { alert(batch);
                    document.getElementById("valbatch").innerHTML="Invalid data";
                    status="false";
                }
                
                
                
                
                
                
                if(status=="false")
                {
                    return false;
                }
                else
                {
                    return true;
                }
                
            }
            
            </script>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <form class="">
            <%
                String batch_name="",batch_id="",batch_from="",batch_to="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_batch where batch_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        batch_name=rs.getString("batch_name");
                        batch_from=rs.getString("batch_from");
                        batch_to=rs.getString("batch_to");
                       
                    }
                }
             
            if(request.getParameter("did")!=null)
           {
            String del="delete from tbl_batch where batch_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("Batch.jsp");
            }
            }
                %>
                <table class="table table-bordered">
                    <tr><td colspan="2"><center><h1 style="font-family: sans-serif">Batch Details</h1></center></td></tr>
        <tr><td>Batch Name:</td><td><input  class="text text-info" type="text" value="<%=batch_name%>" required="" name="batch_name" id="batch_name"><div style="color: red" id="valbatch"></div></td></tr><br>
         <tr><td>Batch From:</td><td><input type="date" value="<%=batch_from%>" required="" name="batch_from" id="batch_from"></td></tr><br>
         <tr><td>Batch To:</td><td><input type="date" value="<%=batch_to%>" required="" name="batch_to" id="batch_to"></td></tr><br>
         <tr><td><input class="btn btn-primary" type="submit" name="sub"  value="SAVE" onclick="return validate()"></td>
                    <td><input class="btn btn-primary" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                <input type="hidden" value="<%=editid%>" name="hid" id="name">
            </table>
        <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String batchname=request.getParameter("batch_name");
                   String batchfrom=request.getParameter("batch_from");
                   String batchto=request.getParameter("batch_to");
                  
                   if(request.getParameter("hid")!="")
                        {
                             String up="update tbl_batch set batch_name='"+batchname+"',batch_from='"+batchfrom+"',batch_to='"+batchto+"' where batch_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("Batch.jsp");
                                     }
                           out.println(up);
                         }
                         else
                   {
                   String ins="insert into tbl_batch(batch_name,batch_from,batch_to)values('"+batchname+"','"+batchfrom+"','"+batchto+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
                <table class="table table-bordered">
                    <tr><td colspan="4"><h2><center>Batch Details</center></h2></td></tr>
                    <tr><td><center>Batch Name</center></td>
                <td><center>Batch From</center></td>
        <td><center>Batch To</center></td><td></td></tr>
                   <%
                       String dis= "select * from tbl_batch";
                       ResultSet rs=obj.Select(dis);
                       while(rs.next())
                       {%>
               <tr><td><%=rs.getString("batch_name")%></td>
                   <td><%=rs.getString("batch_from")%></td>
                   <td><%=rs.getString("batch_to")%></td>
                   
                   <td><a class="btn btn-link " href="Batch.jsp?eid=<%=rs.getString("batch_id")%>">Edit</a>
                       <a class="btn btn-link " href="Batch.jsp?did=<%=rs.getString("batch_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %> 
            </table>
        </form>
    </center>
    </body>
</html>

<%@include file="AdminFooter.jsp" %>