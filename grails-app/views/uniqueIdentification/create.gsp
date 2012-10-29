

<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')}" />
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
            <g:hasErrors bean="${uniqueIdentificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${uniqueIdentificationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="identificationType"><g:message code="uniqueIdentification.identificationType.label" default="Identification Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'identificationType', 'errors')}">
                                    <g:select name="identificationType.id" from="${edu.umn.laccore.tmi.IdentificationType.list()}" optionKey="id" value="${uniqueIdentificationInstance?.identificationType?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="uniqueIdentification.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${uniqueIdentificationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distinguishingFeatures"><g:message code="uniqueIdentification.distinguishingFeatures.label" default="Distinguishing Features" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'distinguishingFeatures', 'errors')}">
                                    <g:textArea name="distinguishingFeatures" cols="40" rows="5" value="${uniqueIdentificationInstance?.distinguishingFeatures}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="uniqueIdentification.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${uniqueIdentificationInstance?.description}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uiTags"><g:message code="uniqueIdentification.uiTags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'uiTags', 'errors')}">
                                    <g:textField name="uiTags" size="40" value="${uniqueIdentificationInstance?.uiTags}" />
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
