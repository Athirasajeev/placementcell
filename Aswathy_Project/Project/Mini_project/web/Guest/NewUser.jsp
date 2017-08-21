<%-- 
    Document   : miniproject
    Created on : Aug 5, 2017, 2:08:06 PM
    Author     : student8
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbconnection"id="obj"></jsp:useBean>

    
<html>
<head>
     <script src="../jquery/jquery.min.js" ></script>
        <script>
            
            function selplace(distid)
            {
                //alert(distid)
                $.ajax({url: "Ajaxplace.jsp?districtid="+distid, success:function(result){
                         //  alert(result)
                $("#sel1").html(result);            
                }});
            }
        </script>
        
         <script>
            
            function sellocal(placeid)
            {
                //alert(placeid)
                $.ajax({url: "Ajaxlocal.jsp?placeid="+placeid, success:function(result){
                        //alert(result)
                $("#sel2").html(result);            
                }});
            }
        </script>
        
<script>
function pass1()
{
	if(document.getElementById("name").value=="")
	{
		alert("Enter name");
                return false;
	}
	else if(document.getElementById("address").value=="")
	{
		alert("Enter address");
                return false;
	}
        else if(((frm.gender[0].checked)==false)&&((frm.gender[1].checked)==false))
	{
		alert("select gender");
                return false;
	}
	else if(document.getElementById("email").value=="")
	{
		alert("Enter email id");
                return false;
	}
	else
	{
		var p1=document.getElementById("pass").value;
		var p2=document.getElementById("repass").value;
		if(p1==p2)
		{
			alert("successfull");
                        return true;
		}
		else
		{
			alert("password missmatch");
                        return false;
		}
	}
}
</script>
</head>
<body>
    <%
    String submit=request.getParameter("sub");
    if(submit!=null)
    {
        String name=request.getParameter("name");
        String address=request.getParameter("address");
        String gender=request.getParameter("gender");
        String email =request.getParameter("email");
        String qualif=request.getParameter("sel");
        String password=request.getParameter("password");
        String ins="insert into tb_reg(reg_name,reg_address,reg_gender,reg_email,reg_qualif,reg_pass)values('"+name+"','"+address+"','"+gender+"','"+email+"','"+qualif+"','"+password+"')";
        out.println(ins);
        boolean b=obj.insert(ins);
        out.println(b);
    }
    %>
    
<form name="frm">
<table>
<tr>
<td>Name:</td><td><input type="text" id="name" name="name"></td>
</tr>
<tr>
<td>Address:</td><td><textarea input type="textarea" name="address" id="address"></textarea></td>
</tr>
<tr>
<td>Gender:</td><td><input type="radio" name="gender" value="male">male
<input type="radio" name="gender" value="female">female</td>
<tr><td>Email:</td><td><input type="email" id="email" name="email"></td></tr>
<tr><td>Qualification:</td><td><select name="sel" id="q">
<option value="1">select</option>
<option value="2">mca</option>
<option value="3">mba</option>
<option value="4">mtech</option>
</select>
</td>
</tr>

<tr>
    <td>District Name:</td><td><select name="name" onchange="selplace(this.value)" id="sel">
<option value="select">select</option>
<%
    String sel="select * from tbl_district";
    ResultSet rs=obj.Select(sel);
    while(rs.next())
    { %>
        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
        <% }
%>
    </select></td>
</tr>

<tr>
<td>Place Name:</td><td>
 <select name="place" onchange="sellocal(this.value)" id="sel1">
<option value="select">select</option>
<%
    String sel1="select * from tbl_place";
    ResultSet rr=obj.Select(sel1);
    while(rr.next())
    { %>
        <option value="<%=rr.getString("place_id")%>"><%=rr.getString("place_name")%></option>
        <% }
%>
    </select>
</td>
</tr>

<tr>
<td>Local Name:</td><td>
 <select name="local" id="sel2">
<option value="select">select</option>
<%
    String sel2="select * from tbl_local";
    ResultSet rc=obj.Select(sel2);
    while(rc.next())
    { %>
        <option value="<%=rc.getString("local_id")%>"><%=rc.getString("local_name")%></option>
        <% }
%>
    </select>
</td>
</tr>


<tr><td>password:</td><td><input type="password" name="password" id="pass"></td></tr>
<tr><td>Re-enter password:</td><td><input type="password" name="password" id="repass"></td></tr>
<tr>
<td><input type="submit" name="sub" value="submit" onclick="return pass1()"></td>
<td><input type="reset" name="Reset" value="reset"></td>
</tr>
</table>
</form>
</body>
</html>