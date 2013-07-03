
<%@ page import="edu.umn.laccore.tmi.XapResource" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'xapResource.label', default: 'XapResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-xapResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-xapResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list xapResource">
			
				<g:if test="${xapResourceInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="xapResource.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${xapResourceInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${xapResourceInstance?.packagingScript}">
				<li class="fieldcontain">
					<span id="packagingScript-label" class="property-label"><g:message code="xapResource.packagingScript.label" default="Packaging Script" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${xapResourceInstance?.metadataSql}">
				<li class="fieldcontain">
					<span id="metadataSql-label" class="property-label"><g:message code="xapResource.metadataSql.label" default="Metadata Sql" /></span>
					
						<span class="property-value" aria-labelledby="metadataSql-label"><g:fieldValue bean="${xapResourceInstance}" field="metadataSql"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${xapResourceInstance?.deploymentXap}">
				<li class="fieldcontain">
					<span id="deploymentXap-label" class="property-label"><g:message code="xapResource.deploymentXap.label" default="Deployment Xap" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${xapResourceInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="xapResource.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${xapResourceInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${xapResourceInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="xapResource.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${xapResourceInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${xapResourceInstance?.id}" />
					<g:link class="edit" action="edit" id="${xapResourceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
