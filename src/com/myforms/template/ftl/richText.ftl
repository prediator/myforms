<#macro renderRichText name h w value>
<script>
renderRichTextEditor('${name}',${h},${w});
</script>
<div class="ui-richtext-form" style="height:100% !important;width 100% !important;">
<textarea id="${name}" name="${name}">
${value}
</textarea>

</div>
</#macro>