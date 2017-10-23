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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            
            function validate()
            {
                var status="true";
                
                var regsem=/^[a-zA-Z 0-9]{4,9}$/;
                var sem=document.getElementById('name').value;
               
                if((sem.match(regsem)))
                {
                    document.getElementById("valsem").innerHTML=""
                }else
                { alert(sem);
                    document.getElementById("valsem").innerHTML="Invalid data";
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
    </head>
    <body>
        <form class="">
            <%
                String semname="",semid="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_semester where sem_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        semname=rs.getString("sem_name");
                       
                    }
                }
             
            if(request.getParameter("did")!=null)
           {
            String del="delete from tbl_semester where sem_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("Semester.jsp");
            }
            }
                %>
            <table class="table table-bordered" >
        <h1>Semester Details</h1>
        <tr><td>Semester Name:</td><td><input type="text" value="<%=semname%>" required="" name="semname" id="name"><div style="color: red" id="valdept"></div></td></tr><br>
                <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick="return validate"></td>
                    <td><input class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                <input type="hidden" value="<%=editid%>" name="hid" id="name">
        <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String name=request.getParameter("semname");
                   if(request.getParameter("hid")!="")
                        {
                             String up="update tbl_semester set sem_name='"+name+"' where sem_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("Semester.jsp");
                                     }
                           out.println(up);
                         }
                         else
                   {
                   String ins="insert into tbl_semester(sem_name)values('"+name+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
                <table class="table table-bordered">
                    <tr><td colspan="2"><h2><center>Semester Details</center></h2></td>
                    <tr><td colspan="2"><center>Semester Name</center></td></tr>
                   <%
                       String dis= "select * from tbl_semester";
                       ResultSet rs=obj.Select(dis);
                       while(rs.next())
                       {%>
               <tr><td><%=rs.getString("sem_name")%></td><td><a href="Semester.jsp?eid=<%=rs.getString("sem_id")%>">Edit</a><a href="Semester.jsp?did=<%=rs.getString("sem_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %> 
            </table>
        </form>
    </body>
</html>

<%@include file="AdminFooter.jsp" %>