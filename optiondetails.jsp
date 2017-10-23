
<%@include file="Companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <form name="option">
            <%
                
                String option_id="",option_name="",question_id="",option_isanswer="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_option where option_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        option_id=rs.getString("option_id");
                        option_name=rs.getString("option_name");
                        question_id=rs.getString("question_id");
                        option_isanswer=rs.getString("option_isanswer");
                       
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_option where option_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("optiondetails.jsp");
            }
                }
            %>
                <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                        
                         option_id=request.getParameter("option_id");
                          option_name=request.getParameter("option_name");
                         question_id=request.getParameter("question_name");
                         option_isanswer=request.getParameter("option");
                        
                        if(request.getParameter("hid")!="")
                         {
                             String up="update tbl_option set option_name='"+option_name+"',question_id='"+question_id+"',option_isanswer='"+option_isanswer+"' where option_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("optiondetails.jsp");
                                     }
                             out.println(up);
                             
                         }
                         else
                   {
                        String ins="insert into tbl_option(option_name,question_id,option_isanswer)values('"+option_name+"','"+question_id+"','"+option_isanswer+"')";
                        Boolean b=obj.insert(ins);
                        out.println(b);
                    }
                    }
                    %>
                     <table>
                        <th><h2>Option Details</h2></th><br><br>
                        <tr><td>Option Name:</td><td><input type="text" value="<%=option_name%>" name="option_name"></td></tr><br>
                        <tr><td>Question Name:</td><td><select name="question_name" id="sel">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel="select * from tbl_question";
                                        ResultSet rs=obj.Select(sel);
                                        while(rs.next())
                                        {%>
                                        <option value="<%=rs.getString("question_id")%>" <% if(question_id.equals(rs.getString("question_id"))){%> selected=" " <%} %>><%=rs.getString("question_name")%></option>
                                        <% }

%>

 <tr><td>option is:<input type="radio" name="option" value="True"> True<input type="radio" name="option" value="False"> False<br>
 

<tr><td><input type="submit" name="sub" value="SAVE"><br>
         <input type="reset" name="cancel" value="CANCEL"></td></tr>
           <input type="hidden" name="hid" value="<%=editid%>">                        
                                </select>
                    </table>
                          
                  <table>
                   <tr><td><h2><center>Option Details</center></h2></td>
                   <tr><td><center>Option Name</center></td><br>
                  <td><center>Question</center></td><br>
                <td><center>option status</center></td><br>
                
                   <%
                       String dis= "select * from tbl_option c,tbl_question d where d.question_id=c.question_id";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                          {%>
                       <td><%=rs1.getString("option_name")%></td><td><a href="optiondetails.jsp?eid=<%=rs1.getString("option_id")%>"><br>Edit</a><a href="optiondetails.jsp?did=<%=rs1.getString("option_id")%>">Delete</a></td></tr>
                       <tr><td><%=rs1.getString("question_id")%></td>    
                       <tr><td><%=rs1.getString("option_isanswer")%></td> 
                     
                         
                       <% }

                %> 
                   
            
                  </table>
            </form>
        
    </body>
</html>
