

<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'smearSlide.label', default: 'SmearSlide')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body" style="width:600px;">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${smearSlideInstance}">
            <div class="errors">
                <g:renderErrors bean="${smearSlideInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${smearSlideInstance?.id}" />
                <g:hiddenField name="version" value="${smearSlideInstance?.version}" />
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
            </g:form>
            <!-- Render the smear slide component template as hidden: provides us a base to clone from -->
            <div id="sscomp_clone" style="display:none;">
	    		<g:render template='sscomp' model="['sscomp':null,'i':'_clone']"/>
	    	</div>
        </div>
    </body>
</html>
