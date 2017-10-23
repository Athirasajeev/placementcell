<%-- 
    Document   : dept_add
    Created on : Sep 16, 2017, 11:24:01 AM
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
                
                var regdept=/^[a-zA-Z]{3,9}$/;
                var dept=document.getElementById('name').value;
               
                if((dept.match(regdept)))
                {
                    document.getElementById("valdept").innerHTML=""
                }else
                { alert(dept);
                    document.getElementById("valdept").innerHTML="Invalid data";
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
        
    <body>
       
        <form class="">
            <%
                String deptname="",deptid="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_department where dept_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        deptname=rs.getString("dept_name");
                       
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_department where dept_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("Department.jsp");
            }
                }
                %>
            <table class="table table-bordered">
                <tr><td colspan="2"><h1 style="font-family:sans-serif ">Department Details</h1></td></tr>
        <tr><td>Department Name:</td><td><input type="text" value="<%=deptname%>" required="" name="depname" id="name" ><div style="color: red" id="valdept"></div></td></tr><br>
                <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
                    <td><input class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                <input type="hidden" value="<%=editid%>" name="hid" id="name">
        <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String name=request.getParameter("depname");
                   if(request.getParameter("hid")!="")
                        {
                             String up="update tbl_department set dept_name='"+name+"' where dept_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("Department.jsp");
                                     }
                           out.println(up);
                         }
                         else
                   {
                   String ins="insert into tbl_department(dept_name)values('"+name+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
                <table class="table table-bordered">
                    <tr><td colspan="2"><h2 style="font-family: sans-serif "><center>Department Details</center></h2></td>
                    <tr><td style="font-family: sans-serif"><center> Department Name</center></td><td></td></tr>
                   <%
                       String dis= "select * from tbl_department";
                       ResultSet rs=obj.Select(dis);
                       while(rs.next())
                       {%>
               <tr><td><%=rs.getString("dept_name")%></td><td><a class="btn btn-link " href="Department.jsp?eid=<%=rs.getString("dept_id")%>">Edit</a><a class="btn btn-link " href="Department.jsp?did=<%=rs.getString("dept_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %> 
                    </head>
            </table>
        </form>
    </body>
</html>
<%@include file="AdminFooter.jsp" %>