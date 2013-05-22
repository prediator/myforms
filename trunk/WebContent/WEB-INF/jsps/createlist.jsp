<div id="__create_list__" style="display: none;" title="Create/Select List">
<label style="vertical-align: top;">Please select a list : </label> <select name="_list__select" style="height: 20px;font-size: 70%;vertical-align: top;" id="_list__select" class="_list__select"></select>
<img class="go_list_select_for_fld" src="./images/go.jpg">
<hr style="color: #505050;width:100%;"/>
<div class="_create_new_list">
<div style="font-weight: bold;font-size: 90%;margin-bottom:15px;">Create List</div>
	<div style="width: 50%;float:right;">
	<select multiple="multiple" class='_list__val-tmpl' style="height: 100px;margin-left: 50px;font-size: 12px important;"> </select>
	<a class="button delete __delete_sel_list" href="#">Delete Selected</a> <a class="button save_rt save__list" href="#">Save</a>
	</div>
	<div style="width: 50%;">
		<div>
			<label>List Name : </label><input id="__list_name_"/>
			</div><br/>
		<div>
			<label>List Value : </label><input id="__list_value_"/>
		 </div><br/>
		 <div style="float: right;">
			<a class="button add add_to_list" style="height: 75%;" href="#">Add Item</a>
		 </div><br/>
	</div>
	
</div>
</div>

<div id="_add_client_" style="display: none;" title="Add Client">

<form id="add_client_form" style="height: 75%;" method="" action="">
<span class="errorClass" id="errorClassAddClient"></span>
<div class="_create_new_list" >
<div style="font-weight: bold;font-size: 90%;margin-bottom:15px;">Add Client</div>
	<div style="width: 65%;">
		<div>
			<label>Client Name : </label><input id="clientName" name="clientName"/>
			</div><br/>
		<div>
			<label>Descrption : </label><input id="description" name = "description"/>
		 </div><br/>
		 <div style="float: right;">
			<a class="button add add_client add_client_save" style="height: 75%;" href="#">Add Client</a>
		 </div><br/>
	</div>
	</form>
	
</div>
<div id="tableDataDiv" style="display: none;"> </div>
