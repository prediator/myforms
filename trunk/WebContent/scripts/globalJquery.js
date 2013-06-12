	$('document').ready(function() {
		$(".datepicker").datepicker({minDate: -20, 
		maxDate: '+1M +10D',
		dateFormat : 'mm/dd/yy'});
		
	});
	
	$(function() {
		$( "#tabs" ).tabs();
	});
		 
	 function openModalDialog() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#dialog:ui-dialog" ).attr("display","block");
		$( "#refresh-ftls" ).dialog({
			height: 140,
			modal: true
		});
		
	}
	
	function openUploadDialog(id,displayId) {
	if(id == '#'){
	alert("Please first save the document");
	return;
	}
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#dialog:ui-dialog" ).attr("display","block");
		$( "#file-upload" ).dialog({
			height: 500,
			width:800,
			modal: true,
			close: function(event, ui) {			
			   window.location.href = 'editDocument.html?documentId='+displayId;
		    }
		});
		$('#iframe-file-upload').attr('src',"viewFiles.html?documentId="+id);	
	}
	function openCreateHtmlDocDialog(id,rtid) {
		if(id == '#'){
		alert("Please first save the document");
		return;
		}
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#dialog:ui-dialog" ).attr("display","block");
		$( "#create-doc" ).dialog({
			height: 540,
			width:700,
			modal: true,
			position: 'center'
		});
		$('#crt_doc_ifrm').attr('src',"createHtmlDoc.html?documentId="+id+"&richTextDocId="+rtid);	
	}
	function refreshFtls(){
	$.ajax({
  url: "./refreshTemplate.html",
  context: document.body,
  success: function(){
    alert("Ftls refreshed successfullty");
    $( "#refresh-ftls" ).dialog( "close" );
  }
});
	}
	

function renderEditor(name,height,width) {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
    
    var myConfig = {
        height: height,
        width: width,
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    var myEditor = new YAHOO.widget.Editor(name, myConfig);
    myEditor._defaultToolbar.buttonType = 'basic';
    myEditor.render();
      			
  	editors[editorIndex] = myEditor;
  	

}
function renderRichTextEditor(name,height,width) {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
    
    var myConfig = {
        height: height,
        width: width,
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    var myEditor = new YAHOO.widget.Editor(name, myConfig);
    myEditor._defaultToolbar.buttonType = 'basic';
    myEditor.render();
    rtDocEditor =  myEditor;			
  	//editors[editorIndex] = myEditor;
  	

}
function scroll(fld){
fld = "'#div_"+fld+"'";
//$('html,body').animate({scrollTop: $(fld).offset().top-[300]},500);
}
function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
	do {
			curleft += obj.offsetLeft;
			curtop += obj.offsetTop;
			} while (obj = obj.offsetParent);
			return curtop-50;
}
}

