$(document).ready(function() {
        $("#templateTable").flexigrid({
                url: 'templateData.html',
                dataType: 'json',
                colModel : [
                        {display: 'Template Id', name : 'templateId', width : 80, sortable : true, align: 'left'},
                        {display: 'Template Name', name : 'templateName', width : 200, sortable : true, align: 'left'},
                        {display: 'Title', name : 'templateTitle', width : 200, sortable : true, align: 'left'},
                        {display: 'Description', name : 'description', width : 250, sortable : true, align: 'left'}
                ],
                buttons : [
                		{name: 'New Template', bclass: 'newtemp', onpress : createTemplate},
                        {name: 'Edit', bclass: 'edit', onpress : doCommand},
                        {name: 'Delete', bclass: 'delete', onpress : doCommand},
                        {name: 'Create Document', bclass: 'createdoc', onpress : createDocument},
                        {separator: true}
                ],
                searchitems : [
                        {display: 'Template Id', name : 'templateId'},
                        {display: 'Template Name', name : 'templateName', isdefault: true}
                        
                ],
                sortname: "id",
                sortorder: "asc",
                usepager: true,
                title: "Template",
                useRp: true,
                rp: 10,
                showTableToggleBtn: false,
                resizable: false,
                width: '70%',
                height: 320,
                singleSelect: true
        });
});

function doCommand(){}
function createDocument(com, grid){
$('.trSelected', grid).each(function() {
var id = $(this).children('td');
id = $(id[0]).children('div').text();
window.location = "editDocument.html?templateId="+id;
});

}
function createTemplate(){
window.location = 'createUpdateTemplate.html';
}

$(document).ready(function() {
        $("#documentTable").flexigrid({
                url: 'documentData.html',
                dataType: 'json',
                colModel : [
                        {display: 'Document id', name : 'documentId', width : 80, sortable : true, align: 'left'},
                        {display: 'Document title', name : 'title', width : 200, sortable : true, align: 'left'},
                        {display: 'Template name', name : 'templateName', width : 200, sortable : true, align: 'left'},
                        {display: 'Created By', name : 'createdBy', width : 200, sortable : true, align: 'left'},
                        {display: 'Created On', name : 'createdOn', width : 100, sortable : true, align: 'left'}
                        
                ],
                buttons : [
                        {name: 'Edit', bclass: 'edit', onpress : openDocument},
                        {name: 'Read', bclass: 'read', onpress : doCommand},
                        {name: 'Delete', bclass: 'delete', onpress : doCommand},
                        {separator: true}
                ],
                searchitems : [
                        {display: 'Document id', name : 'documentId'},
                        {display: 'Document title', name : 'title', isdefault: true}
                        
                ],
                sortname: "documentId",
                sortorder: "asc",
                usepager: true,
                title: "Document",
                useRp: true,
                rp: 10,
                showTableToggleBtn: false,
                resizable: false,
                width: '70%',
                height: 320,
                singleSelect: true
        });
 $('#documentTable').dblclick( function (e) {
      target = $(e.target);
      while(target.get(0).tagName != "TR"){
        target = target.parent();
      }
      var id =  target.children('td');
	  id = $(id[0]).children('div').text();
      window.location = "editDocument.html?documentId="+id;
  }); 
});
$(document).ready(function(){
$('.menu-itm').click(function(){
if($(this).text() == 'Template'){
$('#dataTableDocument').hide();
$('#admin_panel').hide();
$('#dataTableTemplate').show();
}
else if($(this).text() == 'Document'){
$('#dataTableTemplate').hide();
$('#dataTableDocument').show();
$('#admin_panel').hide();
}
else if($(this).text() == 'Administration'){
$('#dataTableTemplate').hide();
$('#dataTableDocument').hide();
$('#admin_panel').show();

}

else if($(this).text() == 'Others'){

}
});
});

function openDocument(com, grid){
$('.trSelected', grid).each(function() {
var id = $(this).children('td');
id = $(id[0]).children('div').text();
window.location = "editDocument.html?documentId="+id;
});

}
$(document).ready(function() {
$('.header-link').click(function(){
$('.a-selected').removeClass('a-selected');
$(this).addClass('a-selected');
});
});
