<%@ page import="edu.umn.laccore.tmi.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
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
            <g:hasErrors bean="${artifactInstance}">
            <div class="errors">
                <g:renderErrors bean="${artifactInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm method="post" >
                <g:hiddenField name="id" value="${artifactInstance?.id}" />
                <g:hiddenField name="version" value="${artifactInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="artifact.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${artifactInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="artifact.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${artifactInstance?.description}" />
                                </td>
                            </tr>
 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artifactType"><g:message code="artifact.artifactType.label" default="Artifact Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'artifactType', 'errors')}">
                                    <g:textField name="artifactType" value="${artifactInstance?.artifactType}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="artifactImage"><g:message code="artifact.artifactImage.label" default="Artifact Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'artifactImage', 'errors')}">
                                    <input type="file" name="artifactImagePayload" id="artifactImagePayload"/><br/>
                                    <g:if test="${artifactInstance.artifactImage?.length() > 0}">
                                    	<span style="font-size:80%;"><i>Current: ${artifactInstance.artifactImage}</i></span>
                                    </g:if>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="annotationImage"><g:message code="artifact.annotationImage.label" default="Annotation Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'annotationImage', 'errors')}">
                                    <input type="file" name="annotationImagePayload" id="annotationImagePayload"/><br/>
                                    <g:if test="${artifactInstance.annotationImage?.length() > 0}">
                                    	<span style="font-size:80%;"><i>Current: ${artifactInstance.annotationImage}</i></span>
                                    </g:if>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
