<%-- 
    Document   : StudentHomePage
    Created on : Oct 30, 2017, 10:48:28 AM
    Author     : student8
--%>
<%@include file="Studentheader.jsp" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                         response.sendRedirect("apply_page.jsp");
                    }
                    %>
          <form>
              <table class="table table table-bordered ">
              
                                    <th colspan="4"><h2><center>Job And Exam Details</center></h2></th>
                   <tr><td><center>Job Name</center></td><td><center>Company Name</center></td><td><center>Last Date Of apply</center></td></tr>
              
                   <%
                       String dis= "select  * from tbl_jobdetails jb,tbl_company co where  jb.company_id=co.company_id and jb.job_lastdate>=CURDATE()";

                       ResultSet rs4=obj.Select(dis);
                     while(rs4.next())
                       {int crsslc=0,crplus=0,crdegree=0;
                         String selcr="select * from tbl_jobcriteria where job_id='"+rs4.getString("job_id")+"'";
                         ResultSet rscr=obj.Select(selcr);
                         if(rscr.next())
                         {
                             crsslc=rscr.getInt("criteria_10mark");
     crplus=rscr.getInt("criteria_12mark");
      crdegree=rscr.getInt("criteria_degreemark");
                         }
                           
                           
                           
                           
                           
                           
                           
                           
                           String Status="",color="";
String selq="select * from tbl_jobapplication where job_id='"+rs4.getString("job_id")+"' and stud_id='"+session.getAttribute("stud_id")+"'";                           
ResultSet rsq=obj.Select(selq);
if(rsq.next())
{
    Status="Already Applied";
    color="green";
}int mysslc=0,myplus=0,mydegree=0;
String selst="select * from tbl_student  where stud_id='"+session.getAttribute("stud_id")+"'";
ResultSet rsst=obj.Select(selst);
if(rsst.next())
{
    mysslc=rsst.getInt("stud_percentage10");
     myplus=rsst.getInt("stud_percentage12");
      mydegree=rsst.getInt("stud_percentagedegree");
}

if((mysslc<crsslc)||(myplus<crplus)||(mydegree<crdegree))
{
      Status="Not Eligible";
    color="red";
}










                           
    %>

     
                       
    <tr><td><%=rs4.getString("job_name")%>
                        <td><%=rs4.getString("company_name")%></td>
                       <td><%=rs4.getString("job_lastdate")%></td>
                        
                      <td>
                          <%if(Status!=""){%><label style="color: <%=color%>"><%=Status%></label>
                              <%}else{%>
                       <a href="apply_page.jsp?vacc_id=<%=rs4.getString("job_id")%>">Apply Now</a></td>
                              
                      
<% } } %>
                       
                  
                  
                  </table>
                  
            </form>
             
    </body>
</html>
<%@include file="Studentfooter.jsp" %>
    </body>
</html>
