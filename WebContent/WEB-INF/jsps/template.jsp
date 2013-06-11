<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Create/Update Template</title>
<head>
<%@include file="ui.jsp" %>
<link rel="stylesheet" href="./styles/template.css" type="text/css" media="all" />
<script type="text/javascript" src="scripts/jquery/jquery.tmpl.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	renderAllFields();
});
</script>
  </head>
  <body>
  
  <div id="edit-fld-seetings" title="Field Settings" style="display:none;">
	<div class = 'div_fld_row'><span class='fs_fld'>Field Label :</span><input type="text" id="fs_fld_label"></div>
	<div class = 'div_fld_row'><span class='fs_fld'>Field Help Text :</span><input type="text" id="fs_fld_help"></div>
	<div class = 'div_fld_row'><span class='fs_fld'>Field Default value :</span><input type="text" id="fs_fld_dflt"></div>
	<div class = 'div_fld_row'><span class='fs_fld'>Is Required : </span><input type="checkbox" class="checkbox" id="fs_fld_req">&nbsp;</div>
	<div class = 'div_fld_row'><span class='fs_fld'>Is Visible : </span><input type="checkbox" class="checkbox" id="fs_fld_vis"></div>
	<div class = 'div_fld_row'><span class='fs_fld'>Is Enabled : </span><input type="checkbox" class="checkbox" id="fs_fld_ena"></div>
	<div class = 'div_fld_row div_fld_row_selected_list' style="display: none;"><div class='fs_fld'><b>Selected List :</b> <span class="__selecetd_list_for_temp__"></span></div><input type="hidden" " id="_fs_fld_sel_list_"></div>
    <div class = 'div_fld_row div_fld_row_list' style="display:none;"><span class='fs_fld_link'><a onclick="openCreateListModalDialog();" href='#'>Create/Select a list for this field</a></span></div>
  <div class = 'div_fld_row' style="width: 100%;"><span class='fs_fld'><a class="button save_rt save_fld_tmpl__" href="#">Save</a> </span>&nbsp;</div>
	
</div>
<div class="hidden_doc_errors" style="display:none; ">
<spring:hasBindErrors name="templateMetaData">
Please correct the following errors.
<ul>
<c:forEach var="error" items="${errors.allErrors}">
<li>
 
<spring:message code="${error.code}" arguments="${error.arguments}"/>
</li>

