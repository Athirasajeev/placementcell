<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.dbconnection"></jsp:useBean>
<%boolean staus=true; 
String sel="select count(studentExam_id) as studentExam_id,stud_id from tbl_studentexam se ,tbl_option o where se.question_id=o.question_id and se.option_id=o.option_id and o.option_isanswer='True' and se.exam_id='"+request.getParameter("examId") +"'  GROUP by stud_id";
ResultSet rs=obj.Select(sel);
while(rs.next())
{
    String up="update tbl_exam set exam_status=1 where exam_id='"+request.getParameter("examId")+"'";
    obj.insert(up);
    
    
    String ins="insert into tbl_examresult(exam_id,student_id,examResult_score) values('"+request.getParameter("examId")+"','"+rs.getString("studentExam_id")+"','"+rs.getString("stud_id")+"')";
    boolean b=obj.insert(ins);
    if(!b)
    {
        staus=false;
    }
}
if(staus)
{
    out.print(staus);
}


%>