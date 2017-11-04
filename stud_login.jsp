

<%@include file="Guestheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
   
      
        <%
             
               
            
              String submit=request.getParameter("sub");
               if(submit!=null)
              
               {
                    
                   
                        String stud_regno=request.getParameter("stud_regno");
                       String  pass=request.getParameter("password");
                        String  dob=request.getParameter("dob");
                        
                        
                           String sel="select * from tbl_student where  stud_regno='"+stud_regno+"'  and stud_password='"+pass+"' and stud_dob='"+dob+"'";
                           System.out.println(sel);
                           ResultSet rs=obj.Select(sel);
                          
                    if(rs.next())
                    {   
                         session.setAttribute("stud_id", rs.getString("stud_id"));
                     response.sendRedirect("../Student/StudentHomePage.jsp");
                    }
                    else
                    {
                        response.sendRedirect("../Guest/stud_login.jsp");
                    }
                
               }
             
             
               %>
            
   <body>
        <form frm="stdlogin">
        <table class="table table-bordered">
           
            <th colspan="2"><h2 style="font-family: serif"><center>STUDENT LOGIN</center></h2></th><br>
                <tr><td>User Name:</td><td><input type="text"name="stud_regno"required=""id="stud_regno"></td></tr>
                <tr><td>Password:</td><td><input type="Password"required="" name="password"id="password"</td></tr>
                 <tr><td>Date of Birth:</td><td><input type="date"required="" name="dob"id="dob"</td></tr>
                 <tr><td><input class=" btn btn-danger " type="submit" name="sub" value="LOGIN" ></td>
                    <td><input class="btn btn-danger" type="reset" name="cancel" value="CANCEL"></td></tr>                               
        </table>
        </form>
    </body>
    </head>
</html>
<%@include file="GuestFooter.jsp" %>
