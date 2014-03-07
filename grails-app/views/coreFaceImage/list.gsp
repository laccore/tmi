
<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coreFaceImage.label', default: 'CoreFaceImage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-coreFaceImage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-coreFaceImage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'coreFaceImage.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'coreFaceImage.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="coreFaceImage" title="${message(code: 'coreFaceImage.coreFaceImage.label', default: 'Core Face Image')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${coreFaceImageInstanceList}" status="i" var="coreFaceImageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${coreFaceImageInstance.id}">${fieldValue(bean: coreFaceImageInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: coreFaceImageInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: coreFaceImageInstance, field: "coreFaceImage")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${coreFaceImageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
