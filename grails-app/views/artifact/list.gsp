<%@ page import="edu.umn.laccore.tmi.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<g:render template="artifactNav" />
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'artifact.id.label', default: 'Id')}" />
                            <g:sortableColumn property="name" title="${message(code: 'artifact.name.label', default: 'Name')}" />
                            <g:sortableColumn property="description" title="${message(code: 'artifact.description.label', default: 'Description')}" />
                            <g:sortableColumn property="uiTags" title="${message(code: 'artifact.uiTags.label', default: 'Tags')}" />
                            <g:sortableColumn property="artifactImage" title="${message(code: 'artifact.artifactImage.label', default: 'Artifact Image')}" />
							<g:sortableColumn property="annotationImage" title="${message(code: 'artifact.annotationImage.label', default: 'Annotation Image')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artifactInstanceList}" status="i" var="artifactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${artifactInstance.id}">${fieldValue(bean: artifactInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: artifactInstance, field: "name")}</td>
                            <td>${fieldValue(bean: artifactInstance, field: "description")}</td>
                            <td>${fieldValue(bean: artifactInstance, field: "uiTags")}</td>
                            <td>${fieldValue(bean: artifactInstance, field: "artifactImage")}</td>
                            <td>${fieldValue(bean: artifactInstance, field: "annotationImage")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
