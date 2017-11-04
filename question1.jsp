<%@include file="companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <center>
        <body>
            <form class="">
            <%
                
                String question_id="",question_name="",testtype_id="",company_id="";
                String editid="";
                if(request.getParameter("editid")!=null)
                {
                    String sel="select * from tbl_question where question_id='"+request.getParameter("editid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("editid");
                       question_id=rs.getString("question_id");
                        question_name=rs.getString("question_name");
                         testtype_id=rs.getString("testtype_id");
                        company_id=rs.getString("company_id");
                        
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_question where question_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("question1.jsp");
            }
                }
            %>
            <input type="hidden" value="<%=editid%>" name="hid" id="name">
                <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                        
                       
                       question_name=request.getParameter("question_name");
                       testtype_id=request.getParameter("testtype_id");
                         company_id=request.getParameter("company_name");
                       if(request.getParameter("hid")!="") 
                       {
                             String up="update tbl_question set question_name='"+question_name+"',testtype_id='"+testtype_id+"',company_id='"+session.getAttribute("cid")+"' where question_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("question1.jsp");
                                     }
                             out.println(up);
                             
                         }
                    
                         else
                   {
                        String ins="insert into tbl_question(question_name,testtype_id,company_id)values('"+question_name+"','"+testtype_id+"','"+session.getAttribute("cid")+"')";
                        boolean b=obj.insert(ins);
                        out.println(b);
                    }}
                    
                    %>
                    
                     <table class="table table-bordered">
                         <th colspan="2"><h2>question Details</h2></th>
                        
                          <tr><td>question name :</td><td><input type="text" value="<%=question_name%>" name="question_name" ></td></tr><br>
                        <tr><td>testtype name:</td><td><select name="testtype_id" id="sel">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel="select * from tbl_testtype";
                                        ResultSet rs1=obj.Select(sel);
                                        while(rs1.next())
                                        {%>
                                        <option value="<%=rs1.getString("testtype_id")%>" <% if(testtype_id.equals(rs1.getString("testtype_id"))){%> selected=" " <%} %>><%=rs1.getString("testtype_name")%></option>
                                        <% }

%>
                                </select>


        
                        <tr><td><input type="submit" name="sub" value="SAVE"></td>
         <td><input type="reset" name="cancel" value="CANCEL"></td></tr>
                     </table>

<table class="table table-bordered">
      <tr><td colspan="2"><h2 style="font-family: sans-serif "><center>question details</center></h2></td>
        <tr><td style="font-family: sans-serif"><center> question</center></td><td></td></tr>            
<%
                       String dis= "select * from tbl_question";
                       ResultSet rs4=obj.Select(dis);
                       while(rs4.next())
                       {%>
               <tr><td><%=rs4.getString("question_name")%></td><td><a class="btn btn-link " href="question1.jsp?editid=<%=rs4.getString("question_id")%>">Edit</a><a class="btn btn-link " href="question1.jsp?did=<%=rs4.getString("question_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %>
                          
      </table>           
            
                       </form>   
 
    </body>
</html>
<%@include file="companyfooter.jsp" %>