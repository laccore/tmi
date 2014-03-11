
<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')}" />
        <g:set var="imageEntity" value="${message(code: 'coreFaceImage.label', default: 'CoreFaceImage')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list" controller="coreFaceImage"><g:message code="default.list.label" args="[imageEntity]" /></g:link></span>
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
                            <g:sortableColumn property="id" title="${message(code: 'coreFaceAnnotation.id.label', default: 'Id')}" />
                            <g:sortableColumn property="name" title="${message(code: 'coreFaceAnnotation.name.label', default: 'Name')}" />
                            <g:sortableColumn property="coreFace.name" title="${message(code: 'coreFaceAnnotation.coreFace.name.label', default: 'Parent Core Face')}" />
                            <g:sortableColumn property="x" title="${message(code: 'coreFaceAnnotation.x.label', default: 'X')}" />
                            <g:sortableColumn property="y" title="${message(code: 'coreFaceAnnotation.y.label', default: 'Y')}" />
                            <g:sortableColumn property="width" title="${message(code: 'coreFaceAnnotation.width.label', default: 'Width')}" />
                            <g:sortableColumn property="height" title="${message(code: 'coreFaceAnnotation.height.label', default: 'Height')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${coreFaceAnnotationInstanceList}" status="i" var="coreFaceAnnotationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${coreFaceAnnotationInstance.id}">${fieldValue(bean: coreFaceAnnotationInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: coreFaceAnnotationInstance, field: "name")}</td>
                            <td>${fieldValue(bean: coreFaceAnnotationInstance, field: "coreFace.name")}</td>
                            <td>${fieldValue(bean: coreFaceAnnotationInstance, field: "x")}</td>
                            <td>${fieldValue(bean: coreFaceAnnotationInstance, field: "y")}</td>
                            <td>${fieldValue(bean: coreFaceAnnotationInstance, field: "width")}</td>
                            <td>${fieldValue(bean: coreFaceAnnotationInstance, field: "height")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
