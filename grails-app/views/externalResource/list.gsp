
<%@ page import="edu.umn.laccore.tmi.ExternalResource" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'externalResource.label', default: 'ExternalResource')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'externalResource.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'externalResource.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="URL" title="${message(code: 'externalResource.URL.label', default: 'URL')}" />
                        
                            <th><g:message code="externalResource.uniqueIdentification.label" default="Unique Identification" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${externalResourceInstanceList}" status="i" var="externalResourceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${externalResourceInstance.id}">${fieldValue(bean: externalResourceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: externalResourceInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: externalResourceInstance, field: "URL")}</td>
                        
                            <td>${fieldValue(bean: externalResourceInstance, field: "uniqueIdentification")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${externalResourceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
