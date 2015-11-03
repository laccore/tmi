
<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'smearSlide.label', default: 'SmearSlide')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require module="export"/>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'smearSlide.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'smearSlide.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="depth" title="${message(code: 'smearSlide.depth.label', default: 'Depth')}" />
                        
                            <g:sortableColumn property="reason" title="${message(code: 'smearSlide.reason.label', default: 'Reason')}" />
                        
                            <th><g:message code="smearSlide.user.label" default="User" /></th>
                        
                            <g:sortableColumn property="sedclassName" title="${message(code: 'smearSlide.sedclassName.label', default: 'Sedclass Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${smearSlideInstanceList}" status="i" var="smearSlideInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${smearSlideInstance.id}">${fieldValue(bean: smearSlideInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: smearSlideInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: smearSlideInstance, field: "depth")}</td>
                        
                            <td>${fieldValue(bean: smearSlideInstance, field: "reason")}</td>
                        
                            <td>${fieldValue(bean: smearSlideInstance, field: "user")}</td>
                        
                            <td>${fieldValue(bean: smearSlideInstance, field: "sedclassName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${smearSlideInstanceTotal}" />
            </div>
            Download Data:
            <export:formats value="list me" formats="['csv', 'excel']" action="list" />
        </div>
    </body>
</html>
