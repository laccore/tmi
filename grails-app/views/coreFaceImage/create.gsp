

<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'coreFaceImage.label', default: 'CoreFaceImage')}" />
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
            <g:hasErrors bean="${coreFaceImageInstance}">
            <div class="errors">
                <g:renderErrors bean="${coreFaceImageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="coreFaceImage.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceImageInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${coreFaceImageInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="coreFaceImage.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceImageInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${coreFaceImageInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="coreFaceImage"><g:message code="coreFaceImage.coreFaceImage.label" default="Core Face Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceImageInstance, field: 'coreFaceImage', 'errors')}">
                                    <input type="file" name="payload" id="payload"/><br/>
                                    <g:if test="${coreFaceImageInstance.coreFaceImage?.length() > 0}">
                                    	<span style="font-size:80%;"><i>Current: ${coreFaceImageInstance.coreFaceImage}</i></span>
                                    </g:if>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
