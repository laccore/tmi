
<%@ page import="edu.umn.laccore.tmi.ArtifactCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'artifactCategory.label', default: 'ArtifactCategory')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<g:render template="artifactCategoryNav" />
		<div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifactCategory.id.label" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: artifactCategoryInstance, field: "id")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifactCategory.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: artifactCategoryInstance, field: "name")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifactCategory.description.label" default="Description" /></td>
                            <td valign="top" class="value">${fieldValue(bean: artifactCategoryInstance, field: "description")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifactCategory.categoryTags.label" default="Category Tags" /></td>
                            <td valign="top" class="value">${fieldValue(bean: artifactCategoryInstance, field: "categoryTags")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifactCategory.categoryImage.label" default="Category Image" /></td>
                            <td valign="top" class="value">
								<g:if test="${artifactCategoryInstance.categoryImage?.length() > 0}">
                					<img src="${createLinkTo(dir:'components/artifact/', file:artifactCategoryInstance.categoryImage)}"><br/>
				                </g:if>
                            	${fieldValue(bean: artifactCategoryInstance, field: "categoryImage")}
                            </td>
                        </tr>
                        
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="artifactCategory.displayOrder.label" default="Display Order" /></td>
                            <td valign="top" class="value">${fieldValue(bean: artifactCategoryInstance, field: "displayOrder")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${artifactCategoryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
