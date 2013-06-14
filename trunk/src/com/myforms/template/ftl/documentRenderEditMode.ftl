
<#assign template = document.template />
<#assign fieldMap = document.fieldMap />

<#macro renderField fieldName>
	<#assign field=template.templateFieldMap[fieldName]/>
	<#if field.fieldType.fieldType?exists>
		<#if field.fieldType.fieldType == 'TXT' || field.fieldType.fieldType == 'NUM'>
			<@renderTextField field/>			
		<#elseif field.fieldType.fieldType == 'PSWD'>
			<@renderPasswordField field/>			
		<#elseif field.fieldType.fieldType == 'CHKBOX'> 
			<@renderCheckBoxField field/>
		<#elseif field.fieldType.fieldType == 'LIST'> 
			<@renderListField field/>
		<#elseif field.fieldType.fieldType == 'DT'> 
			<@renderDateField field />			
		<#elseif field.fieldType.fieldType == 'RICHTXT'> 
			<@renderRichTextField field fieldName/>
		</#if>
	<#else>
	<div>field is not configured corretctly</div>
	</#if>	
</#macro>

<#macro renderTextField field>
	<div id="div_${field.fieldName}" class="fieldDiv <#if field.isRequired = true>error_fld_cls<#else>dflt_fld_cls</#if>">	
	
	<@renderLabel field />
	<spring:bind path='fieldMap["${field.fieldName}"]'>
	<input id='${field.fieldName}' type="text" name='fieldMap["${field.fieldName}"]' value = '${fieldMap["${field.fieldName}"].fieldValue!""}'/>
	</spring:bind>
	</div>
</#macro>
<#macro renderDateField field>
	<div id="div_${field.fieldName}" class="fieldDiv <#if field.isRequired = true>error_fld_cls<#else>dflt_fld_cls</#if>">	
	
	<@renderLabel field />
	<spring:bind path='fieldMap["${field.fieldName}"]'>
	<input id='${field.fieldName}' onkeydown="return false;" title='MM/DD/YYYY' class="datepicker" type="text" name='fieldMap["${field.fieldName}"]' value = '${fieldMap["${field.fieldName}"].fieldValue!""}'/>
	</spring:bind>
	</div>
</#macro>
<#macro renderRichTextField field fieldName>

	<#assign templateField=template.templateFieldMap[fieldName]/>


	<div id="div_${field.fieldName}" class="richTxtFieldDiv  <#if field.isRequired = true>error_fld_cls<#else>dflt_fld_cls</#if>" style = 'display:<#if templateField.isVisible = false>
none;
</#if>'>	
	
	
	<@renderLabel field/>
	<spring:bind path='fieldMap["${field.fieldName}"]'>
	<script>
	renderEditor('${field.fieldName}',400,600);
	</script>	
	<div class="ui-richtext-form">
	<textarea id='${field.fieldName}' name='fieldMap["${field.fieldName}"]' rows="20" cols="75">
	<#if fieldMap["${field.fieldName}"].dataList?exists>
	  <#list fieldMap["${field.fieldName}"].dataList as sel> 
	  		${sel}
	  </#list>
	  </#if>
		</textarea>

</div>
	</spring:bind>
	</div>
</#macro>
<#macro renderCheckBoxField field>
	<div id="div_${field.fieldName}" class="fieldDiv  <#if field.isRequired = true>error_fld_cls<#else>dflt_fld_cls</#if>">
	
	<@renderLabel field/>
	<input id='${field.fieldName}' type="checkbox" name='fieldMap["${field.fieldName}"]' value = '${field.defaultValue}!""'/>
	</div>
</#macro>

<#macro renderPasswordField field>
	<div id="div_${field.fieldName}" class="fieldDiv  <#if field.isRequired = true>error_fld_cls<#else>dflt_fld_cls</#if>">
	
	<@renderLabel field/>
	<input id='${field.fieldName}' type="password" name='fieldMap["${field.fieldName}"]' value = '${fieldMap["${field.fieldName}"].fieldValue!""}'/>
	</div>
