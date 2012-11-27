

<%@ page import="edu.umn.laccore.tmi.Imposter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'imposter.label', default: 'Imposter')}" />
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
            <g:hasErrors bean="${imposterInstance}">
            <div class="errors">
                <g:renderErrors bean="${imposterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${imposterInstance?.id}" />
                <g:hiddenField name="version" value="${imposterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="uniqueIdentification"><g:message code="imposter.uniqueIdentification.label" default="Unique Identification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imposterInstance, field: 'uniqueIdentification', 'errors')}">
                                    <g:select name="uniqueIdentification.id" from="${edu.umn.laccore.tmi.UniqueIdentification.list()}" optionKey="id" value="${imposterInstance?.uniqueIdentification?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imposter"><g:message code="imposter.imposter.label" default="Imposter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imposterInstance, field: 'imposter', 'errors')}">
                                    <g:select name="imposter.id" from="${edu.umn.laccore.tmi.UniqueIdentification.list()}" optionKey="id" value="${imposterInstance?.imposter?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="imposter.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imposterInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${imposterInstance?.description}" />
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