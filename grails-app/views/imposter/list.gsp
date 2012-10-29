
<%@ page import="edu.umn.laccore.tmi.Imposter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'imposter.label', default: 'Imposter')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'imposter.id.label', default: 'Id')}" />
                        
                            <th><g:message code="imposter.uniqueIdentification.label" default="Unique Identification" /></th>
                        
                            <th><g:message code="imposter.imposter.label" default="Imposter" /></th>
                        
                            <g:sortableColumn property="description" title="${message(code: 'imposter.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${imposterInstanceList}" status="i" var="imposterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${imposterInstance.id}">${fieldValue(bean: imposterInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: imposterInstance, field: "uniqueIdentification")}</td>
                        
                            <td>${fieldValue(bean: imposterInstance, field: "imposter")}</td>
                        
                            <td>${fieldValue(bean: imposterInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${imposterInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
