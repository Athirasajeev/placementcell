 <%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.dbconnection"></jsp:useBean>



<%
    String qid=request.getParameter("hidqid");
    int count=Integer.parseInt(request.getParameter("count"));
        String q[]=qid.split(",");
        String qstId=request.getParameter("qstn");
        String opt=request.getParameter("opt");
        String examid=request.getParameter("examid");
        
        String sel="select * from tbl_studentexam where exam_id='"+examid+"' and question_id='"+qstId+"' and stud_id='"+session.getAttribute("stud_id")+"'";
        ResultSet rs=obj.Select(sel);
        if(rs.next())
        {
            String up="update tbl_studentexam set exam_id='"+examid+"' ,option_id='"+opt+"', question_id='"+qstId+"' where studentExam_id='"+rs.getString("studentExam_id")+"'" ;
        obj.insert(up);
        }
        else{
        
        String insq="insert into tbl_studentexam (exam_id,option_id,stud_id,question_id) values('"+examid+"','"+opt+"','"+session.getAttribute("stud_id")+"','"+qstId+"')";
      System.out.println(insq);
        obj.insert(insq);
        
        }
        
        
        
        
        String selq="select * from tbl_examqstn eq,tbl_question q where eq.question_id=q.question_id and eq.exam_id='"+session.getAttribute("stud_id")+"' and q.question_id='"+q[count]+"' ";
        ResultSet rsq=obj.Select(selq);
        if(rsq.next())
        {%><input type="hidden" name="hid" value="<%=rsq.getString("question_id")%>">
        <div><%=count+1%> <%=rsq.getString("question_name")%></div>
            
            <%
            
            String selopt="select * from tbl_option where question_id='"+rsq.getString("question_id")+"'";
            ResultSet rsopt=obj.Select(selopt);
            while(rsopt.next())
            {%>
            
             
            <div> <input type="radio" name="option" value="<%=rsopt.getString("option_id")%>"><%=rsopt.getString("option_name")%></div>
            <%}
            
            %>
            
            
            
        <%}
        
        %>