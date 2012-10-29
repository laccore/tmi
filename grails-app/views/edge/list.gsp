
<%@ page import="edu.umn.laccore.tmi.Edge" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'edge.label', default: 'Edge')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'edge.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'edge.description.label', default: 'Description')}" />
                        
                            <th><g:message code="edge.sourceNode.label" default="Source Node" /></th>
                        
                            <th><g:message code="edge.targetNode.label" default="Target Node" /></th>
                            
                            <th><g:message code="edge.imageName.label" default="Image" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${edgeInstanceList}" status="i" var="edgeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${edgeInstance.id}">${fieldValue(bean: edgeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: edgeInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: edgeInstance, field: "sourceNode")}</td>
                        
                            <td>${fieldValue(bean: edgeInstance, field: "targetNode")}</td>
                            
                            <td>${fieldValue(bean: edgeInstance, field: "imageName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${edgeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
