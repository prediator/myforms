<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@include file="scriptscss.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><sitemesh:write property='title'/></title>
 <sitemesh:write property='head'/>
</head>
<body class="yui-skin-sam">

<div class='mainBody'>

      <sitemesh:write property='body'/>
      
</div>
    </form>
</body>
</html>