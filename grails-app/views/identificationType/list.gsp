
<%@ page import="edu.umn.laccore.tmi.IdentificationType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'identificationType.label', default: 'IdentificationType')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'identificationType.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="supertype" title="${message(code: 'identificationType.supertype.label', default: 'Supertype')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'identificationType.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="label" title="${message(code: 'identificationType.label.label', default: 'Label')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${identificationTypeInstanceList}" status="i" var="identificationTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${identificationTypeInstance.id}">${fieldValue(bean: identificationTypeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: identificationTypeInstance, field: "supertype")}</td>
                        
                            <td>${fieldValue(bean: identificationTypeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: identificationTypeInstance, field: "label")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${identificationTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
