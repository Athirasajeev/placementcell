<%@include file="AdminHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            
            function validate()
            {
                var status="true";
                
                var regcourse=/^[a-zA-Z]{2}$/;
                var course=document.getElementById('course_name').value;
               
                if((course.match(regcourse)))
                {
                    document.getElementById("valcourse").innerHTML=""
                }else
                { //alert(course);
                    document.getElementById("valcourse").innerHTML="Invalid course name";
                    status="false";
                }
                
                
                var dep=document.getElementById('seldep').value;
                
                if(dep=="select")
               {//alert('dep');
                    document.getElementById("valdep").innerHTML="Select"
                     status="false";
                }else
                { //alert(dep);
                    document.getElementById("valdep").innerHTML="";
                   
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
    <center>
        <body>
            <form name="Course">
            <%
                
                String course="",deptid="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_course where course_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        course=rs.getString("course_name");
                        deptid=rs.getString("dept_id");
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_course where course_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("Course.jsp");
            }
                }
            %>
                <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                        
                        String id=request.getParameter("dept");
                        String name=request.getParameter("course_name");
                        if(request.getParameter("hid")!="")
                         {
                             String up="update tbl_course set course_name='"+name+"',dept_id='"+id+"' where course_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("Course.jsp");
                                     }
                             out.println(up);
                             
                         }
                         else
                   {
                        String ins="insert into tbl_course(dept_id,course_name)values('"+id+"','"+name+"')";
                        Boolean b=obj.insert(ins);
                        out.println(b);
                    }
                    }
                    %>
                     <table class="table table-bordered">
                         <th colspan="2"><h2 style="font-family: sans-serif;text-align: center">Course Details</h2></th><br><br>
                        <tr><td>Department Name:</td><td><select name="dept" id="seldep">
                                    
                                    <option value="select" required="">select</option>
                                    <%
                                        String sel="select * from tbl_department";
                                        ResultSet rs=obj.Select(sel);
                                        while(rs.next())
                                        {%>
                                        <option value="<%=rs.getString("dept_id")%>" <% if(deptid.equals(rs.getString("dept_id"))){%> selected=" " <%} %>><%=rs.getString("dept_name")%></option>
                                        <% }

%>
                                </select>
                                <div id="valdep"></div>
                            </td>
                        </tr>
                        <tr><td>Course Name:</td><td><input type="text" value="<%=course%>" name="course_name" required="" id="course_name"><div style="color: red" id="valcourse"></div></td></tr><br>
                        <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
        <td> <input  class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr>
           <input type="hidden" name="hid" value="<%=editid%>">                        
                                
                    </table>
                          
                  <table class="table table-bordered">
                       <tr><td colspan="3"><h2><center>Course Details</center></h2></td>
                   <tr><td><center>Department Name</center></td><td><center>Course Name</center></td><td></td></tr>
                
                   <%
                       String dis= "select * from tbl_course c,tbl_department d where d.dept_id=c.dept_id";
                       ResultSet rs1=obj.Select(dis);
                     while(rs1.next())
                       {
                           
    %>
                       <tr><td><%=rs1.getString("dept_name")%></td>
                       <td><%=rs1.getString("course_name")%></td><td><a class="btn btn-link " href="Course.jsp?eid=<%=rs1.getString("course_id")%>">Edit</a><a class="btn btn-link " href="Course.jsp?did=<%=rs1.getString("course_id")%>">Delete</a></td></tr>
                         
                   
                       
                  <% }  %>  
                  </table>
            </form>
        
    </body>
</html>
<%@include file="AdminFooter.jsp" %>
