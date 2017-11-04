<!DOCTYPE HTML>
<html>
<head>
    
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.dbconnection"></jsp:useBean>
<style>
p {
  text-align: center;
  font-size: 60px;
}
</style>
</head>
<body>
    <script src="js/jquery.min.js"></script>
<p id="demo"></p>

<script>
// Set the date we're counting down to
var DownDate = new Date();
var countDownDate=DownDate.setMinutes(DownDate.getMinutes()+1);
// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML =   minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
         setTimeout(function(){window.location.href='StudentHomePage.jsp'},100);
        //document.getElementById("demo").innerHTML = "EXPIRED";
    }
}, 1000);

var count=0;
function  next(hidqid,len,qstn,opt,examid)
{
    count=count+1;
    alert(count+" "+parseInt(len)+10)
   $("#prev").css("visibility","visible")
    if(count>parseInt(len)+1)
    {
        count=0;
         
    }
    
     $.ajax({url: "AjaxOnlineExam.jsp?hidqid="+hidqid+"&count="+count+"&qstn="+qstn+"&opt="+opt+"&examid="+examid, success: function(result){
        $("#questions").html(result);
    }});

}


function  pre(hidqid,len,qstn,opt,examid)
{ $("#nxt").css("visibility","visible")
    count=count-1;
    if(count<1){
       count=parseInt(len)+2
     
 }
   $.ajax({url: "AjaxOnlineExam.jsp?hidqid="+hidqid+"&count="+count+"&qstn="+qstn+"&opt="+opt+"&examid="+examid, success: function(result){
        $("#questions").html(result);
    }});
}














</script>

<form>
    
    <%
    String qid="";
    String examid=request.getParameter("examid");
    String sel="select * from tbl_examqstn where exam_id=1 ORDER by RAND()";
    ResultSet rs=obj.Select(sel);
    while(rs.next())
    {
        qid=qid+rs.getString("question_id")+",";
    }

    %>
     <input type="hidden" name="examid" value="<%=examid%>">
    <input type="hidden" name="hidqid" value="<%=qid%>">
    <div id="questions">
        <%int i=0;
        String q[]=qid.split(",");
        String selq="select * from tbl_examqstn eq,tbl_question q where eq.question_id=q.question_id and eq.exam_id=1 and q.question_id='"+q[0]+"' ";
        ResultSet rsq=obj.Select(selq);
        if(rsq.next())
        {i++;%>
         <input type="hidden" name="hid" value="<%=rsq.getString("question_id")%>" >
        <div>1 <%=rsq.getString("question_name")%></div>
            
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
        
        
        
        
    </div>
        <div id="buttons">
            <input type="button" name="btnpre" id="prev" value="<<<Previous" onclick="pre(hidqid.value,<%=i%>)">
            <input type="button" name="btnnext" id="nxt" value="Next>>>" onclick="next(hidqid.value,<%=i%>,hid.value,option.value,examid.value)">
        </div>
    
    
    
    
    
    
</form>





























</body>
</html>