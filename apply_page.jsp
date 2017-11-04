<%-- 
    Document   : apply_page
    Created on : Oct 30, 2017, 11:38:43 AM
    Author     : student8
--%>
<%@include file="Studentheader.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <form>
            <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                        String jid=request.getParameter("hidjob");
                     
                      
                   
                   String ins="insert into tbl_jobapplication(job_id,stud_id,appli_date)values( '"+jid+"','"+session.getAttribute("stud_id")+"',curdate())";
                   boolean b=obj.insert(ins);
                   if(b)
                   {%>
                        <script type="text/javascript">
            alert("Application Applied Successfully..");
            setTimeout(function() {
                window.location.href = 'StudentHomePage.jsp'
            }, 100);
        </script>

                   <%}else
                   out.println(ins);
                 
               }
               %>
             
        <table class="table table-bordered">
            <%
                String vacca_id=request.getParameter("vacc_id");
                       String dis= "   select * from tbl_company c,tbl_jobcriteria jc,tbl_jobdetails j where  j.job_id=jc.job_id and c.company_id=j.company_id  and j.job_id='"+vacca_id+"'";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                       {
                           
            %>
                       <tr><td colspan="3"><h2><center>JOB DETAILS</center></h2></td>
                       <tr><td>Locality</td><td><%=rs1.getString("company_address")%></td></tr>
                       <tr><td>Role</td><td><%=rs1.getString("job_name")%></td></tr>
                       <tr><td>Basic Salary</td><td><%=rs1.getString("job_basicsalary")%></td></tr>
                       <tr><td>Designation</td><td><%=rs1.getString("job_name")%></td></tr>
                       <tr><td>No of Vaccancies</td><td><%=rs1.getString("job_novaccancy")%></td></tr>
                       <tr><td>Criteria Of Degree Mark</td><td><%=rs1.getString("criteria_degreemark")%></td></tr>
                       <tr><td colspan="2"><input class="btn btn-block" type="submit" name="sub" value="Apply" onclick="return validate()"></td> 
                     
                         
                   
                       
                  <% }  %>  
                  </table>
                  <input type="hidden" name="hidjob" value="<%=vacca_id%>">
            </form>
        
        
    </body>
</html>
<%@include file="Studentfooter.jsp" %>