var fldLabel = '.fldLabel';
var fldTxt = '.fldTxt';
var fldType = '.fldType';
var help = '.help';
var fldRequired = '.fldRequired';
var selectedList = ".LIST_List_Selected";
var settings;
var __num;
function editSettings(s,num){
settings =s;
__num = num;
var topDiv= settings.parentNode.parentNode;	
$('#fs_fld_label').val($(topDiv).find(fldLabel).text());
$('#fs_fld_dflt').val($(topDiv).find(fldTxt).val());
$('#fs_fld_help').val($(topDiv).find(help).attr('title'));



if($(topDiv).find(fldRequired).css('display') != 'none')
{
	$('#fs_fld_req').attr('checked','checked')
}
var fldPrefix = $(topDiv).find('.__fld_type_').html();
var isVis = '.'+fldPrefix + '_isVisible';
var isEna = '.'+fldPrefix + '_isEnabled';

if($(topDiv).find(isVis).text() == 'true'){
$('#fs_fld_vis').attr('checked','checked');
}

if($(topDiv).find(isEna).text() == 'true'){
$('#fs_fld_ena').attr('checked','checked');
}
$( "#edit-fld-seetings" ).dialog({
			height: 350,
			width:510,
			modal: true
		});

if(fldPrefix == 'LIST'){
	$('.div_fld_row_list').css('display','block');
	
	var listVal = $(topDiv).find(selectedList).html();
	
	$('#_fs_fld_sel_list_').val($(topDiv).find(selectedList).html());
	
	if(listVal != null){
		var spl = listVal.split('~');
		if(spl.length == 2)
		var img = '&nbsp;<img class="___delete_list__" src="./images/delete.jpg" />';
		$('.__selecetd_list_for_temp__').html($(spl[0] + img));
		}
	}
}
expandField  = function(set, num){
 var tr = $(set).parents('tr:first');
 var td = $(set).parents('td:first');
 var ind = tr.children().index(td);
 var cspan = 1;
 var i = ind+1;
 
 {
	var remtd = tr.children()[i]; 
	var html = $(remtd).children().length;
	if(html <=0){
		cspan = cspan + ($(td).attr('colspan')? parseInt($(td).attr('colspan')) : 1);
		$(remtd).remove();
	}
	
 }
 td.attr('colspan', cspan);
 if(!isNextAvailable(td))
	 {
	 $(set).hide();
	 $(set).siblings('.collapse_fld').show();
	 }
}
isNextAvailable = function(td){
	if($(td).next() == undefined || !$(td).next() || $(td).next().length == 0|| $(td).next().children().length>0){
		return false;
	}
	else
		return true;
}
collapseField = function(set, index1){
	 var tr = $(set).parents('tr:first');
	 var td = $(set).parents('td:first');
	 var ind = tr.children().index(td);
	 
	 var count = tr.children().length;
	 var colspan = ($(td).attr('colspan')? parseInt($(td).attr('colspan')) : 1);
	 if(colspan > 1){
		 colspan = colspan -1; 
		 td.attr('colspan', colspan);
		 tr.append('<td>&nbsp;</td>');
	 }
	 if(colspan == 1){
		 $(set).hide();
		 $(set).siblings('.expand_fld').show();
	 }
	 
}
isPrvAvailable = function(td){
	if($(td).prev() == undefined || !$(td).prev() || $(td).prev().length == 0|| $(td).next().children().length>0){
		return false;
	}
	else
		return true;
}
$(document).ready(function() {
	$('.save_fld_tmpl__').click(function(){

		var topDiv= settings.parentNode.parentNode;	
		var fldPrefix = $(topDiv).find('.__fld_type_').html();
		var isVis = '.'+fldPrefix + '_isVisible';
		var isEna = '.'+fldPrefix + '_isEnabled';
		var selectedList = ".LIST_List_Selected";

		if($('#fs_fld_label').val() !=null && $('#fs_fld_label').val() != '')	
		$(topDiv).find(fldLabel).html($('#fs_fld_label').val());
		$('#fs_fld_label').val('');
		
		if($('#fs_fld_dflt').val() !=null && $('#fs_fld_dflt').val() != '')	
		$(topDiv).find(fldTxt).val($('#fs_fld_dflt').val());
		$('#fs_fld_dflt').val('');
		
		if($('#fs_fld_help').val() !=null && $('#fs_fld_help').val() != '')	{
		$(topDiv).find(help).attr('title',$('#fs_fld_help').val());}
		$('#fs_fld_help').val('');
		
		if($('#fs_fld_req').is(':checked')){
		$(topDiv).find(fldRequired).css('display','');
		}
		else{
		$(topDiv).find(fldRequired).css('display','none');
		}
		$('#fs_fld_req').attr('checked',false);
		
		if($('#fs_fld_vis').is(':checked'))
		$(topDiv).find(isVis).html('true');
		else{
		$(topDiv).find(isVis).html('false');
		}
		if($('#fs_fld_ena').is(':checked'))
		$(topDiv).find(isEna).html('true');
		else{
		$(topDiv).find(isEna).html('false');
		}

		$('#fs_fld_vis').attr('checked',false);
		$('#fs_fld_ena').attr('checked',false);
		
		//alert($('#_fs_fld_sel_list_').val());
		if(fldPrefix == 'LIST'){
			if($('#_fs_fld_sel_list_').val() !=null && $('#_fs_fld_sel_list_').val() != '')	
			$(topDiv).find(selectedList).html($('#_fs_fld_sel_list_').val());
			$('#_fs_fld_sel_list_').val('');
			$('.__selecetd_list_for_temp__').html('');
		}
		$( "#edit-fld-seetings" ).dialog('close');
	});
	
	$("#anchor-tab-3").click(function(){
		loadData('notes.html?documentId='+$("#documentId").val(),'tabs-3');
	});	
	
	$('._view_clients').live('click',viewAllClients);
});

