<%-- 
    Document   : ExamQuestions
    Created on : Oct 28, 2017, 2:21:55 PM
    Author     : student8
--%>
<%@include file="companyheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
        <%
            String examid=request.getParameter("examid");
        if(request.getParameter("sub")!=null)
        {
            String chkvalues[]=request.getParameterValues("chk");
            for(int i=0;i<chkvalues.length;i++)
            {
                String insq="insert into tbl_examqstn (exam_id,question_id) values('"+examid+"','"+chkvalues[i]+"')";
            obj.insert(insq);
            }
        }
            
            
            
            
            
            
            
            
            
        String sel="select * from tbl_question where company_id ='"+session.getAttribute("cid")+"'";
        ResultSet rs=obj.Select(sel);
        while(rs.next())
        {%>
            
        <input type="checkbox" name="chk" value="<%=rs.getString("question_id")%>"><%=rs.getString("question_name")%>
        <br>
        
        
        
        
        <%}
        
        
        
        
        
        %>
        <input type="hidden" name="examid" value="<%=examid%>">
        <input type="submit" name="sub" value="Save">
        
        
        </form>
    </body>
</html>
<%@include file="companyfooter.jsp" %>