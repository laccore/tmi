
<%@ page import="edu.umn.laccore.tmi.XapResource" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'xapResource.label', default: 'XapResource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-xapResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-xapResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="summary" title="${message(code: 'xapResource.summary.label', default: 'Summary')}" />
					
						<g:sortableColumn property="packagingScript" title="${message(code: 'xapResource.packagingScript.label', default: 'Packaging Script')}" />
					
						<g:sortableColumn property="metadataSql" title="${message(code: 'xapResource.metadataSql.label', default: 'Metadata Sql')}" />
					
						<g:sortableColumn property="deploymentXap" title="${message(code: 'xapResource.deploymentXap.label', default: 'Deployment Xap')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'xapResource.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'xapResource.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${xapResourceInstanceList}" status="i" var="xapResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${xapResourceInstance.id}">${fieldValue(bean: xapResourceInstance, field: "summary")}</g:link></td>
					
						<td>${xapResourceInstance.packagingScript?"stored":"missing"}</td>
					
						<td>${xapResourceInstance.metadataSql?"stored":"missing"}</td>
					
						<td>${xapResourceInstance.deploymentXap?"stored":"missing"}</td>
					
						<td><g:formatDate date="${xapResourceInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${xapResourceInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${xapResourceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