function submitTemplate(){
var selectedList = ".LIST_List_Selected";
	var form = $('#form');
	
	var _len = $('#cart_items').find('tr').size();

	for(var _i = 0; _i< _len ; _i++){
		var tr = $('#cart_items').find('tr')[_i];
		var len = $(tr).find('td').size();
		for(var _j = 0; _j< len ; _j++)
		{
			td = $(tr).children()[_j];
			var  topDiv = $(td).children()[0];
			if(topDiv == null){
			 continue;
			}
			var nm = getName(_i,_j,'csan');
			addElement(form,nm,getColSpan(td));
			
			nm = getName(_i,_j,'rsan');
			addElement(form,nm,1);			
			
			nm = getName(_i,_j,'type');
			addElement(form,nm,$(topDiv).find('.__fld_type_').html());
			
			if($(topDiv).find('.__fld_type_').html() == 'LIST'){
				var _selList = $(topDiv).find(selectedList).html();
				nm = getName(_i,_j,'selectedList');
				addElement(form,nm,_selList);
			} 
			
			
			nm = getName(_i,_j,'label');
			addElement(form,nm,$(topDiv).find(fldLabel).html());
			
			nm = getName(_i,_j,'defaultValue');
			addElement(form,nm,$(topDiv).find(fldTxt).val());
			
			nm = getName(_i,_j,'helpText');
			addElement(form,nm,$(topDiv).find(help).attr('title'));
			
			nm = getName(_i,_j,'required');
			
			if($(topDiv).find(fldRequired).css('display') != 'none')
			{
			  addElement(form,nm,'true');
			}
			else{
				addElement(form,nm,'false');
			}
			
			var fldPrefix = $(topDiv).find('.__fld_type_').html();
			var isVis = '.'+fldPrefix + '_isVisible';
			var isEna = '.'+fldPrefix + '_isEnabled';
			
			nm = getName(_i,_j,'visible');			
			addElement(form,nm,$(topDiv).find(isVis).html());
			
			nm = getName(_i,_j,'ebalbled');			
			addElement(form,nm,$(topDiv).find(isEna).html());
							
			
		}
	
	}
	
	$('#form').submit();
}
function getName(row,col,key){
return "rowMetaData["+row+"].columnMetaData["+col+"].fieldProperties['"+key+"']";
}
function addElement(form, nm, val){
var ele = document.createElement('input');
ele.type = 'hidden';
ele.name = nm;
ele.value = val;
$(form).append(ele);
}

function appendUploadedData(obj){
	var data = jQuery.parseJSON(obj);
	alert(data);
}

function saveRTDocEditor(){
rtDocEditor.saveHTML();
}
$(document).ready(function(){
	$('#save_rt_doc').click(function(){
		$('#rt_form').submit();
	});
	$( "#_add_client_" ).dialog({
			height: 300,
			width: 500,
			modal: true,
			draggable: false,
			autoOpen : false
		});
	$( "#tableDataDiv" ).dialog({
			height: 500,
			width: 600,
			modal: true,
			draggable: false,
			autoOpen : false,
			position:'top'
	});
	jQuery.validator.addMethod("alphanumeric", function(value, element) {
   		 return this.optional(element) || /^[a-z0-9\-]+$/i.test(value);
	}, "Please use letters, numbers or underscores only."); 
	
	$('#add_client').live('click',openAddClientModal);
	$('.add_client_save').live('click',submitAddClient);	
	$('._add_new_user_').live('click',showAddUserForm);	
	$('#add_client_form').validate(rulesForCleintSaveForm);
	$('.add_user_save').live('click',submitSaveUser);
	//$('#clientIcon').live('click',showClientstoSelect);
	
});
openAddClientModal = function(){
$( "#_add_client_" ).dialog('open');
}
submitAddClient = function(){
var valid = $('#add_client_form').validate(rulesForCleintSaveForm);
if(valid.form())
$.post("saveClient.html", $('#add_client_form').serialize(),postClientSubmission);
}
postClientSubmission = function(data){
if(data)
data = $.parseJSON(data)
if(data['client'])
viewAllClients();
else{
$('#errorClassAddClient').html('Some error occured while saving client. Please try later.');
$('#errorClassAddClient').show();
}
}
function openCreateListModalDialog() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#dialog:ui-dialog" ).attr("display","block");
		$( "#__create_list__" ).dialog({
			height: 400,
			width: 600,
			modal: true,
			draggable: false
		});
		
	}

