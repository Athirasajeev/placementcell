<%@include file="CompanyHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
            
            function validate()
            {
                var status="true";
                
                var regname=/^[a-zA-z ]{4,20}$/;
                var name=document.getElementById('name').value;
               
                if((name.match(regname)))
                {
                    document.getElementById("valname").innerHTML=""
                }else
                { alert(name);
                    document.getElementById("valname").innerHTML="Invalid name";
                    status="false";
                }
                
                var regaddress=/^[a-zA-z 0-9]{4,20}$/;
                var address=document.getElementById('address').value;
               
                if((address.match(regaddress)))
                {
                    document.getElementById("valaddress").innerHTML=""
                }else
                { alert(address);
                    document.getElementById("valaddress").innerHTML="Invalid Address";
                    status="false";
                }
                
                 var regcnt=/^[0-9]{10}$/;
                var cnt=document.getElementById('contact').value;
               
                if((cnt.match(regcnt)))
                {
                    document.getElementById("valcnt").innerHTML=""
                }else
                { alert(cnt);
                    document.getElementById("valcnt").innerHTML="Invalid contact";
                    status="false";
                }
                var regweb=/^[a-zA-z.]{2,10}$/;
                var web=document.getElementById('web').value;
               
                if((web.match(regweb)))
                {
                    document.getElementById("valweb").innerHTML=""
                }else
                { alert(web);
                    document.getElementById("valweb").innerHTML="Invalid website";
                    status="false";
                }
                 var regfounders=/^[a-zA-z]{4,100}$/;
                var founders=document.getElementById('founders').value;
               
                if((founders.match(regfounders)))
                {
                    document.getElementById("valfounders").innerHTML=""
                }else
                { alert(founders);
                    document.getElementById("valfounders").innerHTML="Invalid founders";
                    status="false";
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
    <head>
    <center>
        <form name="frm_company">
           
            <%
                String company_name="",company_logo="",company_address="",company_contact="",company_email="",company_website="",company_eno="",company_revenue="",company_founded="",company_founders="",company_uname="",company_pass="",company_id="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_company where company_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        company_name=rs.getString("company_name");
                        company_address=rs.getString("company_address");
                        company_logo=rs.getString("company_logo");
                        company_contact=rs.getString("company_contact");
                        company_email=rs.getString("company_emailid");
                        
                        company_website=rs.getString("company_website");
                        company_eno=rs.getString("company_employeesno");
                        company_revenue=rs.getString("company_username");
                        company_founded=rs.getString("company_password");
                        company_founders=rs.getString("company_founders");
                        company_uname=rs.getString("company_username");
                        company_pass=rs.getString("company_password");
                        
                    }
                }
             
            if(request.getParameter("did")!=null)
           {
            String del="delete from tbl_company where company_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("company.jsp");
            }
            }
                %>
                <table class="table table-bordered">
                <th colspan="9"><h2 style="font-family: serif"><center>  Company Registration</center></h2></th><br><br>
                <tr><td>Company Name:</td><td><input type="text" value="<%=company_name%>" name="name" required="" id="name"><div style="color: red" id="valname"></</td></tr><br>
                <tr><td>Company Address:</td><td><textarea input type="textarea" value="<%=company_address%>" required=""name="address" id="address"></textarea><div style="color: red" id="valaddress"></</td></tr><br>
                <tr><td>Company Contact:</td><td><input type="text" value="<%=company_contact%>" name="contact" id="contact"><div style="color: red" id="valcnt"></</td></tr><br>
                <tr><td>Email-ID:</td><td><input type="email" value="<%=company_email%>" name="mail" id="mail"></td></tr><br>
                <tr><td>Company Web site:</td><td><input type="text" value="<%=company_website%>" name="web" id="web"><div style="color: red" id="valweb"></</td></tr><br>
                <tr><td>Company Logo:</td><td><input type="text" value="<%=company_logo%>" name="logo" required="" id="logo"></td></tr><br>
                <tr><td>Company Employee No:</td><td><input type="number" value="<%=company_eno%>" name="eno" id="eno"></td></tr><br>
                <tr><td>Revenue:</td><td><input type="number" value="<%=company_revenue%>" name="revenue" id="revenue"></td></tr><br>
                <tr><td>Founded:</td><td><input type="number" value="<%=company_founded%>" required="" name="founded" id="founded"></td></tr><br>
                 <tr><td>Founders:</td><td><input type="textarea" value="<%=company_founders%>" required="" name="founders" id="founders"></textarea><div style="color: red" id="valfounders"></</td></tr><br>
                <tr><td>User Name:</td><td><input type="text" value="<%=company_uname%>" name="uname" required="" id="uname"></td></tr><br>
                <tr><td>Password:</td><td><input type="text" value="<%=company_pass%>" name="password" required="" id="password"></td></tr><br>
                <tr><td><input type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
                    <td><input type="reset" name="cancel" value="CANCEL"></td></tr><br>
                 <input type="hidden" value="<%=editid%>" name="hid" id="name">
                </table>
         <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String name=request.getParameter("name");
                   String address=request.getParameter("address");
                   String contact=request.getParameter("contact");
                   String email=request.getParameter("mail");
                   String website=request.getParameter("web");
                   String logo=request.getParameter("logo");
                   String eno=request.getParameter("eno");
                   String revenue=request.getParameter("revenue");
                   String founded=request.getParameter("founded");
                   String founders=request.getParameter("founders");
                   String uname=request.getParameter("uname");
                   String password=request.getParameter("password");
                           
                   if(request.getParameter("hid")!="")
                         {
                             String up="update tbl_company set company_name='"+name+"',company_address='"+address+"',company_contact='"+contact+"',company_emailid='"+email+"',company_website='"+website+"',company_logo='"+logo+"',company_employeesno='"+eno+"',company_revenue='"+revenue+"',company_founded='"+founded+"',company_founders='"+founders+"',company_username='"+uname+"',company_password='"+password+"' where company_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                            if(b)
                                     {
                                      response.sendRedirect("company.jsp");
                                    }
                             out.println(up);
                             
                         }
                        else
                   {
                   String ins="insert into tbl_company(company_name,company_address,company_contact,company_emailid,company_website,company_logo,company_employeesno,company_revenue,company_founded,company_founders,company_username,company_password)values('"+name+"','"+address+"','"+contact+"','"+email+"','"+website+"','"+logo+"','"+eno+"','"+revenue+"','"+founded+"','"+founders+"','"+uname+"','"+password+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
               <table class="table table-bordered">
                   <tr><td colspan="15"><h2 style="font-family: serif"><center>Company Details</center></h2></td></tr>
                    <tr><td><center>Name</center></td>
                        <td><center>Address</center></td>
                        <td><center>Contact</center></td>
                        <td><center>Email-ID</center></td>
                        <td><center>Web site</center></td>
                        <td><center>Logo</center></td>
                        <td><center>No Of Employees</center></td>
                        <td><center>Revenue</center></td>
                        <td><center>Founded On</center></td>
                        <td><center>Founders</center></td>
                        <td><center>Username</center></td>
                        <td><center>Password</center></td></tr>
         <%
                       String dis= "select * from tbl_company";
                       ResultSet rs=obj.Select(dis);
                       while(rs.next())
                       {%>
               
               <tr><td><%=rs.getString("company_name")%></td>
               <td><%=rs.getString("company_address")%></td>
                   <td><%=rs.getString("company_contact")%></td>
                  <td> <%=rs.getString("company_emailid")%></td>
                  <td><%=rs.getString("company_website")%></td>
                   <td><%=rs.getString("company_logo")%></td>
                   <td><%=rs.getString("company_employeesno")%></td>
                   <td><%=rs.getString("company_revenue")%></td>
                   <td><%=rs.getString("company_founded")%></td>
                   <td><%=rs.getString("company_founders")%></td>
                   <td><%=rs.getString("company_username")%></td>
                   <td><%=rs.getString("company_password")%></td>
                 <td> </td> <td><a href="company.jsp?eid=<%=rs.getString("company_id")%>">Edit</a>
                       <a href="company.jsp?did=<%=rs.getString("company_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %> 
            </table>
        </form>
    </body>
</html>
               
    