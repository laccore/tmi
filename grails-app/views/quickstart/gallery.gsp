<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')}" />
        <title>TMI - Smear Slides - Contaminants Gallery</title>
    </head>
    <body>
		<!-- 2/20/2014 brgtodo: Make a gallery taglib since this code is now thrice-duplicated -->
        <div class="body">
            <h2 style="font-weight:700; color:#031040;">Contaminants</h2>
            
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
	</body>
</html>