$(document).ready(function(){

$('.save__list').click(function(){
	var params = {};
	var nm = $('#__list_name_').val();
	if(nm == null || nm == ''){
		alert('List name is required!');
		return;
	}
	params['name'] = nm;
	var values = {};
	$('._list__val-tmpl option').each(function(i, selected) {
    	values[i] = $(selected).text();
	});
	params['values'] = values;
	
	$.post('./saveTemplateList.html',params, function(data){
		var dataVal = $.parseJSON(data);
		var img = '&nbsp;<img class="___delete_list__" src="./images/delete.jpg" />';
		$('.__selecetd_list_for_temp__').html(dataVal.name + img);
		$('#_fs_fld_sel_list_').val(dataVal.name +  '~' + dataVal.id);
		$('.div_fld_row_selected_list').css('display','block');
		$( "#__create_list__" ).dialog('close');
	});	
});
$( ".div_fld_row_list" ).click(function(){
	$.get('getListForUser.html', function(data) {
	var dataVal = $.parseJSON(data);
	$('#_list__select').html('');
	$.each(dataVal, function(prop,val){
	$.each(val, function(p,value){
		$('#_list__select').append('<option value="'+p+'">'+value+'</option>');
	});
		
	});
	});
});

$('.add_to_list').click(function(){
var val = $('#__list_value_').val();
	if(val != null && val != ''){
		$('._list__val-tmpl').append('<option>'+val+'</option>');
		$('#__list_value_').val('');
	}
});


$('.go_list_select_for_fld').click(function(){	
	$('#_fs_fld_sel_list_').val($('#_list__select option:selected').text() +  '~' + 	$('#_list__select option:selected').val());
		var img = '&nbsp;<img class="___delete_list__" src="./images/delete.jpg" />';
		$('.__selecetd_list_for_temp__').html($('#_list__select option:selected').text() + img);
		$('.div_fld_row_selected_list').css('display','block');
		$( "#__create_list__" ).dialog('close');	
});
});

function loadData(url,divId){
	$.ajax({
		  type : "GET",
          url:url,
		  success: function(result){
		   $("#"+divId).html(result);
		  },
		  error:function(){
			  alert("hello");
		  }
	});
}

