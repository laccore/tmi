
<%@ page import="edu.umn.laccore.tmi.Question" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'question.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'question.name.label', default: 'Name')}" />
                            
                            <th><g:message code="question.exampleImage.label" default="Example Image" /></th>
                            
                            <th><g:message code="question.exampleAltText.label" default="Example Tooltip Text" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${questionInstanceList}" status="i" var="questionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: questionInstance, field: "name")}</td>
                            
                            <td>${fieldValue(bean: questionInstance, field: "exampleImage")}</td>
                            
                            <td>${fieldValue(bean: questionInstance, field: "exampleAltText")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${questionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
