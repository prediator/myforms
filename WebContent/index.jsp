<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyForms Login</title>
<script type="text/javascript" src="scripts/jquery/jquery-1.7.js"></script>
<script type="text/javascript" src="scripts/canvas/liquid-canvas.js"></script>
<script type="text/javascript" src="scripts/canvas/liquid-canvas-plugins.js"></script>
<script type="text/javascript">
      // First we wait until the document is completely loaded using the handy
      // jQuery "ready" method.
      $(window).load(function() {
        // No we can paint our canvas. Something rounded with a shadow ;-)
        $("#loginscreen").liquidCanvas(
            "[shadow border gradient] => roundedRect{radius:20}");
      });
	</script>  
	<style type="text/css">
      #loginscreen {  height:450px;;width:15%; margin-right:50px; padding:40px;float:right; }
      div.logFld{
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
<div class='leftarea'>
<div class='right image'><img style="height: 450px;margin-top: 38px;float: left;" src='images/l.jpg'>
<div class="text loc3">
        <p>Enjoy With MyForms</p>
 	 </div>
</div>
	<div class='top image' ><img style="height: 250px;" src='images/d.jpg'>
	<div class="text loc1">
        <p>Create Your Template</p>
  </div>
	</div>
	<div class='bottom  image'><img style="height: 250px;" src='images/t.jpg'>
	<div class="text loc2">
        <p>Edit/Update Documents</p>
 	 </div>
	</div>
	
</div>
<div id="loginscreen">
	   <form action="login.html" method="post">
	   <div class='errors'>
	   <c:if test="${not empty param.login_error}">
      <font color="red">
        Your login attempt was not successful, try again.<br/>
        
        Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.<br/>
      </font>
    </c:if>
	   </div>
	    <div class='logFld'>Username</div>
			<div class=''><input name="username"/></div>
			<div class='logFld'>Password</div>
			<div class=''><input name="password"/></div>
    <img class='login' src="images/login.jpg" onclick="javascript:this.parentNode.submit();"/>
    <div class='linkdiv'>
     <div style="margin-bottom: 7px;"><a class='link' href="#">Forget password</a></div>
     <div><a class='link' href="#">Create Account</a></div>
    </div>
</form>
	  </div></div>
	  <div class="footer">
<br/>&copy;Copyright 2012. All Rights are Reserved Mohd Irshad 
</div>
</body>
</html>