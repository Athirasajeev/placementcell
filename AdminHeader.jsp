<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<!--
Template Name: Academic Education V2
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<jsp:useBean id="obj" class="db.dbconnection"></jsp:useBean>

<html>
<head>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
<script src="CSS/bootstrap.min.js"></script>
<script src="CSS/jquery.min.js"></script>
<title>Academic Education V2</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="clear"> 

    <!-- ################################################################################################ -->
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">A - Z Index</a></li>
        <li><a href="#">Student Login</a></li>
        <li><a href="#">Staff Login</a></li>
      </ul>
    </nav>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="index.html">Academic Education V2</a></h1>
      <p>Free Website Template</p>
    </div>
    <div class="fl_right">
      <form class="clear" method="post" action="#">
        <fieldset>
          <legend>Search:</legend>
          <input type="text" value="" placeholder="Search Here">
          <button class="fa fa-search" type="submit" title="Search"><em>Search</em></button>
        </fieldset>
      </form>
    </div>
    <!-- ################################################################################################ --> 
  </header>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <div class="rounded">
    <nav id="mainav" class="clear"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li class="active"><a href="AdminHeader.jsp">Home</a></li>
        <li><a class="drop" href="#">Add</a>
          <ul>
            <li> <a href="Batch.jsp">Batch</a></li>
            <li><a href="Course.jsp">Course</a></li>
            <li><a href="Department.jsp">Department</a></li>
            <li><a href="Semester.jsp">Semester</a></li>
            
          </ul>
        </li>
        <li><a class="drop" href="#">Registration</a>
          <ul>
            <li><a href="officer_register.jsp">Officer Register</a></li>
            <li><a href="company.jsp">Company</a>
              
            </li>
          </ul>
        </li>
        <li><a href="publish_selected.jsp">Publish Selected Students</a></li>
        
        
      </ul>
      <!-- ################################################################################################ --> 
    </nav>
  </div>
</div>
<div class="wrapper row3" >
  <div class="rounded">
    <main class="container clear" style="min-height:500px"> 
        
        
        
        
        
        
        
        
        
       
        
        
         