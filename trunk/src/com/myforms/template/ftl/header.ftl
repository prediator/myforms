
<meta charset="utf-8">

<!--YUI CODE-->
<link rel="stylesheet" type="text/css" href="./yui/build/menu/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css" href="./yui/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="./yui/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="./yui/build/container/assets/skins/sam/container.css" />

<link rel="stylesheet" type="text/css" href="./yui/build/editor/assets/skins/sam/editor.css" />
<script type="text/javascript" src="./yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="./yui/build/element/element-min.js"></script>
<script type="text/javascript" src="./yui/build/container/container-min.js"></script>
<script type="text/javascript" src="./yui/build/menu/menu-min.js"></script>
<script type="text/javascript" src="./yui/build/button/button-min.js"></script>
<script type="text/javascript" src="./yui/build/editor/editor-min.js"></script>
<!-- YUI CODE END-->
<!-- Code has been moved to Global file -->
<!--link rel="stylesheet" href="./styles/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="./styles/ui.theme.css" type="text/css" media="all" />
<script src="./scripts/jquery/jquery-ui.min.js" type="text/javascript"></script>
<script src="./scripts/jquery/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
<script src="./scripts/jquery/jquery-ui-i18n.min.js" type="text/javascript"></script>
<script src="./scripts/globalJquery.js" type="text/javascript"></script-->
	<!-- /Code has been moved to Global file -->


<div id="refresh-ftls" title="Refresh Templates" style="display:none;">
	<p><a href="#" onclick="refreshFtls()">Click Here</a> to refresh all ftls</p>
</div>
<table width="100%"><tr><td class = "header">
<div class="ui-header-form">
${document.template.templateName!""} - ${document.displayId!"--"}	
</div>
</td><td align="right" class = "timestamp">
<div class="ui-timestamp-form">
<b>Create Timestamp&nbsp; :</b>   ${document.createTimestamp }
<br/>
<b>Update Timestamp :</b>  ${document.updateTimestamp }
</div></td>
</tr></table>
<div class="doc_errors"></div>
<table width="90%"><tr>
<td style="width:70%;vertical-align :top;">
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">Document</a></li>
		<li><a href="#tabs-2" id="_document-history-tab" >History</a></li>
		<li><a href="#tabs-3" id="anchor-tab-3">Document Notes</a></li>
	</ul>
	
	<div id="tabs-2" id="_history-container">
	<div id="clientTableDiv">
	<table cellspacing=0 class="clientTable" style="width: 100%; text-align: left;"> </table>
	</div>	   
	</div>
	<div id="tabs-3">
	</div>

<div id="tabs-1">
	
<div id="mainContainer">



