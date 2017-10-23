<%@include file="companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script>
            
            function validate()
            {
                var status="true";
                
                var regname=/^[a-zA-z ]{4,20}$/;
                var name=document.getElementById('job_name').value;
               
                if((name.match(regname)))
                {
                    document.getElementById("valname").innerHTML=""
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
            <form name="jobdetails">
            <%
                
                String job_name="",jobtype_id="",company_id="",job_basicsalary="",job_novaccancy="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_jobdetails where job_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        job_name=rs.getString("job_name");
                        jobtype_id=rs.getString("jobtype_id");
                        company_id=rs.getString("company_id");
                        job_basicsalary=rs.getString("job_basicsalary");
                        job_novaccancy=rs.getString("job_novaccancy");
                    }
                }
                
                
                if(request.getParameter("did")!=null)
                {
            String del="delete from tbl_jobdetails where job_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("jobdetails.jsp");
            }
                }
            %>
                <%
                    String submit=request.getParameter("sub");
                    if(submit!=null)
                    {
                        
                       jobtype_id=request.getParameter("jobtype_name");
                       company_id=request.getParameter("company_name");
                       job_name=request.getParameter("job_name");
                       job_basicsalary=request.getParameter("job_basicsalary");
                       job_novaccancy=request.getParameter("job_novaccancy");
                       if(request.getParameter("hid")!="")
                         
                        {
                             String up="update tbl_jobdetails set job_name='"+job_name+"',jobtype_id='"+jobtype_id+"',job_basicsalary='"+job_basicsalary+"',job_novaccancy='"+job_novaccancy+"',company_id='"+company_id+"' where job_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("jobdetails.jsp");
                                     }
                             out.println(up);
                             
                         }
                    
                         else
                   {
                        String ins="insert into tbl_jobdetails(job_name,jobtype_id,job_basicsalary,job_novaccancy,company_id)values('"+job_name+"','"+jobtype_id+"','"+job_basicsalary+"','"+job_novaccancy+"','"+company_id+"')";
                        Boolean b=obj.insert(ins);
                        out.println(b);
                    }}
                    
                    %>
                    
                    <table class="table table-bordered">
                        <th colspan="5"><h2>Job Details</h2></th>
                        <tr><td>Job Name:</td><td><input type="text" value="<%=job_name%>" name="job_name" ><div style="color: red" id="valname"></div></td></tr><br>
                        <tr><td>Job Type:</td><td><select  name="jobtype_name" required="" id="sel">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel="select * from tbl_jobtype";
                                        ResultSet rs1=obj.Select(sel);
                                        while(rs1.next())
                                        {%>
                                        <option value="<%=rs1.getString("jobtype_id")%>" <% if(jobtype_id.equals(rs1.getString("jobtype_id"))){%> selected=" " <%} %>><%=rs1.getString("jobtype_name")%>
                                        <% }

%>
<tr><td>Basic Salary:</td><td><input type="number" value="<%=job_basicsalary%>"  required=" "name="job_basicsalary"></td></tr><br>
<tr><td>No: of vaccancies:</td><td><input type="number" value="<%=job_novaccancy%>" required="" name="job_novaccancy"></td></tr><br>
<tr><td>Company Name:</td><td><select name="company_name" id="sel2">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel2="select * from tbl_company";
                                        ResultSet rs3=obj.Select(sel2);
                                        while(rs3.next())
                                        {%>
                                        <option value="<%=rs3.getString("company_id")%>" <% if(company_id.equals(rs3.getString("company_id"))){%> selected=" " <%} %>><%=rs3.getString("company_name")%></option>
                                        <% }

                                        %></select>
<tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE"></td>
   <td><input class="btn-block"  type="reset" name="cancel" value="CANCEL"></td></tr>
           <input type="hidden" name="hid" value="<%=editid%>">                        
                                </select>
                    </table>
                          
                                <table class="table table-bordered">
                                    <th><h2><center>Job Details</center></h2></th>
                   <tr><td><center>Job Name</center></td><td><center>Job Type</center></td><td><center>Basic Salary</center></td><td><center>Vaccancies</center></td></tr>
                
                   <%
                       String dis= "select * from tbl_jobdetails c,tbl_jobtype d,tbl_company co where d.jobtype_id=c.jobtype_id and co.company_id=c.company_id";
                       ResultSet rs4=obj.Select(dis);
                     while(rs4.next())
                       {
                           
    %>
                       
                       <td><%=rs4.getString("job_name")%></td><td><a href="jobdetails.jsp?eid=<%=rs4.getString("job_id")%>">Edit</a><a href="jobdetails.jsp?did=<%=rs4.getString("job_id")%>">Delete</a></td></tr>
                       <tr><td><%=rs4.getString("Jobtype_name")%></td>
                       <td><%=rs4.getString("job_basicsalary")%></td><td><a href="jobdetails.jsp?eid=<%=rs4.getString("job_id")%>">Edit</a><a href="jobdetails.jsp?did=<%=rs4.getString("job_id")%>">Delete</a></td></tr>    
                       <td><%=rs4.getString("job_novaccancy")%></td><td><a href="jobdetails.jsp?eid=<%=rs4.getString("job_id")%>">Edit</a><a href="jobdetails.jsp?did=<%=rs4.getString("job_id")%>">Delete</a></td></tr>
                       <tr><td><%=rs4.getString("company_name")%></td>
                  <% }  %>  
                  
                  </table>
            </form>
        
    </body>
</html>
<%@include file="companyfooter.jsp" %>
