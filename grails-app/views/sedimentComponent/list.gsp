
<%@ page import="edu.umn.laccore.tmi.SedimentComponent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="umn">
		<g:set var="entityName" value="${message(code: 'sedimentComponent.label', default: 'SedimentComponent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div class="body">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'sedimentComponent.name.label', default: 'Name')}" />
						<g:sortableColumn property="modifier" title="${message(code: 'sedimentComponent.modifier.label', default: 'Modifier')}" />
						<g:sortableColumn property="type" title="${message(code: 'sedimentComponent.type.label', default: 'Type')}" />
						<g:sortableColumn property="isStandardComponent" title="${message(code: 'sedimentComponent.isStandardComponent.label', default: 'Is Standard Component')}" />
						<g:sortableColumn property="speechToTextMappings" title="${message(code: 'sedimentComponent.speechToTextMappings.label', default: 'Speech To Text Mappings')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sedimentComponentInstanceList}" status="i" var="sedimentComponentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${sedimentComponentInstance.id}">${fieldValue(bean: sedimentComponentInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: sedimentComponentInstance, field: "modifier")}</td>
						<td>${fieldValue(bean: sedimentComponentInstance, field: "type")}</td>
						<td><g:formatBoolean boolean="${sedimentComponentInstance.isStandardComponent}" /></td>
						<td>${fieldValue(bean: sedimentComponentInstance, field: "speechToTextMappings")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="paginateButtons">
				<g:paginate total="${sedimentComponentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