viewAllClients = function(){
$.ajax({
		  type : "GET",
          url:'clients.html',
		  success: function(result){
		  var data = {};
		  data['clients'] = $.parseJSON(result);
		  $( ".admin_panel_content" ).empty();
		   $( "#clientTemplate" ).tmpl( data).appendTo( ".admin_panel_content" );

		  },
		  error:function(){
			  alert("error in populating clients.");
		  }
	});
}
showAddUserForm = function(){
	$('.admin_panel_content').empty();
	$('.admin_panel_content').html($('#addUserForm').html());
	$('.admin_panel_content form').attr('id','add_new_user_form');
	
	//populateFormData();
	$('#add_new_user_form').validate(rulesForUserSaveForm);
}
populateFormData = function(){
var id = $('#add_new_user_form #clientId').val();
id = id.substring(0, id.indexOf(':'));
$.ajax({
		  type : "GET",
          url:'getAccessData.html?clientId='+id,
		  success: function(result){
		  	var data = {};
		  	data = $.parseJSON(result);
		  	var roles = data['roles'];
		  	$.each(roles, function(i,val){
		  	 $('<option value="'+val.roleId+'">'+val.roleName+'</option>').appendTo( $('#add_new_user_form').find('#role'));
		  	});
		  	//var nodes = getCompleteTree();
		  	createTree(data['accessTypes']);
		  },
		  error:function(){
			  alert("error in populating clients.");
		  }
	});
}
populateTemplateFieldData = function(){
	var id = $('#doc_history_con #templateIdVal').val();
	id = id.substring(0, id.indexOf(':'));
	$.ajax({
			  type : "GET",
	          url:'clientTemplateFieldData.html?templateId='+id,
			  success: function(result){
			  	var data = {};
			  	data = $.parseJSON(result);
			  	//var roles = data['roles'];
			  	$('#doc_history_con #historyFields').empty();
			  	$.each(data.result, function(i,val){
			  	 $('<option value="'+i+'">'+val+'</option>').appendTo( $('#doc_history_con #historyFields'));
			  	});
			  	//var nodes = getCompleteTree();
			  	if(data.historyTemplateField && data.historyTemplateField.id){
			  		$('#doc_history_con #id').val(data.historyTemplateField.id);
			  		$('#doc_history_con #templateId').val(data.historyTemplateField.templateId);
			  	}
			  	$.each(data.historyTemplateField.fieldNames, function(i,val){
			  		$('#doc_history_con #historyFields option[value="'+val+'"]').attr('selected','selected');
			  	});
			  	createTree(data['accessTypes']);
			  },
			  error:function(){
				  alert("error in populating clients.");
			  }
		});
}
createTree = function(nodes){
$('#add_new_user_form #accessNodeTree').empty();
		$("#add_new_user_form #accessNodeTree").dynatree({
			checkbox: true,
			// Override class name for checkbox icon, so rasio buttons are displayed:
			//classNames: {checkbox: "dynatree-radio"},
			// Select mode 3: multi-hier
			selectMode: 3,
			children: nodes
		});
		$('#accessNodeTree').show();
		}
showClientstoSelect = function(fld, callback){
$('#tableDataDiv').empty();
$('#tableDataDiv').bind( "callback", callback );
$('#tableDataDiv').attr('custom_fld_id',fld);
$.ajax({
		  type : "GET",
          url:'clientsData.html',
		  success: function(result){
			var data = jQuery.parseJSON(result);
			$( "#tableDataTemplate" ).tmpl( {tableData : data,displayCol : "name",selectorType : 'client',  idCol: 'id'}).appendTo( "#tableDataDiv" );
			$('#tableDataDiv').dialog('open');
			$('#tableDataDiv').show();
		  },
		  error:function(){
			  alert("error in populating clients.");
		  }
	});
}		
showTemplatetoSelect = function(fld, callback){
	$('#tableDataDiv').empty();
	$('#tableDataDiv').bind( "callback", callback );
	$('#tableDataDiv').attr('custom_fld_id',fld);
	$.ajax({
			  type : "GET",
	          url:'clientTemplateData.html',
			  success: function(result){
				var data = jQuery.parseJSON(result);
				$( "#tableDataTemplate" ).tmpl( {tableData : data,displayCol : "templateName",selectorType : 'template', idCol: 'templateId'}).appendTo( "#tableDataDiv" );
				$('#tableDataDiv').dialog('open');
				$('#tableDataDiv').show();
			  },
			  error:function(){
				  alert("error in populating clients.");
			  }
		});
	}	
showSelectedValue = function (ele){
var value = $.trim($('#'+ele).text());
$($('#tableDataDiv').attr('custom_fld_id')).val(value);
$('#tableDataDiv').dialog('close');
$('#tableDataDiv').trigger('callback');
$('#tableDataDiv').unbind('callback');
}
submitSaveUser = function(){
var valid = $('#add_new_user_form').validate(rulesForUserSaveForm);
if(valid.form()){
var formData = $('#add_new_user_form').serialize();
var tree = $("#accessNodeTree").dynatree("getTree");
var accessNodes = "[";
$.each(tree.serializeArray(),function(key,value){
	formData += '&accessNodes['+key+']=' + value.value;
});

$.post("saveUser.html", formData,postUserSubmission);

}
}		
postUserSubmission = function(data){
if(data)
data = $.parseJSON(data)
if(data['user'])
$('#errorClassAddUser').html("User Saved successfully.");
else
$('#errorClassAddUser').html("Some Server error occured. Unable to save user.");
}

