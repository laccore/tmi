
<%@ page import="edu.umn.laccore.tmi.Image" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="images" controller="fileResource" action="upload">Upload Images</g:link></span>
        	<span class="menuButton"><g:link class="link" controller="fileResource" action="list">Link Images</g:link></span>
        	<span class="menuButton"><g:link class="meta" controller="excelUploader" action="index">Upload Metadata</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'image.id.label', default: 'Id')}" />
                            <g:sortableColumn property="name" title="${message(code: 'image.name.label', default: 'Name')}" />
                            <th><g:message code="image.uniqueIdentification.label" default="Unique Identification" /></th>
                            <th><g:message code="image.lightType.label" default="Light Type" /></th>
							<th><a href="http://lrc.geo.umn.edu/laccore/assets/pdf/sops/LacCore_naming_code.pdf">LacCore ID</a></th>
							<g:sortableColumn property="submittedBy" title="${message(code: 'image.submittedBy.label', default: 'Submitted By')}" />
							<g:sortableColumn property="notes" title="${message(code: 'image.notes.label', default: 'Notes')}" />
							<g:sortableColumn property="uiTags" title="${message(code: 'image.uiTags.label', default: 'Tags')}" />
							<g:sortableColumn property="taxon" title="${message(code: 'image.taxon.label', default: 'Taxon')}" />
                        	<th>Thumbnail</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${imageInstanceList}" status="i" var="imageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${imageInstance.id}">${fieldValue(bean: imageInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: imageInstance, field: "name")}</td>
                            <td><g:link controller="uniqueIdentification" action="show" id="${imageInstance.uniqueIdentification.id}">${fieldValue(bean: imageInstance, field: "uniqueIdentification")}</g:link></td>
                            <td>${fieldValue(bean: imageInstance, field: "lightType")}</td>
                            <td>
                            	${fieldValue(bean: imageInstance, field: "expeditionCode")}-${fieldValue(bean: imageInstance, field: "lakeCode")}<script type="text/javascript">
									var str="${fieldValue(bean: imageInstance, field: "year")}";
									document.write(str.substr(2));
								</script>-${fieldValue(bean: imageInstance, field: "siteHole")}-${fieldValue(bean: imageInstance, field: "drive")}${fieldValue(bean: imageInstance, field: "corerType.corerShort")}-${fieldValue(bean: imageInstance, field: "section")}
                            </td>
                            <td>${fieldValue(bean: imageInstance, field: "submittedBy")}</td>
                            <td>${fieldValue(bean: imageInstance, field: "notes")}</td>
                            <td>${fieldValue(bean: imageInstance, field: "uiTags")}</td>
                            <td>${fieldValue(bean: imageInstance, field: "taxon")}</td>
                        	<td>
                        		<g:link action="show" id="${imageInstance.id}">
                        			<img src="${createLinkTo(dir:imageInstance.viewDir(), file:imageInstance.filenameThumb)}" 
									alt="${imageInstance.filename}" title="${imageInstance.filename}" style="max-height:100px; max-width:100px;" />
								</g:link>
							</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${imageInstanceTotal}" />
                <!--<g:paginate next="Next" prev="Prev" maxsteps="10" controller="image" action="list" max="50" offset="50" total="${imageInstanceTotal}" />-->
            </div>
        </div>
    </body>
</html>
