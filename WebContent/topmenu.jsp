<script type="text/javascript" src="scripts/menu.js"></script>
<link rel="stylesheet" type="text/css" href="styles/menu.css"/>
<link rel="stylesheet" type="text/css" href="styles/main.css"/>

<script>
        $('document').ready(function(){
            
            $('.single-link').click(function(){
             
            $('.current').attr('class','single-link');
            	$(this).attr('class','current');
            });
            // $('.menu').fixedMenu();
        });
        </script>
<script>
function submitForm()
{
   saveEditors();
   $('#form').submit();
}
function saveEditors(){
for(var i=0; i<editors.length;i++)
editors[i].saveHTML();
}
</script>

<div class="menu">
    <ul>
      <%-- <li class="single-link">
        <a  id="save" onclick="submitForm()" href="#">Save</a>
        </li>
        <!-- Using class="current" for the link of the current page -->
      
      <li class="single-link"><!-- Using class="single-link" for links with no dropdown -->
        <a href="#" onClick="openModalDialog()">Refresh Template</a>
        </li>
      <li class="single-link"><!-- Using class="single-link" for links with no dropdown -->
        <a href="createUpdateTemplate.html">Create Template</a>
      </li> --%>
    <c:forEach items="${myFormsMenu.menuItems}"
               var="menuItem"
               varStatus="status">
      		      
      <li class="single-link">
        <a href="${menuItem.link}" title="${menuItem.helpText }" 
        <c:if test = "${menuItem.jsMenu == true }">
        ${menuItem.jsMethod}="${menuItem.js}" </c:if> >${menuItem.name }</a>
        </li>       
    </c:forEach>
        
    <%--   <li class="single-link"><!-- Using class="single-link" for links with no dropdown -->
        <a target="_blank" href="https://www.google.com/calendar">Calendar</a>
        </li>
      <li class="single-link"><!-- Using class="single-link" for links with no dropdown -->
        <a target="_blank" href="https://docs.google.com">Documents</a>
        </li>
      <li class="single-link"><!-- Using class="single-link" for links with no dropdown -->
        <a target="_blank" href="http://picasaweb.google.co.in/home">Photos</a>
        </li>
      <li><!-- Do not add any class for links with dropdown -->
        <a href="#">More<span class="arrow"></span></a>
        <!-- Drop Down menu Items -->
<ul>
            <li><a href="http://www.google.co.in/reader">Reader</a></li>
            <li><a href="https://sites.google.com">Sites</a></li>
            <li><a href="http://groups.google.co.in">Groups</a></li>
            <li><a href="http://www.youtube.com">YouTube</a></li>
            <li>
            <div class="mid-line">
            </div>
            </li>
            <li><a href="http://www.google.co.in/imghp?hl=en&tab=wi">Images</a></li>
            <li><a href="http://maps.google.co.in/maps?hl=en&tab=wl">Maps</a></li>
            <li><a href="http://translate.google.co.in/">Translate</a></li>
            <li><a href="http://books.google.co.in">Books</a></li>
            <li><a href="http://scholar.google.co.in/">Scholar</a></li>
            <li><a href="http://blogsearch.google.co.in">Blogs</a></li>
            <li>
            <div class="mid-line">
            </div>
            </li>
            <li><a href="http://www.google.co.in/intl/en/options/">even more >></a></li>
            <li>
            <div class="mid-line">
            </div>
            </li>--%>
            <li style="float: right;margin-right: 30px;color: white;">
            <div >
            Welcome! <c:out value="${user_name}"/> <a href="<spring:url value="/j_spring_security_logout" htmlEscape="true" />">Logout</a>
            </div>  
            
        </li>
        <li style="float: right;margin-right: 5px;color: white;">
        </li>
    </ul>
</div>
<div style="height:30px;">&nbsp;</div>
