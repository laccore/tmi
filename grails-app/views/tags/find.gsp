<%@ page import="edu.umn.laccore.tmi.Image" %>
<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'tags.label', default: 'Matching Tags')}" />
        <title>TMI - Smear Slides - Tags</title>
    </head>
    <body>
        <div class="body">
            <h1>Entities tagged with '${params.id}'</h1>
            <div class="list">
            	<g:if test="${uniqueIdentifications}">
                	<h2>Smear Slide Components</h2>
                	<ul>
                		<g:each in="${uniqueIdentifications}" status="i" var="ui">
                			<li><g:link controller="uniqueIdentification" action="show" id="${ui.id}">${ui.name}</g:link></li>
   						</g:each>
               		</ul>
               	</g:if>
               	<g:if test="${images}">	
	               <h2>Images</h2>
	                <ul>
	                <g:each in="${images}" status="i" var="image"> 
		                   <sec:ifAllGranted roles="ROLE_ADMIN"> 
		                   		<li><g:link controller="image" action="show" id="${image.id}">${image.uniqueIdentification.name} - Admin Page</g:link></li>
		                   </sec:ifAllGranted>
		                   <li><a target="_blank" href="${createLinkTo(dir:image.viewDir(), file:''+image.filename)}">Image of ${image.uniqueIdentification.name}</a></li> 
	                </g:each>
	               </ul>
	            </g:if>
            </div>
        </div>
    </body>
</html>
