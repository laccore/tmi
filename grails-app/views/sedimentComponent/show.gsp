
<%@ page import="edu.umn.laccore.tmi.SedimentComponent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="umn">
		<g:set var="entityName" value="${message(code: 'sedimentComponent.label', default: 'SedimentComponent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div id="body">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="dialog"><table><tbody>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="sedimentComponent.name.label" default="Name" /></td>
            		<td valign="top" class="value">${fieldValue(bean: sedimentComponentInstance, field: "name")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="sedimentComponent.modifier.label" default="Modifier" /></td>
            		<td valign="top" class="value">${fieldValue(bean: sedimentComponentInstance, field: "modifier")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="sedimentComponent.type.label" default="Type" /></td>
            		<td valign="top" class="value">${fieldValue(bean: sedimentComponentInstance, field: "type")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="sedimentComponent.isStandardComponent.label" default="Is Standard Component" /></td>
            		<td valign="top" class="value">${fieldValue(bean: sedimentComponentInstance, field: "isStandardComponent")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="sedimentComponent.speechToTextMappings.label" default="Speech To Text Mappings" /></td>
            		<td valign="top" class="value">${fieldValue(bean: sedimentComponentInstance, field: "speechToTextMappings")}</td>
            	</tr>
            </tbody></table></div>
            
			<div class="buttons">
				<g:form>
					<g:hiddenField name="id" value="${sedimentComponentInstance?.id}" />
				    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
				</g:form>
			</div>
		</div>
	</body>
</html>
