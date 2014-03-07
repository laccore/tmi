
<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-coreFaceAnnotation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-coreFaceAnnotation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'coreFaceAnnotation.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="x" title="${message(code: 'coreFaceAnnotation.x.label', default: 'X')}" />
					
						<g:sortableColumn property="y" title="${message(code: 'coreFaceAnnotation.y.label', default: 'Y')}" />
					
						<g:sortableColumn property="width" title="${message(code: 'coreFaceAnnotation.width.label', default: 'Width')}" />
					
						<g:sortableColumn property="height" title="${message(code: 'coreFaceAnnotation.height.label', default: 'Height')}" />
					
						<th><g:message code="coreFaceAnnotation.coreFace.label" default="Core Face" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${coreFaceAnnotationInstanceList}" status="i" var="coreFaceAnnotationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${coreFaceAnnotationInstance.id}">${fieldValue(bean: coreFaceAnnotationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: coreFaceAnnotationInstance, field: "x")}</td>
					
						<td>${fieldValue(bean: coreFaceAnnotationInstance, field: "y")}</td>
					
						<td>${fieldValue(bean: coreFaceAnnotationInstance, field: "width")}</td>
					
						<td>${fieldValue(bean: coreFaceAnnotationInstance, field: "height")}</td>
					
						<td>${fieldValue(bean: coreFaceAnnotationInstance, field: "coreFace")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${coreFaceAnnotationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
