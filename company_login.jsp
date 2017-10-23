

<%@include file="Companyheader.jsp" %>
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
                         
                     response.sendRedirect("../Admin/company.jsp");
                    }
                    else
                    {
                        response.sendRedirect("company_login.jsp");
                    }
                
               }
             
             
               %>
            
   
        <form>
        <table>
           
            <th><h2><center>Company Login</center></h2></th><br><br>
                <tr><td>User Name:</td><td><input type="text"  name="uname" id="uname"></td></tr><br>
                <tr><td>Password:</td><td><input type="Password"  name="password" id="password"</td></tr>
                 <tr><td><input type="submit" name="sub" value="LOGIN" ></td>
                    <td><input type="reset" name="cancel" value="CANCEL"></td></tr><br>                                
        </table>
        </form>
    </body>
</html>
