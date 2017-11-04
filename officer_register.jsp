<%-- 
    Document   : district_details
    Created on : Aug 12, 2017, 9:31:34 AM
    Author     : student10
--%>
<%@include file="AdminHeader.jsp" %>
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
                var regdesig=/^[a-zA-z .]{4,10}$/;
                var desig=document.getElementById('designation').value;
               
                if((desig.match(regdesig)))
                {
                    document.getElementById("valdesig").innerHTML=""
                }else
                { alert(desig);
                    document.getElementById("valdesig").innerHTML="Invalid destination";
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
    <center>
        <form name="frm_placementOfficer">
           
           
            
                <table class="table table-bordered">
                <tr><td colspan="2"><h2 style="font-family: serif"><center>   Placement Officer Registration</center></h2></td></tr>
                <tr><td>Name:</td><td><input type="text"  name="name"  required=""id="name"><div style="color: red" id="valname"></div></td></tr><br>
                <tr><td>Designation:</td><td><input type="text"  name="designation"  required=""id="designation"><div style="color: red" id="valdesig"></div></td></tr><br>
                <tr><td>Address:</td><td><textarea input type="textarea"   required="" name="address" id="address"></textarea><div style="color: red" id="valaddress"></div></td></tr><br>
                <tr><td>Contact:</td><td><input type="text"  name="contact" id="contact"><div style="color: red" id="valcnt"></div></td></tr><br>
                <tr><td>Email-ID:</td><td><input type="email"  required=""name="mail" id="mail"></td></tr><br>
                <tr><td>Date-Of-Join:</td><td><input type="DATE" required="" name="doj" id="doj"></td></tr><br>
                <tr><td>Photo:</td><td><input type="text" required="" name="photo" id="photo"></td></tr><br>
                <tr><td>User Name:</td><td><input type="text"  required="" name="uname" id="uname"></td></tr><br>
                <tr><td>Password:</td><td><input type="text"  required="" name="password" id="password"></td></tr><br>
                <tr><td><input class="btn btn-block" type="submit" name="sub" value="SAVE" onclick="return validate()"></td>
                    <td><input class="btn btn-block" type="reset" name="cancel" value="CANCEL"></td></tr><br>
                 
          
         <%
               String submit=request.getParameter("sub");
               if(submit!=null)
               {
                   
                   String name=request.getParameter("name");
                   String desg=request.getParameter("designation");
                   String address=request.getParameter("address");
                   String contact=request.getParameter("contact");
                   String email=request.getParameter("mail");
                   String doj=request.getParameter("doj");
                   String photo=request.getParameter("photo");
                   String uname=request.getParameter("uname");
                   String pass=request.getParameter("password");
                           
                   
                   String ins="insert into tbl_placementofficer(officer_name,officer_designation,officer_address,officer_contact,officer_email,officer_doj,officer_photo,officer_username,officer_password)values('"+name+"','"+desg+"','"+address+"','"+contact+"','"+email+"','"+doj+"','"+photo+"','"+uname+"','"+pass+"')";
                   Boolean b=obj.insert(ins);
                   out.println(b);
                 }
               
               %>
               </table>
               
        </form>
    </body>
</html>
<%@include file="AdminFooter.jsp" %>
               
    