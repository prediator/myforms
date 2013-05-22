<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="styles/grid/flexigrid.css" type="text/css" media="all" />
<link rel="stylesheet" href="styles/grid/flexigrid.pack.css" type="text/css" media="all" />
<link rel="stylesheet" href="styles/home.css" type="text/css" media="all" />
<script type="text/javascript" src="scripts/homeScripts.js"></script>
<script type="text/javascript" src="scripts/admenu.js"></script>
<script type="text/javascript" src="scripts/grid/flexigrid.js" ></script>
<script type="text/javascript" src="scripts/grid/flexigrid.pack.js" ></script>
<SCRIPT SRC="scripts/ssm.js" language="JavaScript1.2"></SCRIPT>
<SCRIPT SRC="scripts/ssmItems.js" language="JavaScript1.2"></SCRIPT>
<link rel="stylesheet" type="text/css" href="styles/mainmenu.css" />
<script type="text/javascript">
ddaccordion.init({
	headerclass: "silverheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "mouseover", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: true, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})
</script>
</head>
<body>
<div class='main'>
 <div style="width 100%;height: 9%;" class='header_logo   image'><img style="height: 60px;" src='images/logo.jpg'>
<div class="text loc4"><h1>MyForms&#0153;</h1> </div></div>
 
 <div id="menu-container" style="background-color: #F2F2F2;width: 106%;float: left;display: inline;" class='mainMenu1'>


<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all menuitm">
<!--  ui-tabs-selected ui-state-active -->
		<li class="header-link a-selected ui-state-default ui-corner-top menu-itm mainmenuli"><a class = "" href="#tabs-1">Template</a></li>
		<li class="header-link  ui-state-default ui-corner-top  menu-itm mainmenuli"><a href="#tabs-2">Document</a></li>
		<li class="header-link ui-state-default ui-corner-top  menu-itm mainmenuli"><a href="#tabs-2">My Report</a></li>
		<li class="header-link ui-state-default ui-corner-top  menu-itm mainmenuli"><a href="#tabs-3">Administration</a></li>
		<li style="float: right;margin-right: 5%;text-align: center;vertical-align: middle;margin-top: 10px;">
		Client : ${client}
		</li>
</ul>



 </div>
 <div class="leftNav">&nbsp;</div>
<div id="dataTableTemplate" class="dataTable">
<table id="templateTable" class="templateTable">
<tr>
<td></td>
</tr>
</table>
</div>

<div id="dataTableDocument" style="display: none;" class="dataTable">
<table id="documentTable" class="documentTable">
<tr>
<td><br><br></td>
</tr>
</table>
</div>
<div class='admin_panel' id="admin_panel" style="display: none;">
<div class="applemenu applemenu_div">
<div class="silverheader"><a class='mn_itm' href="#">Template/Config Data management</a></div>
	<div class="submenu">
	<ul><li class="mainmenuli">
	<img style="margin-right: 3px;"  src="images/ar.jpeg"/><a href="#" class="admin_menu" onclick="openModalDialog()">Refresh Template</a>
	</li>
	<li class="mainmenuli">
		<img style="margin-right: 3px;"  src="images/ar.jpeg"/><a href="#" class="admin_menu div_fld_row_list" onclick="openCreateListModalDialog();">Template Lists</a>
	</li>
	</ul>
	</div>
<div class="silverheader"><a class='mn_itm' href="#" >User management</a></div>
	<div class="submenu">
	<ul>
	<li class="mainmenuli">
	<img style="margin-right: 3px;"  src="images/ar.jpeg"/><a href="#" class="admin_menu _view_clients">View Clients&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</li>
	<li class="mainmenuli">
	<img style="margin-right: 3px;"  src="images/ar.jpeg"/><a href="#" class="admin_menu _add_new_user_">Add User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</li>
	</ul>
	</div>
<div class="silverheader"><a class='mn_itm' href="#">Archive Document</a></div>
	<div class="submenu">
	Archive Document<br />
	</div>
<div class="silverheader"><a class='mn_itm' href="#">About MyForms</a></div>
	<div class="submenu">
	About MyForms
	</div>
<div class="silverheader"><a class='mn_itm' href="#">About Us</a></div>
	<div class="submenu">
	About Us<br />
	</div>		
</div>
<div class="admin_panel_content">Admin Panel

</div>
</div>
<div id="refresh-ftls" title="Refresh Templates" style="display:none;">
	<p><a href="#" onclick="refreshFtls()">Click Here</a> to refresh all ftls</p>
</div>
</div>
<jsp:include flush="true" page="createlist.jsp"/>
<jsp:include flush="true" page="jqueryTemplates.htm"></jsp:include>
<jsp:include flush="true" page="newUser.htm"></jsp:include>
</body>
</html>