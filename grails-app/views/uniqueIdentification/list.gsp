
<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')}" />
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
                            <g:sortableColumn property="id" title="${message(code: 'uniqueIdentification.id.label', default: 'Id')}" />
                            <th><g:message code="uniqueIdentification.identificationType.label" default="Identification Type" /></th>
                            <g:sortableColumn property="name" title="${message(code: 'uniqueIdentification.name.label', default: 'Name')}" />
                            <g:sortableColumn property="description" title="${message(code: 'uniqueIdentification.description.label', default: 'Description')}" />
                            <g:sortableColumn property="distinguishingFeatures" title="${message(code: 'uniqueIdentification.distinguishingFeatures.label', default: 'Distinguishing Features')}" />
                            <g:sortableColumn property="uiTags" title="${message(code: 'uniqueIdentification.uiTags.label', default: 'Tags')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${uniqueIdentificationInstanceList}" status="i" var="uniqueIdentificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${uniqueIdentificationInstance.id}">${fieldValue(bean: uniqueIdentificationInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: uniqueIdentificationInstance, field: "identificationType")}</td>
                            <td>${fieldValue(bean: uniqueIdentificationInstance, field: "name")}</td>
                            <td>${fieldValue(bean: uniqueIdentificationInstance, field: "description").replaceAll(/\n/, '<br />')}</td>
                            <td>${fieldValue(bean: uniqueIdentificationInstance, field: "distinguishingFeatures").replaceAll(/\n/, '<br />')}</td> 
                            <td>${fieldValue(bean: uniqueIdentificationInstance, field: "uiTags").replaceAll(' ', '<br />')}</td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${uniqueIdentificationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
