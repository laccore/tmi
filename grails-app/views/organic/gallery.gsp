<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <title>TMI - Smear Slides - Organic Gallery</title>
    </head>
    <body>
        <div class="body">
            <div>
	            <h2 style="font-weight:700; color:#031040;">Organic Components</h2>
	            	<g:each in="${uniqueIdentificationInstanceList}" var="ui">
							<g:each in="${ui.images}" var="image">
								<g:if test="${image.displayOrder>0}">
									<g:link controller="uniqueIdentification" action="show" id="${image.uniqueIdentification.id}">
										<img 
										src="${createLinkTo(dir:image.viewDir(), file:image.filenameMedium)}"
										alt="${image.filenameMedium}"
										title="${image.uniqueIdentification?.name}" /> 
									</g:link>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</g:if>
							</g:each>
						</g:each>
	        </div>
        </div>
        <%--<div class="paginateButtons">
            <g:paginate total="${uniqueIdentificationInstanceTotal}" />
        </div>
    --%></body>
</html>
