

<%@ page import="edu.umn.laccore.tmi.IdentificationType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'identificationType.label', default: 'IdentificationType')}" />
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
            <g:hasErrors bean="${identificationTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${identificationTypeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="supertype"><g:message code="identificationType.supertype.label" default="Supertype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: identificationTypeInstance, field: 'supertype', 'errors')}">
                                    <g:textField name="supertype" value="${identificationTypeInstance?.supertype}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="identificationType.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: identificationTypeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="128" value="${identificationTypeInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="label"><g:message code="identificationType.label.label" default="Label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: identificationTypeInstance, field: 'label', 'errors')}">
                                    <g:textField name="label" value="${identificationTypeInstance?.label}" />
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
