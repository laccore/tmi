<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <title>TMI - Smear Slides - Organic Gallery</title>
    </head>
    <body>
        <div class="body">
        	<h2 style="font-weight:700; color:#031040;">Organic Components</h2>

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
	                  	        Unique Identification: ${ui?.name}<br/>
	                  	        <g:if test="${image.taxon?.length() > 0}">
	                  	        	Taxon: ${image.taxon}<br/>
	                  	        </g:if>
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
