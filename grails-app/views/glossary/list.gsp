
<%@ page import="edu.umn.laccore.tmi.Glossary" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'glossary.label', default: 'Glossary')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'glossary.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'glossary.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'glossary.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${glossaryInstanceList}" status="i" var="glossaryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${glossaryInstance.id}">${fieldValue(bean: glossaryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: glossaryInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: glossaryInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${glossaryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>