//uniqueIdentification.identificationType?.noWhitespace() + '/' + imageInstance.uniqueIdentification?.noWhitespace()
<%@ page import="edu.umn.laccore.tmi.Image" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.id.label" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "id")}</td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.displayOrder.label" default="Display Order" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "displayOrder")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "name")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.uniqueIdentification.label" default="Unique Identification" /></td>
                            <td valign="top" class="value"><g:link controller="uniqueIdentification" action="show" id="${imageInstance?.uniqueIdentification?.id}">${imageInstance?.uniqueIdentification?.encodeAsHTML()}</g:link></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.lightType.label" default="Light Type" /></td>
                            <td valign="top" class="value"><g:link controller="lightType" action="show" id="${imageInstance?.lightType?.id}">${imageInstance?.lightType?.encodeAsHTML()}</g:link></td>
                        </tr>
                    
                        <tr class="prop">
                        	<td valign="top" class="name"><g:message code="image.magnification.label" default="Magnification" /></td>
                        	<td valign="top" class="value">${fieldValue(bean: imageInstance, field: "magnification")}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><a href="http://lrc.geo.umn.edu/laccore/assets/pdf/sops/LacCore_naming_code.pdf">LacCore ID</a></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "expeditionCode")}-${fieldValue(bean: imageInstance, field: "lakeCode")}<script type="text/javascript">
									var str="${fieldValue(bean: imageInstance, field: "year")}";
									document.write(str.substr(2));
								</script>-${fieldValue(bean: imageInstance, field: "siteHole")}-${fieldValue(bean: imageInstance, field: "drive")}${fieldValue(bean: imageInstance, field: "corerType.corerShort")}-${fieldValue(bean: imageInstance, field: "section")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.depth.label" default="Depth" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "depth")}</td>
                        </tr>
                        
                        <tr class="prop">
                        	<td valign="top" class="name"><g:message code="image.notes.label" default="Notes" /></td>
                        	<td valign="top" class="value">${fieldValue(bean: imageInstance, field: "notes").replaceAll(/\n/, '<br />')}</td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.submittedBy.label" default="Submitted By" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "submittedBy")}</td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.uiTags.label" default="Tags" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "uiTags").replaceAll(" ", '<br />')}</td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.taxon.label" default="Taxon" /></td>
                            <td valign="top" class="value">${fieldValue(bean: imageInstance, field: "taxon")}</td>
                        </tr>
                        
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="image.filename.label" default="Original Filename" /></td>
                            <td valign="top" class="value"><a href="${createLinkTo(dir:imageInstance.viewDir(), file:''+imageInstance.filename)}">${fieldValue(bean: imageInstance, field: "filename")}</a></td>
                        </tr>
                        
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="image.filenameMedium.label" default="Filename Medium" /></td>
                            <td valign="top" class="value"><a href="${createLinkTo(dir:imageInstance.viewDir(), file:''+imageInstance.filenameMedium)}">${fieldValue(bean: imageInstance, field: "filenameMedium")}</a></td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="image.filenameThumb.label" default="Filename Thumb" /></td>
                            <td valign="top" class="value"><a href="${createLinkTo(dir:imageInstance.viewDir(), file:''+imageInstance.filenameThumb)}">${fieldValue(bean: imageInstance, field: "filenameThumb")}</a></td>
                        </tr>
                        
                        <tr class="prop">
                        	<td valign="top" class="name">Image</td>
                        	<td valign="top" class="value">
                        		<g:if test="${imageInstance.filename}">
                        			<a href="${createLinkTo(dir:imageInstance.viewDir(), file:''+imageInstance.filename)}">
                        				<img src="${createLinkTo(dir:imageInstance.viewDir(), file:imageInstance.filenameThumb)}" 
                        					alt="${imageInstance.filenameThumb}"
                        					title="${imageInstance.filenameThumb}"/>
                        			</a>
                        		</g:if>
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${imageInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
