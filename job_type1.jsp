<%-- 
    Document   : job_type1
    Created on : Oct 3, 2017, 10:55:23 AM
    Author     : student6
--%>

<%@include file="companyheader.jsp" %>
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
                
                var regtype=/^[a-zA-Z]{4,20}$/;
                var type=document.getElementById('jobtype_name').value;
               
                if((type.match(regtype)))
                {
                    document.getElementById("valtype").innerHTML=""
                }else
                { alert(type);
                    document.getElementById("valtype").innerHTML="Invalid Data";
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
                String jobtype_name="",jobtype_id="";
                String editid="";
                if(request.getParameter("editid")!=null)
                {
                    String sel="select * from tbl_jobtype where jobtype_id='"+request.getParameter("editid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("editid");
                        jobtype_name=rs.getString("jobtype_name");
                       
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_jobtype where jobtype_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("job_type1.jsp");
            }
                }
                %>
            <table class="table table-bordered">
                <tr><td colspan="2"><h1 style="font-family:serif "> <center>Job Type Details</center></h1></td></tr>
        <tr><td style="font-family: initial">JOB Name :</td><td><input type="text" value="<%=jobtype_name%>" required="" name="jobtype_name" id="jobtype_name" ><div style="color: red" id="valtype"></div></td></tr><br>
                <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
                    <td><input class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                <input type="hidden" value="<%=editid%>" name="hid" id="name">
        <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String name=request.getParameter("jobtype_name");
                   if(request.getParameter("hid")!="")
                        {
                             String up="update tbl_jobtype set jobtype_name='"+name+"' where jobtype_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("job_type1.jsp");
                                     }
                           out.println(up);
                         }
                         else
                   {
                   String ins="insert into tbl_jobtype(jobtype_name)values('"+name+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
                <table class="table table-bordered">
                    <tr><td colspan="2"><h2 style="font-family:serif "><center> job Type Details </center></h2></td>
                    <tr><td> job Name</td><td></td></tr>
                   <%
                       String dis= "select * from tbl_jobtype";
                       ResultSet rs=obj.Select(dis);
                       while(rs.next())
                       {%>
               <tr><td><%=rs.getString("jobtype_name")%></td><td><a class="btn btn-link " href="job_type1.jsp?editid=<%=rs.getString("jobtype_id")%>">Edit</a><a class="btn btn-link " href="job_type1.jsp?did=<%=rs.getString("jobtype_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %> 
                    </head>
            </table>
        </form>
    </body>
</html>
<%@include file="companyfooter.jsp" %>

