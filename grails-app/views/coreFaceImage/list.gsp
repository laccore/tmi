<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'coreFaceImage.label', default: 'CoreFaceImage')}" />
        <g:set var="annotEntity" value="${message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list" controller="coreFaceAnnotation"><g:message code="default.list.label" args="[annotEntity]" /></g:link></span>
            <span class="menuButton"><g:link class="link" controller="coreFace" action="list">CoreFace Page</g:link></span>
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
                            <g:sortableColumn property="id" title="${message(code: 'coreFaceImage.id.label', default: 'Id')}" />
                            <g:sortableColumn property="name" title="${message(code: 'coreFaceImage.name.label', default: 'Name')}" />
                            <g:sortableColumn property="description" title="${message(code: 'coreFaceImage.description.label', default: 'Description')}" />
                            <g:sortableColumn property="coreFaceImage" title="${message(code: 'coreFaceImage.coreFaceImage.label', default: 'Core Face Image')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${coreFaceImageInstanceList}" status="i" var="coreFaceImageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${coreFaceImageInstance.id}">${fieldValue(bean: coreFaceImageInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: coreFaceImageInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: coreFaceImageInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: coreFaceImageInstance, field: "coreFaceImage")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
