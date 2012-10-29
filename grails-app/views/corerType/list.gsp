
<%@ page import="edu.umn.laccore.tmi.CorerType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'corerType.label', default: 'CorerType')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'corerType.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'corerType.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="corerShort" title="${message(code: 'corerType.corerShort.label', default: 'Corer Short')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${corerTypeInstanceList}" status="i" var="corerTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${corerTypeInstance.id}">${fieldValue(bean: corerTypeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: corerTypeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: corerTypeInstance, field: "corerShort")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${corerTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
