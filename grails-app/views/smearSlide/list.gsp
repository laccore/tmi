<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="umn">
		<g:set var="entityName" value="${message(code: 'smearSlide.label', default: 'SmearSlide')}" />
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
			<div class="list">
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'smearSlide.name.label', default: 'Name')}" />
						<g:sortableColumn property="sedclassName" title="${message(code: 'smearSlide.sedclassName.label', default: 'Sedclass Name')}" />
						<g:sortableColumn property="grainSize" title="${message(code: 'smearSlide.grainSize.label', default: 'Grain Size')}" />
						<g:sortableColumn property="components.size" title="Component Count" />
						<g:sortableColumn property="coreSection" title="${message(code: 'smearSlide.coreSection.label', default: 'Core Section')}" />
						<g:sortableColumn property="depth" title="${message(code: 'smearSlide.depth.label', default: 'Depth')}" />
						<g:sortableColumn property="reason" title="${message(code: 'smearSlide.reason.label', default: 'Reason')}" />
						<g:sortableColumn property="comments" title="${message(code: 'smearSlide.comments.label', default: 'Comments')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${ssInstanceList}" status="i" var="ssInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${ssInstance.id}">${fieldValue(bean: ssInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: ssInstance, field: "sedclassName")}</td>
						<td>${fieldValue(bean: ssInstance, field: "grainSize")}</td>
						<td>${ssInstance.components.size()}</td>
						<td>${fieldValue(bean: ssInstance, field: "coreSection")}</td>
						<td>${fieldValue(bean: ssInstance, field: "depth")}</td>
						<td>${fieldValue(bean: ssInstance, field: "reason")}</td>
						<td>${fieldValue(bean: ssInstance, field: "comments")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			<div class="pagination">
				<g:paginate total="${ssInstanceList.size()}" />
			</div>
		</div>
	</body>
</html>
