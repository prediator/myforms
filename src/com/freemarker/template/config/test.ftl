<#import "documentRenderEditMode.ftl" as documentRenderEditMode>
<div>
<table>
<tr><th>Username</th><th>Password</th></tr>
<#list users as user>
<tr><td>${user.username}</td><td>${user.password}</td></tr>
</#list>



</table>
<#list template.templateFieldMap?values as value>
       <@documentRenderEditMode.renderField value/>
</#list>
</div>