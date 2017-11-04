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
                        
                        
                         String selofficer="select * from tbl_placementofficer where officer_username='"+uname+"' and officer_password='"+pass+"'";
                           String sel="select * from tbl_company where company_username='"+uname+"' and company_password='"+pass+"'";
                           String seladmin="select * from tbl_admin where admin_username='"+uname+"' and  admin_password='"+pass+"'";
                           String selstud="";
                           System.out.println(sel);
                           ResultSet rsofficer=obj.Select(selofficer);
                           ResultSet rs=obj.Select(sel);
                           ResultSet rsadmin=obj.Select(seladmin);
                    if(rs.next())
                    {   
                     session.setAttribute("cid", rs.getString("company_id"));
                     response.sendRedirect("../Company/CompanyHomePage.jsp");
                    }
                    else if(rsadmin.next())
                    {
                        response.sendRedirect("../Admin/AdminHomePage.jsp");
                    }else if(rsofficer.next())
                    {
                        session.setAttribute("oid", rsofficer.getString("officer_id"));
                        response.sendRedirect("../PlacementOfficer/OfficerHomePage.jsp");
                    }
                    else
                    {%>
                    <script>
                        
                        document.getElementById('alertSpan').innerHTML="Invalid Username or Password!!! ";
                        
                    </script>
                    <%}
                
               }
             
             
               %>
            
   
        <form >
        <table class="table table-bordered">
           
            <th colspan="2"><h2 style="font-family: serif"><center>Login</center></h2></th>
                
            
            <tr><td colspan="2" ><span id="alertSpan" style="color: red"> </span></td></tr>
            <tr><td>User Name:</td><td><input type="text" required="" name="uname" id="uname"></td></tr><br>
                <tr><td>Password:</td><td><input type="Password"  name="password" required="" id="password"</td></tr>
                 <tr><td><input type="submit" name="sub" value="LOGIN" ></td>
                    <td><input type="reset" name="cancel" value="CANCEL"></td></tr><br>                                
        </table>
        </form>
    </body>
</html>
<%@include file="GuestFooter.jsp" %>