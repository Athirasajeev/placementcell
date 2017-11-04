
<%@include file="placeheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
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
                 
                
                var regnbr=/^[0-9]{10}$/;
                var nbr=document.getElementById('stud_regno').value;
               
                if((nbr.match(regnbr)))
                {
                    document.getElementById("valnbr").innerHTML=""
                }else
                { alert(nbr);
                    document.getElementById("valnbr").innerHTML="Invalid registernumber";
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
        
            <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                        String stud_name=request.getParameter("stud_name");
                       String  stud_address=request.getParameter("stud_address");
                       String  stud_contact=request.getParameter("stud_contact");
                       String  stud_email=request.getParameter("stud_email");
                        String sem_id=request.getParameter("sem");
                        
                       String  course_id=request.getParameter("course");
                       String  batch_id=request.getParameter("batch");
                        String stud_regno=request.getParameter("stud_regno");
                        String stud_photo=request.getParameter("stud_photo");
                       String  stud_10mark=request.getParameter("stud_10mark");
                        String stud_12mark=request.getParameter("stud_12mark");
                        String stud_degreemark=request.getParameter("stud_degreemark");
                       String  stud_proof10=request.getParameter("stud_proof10");
                       String  stud_proof12=request.getParameter("stud_proof12");
                        String stud_proofdegree=request.getParameter("stud_proofdegree");
                       
                        String stud_percentage10=request.getParameter("stud_percentage10");
                       String  stud_percentage12=request.getParameter("stud_percentage12");
                       String  stud_percentagedegree=request.getParameter("stud_percentagedegree");
                        String stud_password=request.getParameter("stud_password");
                        String stud_additional=request.getParameter("stud_additional");
                         String stud_dob=request.getParameter("stud_dob");  
//                   
                   {
                   String ins="insert into tbl_student(stud_name,stud_address,stud_contact,stud_email,sem_id,course_id,batch_id,stud_regno,stud_photo,stud_10mark,stud_proof10,stud_percentage10,stud_12mark,stud_proof12,stud_percentage12,stud_degreemark,stud_proofdegree,stud_percentagedegree,stud_additional,stud_password,stud_dob)values('"+stud_name+"','"+stud_address+"','"+stud_contact+"','"+stud_email+"','"+course_id+"','"+batch_id+"','"+sem_id+"','"+stud_regno+"','"+stud_photo+"','"+stud_10mark+"','"+stud_proof10+"','"+stud_percentage10+"','"+stud_12mark+"','"+stud_proof12+"','"+stud_percentage12+"','"+stud_degreemark+"','"+stud_proofdegree+"','"+stud_percentagedegree+"','"+stud_additional+"','"+stud_password+"','"+stud_dob+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               }
               %>
             <body>
            <form name="frm_student">
               
                <table class="table table-bordered">
                    <th colspan="2"><h2 style="font-family: serif"><center>  Student Registration</center></h2></th>
                <tr><td>Student Name:</td><td><input type="text"  name="stud_name" required="" id="name"><div style="color: red" id="valname"></div></td></tr><br>
                <tr><td>Address:</td><td><textarea input type="textarea"  name="stud_address" required="" id="address"></textarea><div style="color: red" id="valaddress"></div></td></tr><br>
                <tr><td>Contact:</td><td><input type="text"  name="stud_contact" required="" id="contact"><div style="color: red" id="valcnt"></div></td></tr><br>
                <tr><td>Email-ID:</td><td><input type="email" name="stud_email" required="" id="mail"></td></tr><br>
                <tr><td>Date Of Birth:</td><td><input type="DATE"  name="stud_dob" required="" id="dob"></td></tr><br>
                <tr><td>Course Name:</td><td><select name="course" id="sel2">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel2="select * from tbl_course";
                                        ResultSet rs1=obj.Select(sel2);
                                        while(rs1.next())
                                        {%>
                                        <option value="<%=rs1.getString("course_id")%>" ><%=rs1.getString("course_name")%></option>
                                        <% }
                                        %></select>
                <tr><td>Batch:</td><td><select name="batch" id="sel3">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel3="select * from tbl_batch";
                                        ResultSet rs2=obj.Select(sel3);
                                        while(rs2.next())
                                        {%>
                                        <option value="<%=rs2.getString("batch_id")%>" ><%=rs2.getString("batch_name")%></option>
                                        <% }
%>
                        </select>
               

                <tr><td>Semester:</td><td><select name="sem" id="sel">
                                    
                                    <option value="select">select</option>
                                    <%
                                        String sel="select * from tbl_semester";
                                        ResultSet rs=obj.Select(sel);
                                        while(rs.next())
                                        {%>
                                        <option value="<%=rs.getString("sem_id")%>"><%=rs.getString("sem_name")%></option>
                                        <% }
%>
                        </select>
 
                <tr><td>Register Number:</td><td><input type="number" required="" name="stud_regno" id="stud_regno"><div style="color: red" id="valnbr"></div></td></tr><br>
                <tr><td>Upload Student Photo:</td><td><input type="text" required="" name="stud_photo" id="stud_photo"></td></tr><br>
                <tr><td>SSLC Mark:</td><td><input type="number" required="" name="stud_10mark" id="stud_10mark"><div style="color: red" id="val10mark"></div></td></tr><br>
                <tr><td>Proof For SSLC:</td><td><input type="text" reqiured="" name="stud_proof10" id="stud_proof10"></td></tr><br>
                <tr><td>Percentage Of SSLC:</td><td><input type="number" max="100" required="" name="stud_percentage10" id="stud_percentage10"></td></tr><br>
                <tr><td>PlusTwo Mark:</td><td><input type="number" required="" name="stud_12mark" id="stud_12mark"></td></tr><br>
                <tr><td>Proof For PlusTwo:</td><td><input type="text" required="" name="stud_proof12" id="stud_proof12"></td></tr><br>
                <tr><td>Percentage Of PlusTwo:</td><td><input type="number" max="100"required=""  name="stud_percentage12" id="stud_percentage12"></td></tr><br>
                <tr><td>Degree Mark:</td><td><input type="number" required="" name="stud_degreemark" id="stud_degreemark"></td></tr><br>
                <tr><td>Proof For Degree:</td><td><input type="text" required="" name="stud_proofdegree" id="stud_proofdegree"></td></tr><br>
                <tr><td>Percentage Of Degree:</td><td><input type="number"  required="" max="100" name="stud_percentagedegree" id="stud_percentagedegree"></td></tr><br>
                <tr><td>Additional Qualifications:</td><td><input type="text" required="" name="stud_additional" id="stud_additional"></td></tr><br>
                <tr><td>Password:</td><td><input type="text" required="" name="stud_password" id="stud_password"></td></tr><br>
                <tr><td><input type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
                    <td><input type="reset" name="cancel" value="CANCEL"></td></tr><br>
                 
          
        
            </table>       
         </form>
    </body>
   
</head>
</html>
<%@include file="placefooter.jsp" %>
               
    