<%-- 
    Document   : dept_add
    Created on : Sep 16, 2017, 11:24:01 AM
    Author     : student10
--%>
<%@include file="companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
            <%
                String criteria_10mark="",criteria_12mark="",criteria_degreemark="",job_id="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_jobcriteria where criteria_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        criteria_10mark=rs.getString("criteria_10mark");
                        criteria_12mark=rs.getString("criteria_12mark");
                        criteria_degreemark=rs.getString("criteria_degreemark");
                       
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_jobcriteria where criteria_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("jobcriteria.jsp");
            }
                }
                %>
                <form>
            <table class="table table-bordered">
                <th colspan="2"><h1 style="font-family: serif"><center>Job Criteria</center></h1></th>
                <tr><td>SSLC mark percentage:</td><td><input type="number" max="100" required="" value="<%=criteria_10mark%>" name="criteria_10mark" id="criteria_10mark"></td></tr><br>
         
         <tr><td>Plus Two mark percentage:</td><td><input type="number" max="100" required="" value="<%=criteria_12mark%>" name="criteria_12mark" id="criteria_12mark"></td></tr><br>
         <tr><td>Degree Mark Percentage:</td><td><input type="number" max="100" value="<%=criteria_degreemark%>" name="criteria_degreemark" id="criteria_degreemark"></td></tr><br>
         <tr><td>Job Name:</td><td><select name="job_name" required="" id="sel">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel="select * from tbl_jobdetails";
                                        ResultSet rs=obj.Select(sel);
                                        while(rs.next())
                                        {%>
                                        <option value="<%=rs.getString("job_id")%>" <% if(job_id.equals(rs.getString("job_id"))){%> selected=" " <%} %>><%=rs.getString("job_name")%>
                                        <% }

%></select>
                <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick=""></td>
                    <td><input class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                <input type="hidden" value="<%=editid%>" name="hid" id="name">
            </table>
               
        <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   criteria_10mark=request.getParameter("criteria_10mark");
                    criteria_12mark=request.getParameter("criteria_12mark");
                    criteria_degreemark=request.getParameter("criteria_degreemark");
                    job_id=request.getParameter("job_name");
                   if(request.getParameter("hid")!="")
                        {
                             String up="update tbl_jobcriteria set criteria_10mark='"+criteria_10mark+"',criteria_12mark='"+criteria_12mark+"',criteria_degreemark='"+criteria_degreemark+"',job_id='"+job_id+"' where criteria_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("jobcriteria.jsp");
                                     }
                           out.println(up);
                         }
                         else
                   {
                   String ins="insert into tbl_jobcriteria(criteria_10mark,criteria_12mark,criteria_degreemark,job_id)values('"+criteria_10mark+"','"+criteria_12mark+"','"+criteria_degreemark+"','"+job_id+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
                <table class="table table-bordered">
                    <tr><td colspan="5"><h2 style="font-family: serif"><center>Job Criteria</center></h2></td>
                   <tr><td><center> criteria_10mark</center></td><td><center> criteria_12mark</center></td><td><center> criteria_degreemark</center></td><td><center>Job name</center></td> <td></td> </tr>
                   
                   
                         <%
                       String dis= "select * from tbl_jobcriteria jc , tbl_jobdetails jd where jd.job_id=jc.job_id";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                       {%>
                           
                       <tr> <td><%=rs1.getString("criteria_10mark")%></td>
                           <td><%=rs1.getString("criteria_12mark")%></td>
                               <td><%=rs1.getString("criteria_degreemark")%></td>
                               <td><%=rs1.getString("job_name")%></td>
                                <td><a class="btn btn-link " href="jobcriteria.jsp?eid=<%=rs1.getString("criteria_id")%>">Edit</a><a  class="btn btn-link " href="jobcriteria.jsp?did=<%=rs1.getString("criteria_id")%>">Delete</a></td></td></tr>
                                         
                     <%  }
                       
                    %> 
            </table>
        </form>
    </body>
</html>
<%@include file="companyfooter.jsp" %>
