<div id ="docHistoryConfig"  style="display: none;">
<div class="clientTableDiv" >
<table class="clientTable">

<thead><th>Document History Configuration</th>
</thead>
<tr>
<td>
<form id="" style="height: 100%;" method="" action="">
<div style="float: left">
			<a class="button add add_client docHistoryConfig_save" style="height: 75%;" href="#">Save User</a>
		 </div>
<span class="errorClass" id="errorClassAddUser"></span>
<div class="doc_history_con" >
<div style="font-weight: bold;font-size: 90%;margin-bottom:15px;"></div>
	<div style="">
			<div>
			<label>Template : </label><input id="templateIdVal" name = "templateIdVal" readonly="readonly"/>
			<input id="templateId" name = "templateId" type="hidden"/>&nbsp;&nbsp;
			<img title="Select client" onclick="javascript:showTemplatetoSelect('#doc_history_con #templateIdVal',populateTemplateFieldData)" id="templateIcon" src="images/template.jpg">
		 </div>
		 <div>
			<label>History Fields : </label><select id="historyFields" name = "fieldNames" multiple="multiple"></select>
		 </div><br/>
		 </div>
		 </div>
	</form>
</td>
</tr>
</table>
</div>
</div>
