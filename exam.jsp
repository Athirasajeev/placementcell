<%@include file="companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
   
       
            <%
                String job_id=request.getParameter("job_id");
                String exam_date="",exam_name="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_exam where exam_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        exam_date=rs.getString("exam_date");
                        exam_name=rs.getString("exam_name");
                       
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_exam where exam_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("exam.jsp");
            }
                }
            %>
                <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                        
                       
                         exam_name=request.getParameter("exam_name");
                         exam_date=request.getParameter("exam_date");
                        if(request.getParameter("hid")!="")
                         {
                             String up="update tbl_exam set exam_date='"+exam_date+"',exam_name='"+exam_name+"' where exam_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("exam.jsp");
                                     }
                             out.println(up);
                             
                         }
                         else
                   {
                        String ins="insert into tbl_exam(exam_date,exam_name,job_id)values('"+exam_date+"','"+exam_name+"','"+job_id+"')";
                        boolean b=obj.insert(ins);
                        out.println(b);
                    }
                    }
                    %>
            </head>
             <body>
                 
            <form name="exam">
                 <center>
                     <input type="hidden" name="job_id" value="<%=job_id%>">
                     <table class="table table-bordered">
                         <th colspan="3"><h2 style="font-family: serif"><center>Exam Details</center></h2></th>
                         <tr><td>Exam Date:</td><td><input type="DATE" value="<%=exam_date%>" name="exam_date"></td></tr>
                       <tr><td>Exam name:</td><td><input type="text" value="<%=exam_name%>" name="exam_name"></td></tr>

                       <tr><td><input type="submit" name="sub" value="SAVE"></td>
       <td><input type="reset" name="cancel" value="CANCEL"></td></tr>
           <input type="hidden" name="hid" value="<%=editid%>">                        
                                </select>
                    </table>
                          
                                <table class="table table-bordered">
                                    <tr><td colspan="3"><h2 style="font-family: serif"><center>Exam Details</center></h2></td>
                   <tr><td><center>Exam Date</center></td><td><center>Exam name</center></td><td></tr>
                
                   <%
                       String dis= "select * from tbl_exam";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                       {
                           
    %>
                       <tr><td><%=rs1.getString("exam_date")%></td>
                           <td><%=rs1.getString("exam_name")%></td><td><a href="exam.jsp?eid=<%=rs1.getString("exam_id")%>">Edit</a><a href="exam.jsp?did=<%=rs1.getString("exam_id")%>">Delete</a></td><td><a href="ExamQuestions.jsp?examid=<%=rs1.getString("exam_id")%>">Add Questions</a></td></tr>
                         <% }  %>  
                  </table>
                   </center>
            </form>
        
    </body>
</html>
<%@include file="companyfooter.jsp" %>
