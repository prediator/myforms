<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<HTML>
 <HEAD>
  <TITLE> Thanks </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <script type="text/javascript" src="scripts/jquery/jquery-1.7.js"></script>
 </HEAD>
<script type="text/javascript">
$(document).ready(function(){
var msg = '<c:out value="${message}"/>';
$('#msg').html($('<div />').html(msg).text());
});
</script>
 <BODY>
 <div id="msg"></div>
 
 </BODY>
</HTML>
