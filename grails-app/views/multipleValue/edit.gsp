

<%@ page import="edu.umn.laccore.tmi.MultipleValue" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'multipleValue.label', default: 'MultipleValue')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${multipleValueInstance}">
            <div class="errors">
                <g:renderErrors bean="${multipleValueInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${multipleValueInstance?.id}" />
                <g:hiddenField name="version" value="${multipleValueInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="edges"><g:message code="multipleValue.edges.label" default="Edges" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: multipleValueInstance, field: 'edges', 'errors')}">
                                    
<ul>
<g:each in="${multipleValueInstance?.edges?}" var="e">
    <li><g:link controller="edge" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="edge" action="create" params="['multipleValue.id': multipleValueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'edge.label', default: 'Edge')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="multipleValue.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: multipleValueInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${multipleValueInstance?.name}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