renderAllFields = function(){
	$.ajax({
		  type : "GET",
        url:'getTemplateFieldTypes.html',
		  success: function(result){
		  var data = {};
		  data['fields'] = $.parseJSON(result);
		  $( "._allfieldcontainer" ).empty();
		  $( "#fieldTypeTemplate" ).tmpl( data).appendTo( "._allfieldcontainer" );
		  $(".item").draggable({
	            revert: true            
	        });
		//  $(".item").on('click', showAdditionalSettings); 
		  },
		  error:function(){
			  alert("error in populating clients.");
		  }
	});
	
}
showAdditionalSettings = function(el){
	$('._field_setting_div').hide();
	var type = $.trim($(el).find('.__fld_type_').html());
	$('td.field_settings').find('.'+type).show();
	$('td.field_settings').find('._common').show();
	$('._fs_current').removeClass('_fs_current');
	$(el).parents('td:first').addClass('_fs_current');
	
	var cspan = ($(el).parents('td:first').attr('colspan')? parseInt($(el).parents('td:first').attr('colspan')) : 1);
	
	if(cspan >1){
		$('#field_view').removeAttr('disabled');
	}
	else{
		$('#field_view').attr('disabled','disabled');
	}
	if(type == 'RADIO'){
		setupRadioCheckboxes(el, type);
	}
}
setupRadioCheckboxes = function(el, type){
	var radio = $(el).parents('td:first').find('input[type="radio"]');
	var lbls = $(el).parents('td:first').find('._fld-label');
	
	var tr = $('table.add_settings_table').find('tr:first');
	$('table.add_settings_table').empty();
	
	$(radio).each(function(i, fld){
		var lbl = lbls[i];		
		var row = $(tr).clone();
		row.find('input[type="radio"]').attr('checked', $(radio).attr('checked'));
		row.find('input[type="text"]').val($(lbl).text());
		row.appendTo($('table.add_settings_table'));
		$(row).find('._add_radio_val').on('click',addNewFieldRow);
		$(row).find('._delete_radio_val').on('click',deletFieldRow);
	});
}

addNewFieldRow = function(){
	var clone = $(this).parent().clone();
	$(clone).find('input').val('');
	$(clone).find('input').removeAttr('checked');
	$(this).parent().after($(clone));
	
	$(clone).find('._add_radio_val').on('click',addNewFieldRow);
	$(clone).find('._delete_radio_val').on('click',deletFieldRow);
	
}
deletFieldRow = function(){
	$(this).parent().remove();
}
getColSpan= function(etd){
	return ($(etd).attr('colspan')? parseInt($(etd).attr('colspan')) : 1);
}
showDocHistoryConfig =  function(){
	$('.admin_panel_content').empty();
	$('.admin_panel_content').html($('#docHistoryConfig').clone());
	$('.admin_panel_content #docHistoryConfig form').attr('id', 'doc_history_con');
	$('.admin_panel_content #docHistoryConfig').show();
	$('.admin_panel_content #docHistoryConfig').find('input').val('');
	$('.admin_panel_content #docHistoryConfig .docHistoryConfig_save').on('click', saveDocHistoryConfig);
}
saveDocHistoryConfig = function(){
	var id =  $('#doc_history_con').find('#templateIdVal').val().substring(0, $('#doc_history_con').find('#templateIdVal').val().indexOf(':'));
	$('#doc_history_con #templateId').val(id);
	$.ajax({url : "saveHistoryFieldConfig.html",type: "POST", data: $('#doc_history_con').serialize(), success : function(data){
		var data = jQuery.parseJSON(data);
		if(data != null && data != undefined && data.id != null && data.id != undefined){
			
			$('#doc_history_con #id').val(data.id);
			$('#doc_history_con .errorClass').html("Configuration has been saved successfully.");
		}
	}
	});
}
$(document).ready(function(){
	$('.doc_history').on('click',showDocHistoryConfig);
});