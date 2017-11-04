<%-- 
    Document   : StudentExamList
    Created on : Nov 4, 2017, 12:31:41 PM
    Author     : student8
--%>
<%@include file="Studentheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam List Page</title>
        
    </head>
    
    <body>
      <table class="table table-bordered">
           <tr><td colspan="3"><h2><center>Today's ExamZ</center></h2></td>
            <%
                
                       String dis= "select * from tbl_company c,tbl_exam e,tbl_jobdetails j where  j.job_id=e.job_id and c.company_id=j.company_id and exam_date=CURDATE()";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                       {
                           String selq="select * from tbl_jobapplication where job_id='"+rs1.getString("job_id")+"' and stud_id='"+session.getAttribute("stud_id")+"'";
                           ResultSet rsq=obj.Select(selq);
                           if(rsq.next()){
            %>
                      
                       <tr><td>Company Name</td><td><%=rs1.getString("company_name")%></td></tr>
                       <tr><td>Job Name</td><td><%=rs1.getString("job_name")%></td></tr>
                       <tr><td>Exam Name</td><td><%=rs1.getString("exam_name")%></td></tr>
                        <tr><td><a href="OnlineExam.jsp?examid=<%=rs1.getString("exam_id")%>">Click Here To Attend Exam</a></td></tr>
                     
                         
                   
                       
                  <% } } %>  
                  </table>
    </body>
</html>
<%@include file="Studentfooter.jsp" %>