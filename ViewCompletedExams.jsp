<%-- 
    Document   : ViewCompletedExams
    Created on : Nov 4, 2017, 2:31:57 PM
    Author     : student8
--%>
<%@include file="companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function genResult(examId){
        $.ajax({url: "AjaxGenResult.jsp?examId="+examId, success: function(result){
                var res=result.trim();
                alert(res)
                if(res=="true")
     $("#"+examId).html("Result Genarated");
    }});
            }
       </script>
       
        
        
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
    <body>
       <table class="table table-bordered">
           <tr><td colspan="3"><h2><center>Completed Exams</center></h2></td></tr>
           <tr><th>Job Name</th><th>Exam Name</th><th></th></tr>
            <%
                
                       String dis= "select * from tbl_company c,tbl_exam e,tbl_jobdetails j where  j.job_id=e.job_id and c.company_id=j.company_id and exam_date<=CURDATE()";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                       {
                           
                          
            %>
                      
                      
                       <tr><td><%=rs1.getString("job_name")%></td>
                      <td><%=rs1.getString("exam_name")%></td>
                      <td colspan="2"><div id="<%=rs1.getString("exam_id")%>"><%if(rs1.getString("exam_status").equals("0")){%><input class="btn btn-primary" type="submit" name="sub" onclick="genResult(<%=rs1.getString("exam_id")%>)"  value="View Result"><%}else{%>Result Genarated<%}%></div></td></tr>
                     
                         
                   
                       
                  <% }  %>  
                  </table>
    </body>
</html>
<%@include file="companyfooter.jsp" %>
    </body>
</html>
