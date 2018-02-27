
<%@ page import="edu.umn.laccore.tmi.ArtifactCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'artifactCategory.label', default: 'ArtifactCategory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
		<g:render template="artifactCategoryNav" />
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'artifactCategory.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'artifactCategory.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'artifactCategory.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="categoryTags" title="${message(code: 'artifactCategory.categoryTags.label', default: 'Category Tags')}" />
                        
                            <g:sortableColumn property="categoryImage" title="${message(code: 'artifactCategory.categoryImage.label', default: 'Category Image')}" />
                            
							<g:sortableColumn property="displayOrder" title="${message(code: 'artifactCategory.displayOrder.label', default: 'Display Order')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artifactCategoryInstanceList}" status="i" var="artifactCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${artifactCategoryInstance.id}">${fieldValue(bean: artifactCategoryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: artifactCategoryInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: artifactCategoryInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: artifactCategoryInstance, field: "categoryTags")}</td>
                        
                            <td>
                            	<g:if test="${artifactCategoryInstance.categoryImage?.length() > 0}">
                					<img src="${createLinkTo(dir:'components/artifact/', file:artifactCategoryInstance.categoryImage)}"><br/>
				                </g:if>
                            	${fieldValue(bean: artifactCategoryInstance, field: "categoryImage")}
                            </td>
                            
                            <td>${fieldValue(bean: artifactCategoryInstance, field: "displayOrder")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${artifactCategoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