</#macro>
<#macro renderListField field>
	<div id="div_${field.fieldName}" class="fieldDiv  <#if field.isRequired = true>error_fld_cls<#else>dflt_fld_cls</#if>">
	
	<@renderLabel field/>
	<#if field.list?exists>
	<#assign lst = field.list>
	</#if>
	<#if lst?exists &&  lst.values?exists>
	<#assign listVal = lst.values>
	</#if>
	
	
	<select id='${field.fieldName}' <#if field.isMultiselect() = true>size=2 multiple</#if> name='fieldMap["${field.fieldName}"]' value = '${field.defaultValue!""}'>
	<#if listVal?exists>
	<#list listVal as val>
	  <option value="${val.value!""}"
	  <#if fieldMap["${field.fieldName}"]?exists>
	  <#if fieldMap["${field.fieldName}"].fieldValues?exists>
	  <#list fieldMap["${field.fieldName}"].fieldValues as sel> 
	  <#if val.value == sel>selected</#if>
	  </#list>
	  </#if>
	  </#if>>
	  ${val.value!""}</option>
	</#list>
	</#if>
	</select>
	
	</div>
</#macro>
<#macro renderUplodaDownloadDoc document>
<#if document.uploadedItems?exists>
<#assign uploadedItems = document.uploadedItems>
</#if>
<div id="upld_dwld_doc" style="background-color: #F2F2F2;display: inline;" class='upld_dwld_doc'>


<ul  class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all menuitm upld_dwld_doc-header">
<!--  ui-tabs-selected ui-state-active -->
		<li class="ui-state-default ui-corner-top menu-itm header-menu-item-udd"><a href="#" onclick="openUploadDialog('${document.id!"#"}','${document.displayId!"#"}');"><img style="vertical-align:middle;" src="images/upload.jpg">
		<b>Upload/Download Documents</b></a></li>
		</ul>
<ul style="list-style-type: none !important;" id="upld_dwld_doc_ui">
<#if uploadedItems?exists>
   <#list uploadedItems as uploadedItem>
    <li><a href="download.html?id=${uploadedItem.id}&docId=${uploadedItem.document.id}"><div style="float:left"><span class="ui-icon ui-icon-circle-arrow-s"></span></div>${uploadedItem.fileName!"No Name"}</a></li>
   </#list>
</#if>

</ul>


 </div>
 <div id="file-upload" style="display:none;" title="File upload/download"><iframe id="iframe-file-upload"></iframe></div>
</#macro>
<#macro renderCreateDocSection document>

<div id="create_doc" style="background-color: #F2F2F2;display: inline;" class='create_doc'>


<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all menuitm upld_dwld_doc-header">
<!--  ui-tabs-selected ui-state-active -->
		<li class="ui-state-default ui-corner-top menu-itm header-menu-item-udd"><a href="#" onclick="openCreateHtmlDocDialog('${document.id!"#"}','');"><img style="vertical-align:middle;" src="images/doc.jpg"/>
		<b>Create Documents</b></a></li>
		</ul>
<ul style="list-style-type: none !important;" id="crt_doc_ui">

<#if document.richTextDocs?exists>
<#assign richTextDocs = document.richTextDocs>
</#if>
<#if richTextDocs?exists>
   <#list richTextDocs as richTextDoc>
    <li><a href="#" onclick="openCreateHtmlDocDialog('${richTextDoc.documentId!"#"}','${richTextDoc.richTextDocId}');"><div style="float:left"><span><img style="vertical-align:middle;height: 15px;" src="images/doc.jpg"/></span></div>${richTextDoc.title!"No Name"}</a></li>
   </#list>
</#if>
</ul>


 </div>
 <div id="create-doc" title="Create Document" style="display: none;"><iframe id="crt_doc_ifrm" class="crt_doc_ifrm" ></iframe></div>
</#macro>
<#macro renderLabel field>
<div>
<label>${field.fieldTitle}</label><span class="help" title="${field.fieldHeltText}">&nbsp;&nbsp;&nbsp;
<span id="req_div_${field.fieldName}" style="color:red;<#if field.isRequired = false>display:none;</#if>">*</span>

<div>&nbsp;</div>
</div>
</#macro>