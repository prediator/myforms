<link rel="stylesheet" href="./styles/demo.css" type="text/css"/>
<script>
$("#notesubmit").click(function(){
		if($("#note").val()!=undefined && $("#note").val()!=''){
			loadData('addNotes.html?documentId='+$("#documentId").val()+'&notes='+$("#note").val(),'tabs-3');
		}
	});
	
	
</script>
<div id="listdiv">
    
        <#if documentNotes?exists>            
		   <#list documentNotes as notes>
		     <div class="list">
		      <div class="message"> 
		       <div><strong>${notes.user.firstName!""}&nbsp;&nbsp;${notes.user.lastName!""}&nbsp;&nbsp;</strong></div>
		       <span class="name">${notes.notes!""}</span></br>
		       <span class="date">${notes.createdOn!""}</span>		       
		      </div >
		     </div>
		   </#list>		   
	    </#if>
</div>
        <div class="addcomment">
		  <textarea id="note" name="note" class="input"></textarea>		     
		</div>
		<div>
		   <a href="#" id="notesubmit" class="submit button save_rt">Add Notes</a>	
		</div>

