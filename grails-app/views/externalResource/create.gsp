

<%@ page import="edu.umn.laccore.tmi.ExternalResource" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'externalResource.label', default: 'ExternalResource')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${externalResourceInstance}">
            <div class="errors">
                <g:renderErrors bean="${externalResourceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="externalResource.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: externalResourceInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="128" value="${externalResourceInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="URL"><g:message code="externalResource.URL.label" default="URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: externalResourceInstance, field: 'URL', 'errors')}">
                                    <g:textField name="URL" value="${externalResourceInstance?.URL}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uniqueIdentification"><g:message code="externalResource.uniqueIdentification.label" default="Unique Identification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: externalResourceInstance, field: 'uniqueIdentification', 'errors')}">
                                    <g:select name="uniqueIdentification.id" from="${edu.umn.laccore.tmi.UniqueIdentification.list()}" optionKey="id" value="${externalResourceInstance?.uniqueIdentification?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
