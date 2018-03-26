<%@ page import="edu.umn.laccore.tmi.Artifact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    	<g:render template="artifactNav" />
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
                        	<g:render template="form"/>
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
