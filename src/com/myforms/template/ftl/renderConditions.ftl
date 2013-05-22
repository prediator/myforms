<#import "generateJQuery.ftl" as jquery>
<#assign docTemplate = document.template />
    <script>
   		$(document).ready(function(){
<#list document.fieldMap?keys as key>
	<#assign field=document.fieldMap[key]/>
    <#assign tmplField=field.templateField/>
    <#if tmplField.fieldType.fieldType?exists>
    	<#if tmplField.fieldType.fieldType == 'NUM'>
			$('#${tmplField.fieldName}').mask('9?9999999999');		
		</#if>
    </#if>
    <#list tmplField.conditionsByTarget as conditionByTarget>    
    	 <#list conditionByTarget.sourceConditions as condSrc>	    		
				${condSrc.renderCondition!""}			
    	</#list>    	
    </#list>    
</#list>
});	</script>
