<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Myforms - Client Setup Request</title>
<script type="text/javascript" src="scripts/jquery/jquery-1.7.js"></script>

	<style type="text/css">
      #loginscreen {  height:450px;;width:15%; margin-right:50px; padding:40px;float:right; }
       p{
       font-family: verdana;
      font-size: small;
      padding: 5px 0px;
      color: #555;
      
      }
      div.error{
      color:red;
      font-family: verdana;
      font-size: small;
      padding: 5px 0px;
      }
      div.logFld{
      font-weight: bold;
      font-family: verdana;
      font-size: small;
      padding: 5px 0px;
      }
      
       span.logFld{
      font-weight: bold;
      font-family: verdana;
      font-size: small;
      padding: 5px 0px;
      }
      .linkdiv{
      margin-top: 70px;
      }
      .leftarea{
      width: 70%;
      margin-left: 50px;
      height: 80%;
      float: left;      
      }
      .right{
      height: 100%;
      width :40%;
      float: right;
      margin-right: 70px;
      z-index: 1000;
      vertical-align: top;
      margin-top: 38px;
      }
      .top{
          float: right;
    	height: 40%;
    	margin-right: 100px;
    width: 30%;
      }
      .bottom{
          float: right;
    height: 40%;
    margin-right: 100px;
    width: 30%;
      }
      
      .image .text {
	position:absolute;
	
	width:300px; /* optional, though better have one */
	font-size: x-large;
	font-weight: bold;
	font-style: oblique;
	color: #0B3B17;	
}
.image .loc1{
top:47%; /* in conjunction with left property, decides the text position */
	left:19%;
}
.image .loc2{
top:86%; /* in conjunction with left property, decides the text position */
	left:19%;
}
.image .loc3{
top:23%; /* in conjunction with left property, decides the text position */
	left:41%;
}
.image .loc4{
top:1%; /* in conjunction with left property, decides the text position */
	left:16%;
	font-size: 100%;
	}
.footer{
color: gray;
    font-family: verdana;
    font-size: 12px;
    margin-left: 10%;
    text-align: center;
}
.header{
      width: 85%;
      margin-left: 10%;
      margin-right: 5%;
      margin-bottom :3%;
      float: left; 
      border-bottom-style:solid;
      border-color:#04B404;
      font-size: 320%;
      }
      input{
      width: 95%;
      }
      #submit{
      margin-top: 15px;
      }
      img.login{
      float: right;
      margin-right: 6px;
      margin-top : 20px;
      cursor: pointer;
      }
      a.link{
      font-family: verdana;
      font-weight: bold;
      font-size: small; 
      padding-top: 10px;
      color: gray;
      text-decoration: none;     
      }
      td{
      vertical-align: top;
      }
      A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: black;}
    </style>  
</head>
<body>
    

<div style="width 100%;height: 9%;" class='header   image'><img style="height: 60px;" src='images/logo.jpg'>
<div class="text loc4">MyForms&#0153; </div></div>
<div style="height: 100%;">
<form:form method="post" action="clientSetupRequest.html" commandName="clientSetupInfo">
<div class='leftarea'>

<table width="60%" style="margin-left: 20%;margin-bottom: 50px;;">
<tr><td colspan="2"><div class='logFld'>Please fill all required information.</div></td></tr>
<tr><td><div class='logFld'>*Your Name :</div></td><td><form:input type="text" path="name"/><div class="error"><form:errors path="name"/></div></td></tr>
<tr><td><div class='logFld'>*Your Organization name : </div></td><td><form:input type="text" path="clientName"/><div class="error"><form:errors path="clientName"/></div></td></tr>
<tr><td><div class='logFld'>*Your Email id :</div></td><td><form:input type="text" path="emailId"/>
<div class="error"><form:errors path="emailId"/></div>
</td></tr>
<tr><td><div class='logFld'>*Your Contact No.</div></td><td><form:input type="text" path="contactNo"/><div class="error"><form:errors path="contactNo"/></div></td></tr>
<tr><td colspan="2"><p>Once your request is approved you will recive an email with your temporary username/password that you can change upon your first login.
You will more information at you email address provided on this user form.</p> </td></tr>
<tr><td><div class='logFld'></div></td><td style="float: right;"><input type="submit" name="submit" value="Submit information"></td></tr>
<tr><td><div class='logFld'></div></td><td style="float: right;"><p>Already have Account <span class='logFld'><a href="./login.html">Login</a></span></p></td></tr>
</table>
	
</div>
<div id="loginscreen">
	
</form:form>
	  </div></div>
	  <div class="footer">
<br/>&copy;Copyright 2012. All Rights are Reserved Mohd Irshad 
</div>
</body>
</html>