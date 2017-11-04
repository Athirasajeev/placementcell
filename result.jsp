<%@include file="Officerheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <center>
        <body>
            <form name="result">
            <%
                
                String result_mark="",stud_id="",result_outof="",result_percentage="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_result where result_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        result_mark=rs.getString("result_mark");
                        stud_id=rs.getString("stud_id");
                        result_outof=rs.getString("result_outof");
                        result_percentage=rs.getString("result_percentage");
                       
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_result where result_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("result.jsp");
            }
                }
            %>
                <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                       stud_id=request.getParameter("stud_name");
                       result_mark=request.getParameter("result_mark");  
                       result_outof=request.getParameter("result_outof");
                       result_percentage=request.getParameter("result_percentage");
                      
                       if(request.getParameter("hid")!="")
                         
                         {
                             String up="update tbl_result set stud_id='"+stud_id+"' result_mark='"+result_mark+"',result_outof='"+result_outof+"',result_percentage='"+result_percentage+"' where job_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("result.jsp");
                                     }
                             out.println(up);
                             
                         }
                       
                       else
                   {
                        String ins="insert into tbl_result(stud_id,result_mark,result_outof,result_percentage)values('"+stud_id+"','"+result_mark+"','"+result_outof+"','"+result_percentage+"')";
                        Boolean b=obj.insert(ins);
                        out.println(b);
                    }
                    }
                    %>
                    
                     <table>
                        <th><h2>Result Details</h2></th><br><br>
                       
                        <tr><td>Student Name:</td><td><select name="stud_name" id="sel">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel="select * from tbl_student";
                                        ResultSet rs1=obj.Select(sel);
                                        while(rs1.next())
                                        {%>
                                        <option value="<%=rs1.getString("stud_id")%>" <% if(stud_id.equals(rs1.getString("stud_id"))){%> selected=" " <%} %>><%=rs1.getString("stud_name")%></option>
                                        <% }
%>
                                </select>
                            </td>
                        </tr>
<tr><td>Mark:</td><td><input type="text" value="<%=result_mark%>" name="result_mark"></td></tr><br>
<tr><td>Result Out Of:</td><td><input type="text" value="<%=result_outof%>" name="result_outof"></td></tr><br>
<tr><td>Result Percentage:</td><td><input type="text" value="<%=result_percentage%>" name="result_percentage"></td></tr><br>
                                
<tr><td><input type="submit" name="sub" value="SAVE"><br>
         <input type="reset" name="cancel" value="CANCEL"></td></tr>
           <input type="hidden" name="hid" value="<%=editid%>">                        
                                </select>
                    </table>
                          
                  
                   
                   
               <table class="table table-bordered"> 
                    <tr><td colspan="5"><h2 style="font-family: serif"><center>Result details</center></h2></td>
                    <tr><td><center>Student name</center></td><td><center>Result mark</center></td><td><center>Result_Out_of</center></td><td><td><center>Result percentage <center></tr>
                   
                   
                   <%
                       String dis= "select * from tbl_result c,tbl_student s where c.stud_id=s.stud_id";
                       ResultSet rs4=obj.Select(dis);
                     while(rs4.next())
                       {
                           
    %>
                       
                       
                       <tr><td><%=rs4.getString("stud_name")%></td>
                       <td><%=rs4.getString("result_mark")%></td>
                       <td><%=rs4.getString("result_percentage")%></td><td><a href="result.jsp?eid=<%=rs4.getString("result_id")%>">Edit</a><a href="result.jsp?did=<%=rs4.getString("result_id")%>">Delete</a></td></tr>
                       
                  <% }  
                  %>  
                  
               </table>  
            </form>
        
        </body>
</html>
