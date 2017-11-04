<%-- 
    Document   : officerlogin
    Created on : Sep 25, 2017, 2:31:29 PM
    Author     : student10
--%>
<%@include file="Guestheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html><head>
    </head>
        <body>
        <%
             
               
            
              String submit=request.getParameter("sub");
               if(submit!=null)
              
               {
                    
                   
                        String uname=request.getParameter("uname");
                       String  pass=request.getParameter("password");
                        
                        
                        
                           String sel="select * from tbl_company where company_username='"+uname+"' and company_password='"+pass+"'";
                           System.out.println(sel);
                           ResultSet rs=obj.Select(sel);
                          
                    if(rs.next())
                    {   
                         
                     response.sendRedirect("../PlacementOfficer/company_register.jsp");
                    }
                    else
                    {
                        response.sendRedirect("company_login.jsp");
                    }
                
               }
             
             
               %>
            
   
        <form frm="companylogin">
        <table class="table table-bordered">
           
            <th colspan="2"><h2 style="font-family: serif"><center>Company Login</center></h2></th>
                <tr><td>User Name:</td><td><input type="text" required="" name="uname" id="uname"></td></tr><br>
                <tr><td>Password:</td><td><input type="Password"  name="password" required="" id="password"</td></tr>
                 <tr><td><input type="submit" name="sub" value="LOGIN" ></td>
                    <td><input type="reset" name="cancel" value="CANCEL"></td></tr><br>                                
        </table>
        </form>
    </body>
</html>
<%@include file="GuestFooter.jsp" %>