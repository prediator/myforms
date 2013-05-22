    </div><!-- end main container -->
</div><!-- end tab-1 -->
</div><!-- end tabs -->

</td><td style="width:20%;vertical-align :top;">
<#if document.template.uploadDocEnabled == true>
<@documentRenderEditMode.renderUplodaDownloadDoc document/>
</#if>
<#if document.template.createDocEnabled == true>
<@documentRenderEditMode.renderCreateDocSection document/>
</#if>
</td>
</tr></table>
<div id="footer" class="ui-header-form">
All Copyright Reserved &copy;Mohd Irshad 
</div>
<#include "renderConditions.ftl">
<#include "hiddenFields.ftl">