</c:forEach>
<script>
$(document).ready(function() {
  $(".hidden_doc_errors").css('display','block');
});
</script>
</spring:hasBindErrors>
</ul>
</div>
      <table style="height: 100%;width: 100%;"><tr>
      <td width="20%">
      <div id="cart_title" style="margin-bottom: 28px;">
         <div id="nav_left" style="padding-right: 7px;">
            <span>Add Fields</span>         
          </div>
          <div id="nav_left_ts">
            <span  class="fade_back">Template Settings</span>         
          </div>
      </div>
      
      <div id="item_container">
             <div id="tmplate_settings" style="display: none;">
         	<div class = 'div_fld_row'>	<span class='fs_fld'> Template Name</span> <br/> <input id="tname" name="templateName" value='<c:out value="${templateMetaData.templateName }"/>' class="ts_txt"/></div>
         	<div class = 'div_fld_row'>	<span class='fs_fld'> Parent Template</span>  <br/> 
         		 <select name = "parentTemplateId">
         		   <option value="0">N/A</option>
         		 </select></div>
         		<div class = 'div_fld_row'> <span class='fs_fld'>Template Description</span> <br/> <textarea id="description" name="description" class="ts_txt">${templateMetaData.description}</textarea></div>
         		<div class = 'div_fld_row'>	 <span class='fs_fld'><input type="checkbox" id="isAbstarct" name="isAbstarct" class="ts_txt checkbox"/>Is Abstract  </span></div>
         		<div class = 'div_fld_row'>	<span class='fs_fld'> <input type="checkbox" id="createDocEnabled" name="createDocEnabled" class="ts_txt checkbox"/>Enable create document section?  </span></div>
         		<div class = 'div_fld_row'>	 <span class='fs_fld'><input type="checkbox" id="uploadDocEnabled" name="uploadDocEnabled" class="ts_txt checkbox"/>Enable upload document section? </span></div>
         		 
          </div>
          <div id = "fldtray" class="_allfieldcontainer">
          <!-- <div class="item" id="i1">           
              <div class = 'txt'>	
				<div>
					<label><span  class='fldLabel'>Label</span><span title="Help Text" class="help">&nbsp;&nbsp;&nbsp;
						<span class="fldRequired" style="color:red;display:none;">*</span>
							<div>&nbsp;</div>
						</span>
					</label>
				</div>	
				<input class="fldTxt" type="text" value="" name="" id="txtfld" disabled="disabled">	
				<span style="display: none;" class="__fld_type_"  >TXT</span>	
				<span style="display: none;" class="TXT_isVisible" >false	</span>
				<span style="display: none;" class="TXT_isEnabled" >false</span>		
			   </div>
             <label class="title">Text Box</label>              
          </div> -->

          <div class="item" id="i2">
              <div class="lst" id="div_MyList">
					<div>
						<label><span  class='fldLabel'>Label</span><span title="Help Text" class="help">&nbsp;&nbsp;&nbsp;
							<span class='fldRequired' style="color:red;display:none;">*</span>
								<div>&nbsp;</div>
							</span></label>
						</div>
	
				<select class="slt" value="" name="" id="lstfld" disabled="disabled">
				
			
				  <option value="A">
				  A</option>
				  <option value="B">
				  B</option>
				  <option value="C">
				  C</option>
				</select>	
			</div>
				<span style="display: none;" class="__fld_type_"  >LIST</span>	
				<span style="display: none;" class="LIST_isVisible" >false	</span>
				<span style="display: none;" class="LIST_isEnabled" >false</span>
				<span style="display: none;" class="LIST_List_Selected" >false</span>	
              <label class="title">List Field</label>
              
          </div>


          <div class="clear"></div>
          </div>
      </div>
      </td><td valign="top" width="60%">
      <div id="cart_container">

          <div id="cart_title"><%--
              <div id="nav_left">
                  <a href="" id="btn_prev"><</a>
                  <a href="" id="btn_next">></a>
                  <a href="" id="btn_clear">Clear Cart</a>

              </div>
              --%>
                        <div id="nav_left">
              <span>Template</span>
              <div class="clear"></div>
          </div>
              <div id="nav_right">
                  <span class="sptext">
                      <label>Total Fields </label><label class="count" id="citem">0</label>
                  </span>
                  <span class="sptext">
                      <a href="" title="Up" id="btn_prev"><img src="images/up.jpg"/></a>
                  </span>
                                    <span class="sptext">
                      <a href="" title="Down" id="btn_next"><img src="images/down.jpg"/></a>
                  </span>
                                    <span class="sptext">
                      <a href="" title="Clear template" id="btn_clear"><img style="height: 16px;width: 16px;" src="images/clear.jpg"/></a>
                  </span>
              </div>
              <div class="clear"></div>
          </div>
          <div id="cart_toolbar">
<table style="background: none repeat scroll 0 0 #E9E9E9;width: 100%;"><tr><td>
<div id='templ_title'></div>
</td></tr></table>
              <table id="cart_items" class="back" style="width: 100%;vertical-align: top;">
              <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
              </table>
          </div>
          
          
      </div>
      </td><td class="field_settings">
      <div style="margin-bottom: 28px;margin-left:20px;" id="cart_title">
         <div style="padding-right: 7px;">
            <span>Additional Field settings </span>         
          </div>          
      </div>
      <div id="item_container" style="margin-left:20px;width:220px !important;padding-left: 10px;padding-top: 15px;">
      <div class="_field_setting_div _common" style="display: none;">
      	<label>Field View :</label> <span> 
      	<select id="field_view" disabled="disabled">
      		<option value="classical" selected>
      			Classical view
      		</option>
      		<option value="singlerow">
      			Single row view
      		</option>
      	</select></span>
      </div>
            <div class="_field_setting_div RADIO" style="display: none;">
      		<label>Add options :</label> <span> 
      		<table class="add_settings_table add_settings_radio">
      			<tr>      		
      				<td class="td15">
      					<input type="radio" class="add_settings_rd">
      				</td>
      				<td>
      					<input type="text" class="add_settings_fld"/>
      				</td>
      				<td class="_add_radio_val">
      					<img src="./images/plus.jpeg"/>
      				</td>
      				<td class="_delete_radio_val">
      					<img src="./images/delete.jpg"/>
      				</td>
      		</tr>
      		
      		</table>
      		
      		   		</span>
      </div>
      </div>
      </td>
      </tr></table>
     <jsp:include flush="true" page="createlist.jsp"/>
     <jsp:include flush="true" page="templateFields.htm"></jsp:include>
  </body>
  
</html>