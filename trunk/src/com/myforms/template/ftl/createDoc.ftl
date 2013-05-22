<#import "richText.ftl" as richText/>
<script>
var rtDocEditor = null;
</script>
<!--YUI CODE-->
<link rel="stylesheet" type="text/css" href="./styles/main.css" />

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
<form  method="post" action="createHtmlDoc.html" id="rt_form" onsubmit="saveRTDocEditor();">
<a class="button save_rt" id="save_rt_doc" href="#">Save</a> <br><br>
<#if errorCode?exists>
<div class="doc_errors" style="display:block;margin-left : 0px !important;">${errorCode!""}</div>
</#if>
<label>Title<span style="color:red;">*</span> : </label><br/>
<input name="title" width="60" value = '${richTextDoc.title!""}'/><br/><br/>
<@richText.renderRichText "richText" 800 600 '${richTextDoc.richText!""}'/>	
<input type="hidden" name="documentId" value="${richTextDoc.documentId}">
<input type="hidden" name="richTextDocId" value='${richTextDoc.richTextDocId!""}'>
</form>
