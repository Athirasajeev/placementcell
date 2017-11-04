<%-- 
    Document   : dept_add
    Created on : Sep 16, 2017, 11:24:01 AM
    Author     : student10
--%>

<%@include file="placeheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
      
        <html>
            <head>
                 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <script>
            
            function validate()
            {
                var status="true";
                
                var regtype=/^[a-zA-Z]{4,9}$/;
                var type=document.getElementById('name').value;
               
                if((type.match(regtype)))
                {
                    document.getElementById("valtype").innerHTML=""
                }else
                { alert(type);
                    document.getElementById("valtype").innerHTML="Invalid data";
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
            </head>
    <body>
    <center>
    <form name="frm">
     <%
                String testname="",testid="";
                String editid="";
                if(request.getParameter("eid")!=null)
                {
                    String sel="select * from tbl_testtype where testtype_id='"+request.getParameter("eid")+"'";
                    ResultSet rs=obj.Select(sel);
                    if(rs.next())
                    {
                        editid=request.getParameter("eid");
                        testname=rs.getString("testtype_name");
                       
                    }
                }
             
            if(request.getParameter("did")!=null)
           {
            String del="delete from tbl_testtype where testtype_id='"+request.getParameter("did")+"'";
            boolean b=obj.insert(del);
            out.print(b);
            if(b)
            {
                response.sendRedirect("testtype.jsp");
            }
            }
                %>
            <table class="table table-bordered" >
        <h1>Test Details</h1>
        <tr><td>TestName:</td><td><input type="text" value="<%=testname%>" required="" name="testname" id="name"><div style="color: red" id="valtype"></div></td></tr><br>
                <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
                    <td><input class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                <input type="hidden" value="<%=editid%>" name="hid" id="name">
        <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String test=request.getParameter("testname");
                   if(request.getParameter("hid")!="")
                        {
                             String up="update tbl_testtype set testtype_name='"+test+"' where testtype_id='"+request.getParameter("hid")+"'";
                             boolean b=obj.insert(up);
                             if(b)
                                     {
                                      response.sendRedirect("testtype.jsp");
                                     }
                           out.println(up);
                         }
                         else
                   {
                   String ins="insert into tbl_testtype(testtype_name)values('"+test+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
                <table class="table table-bordered">
                    <tr><td colspan="2"><h2><center>Test Type Details</center></h2></td>
                    <tr><td colspan="2"><center>Test Type Name</center></td></tr>
                   <%
                       String dis= "select * from tbl_testtype";
                       ResultSet rs=obj.Select(dis);
                       while(rs.next())
                       {%>
               <tr><td><%=rs.getString("testtype_name")%></td><td><a href="testtype.jsp?eid=<%=rs.getString("testtype_id")%>">Edit</a><a href="testtype.jsp?did=<%=rs.getString("testtype_id")%>">Delete</a></td></tr>          
                         
                     <%  }
                       
                    %> 
            </table>
        </form>
    </body>
</html>
        <%@include file="placefooter.jsp" %>
         
    
   
        
        
        
         
    
   
