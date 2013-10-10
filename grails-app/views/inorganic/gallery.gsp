
<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')}" />
        <title>TMI - Smear Slides - Inorganic Gallery</title>
    </head>
    <body>
        <%--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>--%>
        <div class="body">
            <h2 style="font-weight:700; color:#031040;">Inorganic Components</h2>
            
            <table><tablebody>
           	<g:each in="${uniqueIdentificationInstanceList}" var="ui">
				<g:each in="${ui.images}" var="image">
					<g:if test="${image.displayOrder > 0}">
						<tr><td>
						<g:link controller="uniqueIdentification" action="show" id="${image.uniqueIdentification.id}">
							<img src="${createLinkTo(dir:image.viewDir(), file:image.filenameMedium)}"
								alt="${image.filenameMedium}"
								title="${image.uniqueIdentification?.name}" /> 
						</g:link>
						</td>
						<td style="text-align:left">
							<!-- 10/10/2013 brgtodo: used frequently: here, organic/gallery, image/list. taglib-ify? -->
                  	        Unique Identification: ${ui?.name}<br/>
              	        	Site name: ${image.lakeName?:'not specified'}<br/>
              	        	Light type: ${image.lightType?:'not specified' }<br/>
              	        	Magnification: ${image.magnification?:'not specified'}<br/>
							Submitted by: ${image.submittedBy?:'not specified'}<br/>
							Notes: ${image.notes?:'none'}<br/>
							Image Tags: ${image.uiTags?:'none'}
						</td></tr>
					</g:if>
				</g:each>
			</g:each>
			</tablebody></table>
        </div>
        <%--<div class="paginateButtons">
            <g:paginate total="${uniqueIdentificationInstanceTotal}" />
        </div>
    --%></body>
</html>
